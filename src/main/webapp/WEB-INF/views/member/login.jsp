<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/join.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/login.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script>

$(function(){
	var message = '<c:out value="${message}" />';
	
	if(message != null && message != ""){
		alert(message);
	}
	
});

</script>
</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<!-- account-wrap -->


		<div id="container">
        	<div class="inner-wrap">
       			<h2 class="logintitle">로그인</h2>
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

				<div id="naver_id_login" style="text-align:center"><a href="${url}">
				<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
				
				<div class="find_div">
					<a href="/farm/moveFindId.do">아이디 찾기</a>&nbsp;&nbsp;<a>|</a>&nbsp;&nbsp;<a href="/farm/moveFindPwd.do">비밀번호 찾기</a>
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