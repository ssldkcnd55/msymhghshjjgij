<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/boot.css"  rel="stylesheet" type="text/css">
<link href="/farm/resources/css/join.css" rel="stylesheet" type="text/css">
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
			<div class="join_form join_form2" style="padding:20px 40px;"> <!--div구역내에 mainform을 담았음  -->
				<form id="mainform" method="post" action="/classKing/idfind">
					<div>
						<h2 align="center" style="color:#777;margin-bottom:20px;">
								ID 찾기
						</h2>
						<h3 id="p">작물팜은 이메일을 아이디로 사용합니다.<br>소유하고 계신 계정을 입력해보세요.<br>가입여부를 확인해드립니다.</h3>
						<div>
								<div class="form-group"> <!--이름 label 및 이름 입력란 -->
									<label for="userName">이름</label> <input type="text"
										class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요.">
								</div>
								
								<div class="form-group"> <!--e-mail label 및 e-mail 입력란  -->
									<label for="userMail">E-mail</label> <input type="text"
										class="form-control" id="userMail" name="userEmail"
										placeholder="ex)abcd@naver.com">
								</div>
								<div class="form-group text-center"><!--아이디 찾기 버튼 및 아이디 찾기 취소 버튼  -->
									<input type="submit" class="btn btn-info" id="searchId" name="searchId" value="찾기"/>
									<input type="button" class="btn btn-danger" id="cancelBt" name="cancelBt" value="취소">
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