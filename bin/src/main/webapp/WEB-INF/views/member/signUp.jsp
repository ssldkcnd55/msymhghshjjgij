<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="/farm/resources/css/reset.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/signUp.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


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

				<div class="join_form">
					<!--  -->
					<form id="mainform" action="/farm/mjoin" method="post"
						enctype="multipart/form-data" onsubmit="return formValidation();">
						<!--Join_form 구역 내에 mainform을 담았음  -->
						<div>
							<div class="page-header">
								<h2 align="center" style="color: #777">회원가입</h2>
							</div>
							<div>
								<div style="text-align: center;">

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
										type="email" class="form-control" id="userEmail"
										name="useremail" placeholder="ex)abcd@naver.com">
									<div class="form-group text-center">
										<input type="button" class="btn btn-info" id="mailsend"
											name="dupliBt" value="메일인증" onclick="sendMail();" required />
									</div>
									<br>
								</div>
								<div class="form-group">
									<!--e-Mail 기입란  -->
									<label for="vCode">인증번호</label><br> <input type="text"
										class="form-control" id="vCode" name="vCode"
										onChange="vCodeChange();">
									<div class="form-group text-center">
										<input type="button" class="btn btn-info" id="vCodecheck"
											name="dupliBt" value="번호확인" onclick="vCodeCheck1();" required>
									</div>
								</div>
								<div class="form-group">
									<!--비밀번호 입력란    -->
									<label for="InputPwd1">비밀번호를 입력하세요.</label> <input
										type="password" class="form-control" id="inputPwd1"
										name="userpwd" placeholder="비밀번호" required>
								</div>

								<div class="form-group">
									<!--비밀번호 다시 입력란  -->
									<label for="InputPwd2">비밀번호를 다시 입력하세요.</label><input
										type="password" class="form-control" id="inputPwd2"
										name="inputPwd2" placeholder="비밀번호 확인" required> <label
										class="confirmPwd" id="confirmPwd"></label>
									<!--ID 불일치의 P태그와 동일함  -->
								</div>

								<div class="form-group">
									<!--이름 기입란  -->
									<label for="userName">이름</label><input type="text"
										class="form-control" id="userName" name="username"
										placeholder="이름을 입력해 주세요." required>
								</div>


								<div class="form-group">
									<!--e-Mail 기입란  -->
									<label for="addr">주소</label><br> <input type="text"
										class="form-control" id="addr" name="addr">
									<div class="form-group text-center">
										<input type="button" class="btn btn-info" id="addrbtn"
											name="addrbtn" value="주소검색" onclick="addrSearch();" required>
									</div>
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