<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>


<!--  -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  -->
<!--  -->
<!-- Styles -->
<style>
#chartdiv {
	width: 100%;
	height: 500px;
	font-size: 11px;
}
</style>

<!-- Resources -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<!-- Chart code -->
<script>
	/* var chart = AmCharts.makeChart( "chartdiv", {
	 "type": "serial",
	 "theme": "light",
	 "dataProvider": [ {
	 "country": "USA",
	 "visits": 10
	 }, {
	 "country": "China",
	 "visits": 18
	 }, {
	 "country": "Japan",
	 "visits": 18
	 }, {
	 "country": "Germany",
	 "visits": 13
	 }, {
	 "country": "UK",
	 "visits": 11
	 }, {
	 "country": "France",
	 "visits": 11
	 }, {
	 "country": "India",
	 "visits": 98
	 } ],
	 "valueAxes": [ {
	 "gridColor": "#FFFFFF",
	 "gridAlpha": 0.2,
	 "dashLength": 0
	 } ],
	 "gridAboveGraphs": true,
	 "startDuration": 1,
	 "graphs": [ {
	 "balloonText": "[[category]]: <b>[[value]]</b>",
	 "fillAlphas": 0.8,
	 "lineAlpha": 0.2,
	 "type": "column",
	 "valueField": "visits"
	 } ],
	 "chartCursor": {
	 "categoryBalloonEnabled": false,
	 "cursorAlpha": 0,
	 "zoomable": false
	 },
	 "categoryField": "country",
	 "categoryAxis": {
	 "gridPosition": "start",
	 "gridAlpha": 0,
	 "tickPosition": "start",
	 "tickLength": 20
	 },
	 "export": {
	 "enabled": true
	 }

	 } ); */

	$(function() {
		var type = 1;
		$.ajax({
			url : "visitChart.do",
			type : "post",
			data : {
				type : type
			},
			dataType : "JSON",
			success : function(data) {

				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				/* var outvalues = ""; */
				/* $("#chartdiv").empty(); */

				var day = [];
				var visit = [];

				for ( var i in jsonObj.list) {
					day.push(jsonObj.list[i].date);
					visit.push(jsonObj.list[i].count);
				}
				console.log(day);
				console.log(visit);

				Highcharts.chart('chartdiv', {
					chart : {
						type : 'column'
					},

					title : {
						text : '일별 접속량수'
					},
					xAxis : {
						categories : day

					},
					yAxis : {
						min : 0,
						title : {
							text : '방문자수'
						}
					},
					legend : {
						enabled : false
					},
					tooltip : {
						pointFormat : '판매량: <b>{point.y:.1f} 개</b>'
					},
					series : [ {
						name : day,
						data : visit,
						dataLabels : {
							enabled : true,
							rotation : -90,
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

		});
	});

	function show_Daily() {
		var type = 1;
		$.ajax({
			url : "visitChart.do",
			type : "post",
			data : {
				type : type
			},
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				/* var outvalues = ""; */
				$("#chartdiv").empty();

				var day = [];
				var visit = [];

				for ( var i in jsonObj.list) {
					day.push(jsonObj.list[i].date);
					visit.push(jsonObj.list[i].count);
				}
				console.log(day);
				console.log(visit);

				Highcharts.chart('chartdiv', {
					chart : {
						type : 'column'
					},

					title : {
						text : '일별 방문자수'
					},
					xAxis : {
						categories : day

					},
					yAxis : {
						min : 0,
						title : {
							text : '방문자수'
						}
					},
					legend : {
						enabled : false
					},
					tooltip : {
						pointFormat : '판매량: <b>{point.y:.0f} 개</b>'
					},
					series : [ {
						name : day,
						data : visit,
						dataLabels : {
							enabled : true,
							rotation : -90,
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

		});

	}

	function show_Monthly() {
		var type = 2;
		$.ajax({
			url : "visitChart.do",
			type : "post",
			data : {
				type : type
			},
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);

				var month = [];
				var visit = [];
				$("#chartdiv").empty();
				for ( var i in jsonObj.list) {
					month.push(jsonObj.list[i].month);
					visit.push(jsonObj.list[i].count2);
				}
				console.log(month);
				console.log(visit);

				Highcharts.chart('chartdiv', {
					chart : {
						type : 'column'
					},

					title : {
						text : '월별 방문자수'
					},
					xAxis : {
						categories : month

					},
					yAxis : {
						min : 0,
						title : {
							text : '방문자수'
						}
					},
					legend : {
						enabled : false
					},
					tooltip : {
						pointFormat : '판매량: <b>{point.y:.0f} 개</b>'
					},
					series : [ {
						name : month,
						data : visit,
						dataLabels : {
							enabled : true,
							rotation : -90,
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
		});
	}
	// 총회원수/총 등록된판매수/총 등록된경매수
	$(function() {

		$.ajax({
			url : "countAll.do",
			type : "post",
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				$("#membercount").append(jsonObj.membercount);
				$("#marketcount").append(jsonObj.marketcount);
				$("#auctioncount").append(jsonObj.auctioncount);
				$("#visitcount").append(jsonObj.visitcount);
			}
		});
		$.ajax({
			url : "newmarketDate.do",
			type : "post",
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				var newmarket = "";
				newmarket += "<table class='table table-striped table-hover'>"
						+ "<tr><th>판매제목</th><th>등록자</th><th>출고예정일</th></tr>"
				for ( var i in jsonObj.list) {
					newmarket += "<tr><td>" + jsonObj.list[i].market_title
							+ "</td><td>" + jsonObj.list[i].member_id
							+ "</td><td>" + jsonObj.list[i].market_releasedate
							+ "</td></tr>";
				}
				newmarket += "</table>";
				$("#table").html(newmarket);
			}
		});
		$.ajax({
			url : "newauctionDate.do",
			type : "post",
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				var newauction = "";
				newauction += "<table class='table table-striped table-hover'>"
						+ "<tr><th>경매제목</th><th>등록자</th><th>경매상태</th></tr>"
				for ( var i in jsonObj.list) {
					newauction += "<tr><td>" + jsonObj.list[i].auction_title
							+ "</td><td>" + jsonObj.list[i].member_id + "</td>"
					if (jsonObj.list[i].auction_status == 0) {
						newauction += "<td>경매준비중</td></tr>"
					}
					if (jsonObj.list[i].auction_status == 1) {
						newauction += "<td>경매중</td></tr>"
					}
					if (jsonObj.list[i].auction_status == 2) {
						newauction += "<td>입찰</td></tr>"
					}
					if (jsonObj.list[i].auction_status == 3) {
						newauction += "<td>결제완료</td></tr>"
					}

				}
				newauction += "</table>";
				$("#auctiontable").html(newauction);
			}
		});
	});
</script>
<!--  -->
<link href="/farm/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">


				<!--  -->

				<section id="main" style="margin-top: 60px; margin-bottom: 30px;">
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<div class="list-group">
									<a class="list-group-item active main-color-bg"><span
										class="glyphicon glyphicon-cog" aria-hidden="true"></span>
										관리목록 </a> <a href="/farm/moveNotice.do" class="list-group-item"><span
										class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
										&nbsp;공지사항관리</a> <a href="/farm/moveAdminCategory.do"
										class="list-group-item"><span
										class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										&nbsp;카테고리관리</a> <a href="/farm/moveAdminReport.do"
										class="list-group-item"><span
										class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										&nbsp;신고관리</a> <a href="/farm/moveNotcie_write.do"
										class="list-group-item"><span
										class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										&nbsp;공지사항작성</a> <a href="/farm/moveAdminMember.do"
										class="list-group-item"><span
										class="glyphicon glyphicon-user" aria-hidden="true"></span>
										&nbsp;유저검색</a>
								</div>




							</div>
							<!-- <button onclick="button();">버튼</button> -->
							<div class="col-md-9">
								<div class="panel panel-default">
									<div class="panel-heading" style="background-color: #095f59;">
										<h3 class="panel-title" style="color: #ffffff">사이트 전체보기</h3>
									</div>
									<div class="panel-body">
										<div class="col-md-3">
											<div class="well dash-box">
												<h2>
													<span class="glyphicon glyphicon-user" aria-hidden="true"
														id="membercount">&nbsp;</span>
												</h2>
												<h4>총 회원수</h4>
											</div>
										</div>
										<div class="col-md-3">
											<div class="well dash-box">
												<h2>
													<span class="glyphicon glyphicon-list-alt"
														aria-hidden="true" id="marketcount">&nbsp;</span>
												</h2>
												<h4>총 등록 판매 수</h4>
											</div>
										</div>
										<div class="col-md-3">
											<div class="well dash-box">
												<h2>
													<span class="glyphicon glyphicon-pencil" aria-hidden="true"
														id="auctioncount">&nbsp;</span>
												</h2>
												<h4>총 등록 경매 수</h4>
											</div>
										</div>
										<div class="col-md-3">
											<div class="well dash-box">
												<h2>
													<span class="glyphicon glyphicon-stats" aria-hidden="true"
														id="visitcount">&nbsp;</span>

												</h2>
												<h4>총 방문자수</h4>
											</div>
										</div>
									</div>
								</div>
								<!-최신 강의->




								<div class="panel panel-default">
									<div class="panel-heading" style="background-color: #095f59;">
										<h3 class="panel-title" style="color: #ffffff">최신 판매</h3>
									</div>
									<div class="panel-body" id="table">
										<!-- 	<table class="table table-striped table-hover">
											<tr>
												<th>판매명</th>
												<th>판매자</th>
												<th>등록일</th>
											</tr>


											<tr >
												<td>더미</td>
												<td>더미</td>
												<td>더미</td>
											</tr>


										</table> -->

									</div>
								</div>
								<!-최신유저 ->

								<div class="panel panel-default">
									<div class="panel-heading" style="background-color: #095f59;">
										<h3 class="panel-title" style="color: #ffffff">최신 경매</h3>
									</div>

									<div class="panel-body" id="auctiontable">
										<!-- <table class="table table-striped table-hover"
											id="newdatetable">
											<tr>
												<th>경매명</th>
												<th>경매자</th>
												<th>등록일</th>
											</tr>

										</table> -->
									</div>
								</div>

							</div>
						</div>
						<br> <br>
						<!--차트  -->
						<button onclick="show_Daily();">일별접속량</button>
						&nbsp;
						<button onclick="show_Monthly();">월별접속량</button>
						<div id="chartdiv"></div>
						<!--  -->
					</div>
				</section>




				<!--  -->
			</div>
		</div>

		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>


</body>
</html>