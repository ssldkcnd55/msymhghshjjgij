<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/customerMy/cusqna.css" />
<script type="text/javascript">
$(function(page) {
	$
			.ajax({
				url : "payment_history_list.do",
				type : "post",
				data : {
					page : 1
				},
				dataType : "JSON",
				success : function(data) {
					var objStr = JSON.stringify(data);
					var jsonObj = JSON.parse(objStr);

					var outValues = "<tr><th>번호</th><th>구매 번호</th><th>판매글 번호</th><th>구매 일자</th>"
							+ "<th>구매량</th><th>금액</th><th>거래 상태</th><th>배송 요청 사항</th><th>택배사 명</th><th>운송장 번호</th></tr>";

					for ( var i in jsonObj.list) {
						outValues += "<tr><td>" + jsonObj.list[i].rnum
								+ "</td>" + "<td>" + jsonObj.list[i].buy_no
								+ "</td>"
								+"<td><a href='marketDetail.do?market_no="+jsonObj.list[i].market_no+"' target='_blank'>" + jsonObj.list[i].market_title + "</a></td>" 
								+"<td>"
								+ jsonObj.list[i].buy_date + "</td>"
								+ "<td>" + jsonObj.list[i].buy_amount
								+ "</td>"
								+ "<td>" + jsonObj.list[i].buy_price
								+ "</td>";
								if(jsonObj.list[i].buy_status == 0 ){
									outValues+= "<td>결제완료</td>";
								}else if(jsonObj.list[i].buy_status == 1){
									outValues+= "<td>배송준비중</td>";
								}else if(jsonObj.list[i].buy_status == 2){
									outValues+= "<td>배송중</td>";
								}else if(jsonObj.list[i].buy_status == 3){
									outValues+= "<td>배송완료</td>";
								}else if(jsonObj.list[i].buy_status == 4){
									outValues+= "<td>구매확정</td>";
								}
								outValues+= "<td>" + jsonObj.list[i].buy_request + "</td>"
								+ "<td>"
								+ jsonObj.list[i].buy_transport_name
								+ "</td>" + "<td><a href='moveDelivery_Number.do?code="+jsonObj.list[i].buy_transport_name+"&name="+jsonObj.list[i].buy_transport_no+"'>"
								+ jsonObj.list[i].buy_transport_no
								+ "</a></td>" + "</tr>";
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
					alert("error code : " + request.status + "\nmessage"
							+ request.responseText + "\nerror" + errorData);
				}
			});
});
	function paymentPage(page) {
		$
				.ajax({
					url : "payment_history_list.do",
					type : "post",
					data : {
						page : page
					},
					dataType : "JSON",
					success : function(data) {
						console.log(data);
						var objStr = JSON.stringify(data);
						var jsonObj = JSON.parse(objStr);

						var outValues = "<tr><th>번호</th><th>구매 번호</th><th>판매글 번호</th><th>구매 일자</th>"
							+ "<th>구매량</th><th>금액</th><th>거래 상태</th><th>배송 요청 사항</th><th>택배사 명</th><th>운송장 번호</th></tr>";

					for ( var i in jsonObj.list) {
						outValues += "<tr><td>" + jsonObj.list[i].rnum
								+ "</td>" + "<td>" + jsonObj.list[i].buy_no
								+ "</td>"
								+"<td><a href='marketDetail.do?market_no="+jsonObj.list[i].market_no+"' target='_blank'>" + jsonObj.list[i].market_title + "</a></td>" 
								+"<td>"
								+ jsonObj.list[i].buy_date + "</td>"
								+ "<td>" + jsonObj.list[i].buy_amount
								+ "</td>"
								+ "<td>" + jsonObj.list[i].buy_price
								+ "</td>";
								if(jsonObj.list[i].buy_status == 0 ){
									outValues+= "<td>결제완료</td>";
								}else if(jsonObj.list[i].buy_status == 1){
									outValues+= "<td>배송준비중</td>";
								}else if(jsonObj.list[i].buy_status == 2){
									outValues+= "<td>배송중</td>";
								}else if(jsonObj.list[i].buy_status == 3){
									outValues+= "<td>배송완료</td>";
								}else if(jsonObj.list[i].buy_status == 4){
									outValues+= "<td>구매확정</td>";
								}
								outValues+= "<td>" + jsonObj.list[i].buy_request + "</td>"
								+ "<td>"
								+ jsonObj.list[i].buy_transport_name
								+ "</td>" + "<td><a href='moveDelivery_Number.do?code="+jsonObj.list[i].buy_transport_name+"&name="+jsonObj.list[i].buy_transport_no+"'>"
								+ jsonObj.list[i].buy_transport_no
								+ "</a></td>" + "</tr>";
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
						alert("error code : " + request.status + "\nmessage"
								+ request.responseText + "\nerror" + errorData);
					}
				});
	}
</script>
<meta charset="UTF-8">
<title>title</title>
</head>
<body>
	<table class="View_table">
	</table>

	<div id="bottom">
		<div class="pagination"></div>
	</div>

</body>
</html>