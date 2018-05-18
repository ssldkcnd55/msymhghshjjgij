/**
 * 
 */

/* 메신져 자바스크립트 파일 */

var ws ; 
var beforeName = null;
var beforeTime = null;
var beforeDate = null;
var nowDate=null;
var contents_height=0;
$(function() {
	/* 검색 엔터키 연동 */
	$('.search_member input').keydown(function(key) {
		if (key.keyCode == 13) {
			searchMember();
		}
	});


});

/* 대화추가 검색 메서드 */
function searchMember() {

	/* 대화목록 가리고 검색결과창 띄우기 */
	$('.search_list').css('visibility', 'visible');
	$('.search_list').css('z-index', 2);
	$('.chat_list_table').css('visibility', 'hidden');
	$('.chat_list_table').css('z-index', 1);
	$('.msg_top_div img').css('visibility', 'visible');

	var input_value = $('.search_member input').val();
	$('.search_member input').val('');

	if (input_value.length <= 0) {
		/* 검색결과 있을 때 여기 실행 */
		var searchedMember = "<div class='searchedMember'><img src='/farm/resources/images/logo01.png'><span>회원이름</span><input type='button' value='1:1 채팅'></div>";
		searchedMember += "<div class='searchedMember'><img src='/farm/resources/images/farm.jpg'><span>회원이름2</span><input type='button' value='1:1 채팅'></div>";
		searchedMember += "<div class='searchedMember'><img src='/farm/resources/images/person_icon.png'><span>회원이름3</span><input type='button' value='1:1 채팅'></div>";
		searchedMember += "<div class='searchedMember'><img src='/farm/resources/images/messenger_icon_orange.png'><span>회원이름4</span><input type='button' value='1:1 채팅'></div>";

		$('.search_list').html(searchedMember);
	} else {
		/* 검색결과 없을 때 여기 실행 */
		var fail_msg = " <div class='searchNotFoundID'> '"
				+ input_value
				+ "'를<br> 찾을 수 없습니다.</div>"
				+ " <div class='searchNotFoundMsg'>입력하신 아이디, 이름으로 등록된 회원이 없습니다.</div> "
		$('.search_list').html(fail_msg);
	}

}

/* 검색결과 가리고 대화목록 띄우기 */
function back_chat_list() {
	$('.chat_list_table').css('visibility', 'visible');
	$('.chat_list_table').css('z-index', 2);
	$('.search_list').css('visibility', 'hidden');
	$('.search_list').css('z-index', 1);
	$('.msg_top_div img').css('visibility', 'hidden');

	// 검색창 가리기
	$('.chat_list_table').css('visibility', 'vidible');
	$('.chat_list_table').css('z-index', 2);
	// 검색리스트 가리기
	$('.search_member').css('visibility', 'visible');
	$('.search_member').css('z-index', 2);
	// 대화창 띄우기
	$('.msg_table_middle').css('visibility', 'hidden');
	$('.msg_table_middle').css('z-index', 1);
	$('.msg_top_div').css('visibility', 'visible');
	$('.msg_top_div').css('z-index', 1);
	$('.msg_top_table').css('visibility', 'hidden');
	$('.msg_top_table').css('z-index', 2);
	// 메세지 입력칸 가리기
	$('.msg_bottom_table').css('visibility', 'hidden');
	
	//webSocket닫기
	ws.close();
}

function trans_time(time)
{
	var msg_hour = time.substring(0, 2);

	var msg_min = time.substring(3, 5)
	var msg_time = null;

	if (msg_hour == 00) {
		msg_time = '오전  12';
	} else if (msg_hour < 10) {
		msg_time = '오전  ' + msg_hour.substring(1, 2);
	} else if (msg_hour < 12) {
		msg_time = '오전  ' + msg_hour;

	} else if (msg_hour == 12) {
		msg_time = '오후 ' + msg_hour;
	} else if (msg_hour > 12) {
		msg_time = '오후 ' + (msg_hour - 12);
	}
	msg_time += ":" + msg_min;
	
	return msg_time;
	
}

