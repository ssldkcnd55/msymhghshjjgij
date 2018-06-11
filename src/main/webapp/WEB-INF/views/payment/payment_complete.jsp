<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/farm/resources/js/payment_complete.js"></script>

<link rel="stylesheet" type="text/css" href="/farm/resources/css/payment_complete.css" />

<title>Insert title here</title>
</head>



<body>
	<div id="wrap">
		<!-- wrap -->
		<c:import url="../inc/header.jsp"></c:import>

		<div id="container">
			<!-- #container -->
			<div class="inner-wrap" style="min-height: 1085px;">
				<!-- inner-wrap -->
			<!-- 	 <div class="con_title"><p class="titleP">주문/결제 완료</p></div> -->
				
					<div class="con_head ">구매하신 상품의 <font style="color:#7e5957; font-weight: 900;">주문/결제가</font> 완료되었습니다.</div>
					<div class="con_product_div">
					<strong>
					주문정보
					</strong>
					<table class="con_product_table">
					<tr><td>주문번호</td><td>${pc.group_no}</td></tr>
					<tr><td>상품명</td><td>${pc.name }</td></tr>
					<tr><td>결제 금액</td><td><fmt:formatNumber value="${pc.paid_amount }" pattern="#,###"/> 원</td>
					</table>
					</div>
					
					<div class="con_cus_div ">
					<strong>
					배송정보
					</strong>	
					<table class="con_product_table">
					<tr><td>구매자명</td><td>${pc.buyer_name }</td></tr>
					<tr><td>구매자 이메일</td><td>${pc.buyer_email }</td></tr>
					<tr><td>구매자 전화번호</td><td>${pc.buyer_tel }</td></tr>
					<tr><td>구매자 주소</td><td>${pc.buyer_addr}</td></tr>	
					</table>
					</div>
					<a href="moveHome.do" class="ok_a"><div class="ok_button">확 인</div></a> 
						

				<!-- inner-wrap -->
			</div>
			<!-- #container -->
		</div>
		<!-- wrap -->
	</div>







	<!-- 채팅,최근 본 상품 목록 import jsp ,  footer 위에서 하면됨 -->
	 <c:import url="../messenger/msg_box.jsp"></c:import> 

	<div id="footer">
		<c:import url="../inc/foot.jsp"></c:import>

	</div>


</body>
</html>