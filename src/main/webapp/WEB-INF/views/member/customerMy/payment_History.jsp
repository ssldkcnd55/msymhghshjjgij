<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$
				.ajax({
					url : "payment_history_list.do",
					type : "post",
					data : {
						page : 1
					},
					dataType : "JSON",
					success : function(data) {
						console.log(data);
						var objStr = JSON.stringify(data);
						var jsonObj = JSON.parse(objStr);

						var outValues = "<tr><th>번호</th><th>구매 번호</th><th>그룹 번호</th><th>판매글 번호</th><th>경매글 번호</th><th>구매자 아이디</th><th>구매 일자</th>"
								+ "<th>구매량</th><th>배송지 주소</th><th>배송지 전화번호</th><th>구매자 이름</th><th>거래 상태</th><th>배송 요청 사항</th><th>택배사 명</th><th>운송장 번호</th></tr>";

						for ( var i in jsonObj.list) {
							outValues += "<tr><td>" + jsonObj.list[i].rnum
									+ "</td>" + "<td>" + jsonObj.list[i].buy_no
									+ "</td>" + "<td>"
									+ jsonObj.list[i].group_no + "</td>"
									+ "<td>" + jsonObj.list[i].market_no
									+ "</td>" + "<td>"
									+ jsonObj.list[i].auction_no + "</td>"
									+ "<td>" + jsonObj.list[i].member_id
									+ "</td>" + "<td>"
									+ jsonObj.list[i].buy_date + "</td>"
									+ "<td>" + jsonObj.list[i].buy_amount
									+ "</td>" + "<td>"
									+ jsonObj.list[i].buy_addr + "</td>"
									+ "<td>" + jsonObj.list[i].buy_tel
									+ "</td>" + "<td>"
									+ jsonObj.list[i].buy_name + "</td>"
									+ "<td>" + jsonObj.list[i].buy_status
									+ "</td>" + "<td>"
									+ jsonObj.list[i].buy_request + "</td>"
									+ "<td>"
									+ jsonObj.list[i].buy_transport_name
									+ "</td>" + "<td><a href='moveDelivery_Number.do?code="+jsonObj.list[i].buy_transport_name+"&name="+jsonObj.list[i].buy_transport_no+"'>"
									+ jsonObj.list[i].buy_transport_no
									+ "</a></td>" + "</tr>";
						}
						$(".payment_table").html(outValues);

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
</script>
<meta charset="UTF-8">
<title>title</title>
</head>
<body>
	<table class="payment_table">

	</table>
	<!-- 하단 페이징, 검색 묶음 -->
	<div id="bottom">
		<!-- 페이징 처리 -->
		<div class="pagination"></div>

		<!-- 검색 -->
		<div class="search_box">
			<span class='green_window'> <input type='text'
				class='input_text' />
			</span>
			<button type='submit' class='sch_smit'>검색</button>
		</div>
	</div>

</body>
</html>