/* 리스트 가리고 대화창 화면 띄우기 */
function move_msg_table(chat_no, my_id, your_id) {

	$.ajax({
				url : "chatHistory.do",
				type : "post",
				dataType : "json",
				data : {
					'chat_no' : chat_no,
					'member_id1' : my_id,
					'member_id2' : your_id
				},
				success : function(c) {
					var objStr = JSON.stringify(c);
					var c = JSON.parse(objStr);
					
					$('.msg_table_middle').html('');

					$('.messenger_title img').prop(
							"src",
							"/farm/resources/upload/memberUpload/"
									+ decodeURIComponent((c.img).replace(/\+/g,
											'%20')));
					$('.msg_title_name').text(
							decodeURIComponent((c.name).replace(/\+/g, '%20'))
									+ '(' + your_id + ')');
					
					var your_profile= '<tr><th rowspan="2"><img src="/farm/resources/upload/memberUpload/'
														+ decodeURIComponent((c.img)
																.replace(/\+/g,
																		'%20'))
														+ ' "></th><td>'
														+ decodeURIComponent((c.name)
																.replace(/\+/g,
																		'%20'))
														+ '</td></tr>';
					
				
					for ( var i in c.ht) {
						// ///////////////////////////시간설정////////////////////
						
						var msg_time=	trans_time(c.ht[i].date.substring(11, 16));
				
						var today=new Date(c.ht[i].date) 
						nowDate = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일 ";
						switch(today.getDay() )
						{
						case 0 : nowDate += "일요일"
						       break;
						    case 1 : nowDate += "월요일"
						     break;
						    case 2 : nowDate += "화요일"
						     break;
						    case 3 : nowDate += "수요일"
						     break;
						    case 4 : nowDate += "목요일"
						     break;
						    case 5 : nowDate += "금요일"
						     break;
						    default : nowDate += "토요일"
						}

						
						// 첫 메세지
						if (beforeDate == null) {
							beforeDate=nowDate;
							$('.msg_table_middle').append(
							'<div class="msg_date"><table><tr><td><hr></td><th>'+nowDate+'</th><td><hr></td></tr></table></div>');
							
						}
						// 날 바뀜
						else if (beforeDate != nowDate ) 
						{
							beforeName=null;
							beforeDate=nowDate;
							$('.msg_table_middle').append(
							'<div class="msg_date"><table><tr><td><hr></td><th>'+nowDate+'</th><td><hr></td></tr></table></div>');
						} 
	
						if (c.ht[i].member_id == my_id) {
							// case 1 : 나=>나 and 시간 같음
							if (beforeName == my_id && beforeTime == msg_time) {
								// 바로위에 있는 시간 지우고 메세지+시간
								$('.msg_table_middle .msg_time_my').last().remove();
								$('.msg_table_middle .msg_time').last().remove();
							}
								
								if (c.ht[i].alarm =='N')
								{//안읽음
									$('.msg_table_middle').append(
											'<table class="msg_rightBox"><tr><th>1</th><td class="msg_my">'
													+ decodeURIComponent((c.ht[i].contents)
															.replace(/\+/g,
																	'%20'))
													+ '</td></tr></table>');
									
									$('.msg_rightBox th').last().css('width',304- $('.msg_my').last().css('width') );
									
								}else if (c.ht[i].alarm =='Y')
								{//읽음
									$('.msg_table_middle')
									.append(
											'<div class="msg_rightBox"><div class="msg_my">'
													+ decodeURIComponent((c.ht[i].contents)
															.replace(/\+/g,
																	'%20'))
													+ '</div></div>');
								}
								$('.msg_table_middle').append(
										'<div class="msg_time"><div class="msg_time_my">' + msg_time
												+ '</div></div>');
			
							beforeName = my_id;
							beforeTime = msg_time;
						}

						else if (c.ht[i].member_id == your_id) {
							// case 3 : (나=>너 ) or 너
							if (beforeName == my_id || beforeName == null) {
								// 사진+이름+메세지+시간
								$('.msg_table_middle')
										.append(
												'<div class="msg_middle_left_img"><table>'+your_profile+'<tr><td class="msg_you">'
														+ decodeURIComponent((c.ht[i].contents)
																.replace(/\+/g,
																		'%20'))
														+ '</td></tr></table></div> ');
								$('.msg_table_middle').append(
										'<div class="msg_time"><div class="msg_time_you">' + msg_time
												+ '</div></div>');
							}
							// case 4 : 너=>너 and 시간 같음
							else if (beforeName == your_id
									&& beforeTime == msg_time) {
								// 바로위에있는 시간 지우고 메세지+시간
								$('.msg_table_middle .msg_time_you').last()
								.remove();
								$('.msg_table_middle .msg_time').last()
										.remove();
								$('.msg_table_middle')
										.append(
												'<div class="msg_leftBox"><div class="msg_you">'
														+ decodeURIComponent((c.ht[i].contents)
																.replace(/\+/g,
																		'%20'))
														+ '</div></div>');
								$('.msg_table_middle').append(
										'<div class="msg_time"><div class="msg_time_you">' + msg_time
												+ '</div></div>');
							}
							// case 5 : 너=>너 and 시간 다름
							else if (beforeName == your_id
									&& beforeTime != msg_time) {
								// 메세지+시간
								$('.msg_table_middle')
										.append(
												'<div class="msg_leftBox"><div class="msg_you">'
														+ decodeURIComponent((c.ht[i].contents)
																.replace(/\+/g,
																		'%20'))
														+ '</div></div>');
								$('.msg_table_middle').append(
										'<div class="msg_time"><div class="msg_time_you">' + msg_time
												+ '</div></div>');
							}
							beforeName = your_id;
							beforeTime = msg_time;
						}

					}

					// //////////////////
					// 검색창 가리기
					$('.chat_list_table').css('visibility', 'hidden');
					$('.chat_list_table').css('z-index', 1);
					// 검색리스트 가리기
					$('.search_member').css('visibility', 'hidden');
					$('.search_member').css('z-index', 1);
					// 대화창 띄우기
					$('.msg_table_middle').css('visibility', 'visible');
					$('.msg_table_middle').css('z-index', 2);
					$('.msg_top_div').css('visibility', 'hidden');
					$('.msg_top_div').css('z-index', 1);
					$('.msg_top_table').css('visibility', 'visible');
					$('.msg_top_table').css('z-index', 1);
					// 메시지 입련칸 띄우기
					$('.msg_bottom_table').css('visibility', 'visible');
					/////////////////////////////////////
					/////////채팅방생성////////////////
					//chat_no, my_id, your_id
					openChat(chat_no, my_id, your_id,your_profile);
					  
					 $('.msg_table_middle').scrollTop( $('.msg_table_middle').prop("scrollHeight") );
					 $('.msg_input').focus();
					
					
				},
				error : function(request, status, errorData) {
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			});
	function openChat(chat_no, my_id, your_id,your_profile){
		 ws = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?your_id="+your_id+"&chat_no="+chat_no);
		 ws.onopen = function () {
		   
		        $('.msg_input').on('keydown', function(evt){
		            if(evt.keyCode==13 && $('.msg_input').val() != ''){
		                var msg = $('.msg_input').val();
		                ws.send(msg);
		                $('.msg_input').val('');
		                $('.msg_input').focus();
		            }
		        });
		        $('.send_msg_icon').on('click', function(evt){
		        	if($('.msg_input').val() != ''){
		                var msg = $('.msg_input').val();
		                ws.send(msg);
		                $('.msg_input').val('');
		                $('.msg_input').focus();
		        	}
		        });
		    };
		    ws.onmessage = function (event) {
		    	
		    	var msgCode= event.data.substring(0,3);
		    	if(msgCode == 'min')
		    		{
		    		$('.msg_title_online').text('접속중');
		    		$('.msg_rightBox th').text('');
		    		return;
		    		}
		    	else if(msgCode== 'mot')
		    		{
		    		$('.msg_title_online').text('미접속');
		    		return;
		    		}
		    	var msgContents= event.data.slice(3);
		    	var today=new Date();
		    	nowDate = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일 ";
		    	switch(today.getDay() )
		    	{
		    		case 0 : nowDate += "일요일"
		    			break;
		    		case 1 : nowDate += "월요일"
		    			 break;
		    		case 2 : nowDate += "화요일"
		    			break;
		    		case 3 : nowDate += "수요일"
		    			 break;
		    		case 4 : nowDate += "목요일"
		    			break;
		    		case 5 : nowDate += "금요일"
		    			break;
		    		default : nowDate += "토요일"
		    	}
		    	
		    	var timeTemp=(new Date()).toString().slice(-28).substring(0,5);
		    	var msg_time=trans_time(timeTemp);
		    	
		    	
		    	
		    	// 첫 메세지
				if (beforeDate == null) {
					beforeDate=nowDate;
					$('.msg_table_middle').append(
					'<div class="msg_date"><table><tr><td><hr></td><th>'+nowDate+'</th><td><hr></td></tr></table></div>');
				}
				// 날 바뀜
				else if (beforeDate != nowDate ) 
				{
					beforeName=null;
					beforeDate=nowDate;
					$('.msg_table_middle').append(
					'<div class="msg_date"><table><tr><td><hr></td><th>'+nowDate+'</th><td><hr></td></tr></table></div>');
				} 
				
		    	//내가 보낸 메세지
		    	if(msgCode.substring(0,2)=='me')
		    		{
		    		
		    		
		    		// case 1 : 나=>나 and 시간 같음
		    		if (beforeName == my_id && beforeTime == msg_time)
		    		{// 바로위에 있는 시간 지우고 메세지+시간
		    			$('.msg_table_middle .msg_time_my').last().remove();
						$('.msg_table_middle .msg_time').last().remove();
		    		}
		    		
		    		if(msgCode=='meo')
	    			{
	    			$('.msg_title_online').text('접속중');
	    			$('.msg_rightBox th').text('');
	    			$('.msg_table_middle').append('<div class="msg_rightBox"><div class="msg_my">'+msgContents+'</div></div>');
	    			}
		    		else if(msgCode=='mex')
		    			{
		    			$('.msg_title_online').text('미접속');
		    			$('.msg_table_middle').append('<table class="msg_rightBox"><tr><th>1</th><td class="msg_my">'+msgContents+'</td></tr></table>');
		    			}

			    		$('.msg_table_middle').append('<div class="msg_time"><div class="msg_time_my">'+msg_time+'</div></div>');
	
		    		beforeName=my_id;
		    		beforeTime = msg_time;
		    		
		    		}
		    	
		    	//너가 보낸 메세지
		    	else if(msgCode=='you')
		    	{
		    		// case 3 : (나=>너 ) or 너
		    		if (beforeName == my_id || beforeName == null) 
		    		{// 사진+이름+메세지+시간
		    			$('.msg_table_middle').append('<div class="msg_middle_left_img"><table>'+your_profile+'<tr><td class="msg_you">'+msgContents+'</td></tr></table></div> ');
		    			$('.msg_table_middle').append('<div class="msg_time"><div class="msg_time_you">' + msg_time+ '</div></div>');
		    		}
		    		// case 4 : 너=>너 and 시간 같음
		    		else if (beforeName == your_id && beforeTime == msg_time) 
		    		{// 바로위에있는 시간 지우고 메세지+시간
		    			$('.msg_table_middle .msg_time_you').last().remove();
						$('.msg_table_middle .msg_time').last().remove();
		    			$('.msg_table_middle').append('<div class="msg_leftBox"><div class="msg_you">'+msgContents+'</div></div>');
			    		$('.msg_table_middle').append('<div class="msg_time"><div class="msg_time_you">'+msg_time+'</div></div>');
		    		}
		    		// case 5 : 너=>너 and 시간 다름
		    		else if (beforeName == your_id && beforeTime != msg_time) 
		    		{// 메세지+시간
		    			$('.msg_table_middle').append('<div class="msg_leftBox"><div class="msg_you">'+msgContents+'</div></div>');
			    		$('.msg_table_middle').append('<div class="msg_time"><div class="msg_time_you">'+msg_time+'</div></div>');
		    		}
		    		beforeName=your_id;
		    		beforeTime = msg_time;
		    	}
		   	 $('.msg_table_middle').scrollTop( $('.msg_table_middle').prop("scrollHeight") );
		    };
	}


}