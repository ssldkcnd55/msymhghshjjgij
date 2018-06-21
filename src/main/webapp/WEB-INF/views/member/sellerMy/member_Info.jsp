<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="/farm/resources/css/customerMy/memberinfo.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	Kakao.init('539a8c741155797e275ac9feed4f4760');
	function kaka(){
		 Kakao.Auth.login({
 		 success: function(obj) {
 			 $.ajax({
					url: "kakaoInfo.do",
					type: "post",
					data : {
						kakao_id : '${loginUser.member_id}',
						kakao_access : obj.access_token,
						kakao_refresh : obj.refresh_token
						
					},
					success : function(data){
						alert('dddd');
					}
				}); 
	 		console.log(obj);
	 		console.log(obj.access_token);
	 		console.log(obj.refresh_token);
		  },
		  fail: function(err) {
		     alert(JSON.stringify(err));
		  }
		});
	}	
	function juso() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				$("#loc").val(data.roadAddress);
			}
		}).open();
	};

	var npwdcheck = 0;
	function nowPwdCheck() {
		$.ajax({
			url : "nowPwdCheck.do",
			type : "post",
			data : {
				"MEMBER_ID" : '${loginUser.member_id}',
				"MEMBER_PWD" : $('#nowpwd').val()

			},
			success : function(data) {
				if (data == "ok") {
					npwdcheck = 1;
					$('#npwdtext').html("");
				} else {
					npwdcheck = 0;
					$('#npwdtext').css({
						'font-size' : '10pt',
						'color' : 'red'
					});
					$('#nowpwd').val("");
					$('#npwdtext').html("현재비밀번호와 일치하지 않습니다.");
				}
			}
		});
	}

	function checkPwd() {
		//비밀번호 확인
		if ($('#pwd').val() != $('#cpwd').val()) {
			$('#cpwdtext').css({
				'font-size' : '10pt',
				'color' : 'red'
			});
			$('#cpwdtext').html("비밀번호와 값이 일치하지 않습니다.");
			$('#cpwd').val("");
			cpwCheck = 1;
		} else {
			$('#cpwdtext').html("");
			cpwCheck = 0;
		}
		return false;
	}

	var addr = "";
	$(function() {
		$('#memberBtn').click(function() {
			
			addr = $('#loc').val() + "@" + $('#detail_loc').val();
			
			if('${check}' == 1){
				$.ajax({
					url : "customerNaverMod.do",
					type : "post",
					data : {
						"member_id" : '${loginUser.member_id}',
						"member_addr" : addr,
						"member_name" : '${loginUser.member_name}'

					},
					success : function(data) {
						if (data == "o") {
							location.reload();
						} else if (data == "x") {
							alert("값을 제대로 입력해주세요.")
						} else {
							alert("error");
						}

					}
				});
			}else{
				$.ajax({
				url : "customerMod.do",
				type : "post",
				data : {
					"member_id" : '${loginUser.member_id}',
					"member_pwd" : $('#cpwd').val(),
					"member_addr" : addr,
					"member_name" : '${loginUser.member_name}'

				},
				success : function(data) {
					if (data == "o") {
						location.reload();
					} else if (data == "x") {
						alert("값을 제대로 입력해주세요.")
					} else {
						alert("error");
					}

				}
				});
			}
		});
		
	
		if('${check}' == 1){
			$(".naverCheck").hide();
		}

		$.ajax({
			url : "selectSelInfo.do",
			type : "post",
			dataType : "JSON",
			data: {
				member_id:'${loginUser.member_id}'
			},
			success : function(data) {
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				$('#member_id').val(jsonObj.member_id);
				$('#member_name').val(jsonObj.member_name);
				$('#loc').val(jsonObj.member_addr);
				
				$('#point').val(jsonObj.point_point);
			},
			error : function(request, status, errorData) {
				console.log("error code : " + request.status + "\nmessage"
						+ request.responseText + "\nerror" + errorData);
			}
			
		});
	});
</script>
<meta charset="UTF-8">
<title>title</title>
</head>
<body style="margin:0">
<hr style="margin :0px; border:0.5px solid #7e5957">
	<div class="Info show">

		<!-- <div class="Info_title">회원정보</div> -->
		<!-- <hr class="hr"> -->
		<div class="Info_content">
			<table class="update_table">
				<tr>
					<td>아이디</td>
					<td><input class="member_input" type="text" name="member_id"
						value="" id='member_id' readonly="readonly"></td>
						
				</tr>
				<tr class="naverCheck">
					<td>현재 비밀번호</td>
					<td><input id="nowpwd" class="member_input" type="password"
						onblur="nowPwdCheck()"></td>
					<td id="npwdtext"></td>
				</tr>
				<tr class="naverCheck">
					<td>새 비밀번호</td>
					<td><input id="pwd" name="pwd" class="member_input"
						type="password"></td>
				<tr class="naverCheck">
					<td>새 비밀번호 확인</td>
					<td><input id="cpwd" name="member_pwd" class="member_input"
						type="password" onblur="checkPwd()"></td>
					<td id="cpwdtext"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input class="member_input" type="text"
						value="" readonly="readonly"  id='member_name'></td>
				</tr>
				<tr>
					<td>주소</td>
					<c:set var="before_Addr" value="${loginUser.member_addr}" />
					<c:set var="after_Addr"
						value="${fn:substring(before_Addr,0,fn:indexOf(before_Addr,'@')) }" />
					<td colspan="3" class="td1"><input class="member_input"
						type="text" id="loc" readonly="readonly" value="">
						<button onclick="juso()" class="memberBtn addr">주소검색</button> <br> <c:set
							var="after_DAddr"
							value="${fn:substring(before_Addr,fn:indexOf(before_Addr,'@')+1,fn:length(before_Addr)) }" />
						<br> <input class="member_input" type="text" id="detail_loc"
						value='<c:choose><c:when test="${after_Addr == after_DAddr}"></c:when><c:otherwise>${after_DAddr}</c:otherwise></c:choose>'
						placeholder="상세주소입력"></td>
				</tr>
				<tr>
					<td>포인트</td>
					<td><input class="member_input" type="text"
						value="" readonly="readonly" id='point'>&nbsp;<button class="memberBtn addr">출금하기</button></td>
					
				</tr>
				<tr>
					<td></td>
					<td><input type="button" id="memberBtn" class="memberBtn"
						value="수정"></td>
				</tr>
				<tr>
					<td>카카오 메세지</td>
					<td><input type="button" id="kakaoBtn" class="memberBtn kakaoBtn"
						value="수락" onclick="javascript:kaka()"></td>
				</tr>
			</table>
<script type="text/javascript">

</script>
		</div>

	</div>
</body>
</html>