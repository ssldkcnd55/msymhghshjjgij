/**
 * 
 */

/* 메신져 자바스크립트 파일 */

$(function() {
		/* 검색 엔터키 연동 */
		$('.search_member input').keydown(function(key) {
			if (key.keyCode == 13) {
				searchMember();
			}
		});
		/* 메세지 전송 엔터키 연동 */
		$('.msg_input').keydown(function(key) {
			if (key.keyCode == 13) {
				$('.send_msg_icon').click();
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
		$('.msg_top_div img').css('visibility','visible');
		
		var input_value = $('.search_member input').val();
		$('.search_member input').val('');
	

		if(input_value.length<=0)
		{
			/* 검색결과 있을 때 여기 실행 */
			var searchedMember = "<div class='searchedMember'><img src='/farm/resources/images/logo01.png'><span>회원이름</span><input type='button' value='1:1 채팅'></div>";
			searchedMember+="<div class='searchedMember'><img src='/farm/resources/images/farm.jpg'><span>회원이름2</span><input type='button' value='1:1 채팅'></div>";
			searchedMember+="<div class='searchedMember'><img src='/farm/resources/images/person_icon.png'><span>회원이름3</span><input type='button' value='1:1 채팅'></div>";
			searchedMember+="<div class='searchedMember'><img src='/farm/resources/images/messenger_icon_orange.png'><span>회원이름4</span><input type='button' value='1:1 채팅'></div>";

			$('.search_list').html(searchedMember);
		}
		else{
			/* 검색결과 없을 때 여기 실행 */
			 var fail_msg =  " <div class='searchNotFoundID'> '"+input_value+"'를<br> 찾을 수 없습니다.</div>"
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
		$('.msg_top_div img').css('visibility','hidden');
		
		
		
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
	}
	
	
	/* 리스트 가리고 대화창 화면 띄우기 */
	function move_msg_table(chat_no,my_id,your_id){
		
		$.ajax({
			url:"chatHistory.do",
			type:"post",
			dataType:"json",
			data:{
				'chat_no':chat_no,
				'member_id1':my_id,
				'member_id2':your_id
			},
			success:function(c){
				var objStr = JSON.stringify(c);
				var c = JSON.parse(objStr);
				
				$('.msg_table_middle').html('');
				
				
				$('.messenger_title img').prop("src","/farm/resources/upload/memberUpload/"+decodeURIComponent((c.img).replace(/\+/g, '%20'))  );
				$('.msg_title_name').text( decodeURIComponent((c.name).replace(/\+/g, '%20')) + '('+ your_id+')' );
				
				var beforeName=null;
				var beforeTime=null;
				for(var i in c.ht)
					{
				
				var msg_hour=c.ht[i].date.substring(11,13);
				var msg_min=c.ht[i].date.substring(14,16)
				var msg_time=null;
				if(msg_hour<12)
					{
					msg_time='오전  '+msg_hour;
					}
				else if(msg_hour==12)
					{
					msg_time='오후 '+msg_hour;
					}
				else if(msg_hour>12)
					{
					msg_time='오후 '+(msg_hour-12);
					}
					msg_time+= ":"+msg_min;

					
					
					
					if( c.ht[i].member_id==my_id)
						{
						// case 1 : 나=>나 and 시간 같음
						if( beforeName==my_id && beforeTime==c.ht[i].date )
							{
							// 바로위에 있는 시간 지우고 메세지+시간
							$('.msg_table_middle .msg_time_my').last().remove();
							$('.msg_table_middle').append('<div class="msg_both"><div class="msg_my">'+decodeURIComponent((c.ht[i].contents).replace(/\+/g, '%20'))+'</div></div>');
							$('.msg_table_middle').append('<div class="msg_time_my">'+msg_time+'</div>' );
							}
						// case 2 : (나=>나 and 시간 다름) or ( 너=>나 ) or 나
						else if( (beforeName==my_id && beforeTime!=c.ht[i].date) || beforeName==your_id || beforeName==null )
							{
							// 메세지+시간
							$('.msg_table_middle').append('<div class="msg_both"><div class="msg_my">'+decodeURIComponent((c.ht[i].contents).replace(/\+/g, '%20'))+'</div></div>');
							$('.msg_table_middle').append('<div class="msg_time_my">'+msg_time+'</div>' );
							}
						beforeName=my_id;
						beforeTime=c.ht[i].date;
						}
						
					else if (c.ht[i].member_id==your_id)
						{
						// case 3 : (나=>너 ) or 너
						if( beforeName==my_id || beforeName==null )
						{  
							// 사진+이름+메세지+시간
							$('.msg_table_middle').append('<div class="msg_middle_left_img"><table><tr><th rowspan="2"><img src="/farm/resources/upload/memberUpload/'+decodeURIComponent((c.img).replace(/\+/g, '%20'))+' "></th><td>'+decodeURIComponent((c.name).replace(/\+/g, '%20'))+'</td></tr><tr><td class="msg_you">'+decodeURIComponent((c.ht[i].contents).replace(/\+/g, '%20'))+'</td></tr></table></div> ');
						}
						// case 4 : 너=>너 and 시간 같음
						else if(beforeName==your_id && beforeTime==c.ht[i].date)
							{
							// 바로위에있는 시간 지우고 메세지+시간
							$('.msg_table_middle .msg_time').last().remove();
							$('.msg_table_middle').append('<div class="msg_both"><div class="msg_you">'+decodeURIComponent((c.ht[i].contents).replace(/\+/g, '%20'))+'</div></div>');
							$('.msg_table_middle').append('<div class="msg_time">'+msg_time+'</div>' );
							}
						// case 5 : 너=>너 and 시간 다름
						else if(beforeName==your_id && beforeTime!=c.ht[i].date)
							{
							// 메세지+시간
							$('.msg_table_middle').append('<div class="msg_both"><div class="msg_you">'+decodeURIComponent((c.ht[i].contents).replace(/\+/g, '%20'))+'</div></div>');
							$('.msg_table_middle').append('<div class="msg_time">'+msg_time+'</div>' );							}
						beforeName=your_id;
						beforeTime=c.ht[i].date;
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
				
				
			},
			error: function(request, status, errorData){
				alert("error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
				}
		});
		
		
		
	}