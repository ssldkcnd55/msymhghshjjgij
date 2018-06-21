/**
 * 
 */

/* 메신져 자바스크립트 파일 */

// var ws =null;
var beforeName = null;
var beforeTime = null;
var beforeDate = null;
var nowDate = null;
var ws = null;
var private_chat_no = 0;
var private_my_id = "";

$(function() {

	$('#img_a').on('click', function(evt) {
		$('#img_input').click();
	});
	
	$('#img_input').on('change',function(evt) {
		
		if ($('#img_input')[0].files[0] != null) {
			if($('#img_input')[0].files[0].size > 31457279)
				{
				alert("용량이 30MB를 초과합니다.");
				return;
				}
			var fd = new FormData($('#msg_form')[0]);
			fd.append("chat_room", private_my_id+"_"+private_chat_no);
			fd.append("file", $('#img_input')[0].files[0]);
			$.ajax({
				url : "msg_saveImg.do",
				type : "post",
				processData : false,
				contentType : false,
				cache : false,
				data : fd,
				dataType:"json",
				success : function(jData) {
					var d= JSON.parse(JSON.stringify(jData));
					var data =d.reName;
					var fieSize = d.size;
					
						$('#img_input').val("");
						var msgData="<a href='javascript: openImgPage(\""+ data+ "\","+ private_chat_no+ ");'><img class='chat_send_img'   src='resources/upload/chatUpload/"+data+"'></a><br><a class='msg_img_down_btn' href='msg_img_down.do?filename="+data+"'><img src='resources/upload/chatUpload/down_icon.png'>저장</a>";
						$('.msg_input').val(msgData);
						$('.send_msg_icon').click();
						},
				error : function() {
						console.log("error")}
						});
					}
			});
	$('#file_a').on('click',function(evt){
		$('#file_input').click();
	});
	$('#file_input').on('change',function(evt) {
		if ($('#file_input')[0].files[0] != null) {
			if($('#file_input')[0].files[0].size > 31457279)
			{
			alert("용량이 30MB를 초과합니다.");
			return;
			}
			var fd = new FormData($('#msg_file_form')[0]);
			fd.append("chat_room", private_my_id+"_"+private_chat_no);
			fd.append("file", $('#file_input')[0].files[0]);
			$.ajax({
				url : "msg_saveImg.do",
				type : "post",
				processData : false,
				contentType : false,
				cache : false,
				data : fd,
				dataType:"json",
				success : function(jData) {
					var d= JSON.parse(JSON.stringify(jData));
					var data =d.reName;
					var oriName=d.oriName;
					var fieSize = Number(d.size);
					if(fieSize<1024)
						{
						fieSize = fieSize+" bytes";
						}
					else if(fieSize<1024*1024)
						{
						fieSize = Math.round(fieSize/1024*10)/10+" KB";
						}
					else
						{
						fieSize=  Math.round(fieSize/(1024*1024)*10)/10+" MB";
						}
						$('#file_input').val("");
						var msgData="<a class='chat_send_file_a' href='javascript: openFilePage(\""+ data+ "\");'><img class='chat_send_file'   src='resources/upload/chatUpload/file_down_icon.png'><font class='chat_send_file_font'>파일</font><br>"+oriName+"<br>용량 : "+fieSize+"</a><br><a class='msg_img_down_btn' href='msg_img_down.do?filename="+data+"'><img src='resources/upload/chatUpload/down_icon.png'>저장</a>";
//						var msgData="<a class='chat_send_file_a' href='javascript: openFilePage(\""+ data+ "\");'><font class='chat_send_file_font'>"+data+"</font><br>용량 : "+fieSize+"</a><br><a class='msg_img_down_btn' href='msg_img_down.do?filename="+data+"'><img src='resources/upload/chatUpload/down_icon.png'>저장</a>";
						$('.msg_input').val(msgData);
						$('.send_msg_icon').click();
						},
				error : function() {
						console.log("error")}
						});
		}
	});
	/* 검색 엔터키 연동 */
	$('.search_member input').keydown(function(key) {
		if (key.keyCode == 13) {
			searchMember();
		}
	});

});

