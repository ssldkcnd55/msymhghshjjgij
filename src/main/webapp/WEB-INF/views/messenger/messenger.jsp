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
	<input type="hidden" id="login_id" value="${sessionScope.loginUser.member_id }">
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
						<!-- 채팅목록으로 이동 --></a></th><th class="messenger_back_th">
						<c:if test="${! empty chatList}">
					<c:forEach items="${chatList}" var="chat" varStatus="cList" >	
					<c:set var="alarm_count"  value="${chat.chat_history_alarm +alarm_count}" />	
				 	${chat_history_alarm }
					</c:forEach>
					<c:if test="${ alarm_count > 0}">
					<div class="messenger_back_count"><c:out value="${alarm_count }"></c:out></div></c:if>
					</c:if>
						
						</th>
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
									<td colspan="2"><span class="list_content"> ${chat.chat_history_contents }</span>
									<c:if test="${chat.chat_history_alarm > 0 }">
									<span class="list_alarm">${chat.chat_history_alarm}</span>
									</c:if>
									</td>
								</tr>
							</table>
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${empty chatList }">
				<div class="searchNotFoundID">진행중인 대화가 없습니다.</div>
				<div class="searchNotFoundMsg">아이디 또는 이름을 검색하여 대화를 시작하세요.</div>
				</c:if>
			</div>
			
			<!-- ///////////////////////////////대화목록 끝 ///////////////////////////////////////-->


			<!-- /////////////////////////////대화창 //////////////////////////////////////////////-->
			<div class="msg_table_middle">
			대화창대화창

			</div>
			<!-- ///////////////////////////////대화창 끝 ///////////////////////////////////////-->
</div>
		
		<!-- 메신져 하단 -->
		<div class="msg_bottom">
			<table class="msg_bottom_table">
				<tr>
					<th><input class="msg_input" type="text"
						placeholder="메시지전송..." autofocus="autofocus"></th>
					<th><a href="javascript: return false;">
							<!-- servlet method 실행 -->
							<img class="send_msg_icon"
							src="/farm/resources/images/send_msg_icon_3.png">
					</a></th>
				</tr>
				<!-- <tr><td><a id="img_a" href="javascript: return false;">사진전송</a></td><td><input id="img_input" type="file" hidden="hidden" ></td></tr> -->
			</table>
		</div>
	</div>
	
</body>
</html>