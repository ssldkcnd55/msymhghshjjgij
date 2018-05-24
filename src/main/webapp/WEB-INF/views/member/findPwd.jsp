<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/boot.css" rel="stylesheet"  type="text/css">
<link href="/farm/resources/css/join.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<!-- account-wrap -->
		<div id="container">
        	<div class="inner-wrap1">
			<div class="join_form join_form2" style="padding:20px 40px;"> <!--div구역내에 mainform을 담았음  -->
				<form id="mainform" method="post" action="/farm/moveupdatePwd.do">
					<div>
						<h2 class="h2">
								FIND PWD
						</h2>
						<h3 class="h3">가입하셨던 이메일 계정을 입력하시면,<br>비밀번호를 새로 만들 수 있는 링크로 이동됩니다.</h3>
						<div class="pwd_box">
								<div class="form-group"> <!--이름 label 및 이름 입력란 -->
									<label for="userName">이름</label> <input type="text"
										class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요.">
								</div>
								
								<div class="form-group">
								<!--e-Mail 기입란  --><!-- 원래 이메일인데 테스트할라구 text로바ㅜㄲㅁ -->
								<label for="userEmail">E-mail</label><br><input type="text" 
									class="form-control" id="userEmail" name="member_id" style="width:330px;"
									placeholder="ex)abcd@naver.com">
								<div class="form-group text-center">
									<input type="button" class="btn btn-info" id="mailsend" name="dupliBt" value="메일인증" onclick="sendMail();" required/>
								</div><br><br>
							</div>
								<div class="form-group">
								<!--e-Mail 기입란  -->
								<label for="vCode">인증번호</label><br><input type="text" style="width:330px;"
									class="form-control" id="vCode" name="vCode" onChange="vCodeChange();">
								<div class="form-group text-center">
									<input type="button" class="btn btn-info" id="vCodecheck" name="dupliBt" value="번호확인" onclick="vCodeCheck1();" required>
								</div>
							</div><br><br>
								<div class="form-group text-center"><!--아이디 찾기 버튼 및 아이디 찾기 취소 버튼  -->
									
									<div class="searchBtn"><input type="submit"  id="searchPwd" name="searchPwd" value="아이디 찾기"/></div>
									<input type="button" class="loginBtn" value="로그인">
								</div>
						</div>
					</div>
					<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
					<!-- Include all compiled plugins (below), or include individual files as needed -->
					<script src="/classKing/js/bootstrap.min.js"></script>
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