function insertChat(my_id, your_id) {// 대화상대 추가

	if (my_id != your_id) {
		$.ajax({
			url : "insertChat.do",
			type : "post",
			dataType : "json",
			data : {
				'my_id' : my_id,
				'your_id' : your_id
			},
			success : function(resultData) {

				var objStr = JSON.stringify(resultData);
				var c = JSON.parse(objStr);
				private_chat_no = c.chat_no;

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

				return move_msg_table(c.chat_no, my_id, your_id);

			},
			error : function(request, status, errorData) {
				console.log("messenger.js / insertChat()")
				console.log("error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			}

		});
	} else if (my_id == your_id) {
		/* 대화목록 가리고 검색결과창 띄우기 */
		$('.search_list').css('visibility', 'visible');
		$('.search_list').css('z-index', 2);
		$('.chat_list_table').css('visibility', 'hidden');
		$('.chat_list_table').css('z-index', 1);
		$('.msg_top_div img').css('visibility', 'visible');

		$('.search_list').html('');
		$('.search_member input').val('');
		var fail_msg = " <div class='searchNotFoundID'>본인과는 대화를 할 수 없습니다</div "

		$('.search_list').html(fail_msg);
	}

}

/* 대화추가 검색 메서드 */
function searchMember() {

	$
			.ajax({
				url : "searchChatMember.do",
				type : "post",
				dataType : "json",
				data : {
					sv : $('.search_member>input').val()
				},
				success : function(resultData) {
					var objStr = JSON.stringify(resultData);
					var c = JSON.parse(objStr);
					$('.search_list').html('');

					if (c.ml.length > 0) {
						$('.search_member input').val('');
						for ( var i in c.ml) {

							var searchedMember = "<table class='searchedMember'><tr><td rowspan='2'><img src='/farm/resources/upload/memberUpload/"
									+ decodeURIComponent((c.ml[i].member_img)
											.replace(/\+/g, '%20'))
									+ "'></td><td class='searchMemberNametd'><span class='searchMemberName'>"
									+ decodeURIComponent((c.ml[i].member_name)
											.replace(/\+/g, '%20'))
									+ "</span></td><td rowspan='2'><input type='button' onclick='insertChat(\""
									+ $('#login_id').val()
									+ "\",\""
									+ c.ml[i].member_id
									+ "\");' value='1:1 채팅'></td></tr><tr><td class='searchMemberIdtd'><span class='searchMemberId'>"
									+ c.ml[i].member_id
									+ "</span></td></tr></table>"

							$('.search_list').append(searchedMember);
						}

					} else {
						/* 검색결과 없을 때 여기 실행 */
						var input_value = $('.search_member input').val();
						$('.search_member input').val('');
						var fail_msg = " <div class='searchNotFoundID'> '"
								+ input_value
								+ "'를<br> 찾을 수 없습니다.</div>"
								+ " <div class='searchNotFoundMsg'>입력하신 아이디, 이름으로 등록된 회원이 없습니다.</div> "
						$('.search_list').html(fail_msg);
					}

					/* 대화목록 가리고 검색결과창 띄우기 */
					$('.search_list').css('visibility', 'visible');
					$('.search_list').css('z-index', 2);
					$('.chat_list_table').css('visibility', 'hidden');
					$('.chat_list_table').css('z-index', 1);
					$('.msg_top_div img').css('visibility', 'visible');

				},
				error : function(request, status, errorData) {
					console.log("messenger.js / searchMember()")
					console.log("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			});

}

/* 검색결과 가리고 대화목록 띄우기 */
function back_chat_list() {
	beforeName = null;
	beforeTime = null;
	beforeDate = null;
	nowDate = null;
	ws = null;
	$.ajax({
				url : "getChatList.do",
				type : "post",
				dataType : "json",
				success : function(resultData) {
					// window.location.reload();
					var objStr = JSON.stringify(resultData);
					var c = JSON.parse(objStr);
					$('.chat_list_table').html('');

					if (c.cl.length > 0) {
						for ( var i in c.cl) {
							var con;
							con = '<a href=\'javascript: move_msg_table('
									+ c.cl[i].chat_no + ',"'
									+ $('#login_id').val() + '","'
									+ c.cl[i].member_id + '" );\'>';
							con += '<table><tr><td class="list_profile" rowspan="2"><img src="/farm/resources/upload/memberUpload/'
									+ decodeURIComponent((c.cl[i].member_img)
											.replace(/\+/g, '%20')) + '"></td>';
							con += '<td class="list_name">'
									+ decodeURIComponent((c.cl[i].member_name)
											.replace(/\+/g, '%20')) + '</td>';
							con += '<td class="list_time">'
									+ trans_time(c.cl[i].date.slice(-5))
									+ '</td></tr>';
							if (decodeURIComponent((c.cl[i].contents).replace(/\+/g, '%20')).indexOf("openImgPage") != -1) {
								con += '<tr><td colspan="2"><span class="list_content"><img class="list_content_img_icon" src="resources/upload/chatUpload/img_icon.png"><span class="list_content_img_span">사진</span></span>';
							}
							else if(decodeURIComponent((c.cl[i].contents).replace(/\+/g, '%20')).indexOf("openFilePage") != -1)
								{
								con += '<tr><td colspan="2"><span class="list_content"><img class="list_content_img_icon" src="resources/upload/chatUpload/file_down_icon.png"><span class="list_content_img_span">파일</span></span>';
								}
							else {
								con += '<tr><td colspan="2"><span class="list_content">'
										+ decodeURIComponent((c.cl[i].contents)
												.replace(/\+/g, '%20'))
										+ '</span>';
							}
							if (c.cl[i].alarm > 0) {
								con += '<span class="list_alarm">'
										+ c.cl[i].alarm + '</span>';
							}

							con += '</td></tr></table></a>';

							$('.chat_list_table').append(con);
						}
					} else {
						$('.chat_list_table')
								.append(
										'<div class="searchNotFoundID">진행중인 대화가 없습니다.</div><div class="searchNotFoundMsg">아이디 또는 이름을 검색하여 대화를 시작하세요.</div></div>');
					}
				},
				error : function(request, status, errorData) {
					console.log("messenger.js/ back_chat_list()");
					console.log("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			});

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

	// webSocket닫기
	if (ws != null) {
		ws.close();
		ws = null;
	}
}

function trans_time(time) {
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
				success : function(resultData) {
					var objStr = JSON.stringify(resultData);
					var c = JSON.parse(objStr);

					if ($('.messenger_back_count').html() == undefined) {
						if (c.alarmCount > 0) {
							$('.messenger_back_th').html(
									'<div class="messenger_back_count">'
											+ c.alarmCount + '</div>');
						} else {
							$('.messenger_back_th').html('');
						}
					} else {
						if (c.alarmCount > 0) {
							$('.messenger_back_count').text(c.alarmCount);
						} else {
							$('.messenger_back_th').html('');
						}
					}

					$('.msg_table_middle').html('');

					$('.messenger_title img').prop(
							"src",
							"/farm/resources/upload/memberUpload/"
									+ decodeURIComponent((c.img).replace(/\+/g,
											'%20')));
					$('.msg_title_name').text(
							decodeURIComponent((c.name).replace(/\+/g, '%20'))
									+ '(' + your_id + ')');

					var your_profile = '<tr><th rowspan="2" class="your_profile_img"><img class="your_profile_image" src="/farm/resources/upload/memberUpload/'
							+ decodeURIComponent((c.img).replace(/\+/g, '%20'))
							+ ' "></th><td>'
							+ decodeURIComponent((c.name).replace(/\+/g, '%20'))
							+ '</td></tr>';

					for ( var i in c.ht) {
						// ///////////////////////////시간설정////////////////////

						var msg_time = trans_time(c.ht[i].date
								.substring(11, 16));

						var today = new Date(c.ht[i].date)
						nowDate = today.getFullYear() + "년 "
								+ (today.getMonth() + 1) + "월 "
								+ today.getDate() + "일 ";
						switch (today.getDay()) {
						case 0:
							nowDate += "일요일"
							break;
						case 1:
							nowDate += "월요일"
							break;
						case 2:
							nowDate += "화요일"
							break;
						case 3:
							nowDate += "수요일"
							break;
						case 4:
							nowDate += "목요일"
							break;
						case 5:
							nowDate += "금요일"
							break;
						default:
							nowDate += "토요일"
						}

						// 첫 메세지
						if (beforeDate == null) {
							beforeDate = nowDate;
							$('.msg_table_middle')
									.append(
											'<div class="msg_date"><table><tr><td><hr></td><th>'
													+ nowDate
													+ '</th><td><hr></td></tr></table></div>');

						}
						// 날 바뀜
						else if (beforeDate != nowDate) {
							beforeName = null;
							beforeDate = nowDate;
							$('.msg_table_middle')
									.append(
											'<div class="msg_date"><table><tr><td><hr></td><th>'
													+ nowDate
													+ '</th><td><hr></td></tr></table></div>');
						}

						if (c.ht[i].member_id == my_id) {
							// case 1 : 나=>나 and 시간 같음
							if (beforeName == my_id && beforeTime == msg_time) {
								// 바로위에 있는 시간 지우고 메세지+시간
								$('.msg_table_middle .msg_time_my').last()
										.remove();
								$('.msg_table_middle .msg_time').last()
										.remove();
							}

							if (c.ht[i].alarm == 'N') {// 안읽음
								$('.msg_table_middle')
										.append(
												'<table class="msg_rightBox"><tr><th><div>1</div></th><td class="msg_my">'
														+ decodeURIComponent((c.ht[i].contents)
																.replace(/\+/g,
																		'%20'))
														+ '</td></tr></table>');

								$('.msg_rightBox th').last().css('width',
										304 - $('.msg_my').last().css('width'));

							} else if (c.ht[i].alarm == 'Y') {// 읽음
								$('.msg_table_middle')
										.append(
												'<div class="msg_rightBox"><div class="msg_my">'
														+ decodeURIComponent((c.ht[i].contents)
																.replace(/\+/g,
																		'%20'))
														+ '</div></div>');
							}
							$('.msg_table_middle').append(
									'<div class="msg_time"><div class="msg_time_my">'
											+ msg_time + '</div></div>');

							beforeName = my_id;
							beforeTime = msg_time;
						}

						else if (c.ht[i].member_id == your_id) {
							// case 3 : (나=>너 ) or 너
							if (beforeName == my_id || beforeName == null) {
								// 사진+이름+메세지+시간
								$('.msg_table_middle')
										.append(
												'<div class="msg_middle_left_img"><table>'
														+ your_profile
														+ '<tr><td class="msg_you">'
														+ decodeURIComponent((c.ht[i].contents)
																.replace(/\+/g,
																		'%20'))
														+ '</td></tr></table></div> ');
								$('.msg_table_middle').append(
										'<div class="msg_time"><div class="msg_time_you">'
												+ msg_time + '</div></div>');
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
										'<div class="msg_time"><div class="msg_time_you">'
												+ msg_time + '</div></div>');
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
										'<div class="msg_time"><div class="msg_time_you">'
												+ msg_time + '</div></div>');
							}
							beforeName = your_id;
							beforeTime = msg_time;
						}

					}

					// //////////////////
					$('.search_list').css('visibility', 'hidden');
					$('.search_list').css('z-index', 1);
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

					// ///////////////////////////////////
					// ///////채팅방생성////////////////

					$('.msg_table_middle').scrollTop(
							$('.msg_table_middle').prop("scrollHeight"));
					$('.msg_input').focus();

					openChat(chat_no, my_id, your_id, your_profile);

				},
				error : function(request, status, errorData) {
					console.log("messenger.js / move_msg_table");
					console.log("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
				}
			});
}
function openChat(chat_no, my_id, your_id, your_profile) {
	ws = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?state=msg&your_id="+ your_id + "&chat_no=" + chat_no);
	private_chat_no=chat_no;
	private_my_id=my_id;
	ws.onopen = function() {

		$('.msg_input').on('keydown', function(evt) {
			if (evt.keyCode == 13 && $('.msg_input').val() != '') {
				var msg = $('.msg_input').val();
				ws.send(msg);
				$('.msg_input').val('');
				$('.msg_input').focus();
			}
		});
		$('.send_msg_icon').on('click', function(evt) {
			if ($('.msg_input').val() != '') {
				var msg = $('.msg_input').val();
				ws.send(msg);
				$('.msg_input').val('');
				$('.msg_input').focus();
			}
		});
		
	};
	ws.onmessage = function(event) {

		var msgCode = event.data.substring(0, 3);
		if (msgCode == 'lin') {
			$('.msg_title_online').text('접속중');
			return;
		} else if (msgCode == 'cin') {
			$('.msg_rightBox th').text('');
			return;
		} else if (msgCode == 'lou') {
			$('.msg_title_online').text('미접속');
			return;
		}
		var msgContents = event.data.slice(3);
		var today = new Date();
		nowDate = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 "
				+ today.getDate() + "일 ";
		switch (today.getDay()) {
		case 0:
			nowDate += "일요일"
			break;
		case 1:
			nowDate += "월요일"
			break;
		case 2:
			nowDate += "화요일"
			break;
		case 3:
			nowDate += "수요일"
			break;
		case 4:
			nowDate += "목요일"
			break;
		case 5:
			nowDate += "금요일"
			break;
		default:
			nowDate += "토요일"
		}

		var timeTemp = (new Date()).toString().slice(-26).substring(0, 5);
		var msg_time = trans_time(timeTemp);

		// 첫 메세지
		if (beforeDate == null) {
			beforeDate = nowDate;
			$('.msg_table_middle')
					.append(
							'<div class="msg_date"><table><tr><td><hr></td><th>'
									+ nowDate
									+ '</th><td><hr></td></tr></table></div>');
		}
		// 날 바뀜
		else if (beforeDate != nowDate) {
			beforeName = null;
			beforeDate = nowDate;
			$('.msg_table_middle')
					.append(
							'<div class="msg_date"><table><tr><td><hr></td><th>'
									+ nowDate
									+ '</th><td><hr></td></tr></table></div>');
		}

		// 내가 보낸 메세지
		if (msgCode.substring(0, 2) == 'me') {

			// case 1 : 나=>나 and 시간 같음
			if (beforeName == my_id && beforeTime == msg_time) {// 바로위에 있는
				// 시간 지우고
				// 메세지+시간
				$('.msg_table_middle .msg_time_my').last().remove();
				$('.msg_table_middle .msg_time').last().remove();
			}

			if (msgCode == 'meo') {
				// $('.msg_title_online').text('접속중');
				$('.msg_rightBox th').text('');
				$('.msg_table_middle').append(
						'<div class="msg_rightBox"><div class="msg_my">'
								+ msgContents + '</div></div>');
			} else if (msgCode == 'mex') {
				// $('.msg_title_online').text('미접속');
				$('.msg_table_middle').append(
						'<table class="msg_rightBox"><tr><th><div>1</div></th><td class="msg_my">'
								+ msgContents + '</td></tr></table>');
			}

			$('.msg_table_middle').append(
					'<div class="msg_time"><div class="msg_time_my">'
							+ msg_time + '</div></div>');

			beforeName = my_id;
			beforeTime = msg_time;

		}

		// 너가 보낸 메세지
		else if (msgCode == 'you') {
			// case 3 : (나=>너 ) or 너
			if (beforeName == my_id || beforeName == null) {// 사진+이름+메세지+시간
				$('.msg_table_middle').append(
						'<div class="msg_middle_left_img"><table>'
								+ your_profile + '<tr><td class="msg_you">'
								+ msgContents + '</td></tr></table></div>');
				$('.msg_table_middle').append(
						'<div class="msg_time"><div class="msg_time_you">'
								+ msg_time + '</div></div>');
			}
			// case 4 : 너=>너 and 시간 같음
			else if (beforeName == your_id && beforeTime == msg_time) {// 바로위에있는
				// 시간
				// 지우고
				// 메세지+시간
				$('.msg_table_middle .msg_time_you').last().remove();
				$('.msg_table_middle .msg_time').last().remove();
				$('.msg_table_middle').append(
						'<div class="msg_leftBox"><div class="msg_you">'
								+ msgContents + '</div></div>');
				$('.msg_table_middle').append(
						'<div class="msg_time"><div class="msg_time_you">'
								+ msg_time + '</div></div>');
			}
			// case 5 : 너=>너 and 시간 다름
			else if (beforeName == your_id && beforeTime != msg_time) {// 메세지+시간
				$('.msg_table_middle').append(
						'<div class="msg_leftBox"><div class="msg_you">'
								+ msgContents + '</div></div>');
				$('.msg_table_middle').append(
						'<div class="msg_time"><div class="msg_time_you">'
								+ msg_time + '</div></div>');
			}
			beforeName = your_id;
			beforeTime = msg_time;
		}

		$('.msg_table_middle').scrollTop(
				$('.msg_table_middle').prop("scrollHeight"));
	};

}

function sendMsgOutside(msg, your_id, chat_no) {

	if (ws != null) {
		console.log("ws!=null");
		ws.send(msg);
	} else {

		ws = new WebSocket(
				"ws://127.0.0.1:7777/farm/chat.do?state=msg&your_id=" + your_id
						+ "&chat_no=" + chat_no);
		ws.onopen = function() {
			ws.send(msg);
		}
	}
}
