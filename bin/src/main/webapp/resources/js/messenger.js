/**
 * 
 */

/*메신져 자바스크립트 파일*/

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
	
		
	
	/* 대화추가  검색 메서드 */
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
			/* 검색결과 있을 때  여기 실행*/
			var searchedMember = "<div class='searchedMember'><img src='/farm/resources/images/logo01.png'><span>회원이름</span><input type='button' value='1:1 채팅'></div>";
			searchedMember+="<div class='searchedMember'><img src='/farm/resources/images/farm.jpg'><span>회원이름2</span><input type='button' value='1:1 채팅'></div>";
			searchedMember+="<div class='searchedMember'><img src='/farm/resources/images/person_icon.png'><span>회원이름3</span><input type='button' value='1:1 채팅'></div>";
			searchedMember+="<div class='searchedMember'><img src='/farm/resources/images/messenger_icon_orange.png'><span>회원이름4</span><input type='button' value='1:1 채팅'></div>";

			$('.search_list').html(searchedMember);
		}
		else{
			/* 검색결과  없을 때  여기 실행*/
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
		
		
		
		//검색창 가리기
		$('.chat_list_table').css('visibility', 'vidible');
		$('.chat_list_table').css('z-index', 2);
		//검색리스트 가리기
		$('.search_member').css('visibility', 'visible');
		$('.search_member').css('z-index', 2);
		//대화창 띄우기
		$('.msg_table_middle').css('visibility', 'hidden');
		$('.msg_table_middle').css('z-index', 1);
		$('.msg_top_div').css('visibility', 'visible');
		$('.msg_top_div').css('z-index', 1);
		$('.msg_top_table').css('visibility', 'hidden');
		$('.msg_top_table').css('z-index', 2);
		//메세지 입력칸 가리기
		$('.msg_bottom_table').css('visibility', 'hidden');
	}
	
	
	/* 리스트 가리고 대화창 화면 띄우기 */
	function move_msg_table(){
		//검색창 가리기
		$('.chat_list_table').css('visibility', 'hidden');
		$('.chat_list_table').css('z-index', 1);
		//검색리스트 가리기
		$('.search_member').css('visibility', 'hidden');
		$('.search_member').css('z-index', 1);
		//대화창 띄우기
		$('.msg_table_middle').css('visibility', 'visible');
		$('.msg_table_middle').css('z-index', 2);
		$('.msg_top_div').css('visibility', 'hidden');
		$('.msg_top_div').css('z-index', 1);
		$('.msg_top_table').css('visibility', 'visible');
		$('.msg_top_table').css('z-index', 1);
		//메시지 입련칸 띄우기
		$('.msg_bottom_table').css('visibility', 'visible');
	}