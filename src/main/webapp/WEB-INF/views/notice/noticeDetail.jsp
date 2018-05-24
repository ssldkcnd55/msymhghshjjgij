<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
function moveNotice_write(){
	location.href="/farm/moveNotcie_write.do";
}
</script>

</head>
<body>

	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@ include file="../inc/top_menu.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">
				<div class="board-wrap">

					<div class="Notice_title">${notice.notice_title}</div>

					<div class="Notice_full">
						<table class="Notcie_table">
							<tr>
								<td>홈페이지 공지사항</td>
								<td>운영자</td>
								<td>${notice.notice_date}</td>
							</tr>
						</table>
						<div class="Notice_modify">
							<button onclick="moveNotice_write();">수정</button>&nbsp;
							<button>삭제</button>
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