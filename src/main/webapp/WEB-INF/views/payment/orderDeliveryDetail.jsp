<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/orderDeliveryDetail.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<div id="container">
        	<div class="inner-wrap">
        	<br><br>
        	<div class="previousBtn">이전</div>
        	<div class="bigtitle">주문배송 상세정보</div>
        	<br><br>
        	<div class="check"></div><div class="title">주문 정보</div>
        	<table class="tbStyle">
        	<tr>
        	<td class="first">주문번호</td>
        	<td class="first number">123123123-123234</td>
        	</tr>
        	<tr>
        	<td>주문일</td>
        	<td>2342-2345235</td>
        	</tr>
        	<tr>
        	<td>운송장 번호</td>
        	<td>2342-2345235</td>
        	</tr>                
        	</table>
        	<br><br><br>
        	<div class="check"></div><div class="title">주문 상품 내역</div>
        	<table class="paytabletb">
        	<tr>
        	<td class="paytable info">상품정보</td>
        	<td class="paytable">상품금액</td>
        	<td class="paytable">수량</td>
        	<td class="paytable">주문금액</td>
        	<td class="paytable">진행상태</td>
        	</tr>
        	
        	<tr>
        	<td class="paytable info s"><div class="marketImg" style="background-image: url('/farm/resources/images/딸기.jpg');"></div>유기농 스트로우베리</td>
        	<td class="paytable s">2000원</td>
        	<td class="paytable s">1개</td>
        	<td class="paytable s">2000원</td>
        	<td class="paytable s">배송중<div class="delBtn">수취확인</div>
        	</td>
        	</tr>
        	</table>
        	
        	<table class="payment">
        	<tr>
        	<td>총 상품금액</td>
        	<td>2000원</td>
        	</tr>
        	<tr>
        	<td>배송비</td>
        	<td><div class='plus'>+</div>0원</td>   
        	</tr>       	
        	<tr>
        	<td>총 주문 금액</td>
        	<td><div class="orderPay">2000</div>원</td>
        	</tr>
        	</table>
        	<br><br><br>
        	
        	<div class="check"></div><div class="title" >결제 정보</div>
        	<table class="tbStyle">
        	<tr>
        	<td class="first">결제수단</td>
        	<td class="first">신용카드</td>
        	</tr>
        	</table>
        	
        	<br><br><br>
        	
        	<div class="check"></div><div class="title">배송 정보</div>
        	<table class="tbStyle">
        	<tr>
        	<td class="first">받는사람</td>
        	<td class="first">임종식</td>
        	</tr>
        	<tr>
        	<td>휴대폰번호</td>
        	<td>2342-5235</td>
        	</tr>
        	<tr>
        	<td>배송지</td>
        	<td>경기 성남시 중원구 금광ㄷ홍</td>
        	</tr>
        	<tr>
        	<td>요청사항</td>
        	<td>경기 성남시 중원구 금광ㄷ홍</td>
        	</tr>
        	
        	
        	
        	</table>
        	
        	</div>
        	</div>
        	<br><br>
        	<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
		</div>
</body>
</html>