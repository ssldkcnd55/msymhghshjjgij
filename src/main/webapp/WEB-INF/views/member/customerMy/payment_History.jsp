<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="MyHtml">
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/customerMy/cusqna.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<script type="text/javascript">
$(function(page) {
	$
			.ajax({
				url : "payment_history_list.do",
				type : "post",
				data : {
					page : 1,
					member_id : '${loginUser.member_id}'
				},
				dataType : "JSON",
				success : function(data) {
					var objStr = JSON.stringify(data);
					var jsonObj = JSON.parse(objStr);

					var outValues = "<tr><th>번호</th><th>상품 정보</th>"
							+ "<th>결제 금액</th><th>거래 상태</th><th>구매 일자</th><th> </th></tr>";

					for ( var i in jsonObj.list) {
						outValues += "<tr><td>" + jsonObj.list[i].rnum
								+ "</td>" 
								+"<td><a class='Atitle' href='marketDetail.do?market_no="+jsonObj.list[i].market_no+"' target='_blank'>" + jsonObj.list[i].market_title + "</a></td>" 								
								+ "<td>"+ numberWithCommas(jsonObj.list[i].buy_price)
								+ "원</td>";
								if(jsonObj.list[i].buy_status == 0 ){
									outValues+= "<td>결제완료</td>";
								}else if(jsonObj.list[i].buy_status == 1){
									outValues+= "<td>배송준비중</td>";
								}else if(jsonObj.list[i].buy_status == 2){
									outValues+= "<td>배송중</td>";
								}else if(jsonObj.list[i].buy_status == 3){
									outValues+= "<td>배송완료</td>";
								}else if(jsonObj.list[i].buy_status == 4){
									outValues+= "<td class='complete'>구매확정</td>";
								}
								outValues+= "<td>"+ jsonObj.list[i].buy_date + "</td>"+
								"<td><a class='atag' href='moveDelivery_Number.do?code="+jsonObj.list[i].buy_transport_name+"&name="+jsonObj.list[i].buy_transport_no+"'>"
								+ "<div class='orderDetail delivery'>배송조회</div></a><a class='atag' target='_blank' href='orderDeliveryDetail.do?buy_no="+jsonObj.list[i].buy_no+"'><div class='orderDetail'>주문조회</div></a></td>" + "</tr>";
					}
					$(".View_table").html(outValues);

					var startPage = jsonObj.list[0].startPage;
					var endPage = jsonObj.list[0].endPage;
					var maxPage = jsonObj.list[0].maxPage;
					var currentPage = jsonObj.list[0].currentPage;

					var values = "";
					if (startPage > 5) {
						values += "<a href='javascript:paymentPage("
								+ (startPage - 1) + ")'>&laquo;</a>"
					} else {
						values += "<a>&laquo;</a>";
					}
					for (var i = startPage; i <= endPage; i++) {
						if (i == currentPage) {
							values += "<a class='active'>" + i + "</a>";
						} else {
							values += "<a href='javascript:paymentPage("
									+ i + ");'>" + i + "</a>";
						}
					}
					if (endPage < maxPage) {
						values += "<a href='javascript:paymentPage("
								+ (endPage + 1) + ")'>&raquo;</a>";

					} else {
						values += "<a>&raquo;</a>";
					}
					$(".pagination").html(values);

				},
				error : function(request, status, errorData) {
					console.log("error code : " + request.status + "\nmessage"
							+ request.responseText + "\nerror" + errorData);
				}
			});
});
function numberWithCommas(x) {
	console.log(x);
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	function paymentPage(page) {
		$
				.ajax({
					url : "payment_history_list.do",
					type : "post",
					data : {
						page : page,
						member_id : '${loginUser.member_id}'
					},
					dataType : "JSON",
					success : function(data) {
						console.log(data);
						var objStr = JSON.stringify(data);
						var jsonObj = JSON.parse(objStr);

						var outValues = "<tr><th>번호</th><th>상품 정보</th>"
							+ "<th>결제 금액</th><th>거래 상태</th><th>구매 일자</th><th> </th></tr>";

					for ( var i in jsonObj.list) {
						outValues += "<tr><td>" + jsonObj.list[i].rnum
								+ "</td>"	
								+"<td><a class='Atitle' href='marketDetail.do?market_no="+jsonObj.list[i].market_no+"' target='_blank'>" + jsonObj.list[i].market_title + "</a></td>" 
								+ "<td>" + numberWithCommas(jsonObj.list[i].buy_price) 
								+ "원</td>";
								if(jsonObj.list[i].buy_status == 0 ){
									outValues+= "<td>결제완료</td>";
								}else if(jsonObj.list[i].buy_status == 1){
									outValues+= "<td>배송준비중</td>";
								}else if(jsonObj.list[i].buy_status == 2){
									outValues+= "<td>배송중</td>";
								}else if(jsonObj.list[i].buy_status == 3){
									outValues+= "<td>배송완료<button></button></td>";
								}else if(jsonObj.list[i].buy_status == 4){
									outValues+= "<td class='complete'>구매확정</td>";
								}
								outValues+= "<td>"+ jsonObj.list[i].buy_date + "</td>"	+
								"<td><a class='atag' href='moveDelivery_Number.do?code="+jsonObj.list[i].buy_transport_name+"&name="+jsonObj.list[i].buy_transport_no+"'>"
								+ "<div class='orderDetail delivery'>배송조회</div></a><a class='atag' target='_blank' href='orderDeliveryDetail.do?buy_no="+jsonObj.list[i].buy_no+"'><div class='orderDetail'>주문조회</div></a></td>" + "</tr>";
					}
						$(".View_table").html(outValues);

						var startPage = jsonObj.list[0].startPage;
						var endPage = jsonObj.list[0].endPage;
						var maxPage = jsonObj.list[0].maxPage;
						var currentPage = jsonObj.list[0].currentPage;

						var values = "";
						if (startPage > 5) {
							values += "<a href='javascript:paymentPage("
									+ (startPage - 1) + ")'>&laquo;</a>"
						} else {
							values += "<a>&laquo;</a>";
						}
						for (var i = startPage; i <= endPage; i++) {
							if (i == currentPage) {
								values += "<a class='active'>" + i + "</a>";
							} else {
								values += "<a href='javascript:paymentPage("
										+ i + ");'>" + i + "</a>";
							}
						}
						if (endPage < maxPage) {
							values += "<a href='javascript:paymentPage("
									+ (endPage + 1) + ")'>&raquo;</a>";

						} else {
							values += "<a>&raquo;</a>";
						}
						$(".pagination").html(values);

					},
					error : function(request, status, errorData) {
						console.log("error code : " + request.status + "\nmessage"
								+ request.responseText + "\nerror" + errorData);
					}
				});
	}
</script>
<meta charset="UTF-8">
<title>title</title>
</head>
<body style="margin:0">
<hr style="margin :0px; border:0.5px solid #7e5957">
	<table class="View_table" style="margin-left:10px;">
	</table>

	<div id="bottom">
		<div class="pagination"></div>
	</div>

</body>
</html>