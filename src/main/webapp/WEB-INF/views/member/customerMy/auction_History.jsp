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
		$.ajax({
					url : "auction_history_list.do",
					type : "post",
					data : {
						page : 1,
						member_id : '${loginUser.member_id}'
					},
					dataType : "JSON",
					success : function(data) {
						var objStr = JSON.stringify(data);
						var jsonObj = JSON.parse(objStr);
						var outValues = "<tr><th>번호</th><th>입찰 번호</th><th>경매 이름</th><th>입찰자 아이디</th><th>입찰가</th><th>입찰 시간</th></tr>";

						for ( var i in jsonObj.list) {
							outValues += "<tr><td>"
									+ jsonObj.list[i].rnum + "</td>" + "<td>"
									+ jsonObj.list[i].auction_history_no
									+ "</td>" + "<td><a target=_blank href='AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no+"'>"
									+ jsonObj.list[i].auction_title + "</td>"
									+ "<td>" + jsonObj.list[i].member_id
									+ "</td>" + "<td>"
									+ jsonObj.list[i].auction_history_price
									+ "</td>" + "<td>"
									+ jsonObj.list[i].auction_history_date
									+ "</td></tr>";
						}
						$(".View_table").html(outValues);

						var startPage = jsonObj.list[0].startPage;
						var endPage = jsonObj.list[0].endPage;
						var maxPage = jsonObj.list[0].maxPage;
						var currentPage = jsonObj.list[0].currentPage;

						var values = "";
						if (startPage > 5) {
							values += "<a href='javascript:auctionPage("
									+ (startPage - 1) + ")'>&laquo;</a>"
						} else {
							values += "<a>&laquo;</a>";
						}
						for (var i = startPage; i <= endPage; i++) {
							if (i == currentPage) {
								values += "<a class='active'>" + i + "</a>";
							} else {
								values += "<a href='javascript:auctionPage("
										+ i + ");'>" + i + "</a>";
							}
						}
						if (endPage < maxPage) {
							values += "<a href='javascript:auctionPage("
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
	function auctionPage(page) {
		$.ajax({
					url : "auction_history_list.do",
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

						var outValues = "<tr><th>번호</th><th>입찰 번호</th><th>경매 이름</th><th>입찰자 아이디</th><th>입찰가</th><th>입찰 시간</th></tr>";

						for ( var i in jsonObj.list) {
							outValues += "<tr><td>"
									+ jsonObj.list[i].rnum + "</td>" + "<td>"
									+ jsonObj.list[i].auction_history_no
									+ "</td>" + "<td><a target=_blank href='AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no+"'>"
									+ jsonObj.list[i].auction_title + "</td>"
									+ "<td>" + jsonObj.list[i].member_id
									+ "</td>" + "<td>"
									+ jsonObj.list[i].auction_history_price
									+ "</td>" + "<td>"
									+ jsonObj.list[i].auction_history_date
									+ "</td></tr>";
						}
						$(".View_table").html(outValues);

						var startPage = jsonObj.list[0].startPage;
						var endPage = jsonObj.list[0].endPage;
						var maxPage = jsonObj.list[0].maxPage;
						var currentPage = jsonObj.list[0].currentPage;

						var values = "";
						if (startPage > 5) {
							values += "<a href='javascript:auctionPage("
									+ (startPage - 1) + ")'>&laquo;</a>"
						} else {
							values += "<a>&laquo;</a>";
						}
						for (var i = startPage; i <= endPage; i++) {
							if (i == currentPage) {
								values += "<a class='active'>" + i + "</a>";
							} else {
								values += "<a href='javascript:auctionPage("
										+ i + ");'>" + i + "</a>";
							}
						}
						if (endPage < maxPage) {
							values += "<a href='javascript:auctionPage("
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
		<!-- 페이징 처리 -->
		<div class="pagination"></div>
	</div>
</body>
</html>