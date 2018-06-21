<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/farm/resources/css/selectSignUp.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var cate =0;
var checked =0;

  function selectSignUp(){
	if(checked == 1){
		if(cate ==1){
			location.href="/farm/moveSelectSignUp.do?category=1";	
		}else if(cate ==2){
			location.href="/farm/moveSelectSignUp.do?category=0";
			
		}else if(cate==0){
		alert("회원 유형을 선택해 주세요");  
	
		}
	}else{
		alert("개인정보 수집 이용약관에 동의해 주세요");		
	}
	
	
	

	
	
	

}
 
/*  function cansel(){
	
	
}   */

function checked1(){

	if($("#agreement2").is(":checked")){
		checked =1;
	}else{
		checked = 0;
	}
}

function clickCustom(){
	$("#cusradio").attr("checked", true);
	$("#farmradio").attr("checked", false); 
	$(".signUp.cus").css('border','2px solid #7e5957');
	$(".signUp.farm").css('border','1px solid #dcdcdc');
	cate = 1;
	
}

function clickFarmer(){
	$("#farmradio").attr("checked", true);
	$("#cusradio").attr("checked", false); 
	$(".signUp.farm").css('border','2px solid #7e5957');
	$(".signUp.cus").css('border','1px solid #dcdcdc');
	cate=2;
}

</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		
		<div id="container">
        	<div class="inner-wrap"> 
        	 <!-- <div class="left_menu">
        	<div class="menu">회원 가입</div>
        	<div class="menu">아이디 찾기</div>
        	<div class="menu">비밀번호 찾기</div>
        	</div>  -->
        	<div class="title_box">
        	
        	<div class="legend"> 회원 유형 선택</div>
        	</div>
        	<div class="comment">회원 유형에 따라 가입절차가 다르니 해당 유형을 선택해 주세요.</div>
        	<div class="select_box">
        	<div class="signUp cus" onclick="clickCustom();">
        	<input type="radio" name="groupradio1" hidden="hidden" id="cusradio">
        	<div class="titleImg" style="background-image: url('/farm/resources/images/customer_logo.png'); "></div>
        	<div class="title">일반 회원</div>
        	</div>
        	<div class="signUp farm" onclick="clickFarmer();" >
        	<input type="radio" name="groupradio" hidden="hidden" id="farmradio">
        	<div class="titleImg farmer" style="background-image: url('/farm/resources/images/farmer_logo4.png'); "></div>
        	<div class="title">판매 회원</div>
        	</div>
        	</div>
        	
            
        <!--   <h2 class="conH2">개인정보 수집 및 이용 안내</h2> -->
          
            <!-- <fieldset class="agreement_box"> -->
              <legend class="legend pr"> 개인정보 수집 이용 약관</legend>
              <div class="agreement01" style="height:160px !important;">
							<textarea readonly="readonly" class="ag1">	
작물팜은 통합회원 서비스에 필요한 개인정보 수집·이용을 위하여 개인정보보호법 제15조 및 제22조, 제24조에 따라 귀하의 동의를 받고자 합니다.

1. 개인정보 수집 목적
  작물팜 로그인시스템에서는 다음의 목적을 위해 개인정보 수집하고 이용합니다.
								  
  가. 홈페이지 회원가입 및 관리
 - 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 가입의사 확인 및 가입횟수 제한, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다. 
								  
  나. 서비스 제공 
 - 로그인 한 회원에게 각종 콘텐츠, 서비스 이용자격 등을 목적으로 개인정보를 처리합니다. 
 - 관련법령(산업기술혁신 촉진법, 중소기업기술혁신 촉진법 등 국가기술개발사업 관련)에 의거하여 국가 정부과제수행자(대표자, 책임자, 전문가 등)의 국가과제 운영정보로 활용을 목적으로 개인정보를 처리합니다. 
								
 2. 수집항목
								     
  가. 작물팜은 회원가입, 원활한 고객 상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목과 선택항목으로 수집하고 있습니다. 
 - 필수정보 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 주소  
 - 부가서비스 신청정보 : 뉴스레터 신청
								    
  나. 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. 
 - IP Address, 쿠키, 방문 일시, 서비스 이용기록, 시스템 로그 등 
								
 3. 보유 및 이용기간
 - 정보주체의 동의를 받은 날로부터 회원 탈퇴 시 까지
 - 단, 국가 사업수행에 필수적인 정보에 포함된 개인정보에 대해서는 관련법령(산업기술혁신 촉진법, 중소기업기술혁신 촉진법 등 국가기술개발사업 관련)에 따라 법령에 따른 업무가 종료될 때까지 일정기간 보존합니다. 
								
 4. 동의 거부권 및 거부에 대한 불이익
 - 정보주체는 개인정보 수집·이용에 대해 동의를 거부할 권리가 있으며, 최소한의 개인정보 이외의 개인정보 수집에 동의하지 아니한다는 이유로 회원에게 회원 가입 불가 및 홈페이지서비스 거부와 같은 불이익을 주지 않습니다. 단, 최소한의 개인정보 수집에 대해 동의 거부 시에는 통합회원가입이 제한됩니다. 
 ※ 만 14세미만 아동의 경우 개인정보 처리 목적 상 회원가입을 하실 수 없습니다.
								
								</textarea>
              </div>
        	   
              </div>
              <div class="contxt1">
                <input type="checkbox" id="agreement2" name="agreement2" class="agreement" onchange="checked1();"/>
                <label for="agreement" class="agreement">&nbsp;상기 내용에 따른 개인정보 수집 및 이용에 동의합니다.</label>
        	</div> 
       <!--  </fieldset> -->
       <div class="btn_box">
  		<div class="btn cancel" onclick="location.href='moveHome.do';">가입 취소</div>
  		<div class="btn ok" onclick="selectSignUp();">다음단계로</div>
        </div>	
        	       	
        </div>
        <div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
		</div>
		
		
	

</body>
</html>