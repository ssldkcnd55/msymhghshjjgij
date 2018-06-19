<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>

<link rel="stylesheet" type="text/css" href="/farm/resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/component.css" />
<link  href="/farm/resources/css/boot.css" rel="stylesheet" type="text/css">
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/join2.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function juso() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			$("#addr").val(data.roadAddress);
		}
	}).open();
};

$(function() {
    var email = ${result}.response.email;
    var name = ${result}.response.name;
    if(email != null){
    	$("#email").attr("readonly","true");
    	$("#email").val(email);
    }
    if(name != null){
    	$("#name").attr("readonly","true");
    	$("#name").val(name);
    }
});

function naverSignUp(){
	$.ajax({
	url:"naverSignUp.do",
	type:"post",
	data:{
		"member_id":$("#email").val(),
		"member_name": $("#name").val(),
		"member_tel":$("#tel").val(),
		"member_addr":$("#addr").val()+"@"+$("#detailaddr").val()

	},
	success:function(data){
		location.href=data;
	}
}); 

}
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

				<div class="join_form">
					<!--  -->
					<form id="mainform" action="/farm/signUp.do" method="post"
						enctype="multipart/form-data" onsubmit="return formValidation();">
						<!--Join_form 구역 내에 mainform을 담았음  -->
						<div>
							<div class="page-header">
								<h2 align="center" class="signUpTitle">회원 가입</h2>
							</div>
							<div>
								<div style="text-align: center;">
									<input type="hidden" name="category" value="1" >
									<img src="/farm/resources/upload/memberUpload/default.png"
										id="profile" style="text-align: center; color:gray; font-size:11pt;" 
										alt="이미지를 선택해주세요"></img><br>
									<input type="file" id="file-1" class="inputfile inputfile-1"
										accept='image/gif,image/jpeg,image/pnp'
										data-multiple-caption="{count} files selected" name="upfile"
										onchange="readURL(this);" style="width: 1px; height: 1px;" />
									<label for="file-1" style="background: #7e5957;"><svg
											xmlns="http://www.w3.org/2000/svg" width="20" height="17"
											viewBox="0 0 20 17">
										<path
												d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z" /></svg>
										<span style="font-size:12pt;">프로필 사진&hellip;</span></label>
								</div>
								<!--파일 찾기  -->
								<!-- 	</div> -->
								<div class="form-group">
									<!--e-Mail 기입란  -->
									<br> <input
										type="email" class="form-control" id="email"
										name="member_id" placeholder="이메일 입력  ex)abcd@naver.com" required>
									<div class="form-group text-center">
										
									</div>
									<br>
								</div>
							
								<div class="form-group">
									<!--비밀번호 입력란    -->
									<input
										type="password" class="form-control" id="inputPwd1"
										name="member_pwd" placeholder="비밀번호 입력" required>
								</div>

								<div class="form-group">
									<!--비밀번호 다시 입력란  -->
									<input
										type="password" class="form-control" id="inputPwd2"
										name="inputPwd2" placeholder="비밀번호 확인" oninput="passwordCheck()" required> <label
										class="confirmPwd" id="confirmPwd"></label>
									<!--ID 불일치의 P태그와 동일함  -->
								</div>
								
								
								<div class="form-group">
									<!--이름 기입란  -->
									<input type="text"
										class="form-control" id="name" name="member_name"
										placeholder="이름 입력" required>
								</div>
								
								<div class="form-group">
									<input
										type="text" class="form-control" id="tel"
										name="member_tel" placeholder="전화 번호 입력  ex)010-1234-1234" required>
								</div>

								


								<div class="form-group">
									<!--e-Mail 기입란  -->
									<input type="text"
										class="form-control" id="addr" placeholder="주소 입력" name="member_addr1" readonly="readonly">
									<div class="form-group text-center">
										<input type="button" class="btn btn-info" id="addrbtn"
											name="addrbtn" value="주소검색" onclick="juso();">
										<input
										type="text" class="form-control" id="member_addr2"
										name="member_addr2" placeholder="상세주소 입력" required>
									</div>
									<input type="hidden" name="member_addr" id="member_addr">
									
									
								</div>



								<div class="form-group text-center">
									<!--회원가입 버튼과 가입취소 버튼으로 한 div 구역내에 존재함  -->
									<input type="submit" class="btn btn-info" id="joinBt"
										name="joinBt" value="회원가입"> <input type="reset"
										class="btn btn-danger" id="cancelBt" name="cancelBt"
										value="가입취소">
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
		 <%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
</body>
</html>