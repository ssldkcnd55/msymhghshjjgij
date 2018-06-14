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
<script>

$(function(){
	
	 $.ajax({
		url : "bidding.do",
		type : 'post',
		dataType: "JSON",
		 success : function(obj) {
			console.log(obj);  
			 var objStr = JSON.stringify(obj);
	         var jsonObj = JSON.parse(objStr);
	         var values = "<tr><th>경매이름</th><th>낙찰가격</th><th>결제버튼</th><tr>";
	         
	         for(var i in jsonObj.list){
	         values += 
	        "<tr>"
	 		+"<td>"+jsonObj.list[i].auction_title+"</td>"
	 		+"<td>"+jsonObj.list[i].auction_history_price+"</td>"
	 		+"<td><input type='submit' value='결제' class='buy_button'/></td>"
	 		+"</tr>";
	 		
	         }
	         $("#Bid_win_table").html(values);
		 }
	}); 

});

</script>
<body style="margin:0">
<hr style="margin :0px; border:0.5px solid #7e5957">
	<table class="View_table" id="Bid_win_table"style="margin-left: 10px;">
		
		
		
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