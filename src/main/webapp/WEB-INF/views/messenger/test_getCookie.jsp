<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link href="/farm/resources/css/messenger.css" rel="stylesheet"
	type="text/css" />
	<link href="/farm/resources/css/marketDetail.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/bottommovemenu.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">

<title>COOKIE test</title>
<style type="text/css">
.goods-view-flow-cart __active{
height: 240px;
}
</style>
<script type="text/javascript">
$(function(){
	$('.goods-view-show-option-button').click(function(){
		if($('#flow-cart2').css('display') == 'none'){
			$('#flow-cart2').css('display','block');
		}else{
			$('#flow-cart2').css('display','none');
		}
    });
});

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
				<div class="goods-view-flow-cart-wrapper">
					<button type="button" id="show-option-button"
						class="goods-view-show-option-button __active">
						<span class="goods-view-show-option-button-value">옵션선택</span>
					</button>
					<div id="market-flow-cart-content"
						class="goods-view-flow-cart-content __active">


						<c:if test="${not empty sessionScope.loginUser  }">
							<form action="marketBuy.do" method="post">
								<input type="hidden" name="market_no" value="<%-- ${market.market_no } --%>"> 
								<input type="hidden" name="member_id" value="${sessionScope.loginUser.member_id}">
								<div>
								<table>
								<tr><td>성주꿀참외 1kg</td><td><input type="number" value="1"></td><td>8,900원</td></tr>
								<tr><td colspan="3">총 상품금액: 8,900원</td></tr>
								</table>
								</div>	
									
								<input type="submit" value="구매하기" class="market_buy"> 
								<input type="button" value="장바구니" onclick="addBasket()" class="market_basket">
								
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