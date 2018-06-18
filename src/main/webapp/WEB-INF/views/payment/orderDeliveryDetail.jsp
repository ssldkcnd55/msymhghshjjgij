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
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script>
	function buyComplete(){
		var a = confirm("구매확정 하시겠습니까?");
		if(a == true){
			$.ajax({
				url : "buyComplete.do",
				type : "post",
				data : {
					buy_no : ${payment.buy_no }
				},
				success : function() {
					$(".paytable.s.a").html("구매확정");
					$(".delBtn").remove();
				},
				error : function(request, status, errorData) {
					console.log("error code : " + request.status + "\nmessage"
							+ request.responseText + "\nerror" + errorData);
				}
			});
		}
	}
</script>
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
        	<td class="first">구매번호</td>
        	<td class="first number">${payment.buy_no }</td>
        	</tr>
        	<tr>
        	<td>주문일</td>
        	<td>${payment.buy_date }</td>
        	</tr>
        	<tr>
        	<td>운송장 번호</td>
        	<td>${payment.buy_transport_no }</td>
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
        	<td class="paytable info s"><div class="marketImg" style="background-image: url('/farm/resources/images/${payment.market_img}');"></div>
        	${payment.market_title }</td>
        	<td class="paytable s">${payment.market_price }원</td>
        	<td class="paytable s">${payment.buy_amount }개</td>
        	<td class="paytable s">${payment.market_price * payment.buy_amount }원</td>
        	
        	<c:if test="${payment.buy_status ==0}">
        	<td class="paytable s">결제완료</td>
        	</c:if>
        	
        	<c:if test="${payment.buy_status ==1}">
        	<td class="paytable s">배송 준비중
        	<div class="delBtn">배송조회</div>
        	</td>
        	</c:if>
        	
        	<c:if test="${payment.buy_status ==2}">
        	<td class="paytable s">배송중
        	<div class="delBtn">배송조회</div>
        	</td>
        	</c:if>      	
        	
        	<c:if test="${payment.buy_status ==3}">
        	<td class="paytable s a">배송완료
        	<div class="delBtn" onclick='buyComplete()'>구매확정</div>
        	</td>
        	</c:if>
        	
        	<c:if test="${payment.buy_status ==4}">
        	<td class="paytable s">구매확정</td>
        	</c:if>
        	
        	</tr>
        	</table>
        	
        	<table class="payment">
        	<tr>
        	<td>총 상품금액</td>
        	<td>${payment.buy_amount * payment.market_price}원</td>
        	</tr>
        	<tr>
        	<td>배송비</td>
        	<td><div style="float: right; margin-top: 5px;">2500원</div><div class='plus'>+</div></td>   
        	</tr>       	
        	<tr>
        	<td>총 주문 금액</td>
        	<td><div class="orderPay">${payment.buy_amount * payment.market_price + 2500}</div>원</td>
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
        	<td class="first">${payment.buy_name }</td>
        	</tr>
        	<tr>
        	<td>휴대폰번호</td>
        	<td>${payment.buy_tel }</td>
        	</tr>
        	<tr>
        	<td>배송지</td>
        	<td>${payment.buy_addr }</td>
        	</tr>
        	<tr>
        	<td>요청사항</td>
        	<td>${payment.buy_request }</td>
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