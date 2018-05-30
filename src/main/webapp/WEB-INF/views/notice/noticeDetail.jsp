<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!--Noice_Detail.css -->
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/Notice_Detail.css" />
<title>공지사항</title>

<script type="text/javascript">

/* Notcie수정 버튼 */
function moveUpdateNotice(){
	location.href="/farm/moveUpdateNotice.do?notice_no=${notice.notice_no}&notice_title=${notice.notice_title}&notice_contents=${notice.notice_contents}";
}

/* 삭제 버튼 */
function deleteNotice(){
	var result = confirm('정말로 삭제하시겠습니까?'); 

	if(result) {
		
		location.href="/farm/deleteNotice.do?notice_no=${notice.notice_no}"
	}else {
		
	}
}
</script>

</head>
<body>

	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@ include file="../inc/header.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">
				<div class="board-wrap">

					<div class="Notice_title">공지사항</div>

					<div class="Notice_full">
						<table class="Notcie_table">
							<tr>
								<td>${notice.notice_title}</td>
								<td>운영자</td>
								<td>${notice.notice_date}</td>
							</tr>
						</table>
						
						<div class="Notice_modify">
						<c:choose>
							<c:when test="${loginUser.member_category == 2}">
								<button onclick="moveUpdateNotice();">수정</button>&nbsp;
								<button onclick="deleteNotice();">삭제</button>
							</c:when>
							<c:otherwise/>
						</c:choose>	
						</div>
						<div class="Notice_note">
							${notice.notice_contents}
						</div>
						<br> <br>
					</div><!-- 내용  -->




				</div>
				<!-- board-wrap -->
			</div>
			<!-- inner-wrap -->
			<!-- container끝 -->

			<div id="footer">
				<%@  include file="../inc/foot.jsp"%>
			</div>
		</div>
		<!-- wrap끝  -->
</body>
</html>