<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/boot.css"  rel="stylesheet" type="text/css">
<link href="/farm/resources/css/join.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script>

$(function(){
	
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
			<div class="join_form join_form2" style="padding:20px 40px;"> <!--div구역내에 mainform을 담았음  -->
				<form id="mainform" method="post" action="/farm/updatePwd.do">
					<div>
						<h2 align="center" style="color:#777;margin-bottom:20px;">
							비밀번호 재설정
						</h2>
						<input type="hidden" name="member_id" value="${member.member_id }">
						<h3 class="h3">새로운 비밀번호를 입력해주세요.<br>비밀번호 재설정 후 로그인 페이지로 이동됩니다.</h3>
						<div>
								<div class="form-group"> <!--이름 label 및 이름 입력란 -->
									 <input type="password"
										class="form-control" id="userName" name="member_pwd" placeholder="새 비밀번호">
								</div>
								
								<div class="form-group"> <!--e-mail label 및 e-mail 입력란  -->
									 <input type="password"
										class="form-control" id="userPwd2" 
										placeholder="새 비밀번호 확인">
								</div>
								<div class="form-group text-center"><!--아이디 찾기 버튼 및 아이디 찾기 취소 버튼  -->
									<input type="submit" class="btn btn-info" id="searchId" name="searchId" value="설정"/>
									<input type="button" class="btn btn-danger" id="cancelBt" name="cancelBt" value="취소">
								</div>
						</div>
					</div>
					<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
					<!-- Include all compiled plugins (below), or include individual files as needed -->
					</form>
			</div>
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