<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<link href="/farm/resources/css/messenger.css" rel="stylesheet"
	type="text/css" />

<meta charset="UTF-8">
<title>messenger</title>
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/messenger.js"></script>
</head>

<script type="text/javascript">
	
</script>
<body>
	<div class="messenger_frame">
		<!-- 메신져 상단부분 -->

		<div class="msg_top">

			<div class="msg_top_div">
				<a href="javascript: back_chat_list() "><img
					src="/farm/resources/images/back_white.png"></a>
				<div class="msg_top_div_title">작 물 팜</div>
			</div>

			<table class="msg_top_table">
				<tr>
					<th class="messenger_back"><a
						href="javascript: back_chat_list()"><img
							src="/farm/resources/images/back_white.png">
						<!-- 채팅목록으로 이동 --></a></th>
					<th class="messenger_title"><table>
							<tr>
								<th><img src="/farm/resources/images/person_icon.png"></th>
								<td><div class="msg_title_name">회원이름</div>
									<div class="msg_title_online">접속상태</div></td>
						</table></th>
				</tr>
			</table>
		</div>

		<div class="msg_middle">

			<!-- 사용자 검색 추가 -->
			<div class="search_member">
				<a href="javascript: searchMember()"> <img
					src="/farm/resources/images/search_icon.png">
				</a> <input type="text" placeholder=" 아이디, 이름 검색으로 대화 추가">
			</div>

			<!--//////////////////////// 검색내용 ////////////////////////-->
			<div class="search_list"></div>
			<!--/////////////////////// 검색내용 끝 //////////////////////-->
			<!-- //////////////////////////////대화목록 /////////////////////////////-->

			<div class="chat_list_table">
				<!-- 실제 기능 -->
				<c:if test="${! empty chatList}">
					<c:forEach items="${chatList}" var="chat" varStatus="cList" >
						<a href="javascript: move_msg_table(${chat.chat_no },'${sessionScope.loginUser.member_id }','${chat.member_id }' );">
							<table>
								<tr>
									<td class="list_profile" rowspan="2"><img
										src="/farm/resources/upload/memberUpload/${chat.member_img }"></td>
									<td class="list_name">${chat.member_name }</td>
									<td class="list_time"><fmt:parseDate
											value="${chat.chat_history_date}" var="time"
											pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate value="${time}" type="time"
											 timeStyle="short" /></td>
								</tr>
								<tr>
									<td colspan="2"><span class="list_content"> ${chat.chat_history_contents }  </span></td>
								</tr>
							</table>
						</a>
					</c:forEach>
				</c:if>

				<!-- profile: 사진  / name: 이름 / time: 시간 / content: 내용 -->
				<a href="javascript: move_msg_table();"> <!-- 대화창으로 이동 A태그-->
					<table>
						<tr>
							<td class="list_profile" rowspan="2"><img
								src="/farm/resources/images/logo.jpg"></td>
							<td class="list_name">상대방1</td>
							<td class="list_time">오후 2:41</td>

						</tr>
						<tr>
							<td colspan="2"><span class="list_content">대화내용 대화내용
									대화내용 대화내용 대화내용 대화내용 대화내용 대화내용 대화내용 </span></td>
						</tr>
					</table>
				</a>


				<!-- 테스트용 반복 코드 -->
				<a href="javascript: move_msg_table(); "> <!-- 대화창으로 이동 A태그-->
					<table>
						<tr>
							<td class="list_profile" rowspan="2"><img
								src="/farm/resources/images/send_msg_icon_2.png"></td>
							<td class="list_name">상대방2</td>
							<td class="list_time">오후 3:06</td>
						</tr>
						<tr>
							<td colspan="2"><span class="list_content">대화내용</span></a></td>
						</tr>
					</table>
				</a> <a href="javascript: move_msg_table();"> <!-- 대화창으로 이동 A태그-->
					<table>
						<tr>
							<td class="list_profile" rowspan="2"><img
								src="/farm/resources/images/logo01.png"></td>
							<td class="list_name">상대방3</td>
							<td class="list_time">오전 1:11</td>
						</tr>
						<tr>
							<td colspan="2"><span class="list_content">대화내용</span></a></td>
						</tr>
					</table>
				</a> <a href="javascript: move_msg_table();"> <!-- 대화창으로 이동 A태그-->
					<table>
						<tr>
							<td class="list_profile" rowspan="2"><img
								src="/farm/resources/images/person_icon.png"></td>
							<td class="list_name">상대방4</td>
							<td class="list_time">오후 11:10</td>
						</tr>
						<tr>
							<td colspan="2"><span class="list_content">대화내용</span></a></td>
						</tr>
					</table>
				</a> <a href="javascript: move_msg_table();"> <!-- 대화창으로 이동 A태그-->
					<table>
						<tr>
							<td class="list_profile" rowspan="2"><img
								src="/farm/resources/images/farm.jpg"></td>
							<td class="list_name">상대방5</td>
							<td class="list_time">오후 5:11</td>
						</tr>
						<tr>
							<td colspan="2"><span class="list_content">대화내용aaaaaaa</span></a></td>
						</tr>
					</table>
				</a>
				<!-- 테스트용 반복코드 끝 -->
			</div>
			<!-- ///////////////////////////////대화목록 끝 ///////////////////////////////////////-->


			<!-- /////////////////////////////대화창 //////////////////////////////////////////////-->
			<div class="msg_table_middle">


				<!--  본인이 보내는 메시지 -->

				<div class="msg_my">내가 보낸 짧은 메세지</div>
				<div class="msg_my">내가 보낸 긴 메세지ㅁㅁㅁㅁㅁ</div>
				<div class="msg_my">내가 보낸 긴 개행 메세지 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>

				<!--  본인 메시지 묶음 마지막에 시간 출력 -->
				<div class="msg_time_my">오전 2:47</div>

				<!-- ///////////////////////////// -->
				<!-- 상대방이 처음 메시지를 보내거나,  또는 직전 메시지가 상대방이 아닌경우  프로필사진+이름 포함하여 메시지 출력-->

				<div class="msg_middle_left_img">
					<table>
						<tr>
							<th rowspan="2"><img
								src="/farm/resources/images/person_icon.png"></th>
							<td>회원이름</td>
						</tr>
						<tr>
							<td class="msg_you">상대방 짧은 메세지</td>
						</tr>
					</table>
				</div>

				<!-- 직전 메시지가 상대방일경우, 메시지만 출력 -->
				<div class="msg_you">상대방 긴 메세지ㅁㅁㅁㅁㅁㅁㅁ</div>
				<div class="msg_you">상대방 긴 개행 메세지 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
				<div class="msg_time">오전 2:04</div>




			</div>

			<!-- ///////////////////////////////대화창 끝 ///////////////////////////////////////-->





		</div>
		<!-- 메신져 하단 -->
		<div class="msg_bottom">
			<table class="msg_bottom_table">
				<tr>
					<th><input class="msg_input" type="text"
						placeholder="메시지전송..." autofocus="autofocus"></th>
					<th><a href="#">
							<!-- servlet method 실행 -->
							<img class="send_msg_icon"
							src="/farm/resources/images/send_msg_icon_3.png">
					</a></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>