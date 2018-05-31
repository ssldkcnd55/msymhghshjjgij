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
			<div class="inner-wrap">
				<!-- inner-wrap -->
				 <div class="con_title"><p class="titleP">주문/결제 완료</p></div>
				
					<div class="con_head">구매하신 상품의 <font style="color:#512772; font-weight: 900;">주문/결제가</font> 완료되었습니다.</div>
					<div>
					<table class="con_table">
					<tr>
					<td>주문번호</td>
					<td>123456</td>
					</tr>
					<tr>
					<td>상품명</td>
					<td>사과</td>
					</tr>
					<tr>
					<td>결제 금액</td>
					<td>1000원</td>
					</tr>
					<tr>
					<td>결제 시각</td>
					<td>오늘</td>
					</tr>
					</table>
					</div>
				
		

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