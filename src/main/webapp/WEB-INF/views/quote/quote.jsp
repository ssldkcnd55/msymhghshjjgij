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
							var html = "";
							var tempArr = [];
							html += "<table>";
							html += "<tr>"
							for ( var i in myitem) {
								if (tempArr.length == 0) {
									tempArr.puch(myitem[i].countyname)
								} else {
									html += "<td>" + myitem[i].countyname
											+ "</td>"
								}
							}
							html += "</tr>"
							html += "</table>";
							$("#list").html(html);

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
	<div id="list"></div>
</body>
</html>