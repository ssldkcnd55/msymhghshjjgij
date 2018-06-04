<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<!-- <link href="/farm/resources/css/reset.css" rel="stylesheet" type="text/css"> -->
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/join.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script>

$(function(){
	var notFound='<c:out value="${NotFound}"/>';
	if(notFound != null && notFound != ""){
		alert(notFound);
	}
	
var memberId='<c:out value="${MemberIdFind.member_id}"/>';
	
	if(memberId != null && memberId != ""){
		var result=confirm("찾으신 ID는" + memberId + "입니다."+"\n"+"로그인 페이지로 이동하시겠습니까?");
		
		if(result==true){
			location.href="moveLogin.do";
		}
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
			<div class="join_form join_form2" style="padding:20px 40px;"> <!--div구역내에 mainform을 담았음  -->
				<form id="mainform" method="post" action="/farm/findId.do">
					<div>
						<h2 align="center" style="color:#7e5957;margin-bottom:20px;">
								아이디 찾기
						</h2>
						<h3 class="h3">작물팜은 이메일을 아이디로 사용합니다.<br>소유하고 계신 계정을 입력해보세요.<br>가입여부를 확인해드립니다.</h3>
						<div class="tag_box">
								<div class="form-group name"> <!--이름 label 및 이름 입력란 -->
									<label for="userName" class="userName">이름</label> <input type="text"
										class="form-control" id="userName" name="member_name" placeholder="이름을 입력해주세요.">
								</div>
								
								<div class="form-group"> <!--e-mail label 및 e-mail 입력란  -->
									<label for="userMail">E-mail</label> <input type="text"
										class="form-control" id="userMail" name="member_id"
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
					<!-- <script src="/classKing/js/bootstrap.min.js"></script> -->
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