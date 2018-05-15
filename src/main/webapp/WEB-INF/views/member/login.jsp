<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/join.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/top_menu.jsp"%>
		</div>
		<!-- account-wrap -->


		<div id="container">
        	<div class="inner-wrap">
       			<h2>로그인</h2>
		<form action="/farm/login.do" method="post">
			<div class="login_div" >
				<div>
					<input type="text" name="member_id" id="userid" class="form-control"
						placeholder="아이디">
				</div>
				<div>
					<input type="password" name="member_pwd" id="userpwd"
						class="form-control" placeholder="비밀번호">
				</div>
				<input type="submit" name="login_btn" id="login_btn"
					class="btn btn-primary" value="로그인">

				<div class="social-account-big-wrap">
					<a href="#"><img src="/farm/resources/images/naver_login.PNG"
						style="width: 220px;"></a>
				</div>
			</div>

		</form>

 			 </div>
        </div>
		

		<!-- //account-wrap -->
		 <%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
</body>
</html>