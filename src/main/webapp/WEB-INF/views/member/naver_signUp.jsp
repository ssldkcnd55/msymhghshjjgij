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
<link href="/farm/resources/css/join.css" rel="stylesheet" type="text/css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!-- <script type="text/javascript" src="/farm/resources/js/signUp.js"></script> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<script type="text/javascript">
function juso() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			$("#loc").val(data.roadAddress);
		}
	}).open();
};

$(function() {
    var email = ${result}.response.email;
    $("#email").val(email);
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

				<div class="join_form">
					<!--  -->
						<!--Join_form 구역 내에 mainform을 담았음  -->
						<div>
							<div class="page-header">
								<h2 align="center" style="color: #777">회원가입</h2>
							</div>
							<div>
								<div style="text-align: center;">
									<input type="hidden" name="category" value="${category }" >
									<img src="/farm/resources/images/default_user.png"
										id="profile" style="text-align: center" alt="이미지를 선택해주세요"></img><br>
									<input type="file" id="file-1" class="inputfile inputfile-1"
										accept='image/gif,image/jpeg,image/pnp'
										data-multiple-caption="{count} files selected" name="upfile"
										onchange="readURL(this);" style="width: 1px; height: 1px;" />
									<label for="file-1" style="background: #f77734;"><svg
											xmlns="http://www.w3.org/2000/svg" width="20" height="17"
											viewBox="0 0 20 17">
										<path
												d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z" /></svg>
										<span>프로필 사진&hellip;</span></label>
								</div>
								<!--파일 찾기  -->
								<!-- 	</div> -->
								<div class="form-group">
									<!--e-Mail 기입란  -->
									<label for="userEmail">E-mail</label><br> <input
										type="email" class="form-control" id="email"
										name="member_id" readonly="readonly">
									<br>
								</div>
								
								
								<div class="form-group">
									<!--이름 기입란  -->
									<label for="userName">이름</label><input type="text"
										class="form-control" id="userName" name="member_name"
										placeholder="이름을 입력해 주세요." required>
								</div>
								
								<div class="form-group">
									<label for="tel">전화번호</label><input
										type="text" class="form-control" id="tel"
										name="member_tel" placeholder="핸드폰 번호" required>
								</div>

								<div class="form-group">
									<!--e-Mail 기입란  -->
									<label for="addr">주소</label><br> <input type="text"
										class="form-control" id="loc" name="member_addr">
										<input type="text"
										class="form-control" id="detailaddr" name="member_addr" placeholder="상세주소 입력">
									<div class="form-group text-center">
										<button class="btn btn-info" id="addrbtn"
											name="addrbtn" onclick="juso()">검색</button>
											
									</div>
				
								</div>



								<div class="form-group text-center">
									<!--회원가입 버튼과 가입취소 버튼으로 한 div 구역내에 존재함  -->
									<input type="button" class="btn btn-info" id="joinBt"
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