 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="MyHtml">
<head>
<meta charset="UTF-8">
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/customerMy/cusqna.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/customerMy/auction_Bidding.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
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
	         var values = "<tr><th>경매번호</th><th>경매이름</th><th>낙찰가격</th><th>결제버튼</th><tr>";
	         
	         if(jsonObj.list.length > 0){
	         for(var i in jsonObj.list){
	        	 if('${loginUser.member_id}' == jsonObj.list[i].member_id){
	        		if(jsonObj.list[i].auction_status == '2'){
				         values += 
				        "<tr>"
				        +"<td>"+jsonObj.list[i].auction_no+"</td>"
				 		+"<td ><a class='auction_title_td' target=_blank href='/farm/AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no+" '>"+jsonObj.list[i].auction_title+"</a></td>"
				 		+"<td>"+jsonObj.list[i].auction_history_price+"</td>"
				 		+"<td><input type='submit' onclick='movePaymentPage("+jsonObj.list[i].auction_no+",\""+jsonObj.list[i].member_id+"\","+jsonObj.list[i].auction_history_price+")' value='결제' class='buy_button2'/></td>"
				 		+"</tr>";
	        		}else if(jsonObj.list[i].auction_status == '3'){
	        			 values += 
	 				        "<tr>"
	 				        +"<td>"+jsonObj.list[i].auction_no+"</td>"
	 				 		+"<td ><a class='auction_title_td' target=_blank href='/farm/AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no+" '>"+jsonObj.list[i].auction_title+"</a></td>"
	 				 		+"<td>"+jsonObj.list[i].auction_history_price+"</td>"
	 				 		+"<td><input type='submit' value='결제완료' class='buy_button'/></td>"
	 				 		+"</tr>";
	        		}else if(jsonObj.list[i].auction_status == '4'){
	        			 values += 
		 				        "<tr>"
		 				        +"<td>"+jsonObj.list[i].auction_no+"</td>"
		 				 		+"<td ><a class='auction_title_td' target=_blank href='/farm/AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no+" '>"+jsonObj.list[i].auction_title+"</a></td>"
		 				 		+"<td>"+jsonObj.list[i].auction_history_price+"</td>"
		 				 		+"<td><input type='submit' value='유찰' class='buy_button'/></td>"
		 				 		+"</tr>";
	        		}
	        	 }
	         }
	         $("#Bid_win_table").html(values);
	         }else{
	        	values =
	        	 "<p style='text-align:center;font-size:15pt;padding-top:20px;'>경매 낙찰 내역이 없습니다.</p>";
	         $(".not").html(values);
	         }
		 
		 }
	}); 

});


function movePaymentPage(auction_no,member_id,price)
{
	parent.location.href="makeAuctionPaymentFromCSMy.do?auction_no="+auction_no+"&member_id="+member_id+"&price="+price;
	/* location.href="makeAuctionPayment.do?auction_no="+auction_no+"&member_id="+member_id; */
}


</script>
<body style="margin:0">
<hr style=" border:0.5px solid #7e5957">
	<div class="not" >
	<table class="View_table" id="Bid_win_table"style="margin-left: 10px;">
		
		
		
	</table>
	</div>

	<div id="bottom">
		<!-- 페이징 처리 -->
		<div class="pagination"></div>
	</div>
	<hr style="margin :0px; border:0.5px solid #7e5957">
	<table class="View_table" style="margin-left:10px; width:100%;">

	</table>

	<!-- <div id="bottom">
		페이징 처리
		<div class="pagination"></div> -->
	</div>
</body>
</html>