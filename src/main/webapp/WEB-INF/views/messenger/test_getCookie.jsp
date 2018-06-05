<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/test_getCookie.js"></script>
<link href="/farm/resources/css/messenger.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/marketDetail.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/bottommovemenu.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/test_getCookie.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">

<title>COOKIE test</title>
<style type="text/css">

</style>
<script type="text/javascript">

</script>

<style type="text/css">
</style>
</head>
<body>
<div class="goods-view-flow-cart __active" id="flow-cart">
		<div class="goods-view-flow-cart-wrapper">
			<button type="button" id="show-option-button"
				class="goods-view-show-option-button">
				<span class="goods-view-show-option-button-value">옵션선택</span>
			</button>

			<div class="goods-view-flow-cart __active" id="flow-cart2">
					<div class="flow_order_seller">판매자 : <span style="font-weight: 600">판매자이름</span><!-- (<span>판매자아이디${market.member_id}</span>) -->
					<a href=""><span>상품 문의</span></a> | <a href=""><span>1:1대화</span></a>
					</div>
				<div class="goods-view-flow-cart-wrapper">
					<button type="button" id="show-option-button"
						class="goods-view-show-option-button __active">
						<span class="goods-view-show-option-button-value">옵션선택</span>
					</button>
					<div id="market-flow-cart-content" class="goods-view-flow-cart-content __active">


						<c:if test="${not empty sessionScope.loginUser  }">
							<form action="marketBuy.do" method="post">
								<input type="hidden" name="market_no" value="<%-- ${market.market_no } --%>"> 
								<input type="hidden" name="member_id" value="${sessionScope.loginUser.member_id}">
							
								<div>
								<table class="flow_order_table">
							<tr><td class="flow_order_title"><!--${market.market_title}--> <span class="flow_order_stock" style="margin-left: 10px"> | <span><!--${market.market_amount- market.remaining }--></span>개 남음</span></td>
							<td><div class="amount_box" > <a href="javascript: countOperator(-1)"><div class="flow_order_operator">-</div></a>
                    		 <input type="number" id="" class="flow_order_count" value="1" min="1">
                    		<a href="javascript: countOperator(+1)"><div class="flow_order_operator">+</div></a></div></td>
							<td class="flow_order_price"><span><%-- ${market.market_price } --%></span>원</td>
							<td class="flow_order_button"><input type="button" value="장바구니" onclick="addBasket()" class="flow_order_basket"></td></tr>
							<tr><td class="flow_order_total" colspan="3">총 상품 금액 : <span class="flow_order_total_price"><%-- ${market.market_price } --%></span>원</td>
							<td class="flow_order_button">	<input type="submit" value="구매하기" class="flow_order_buy"> </td>
							</tr>
								</table>
								</div>	
			
							</form>

						</c:if>
						<c:if test="${empty sessionScope.loginUser  }">
						<div class="loginmessage">로그인이 필요한 서비스 입니다.</div>
						</c:if>
						
						
						
						<br> <br> <br> <br>
					</div>					
				</div>
			</div>

		</div>
	</div>


</body>
</html>