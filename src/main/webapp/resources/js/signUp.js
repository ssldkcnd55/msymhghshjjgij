/**
 * 
 */

function findAddr() {
	new daum.Postcode({
		oncomplete : function(data) {
			$('#addr').val(data.postcode + " " + data.address);
		}
	}).open();
}
(function(e, t, n) {
		var r = e.querySelectorAll("html")[0];
		r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2")
	})(document, window, 0);

	var vCodeCheck = false;
	var vCode;
	var idCheck = false;
	function idValidation() {
		idCheck = false;
	}
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#profile').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function sendMail() {//이메일 인증코드 발송  
		$.ajax({
			url : "/farm/sendmail.do",
			data : {
				email : $('#userEmail').val()
			},
			type : "post",
			success : function(data) {
				if(data == null || data == ""){
					alert("중복된 아이디입니다.");
				}else{
					vCode = data;
					alert("인증번호를 발송 하였습니다.");
				}
			},
			error : function(a, b, c) {
				console.log("error : " + a + ", " + b + ", " + c);
			}
		});
	}
	function vCodeCheck1() {
		if (vCode == $("#vCode").val()) {
			vCodeCheck = true;
			alert("인증에 성공하였습니다.");
		} else {
			vCodecheck = false;
			alert("인증번호를 확인해주세요.");
		}
	}
	function vCodeChange() {
		vCodeCheck = false;
	}
	//////////////////아이디 중복체크///////////////////////////////////////////////////

	function idValidity() {
		var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
		var id = $("#userId").val();

		if (!idPattern.test(id)) {
			alert("ID: 4 ~ 20 자리 영(대,소)문자,숫자만 입력 가능하며 첫 문자는 숫자를 사용할 수 없습니다.");
			idCheck = false;
		} else if (idPattern.test(id)) {
			$.ajax({
				url : "idcheck",
				data : {
					userid : $("#userId").val()
				},
				type : "get",
				success : function(data) {
					data *= 1;
					if (data == 1) {
						alert("이미 사용중인 아이디입니다.");
					} else {
						alert("사용 가능한 아이디입니다.");
						idCheck = true;
					}
				}
			});
		}

	}
	/////////////////아이디 중복검사를 한 후에 바꾸었을 경우에 다시 중복 검사를 요구하는 코드//////////////////
	$(function() {

	});
	/////////////////////////////////////////////////////////////////////////////////
	/*비밀번호 일치 여부 알아보는 스크립트*/
	/*$(function() {
		$('input[type=password]').blur(function() {
			var pwd1 = $("#inputPwd1").val();
			var pwd2 = $("#inputPwd2").val();
			if (pwd1 == pwd2) {
				$("#confirmPwd").css("color", "green").css("display", "block");
				$("#confirmPwd").html("비밀번호가 일치합니다.");
			} else {
				$("#confirmPwd").css("color", "red").css("display", "block");
				$("#confirmPwd").html("비밀번호가 불일치합니다.");
				$("#inputPwd2").val("");
			}
		});
	});*/
	function passwordCheck(){
		var pwd1 = $("#inputPwd1").val();
		var pwd2 = $("#inputPwd2").val();
		if (pwd1 == pwd2) {
			$("#confirmPwd").css("color", "green").css("display", "block");
			$("#confirmPwd").html("비밀번호가 일치합니다.");
		} else {
			$("#confirmPwd").css("color", "red").css("display", "block");
			$("#confirmPwd").html("비밀번호가 불일치합니다.");
		}
	}
	function formValidation() {
		$('#member_addr').val($('#addr').val()+"@"+$('#member_addr2').val());
		/////////////////////////////정규식 목록/////////////////////////
		//비밀번호: 6~20자이상 영문 숫자 혼합
		var pwdPattern = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		var pwd = $("#inputPwd1").val();
		//이메일 정규식 @,.을 무조건 포함할것
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = $("#userEmail").val();
		//생일 정규식: 주민번호 앞자리 6자리 정규식
		var birthPattern = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
		var birthday = $("#userBirth").val();
		//핸드폰번호 정규식: 010-1234-1234
		var telPattern = /^\d{3}-\d{3,4}-\d{4}$/;
		var tel = $("#tel").val();
		/////////////////////////////정규식 목록/////////////////////////
		//////////////////////이제 정규식을 검사합니다.//////////////////////////////////////
			if (!emailPattern.test(email)) {
				alert("올바른 이메일 형식이 아닙니다.");
				$("#userEmail").focus();
				return false;
			} else if (!pwdPattern.test(pwd)) {
				alert("비밀번호: 6~20자리 이상 숫자 및 영문자를 혼합 해주세요.");
				$("#inputPwd1").focus();
				return false;
			} else if (!telPattern.test(tel)) {
				alert("올바른 핸드폰번호 형식이 아닙니다.");
				$("#tel").focus();
				return false;
			} else if (vCodeCheck == false) {
				alert("이메일 인증을 해주세요.");
				$("#userEmail").focus();
				return false;
			} else {
				alert("회원가입이 되었습니다!!");
				return true; // 차후 서버 연결이 되면 true로 바꾸어 줄 것;
			}
	}