<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#button").click(
				function() {

					$.ajax({
						url : '/farm/QuoteApi.do',
						type : 'post',
						dataType : 'json',
						data : {

							productclscode : "01",
							startdate : "2018-05-08",
							endday : "2018-05-19",
							itemcategorycode : "200",
							itemcode : "212",
							kindcode : "00",
							productrankcode : "05",
							countrycode : "1101",
							convert : "N"

						},

						success : function(data) {

							var jsonStr = JSON.stringify(data);
							var jsonData = JSON.parse(jsonStr);
							var myitem = jsonData.data.item
							console.log(myitem);

							var result = [];

							var html1 = "";
							var html2 = "";
							var html3 = "";
							var html4 = "";
							
							
							$.each(myitem, function(index, item) {
								
								if ($.inArray(item.regday, result) == -1) {
									result.push(item.regday);
									html1 += "<th>" + item.regday + "</th>"
								}
								if (item.countyname == "평균") {
								if ($.inArray(item.countyname, result) == -1) {
									result.push(item.countyname);									
										html2 += "<td>" + item.countyname
												+ "</td>"	
								}
								html2 += "<td>" + item.price + "</td>"
								}
								if (item.countyname == "평년") {
									if ($.inArray(item.countyname, result) == -1) {
										result.push(item.countyname);									
											html3 += "<td>" + item.countyname
													+ "</td>"	
									}
									html3 += "<td>" + item.price + "</td>"
									}
								if (item.countyname == "서울" && item.marketname =="경동") {
									if ($.inArray(item.countyname, result) == -1) {
										result.push(item.countyname);									
											html4 += "<td>" + item.countyname
													+ "</td>"
									}																	
									html4 += "<td>" + item.price + "</td>"
								}
								
							});
							$("#tr").append(html1);
							$("#tr2").append(html2);
							$("#tr3").append(html3);
							$("#tr4").append(html4);

						},
						error : function(request, status, errorData) {
							alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "\n" + "error : " + errorData);
						}
					});
				});

	});
</script>
</head>
<body>
	<button id="button">작동</button>
	<div id="list">
		<table style="border: 1px solid">
			<tr id="tr">
			<th>날짜</th>
			</tr>
			<tr id="tr2">
			</tr>
			<tr id="tr3">
			</tr>
			</tr>
			<tr id="tr4">
			</tr>
		</table>
	</div>
</body>
</html>