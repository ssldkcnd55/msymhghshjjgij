<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/mypage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/tabMove.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

	var npwdcheck=0;
	function nowPwdCheck(){
	$.ajax({
	      url: "nowPwdCheck.do",
	      type : "post",
	      data : {
	         "MEMBER_ID" : '${loginUser.member_id}',
	         "MEMBER_PWD" : $('#nowpwd').val()
	         
	      },
	      success : function(data){
		     if(data == "ok"){
		    	 npwdcheck=1;
		    	 $('#npwdtext').html("");
		     }else{
		    	 npwdcheck=0;
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
	

var addr="";
	$(function(){
		$('#memberBtn').click(function(){
			addr=$('#loc').val()+"@"+$('#detail_loc').val();
			$.ajax({
				 url: "customerMod.do",
			      type : "post",
			      data : {
			    	  "MEMBER_ID" : '${loginUser.member_id}',
			    	  "MEMBER_PWD" : $('#cpwd').val(),
			    	  "MEMBER_ADDR" : addr
			      		
			      },
			      success : function(data){
			    	  if(data=="o"){
			    		  location.reload();
			    	  }else if(data == "x"){
			    		  alert("값을 제대로 입력해주세요.")
			    	  }else{
			    		  alert("error");
			    	  }
			    	  
			      }
			});
		});
		
	});

	
</script>
<meta charset="UTF-8">
<title>Farm</title>
</head>
<body>
<div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@ include file="../inc/header.jsp" %>
      </div>
       <div id="container">
         <div class="inner-wrap">
         
         <div class="tabs">
         <div class="tab first">회원정보</div>
         <div class="tab">경매내역</div>
         <div class="tab">판매내역</div>
         <div class="tab">QnA</div>
         <div class="tab">구인구직</div>
         <div class="tab last">판매이력</div>
         </div>
         
        <div class="info_box">
         
         <div class="Info show">
         <div class="Info_title">회원정보</div>
         <hr class="hr">
         <br>
         <div class="Info_content">
         <table class="update_table">
								<tr>
									<td>아이디</td>
									<td><input class="member_input" type="text" name="member_id"
										value="${loginUser.member_id}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>현재 비밀번호</td>
									<td><input id="nowpwd" class="member_input"
										type="password" onblur="nowPwdCheck()"></td>
									<td id="npwdtext"></td>
								</tr>
								<tr>
									<td>변경할 비밀번호</td>
									<td><input id="pwd" name="pwd" class="member_input" type="password"></td>
								<tr>
									<td>변경할 비밀번호 확인</td>
									<td><input id="cpwd" name="member_pwd" class="member_input" type="password"
										onblur="checkPwd()"></td>
									<td id="cpwdtext"></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input class="member_input" type="text"
										value="${loginUser.member_name}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>주소</td>
										<c:set var="before_Addr" value="${loginUser.member_addr}"/>
										<c:set var="after_Addr" value="${fn:substring(before_Addr,0,fn:indexOf(before_Addr,'@')) }"/>
									<td colspan="3" class="td1"><input class="member_input"
										type="text" id="loc" readonly="readonly" value="${after_Addr}">
										<button onclick="juso()" class="button">주소검색</button> <br>
										<c:set var="after_DAddr" value="${fn:substring(before_Addr,fn:indexOf(before_Addr,'@')+1,fn:length(before_Addr)) }"/>
										<br> <input class="member_input" type="text"
										id="detail_loc" value="${after_DAddr}" placeholder="상세주소입력"></td>	
								</tr>
								<tr>
									<td></td>
									<td><input type="button" id="memberBtn" class="memberBtn" value="확인"></td>
								</tr>

							</table>
         
         </div>
         
         </div>
         <!-- <hr class="hr1"> -->      
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