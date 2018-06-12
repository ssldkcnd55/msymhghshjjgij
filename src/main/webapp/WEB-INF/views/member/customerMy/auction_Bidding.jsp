<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/customerMy/cusqna.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/customerMy/auction_Bidding.css" />
<title>경매 낙찰 내역</title>
</head>
<body style="margin:0">
<hr style="margin :0px; border:0.5px solid #7e5957">
	<table class="View_table" style="margin-left: 10px;">
		<tr>
			<th>번호</th>
			<th>경매</th>
			<th>입찰자</th>
			<th>입찰상태</th>
			<th>비고</th>
		</tr>
		
		
		<tr>
		<td>1</td>
		<td></td>
		<td></td>
		<th>미결제</th>
		<td><input type="submit" value="결제" class="buy_button"/></td>
		</tr>
		
	</table>

	<div id="bottom">
		<!-- 페이징 처리 -->
		<div class="pagination"></div>
	</div>
<hr style="margin :0px; border:0.5px solid #7e5957">
	<table class="View_table" style="margin-left:10px;">

	</table>

	<div id="bottom">
		<!-- 페이징 처리 -->
		<div class="pagination"></div>
	</div>
</body>
</html>