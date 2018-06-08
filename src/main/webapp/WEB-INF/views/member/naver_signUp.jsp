<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>

<link href="/farm/resources/css/style.css" rel="stylesheet"
	type="text/css" />

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
				<!--e-Mail 기입란  -->
				<div>
					<h3>회원가입</h3>
				</div>
				<div>
					<label>이메일</label><br> <input type="text" id="email">
					<br>
				</div>
				<div>
					<label>이름</label><br> <input type="text" id="name"> <br>
				</div>
				<div>
					<label>전화번호</label><br> <input type="text" id="tel"> <br>
				</div>
				<div>
					<label>주소</label><br> <input type="text" id="addr"
						placeholder="주소 검색" readonly="readonly">
				</div>
				<div>
					<input type="text" id="detailaddr" placeholder="상세주소 입력">
				</div>
				<button id="addrbtn" onclick="juso()">주소검색</button>
				<button id="submit" onclick="naverSignUp()">가입하기</button>

			</div>
		</div>
		<%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
</body>
</html>