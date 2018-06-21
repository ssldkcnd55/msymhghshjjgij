<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Resources -->
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<!-- Chart code -->

<script type="text/javascript">
	window.onload = function() {

		$.ajax({
			url : "mybuy.do",
			type : "post",
			data : {
				member_id : '${loginUser.member_id}'
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				var country = [];
				var visits = [];
				for ( var i in json.list) {
					country.push(json.list[i].market_title);
					visits.push(parseInt(json.list[i].buy_amount));
				}
				console.log(country);
				console.log(visits);
				Highcharts.chart('container', {
					chart : {
						type : 'column'
					},

					title : {
						text : '상품판매량'
					},
					xAxis : {
						categories : country

					},
					yAxis : {
						min : 0,
						title : {
							text : '판매수'
						}
					},
					legend : {
						enabled : false
					},
					tooltip : {
						pointFormat : '판매량: <b>{point.y:.0f} 개</b>'
					},
					series : [ {
						name : country,
						data : visits,
						dataLabels : {
							enabled : true,
							rotation : -360,
							color : '#FFFFFF',
							align : 'right',
							format : '{point.y:.0f}', // one decimal
							y : 10, // 10 pixels down from the top
							style : {
								fontSize : '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					} ]
				});
			}
		}); /*ajax*/
		$.ajax({
			url : "AllmarketAmount.do",
			type : "post",
			data : {
				member_id : '${loginUser.member_id}'
			},
			datetype : "JSON",
			success : function(data) {
				console.log(data)
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				var marketamount = "";
				for ( var i in json.list) {
					marketamount += "<p style='text-align: right;'>총판매금액: "
							+ json.list[i].market_amount + " 원</p>"
				}
				$("#marketamount").html(marketamount)
			}

		});
		$.ajax({
			url : "AllbuyAmount.do",
			type : "post",
			data : {
				member_id : '${loginUser.member_id}'
			},
			datetype : "JSON",
			success : function(data) {
				console.log(data)
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				var buyamount = "";
				for ( var i in json.list) {
					buyamount += "<p style='text-align: right;'>총판매개수: "
							+ json.list[i].buy_amount + " 개</p>"
				}
				$("#buyamount").html(buyamount)
			}

		});
	};
</script>
<title>상품판매량</title>
</head>
<body>
	<div id="container"
		style="min-width: 300px; height: 400px; margin: 0 auto"></div>
	<div id="marketamount"></div>
	<div id="buyamount"></div>

</body>
</html>