<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/farm/resources/css/style.css" />
<script type="text/javascript">
	/*품목 셀렉트박스 생성  */
	$(function() {
		$('#h1').change(
				function() {
					var changevalue = $("#h1").val();

					/*식량작물 : 품목값  */
					var json = [ {
						"name" : "쌀",
						"value" : "111"
					}, {
						"name" : "찹쌀",
						"value" : "112"
					}, {
						"name" : "콩",
						"value" : "141"
					}, {
						"name" : "팥",
						"value" : "142"
					}, {
						"name" : "녹두",
						"value" : "143"
					} ]
					/* 채소류 : 품목값  */
					var json2 = [ {
						"name" : "배추",
						"value" : "211"
					}, {
						"name" : "양배추",
						"value" : "212"
					}, {
						"name" : "시금치",
						"value" : "213"
					}, {
						"name" : "상추",
						"value" : "214"
					}, {
						"name" : "얼갈이배추",
						"value" : "215"
					} ]
					/* 특용작물: 품목값   */
					var json3 = [ {
						"name" : "참깨",
						"value" : "312"
					}, {
						"name" : "땅콩",
						"value" : "314"
					}, {
						"name" : "느타리버섯",
						"value" : "315"
					}, {
						"name" : "팽이버섯",
						"value" : "316"
					}, {
						"name" : "새송이버섯",
						"value" : "317"
					} ]
					/* 과일류: 품목값   */
					var json4 = [ {
						"name" : "사과",
						"value" : "211"
					}, {
						"name" : "양배추",
						"value" : "212"
					}, {
						"name" : "시금치",
						"value" : "213"
					}, {
						"name" : "상추",
						"value" : "214"
					}, {
						"name" : "얼갈이배추",
						"value" : "215"
					} ]
					/*품목 셀렉트박스에 뿌려줄값  */
					var html = "";
					html += "<option>품목선택</option>";
					/*식용작물 품목  */
					if (changevalue == "100") {

						for ( var i in json) {
							html += "<option value="+json[i].value+">"
									+ json[i].name + "</option>";
						}

					}
					/*채소류 품목  */
					if (changevalue == "200") {

						for ( var i in json2) {
							html += "<option value="+json2[i].value+">"
									+ json2[i].name + "</option>";
						}

					}
					/*특용작물 품목  */
					if (changevalue == "300") {

						for ( var i in json3) {
							html += "<option value="+json3[i].value+">"
									+ json3[i].name + "</option>";
						}

					}
					/*과일류  품목*/
					if (changevalue == "400") {

						for ( var i in json4) {
							html += "<option value="+json4[i].value+">"
									+ json4[i].name + "</option>";
						}

					}

					$('#h2').html(html);
				});
		/*품종 셀렉트박스 생성  */
		$('#h2').change(
				function() {
					var html2 = "";
					var value = $("#h2").val();
					var json3 = [ {
						"name" : "일반계",
						"value" : "01"
					}, {
						"name" : "햇일반계",
						"value" : "05"
					} ];
					var json5 = [ {
						"name" : "일반계",
						"value" : "01"
					} ];
					var json6 = [ {
						"name" : "백태",
						"value" : "01"
					} ];
					var json7 = [ {
						"name" : "적두",
						"value" : "00"
					} ];
					html2 += "<option>품종선택</option>";
					if (value == "111") {

						for ( var i in json3) {
							html2 += "<option value="+json3[i].value+">"
									+ json3[i].name + "</option>";
						}
					}
					if (value == "112") {

						for ( var i in json5) {
							html2 += "<option value="+json5[i].value+">"
									+ json5[i].name + "</option>";
						}
					}
					if (value == "141") {

						for ( var i in json6) {
							html2 += "<option value="+json6[i].value+">"
									+ json6[i].name + "</option>";
						}
					}
					if (value == "142") {

						for ( var i in json7) {
							html2 += "<option value="+json7[i].value+">"
									+ json7[i].name + "</option>";
						}
					}

					$("#h3").html(html2);
				});
		/*등급 셀렉트박스 생성 */
		$('#h3').change(
				function() {
					var html3 = "";
					var value2 = $("#h3").val();
					var json4 = [ {
						"name" : "상품",
						"value" : "04"
					}, {
						"name" : "중품",
						"value" : "05"
					} ];

					html3 += "<option>등급선택</option>";
					if (value2 == "01" || value2 == "05" || value2 == "00") {
						for ( var i in json4) {
							html3 += "<option value="+json4[i].value+">"
									+ json4[i].name + "</option>";
						}
					}
					$("#h4").html(html3);
				});

	});

	function selectbox() {

		$(".tr").empty();
		$(".tr2").empty();
		$(".tr4").empty();
		$(".tr5").empty();
		$(".tr6").empty();

		var h1 = $("#h2 option:selected").text();

		$
				.ajax({
					url : '/farm/QuoteApi.do',
					type : 'post',
					dataType : 'json',
					data : {
						startday : $("#start").val(),
						endday : $("#end").val(),
						itemcategorycode : $("#h1").val(),
						itemcode : $("#h2").val(),
						kindcode : $("#h3").val(),
						productrankcode : $("#h4").val(),
						countycode : $("#h0").val()

					},
					success : function(data) {
						$("#p1").remove();
						$("#p2").remove();
						/*시세 정보 테이블에 뿌리기 */
						var jsonStr = JSON.stringify(data);
						var jsonData = JSON.parse(jsonStr);
						var myitem = jsonData.data.item;
						console.log(myitem);

						var result = [];
						var c = [];
						var m = [];
						var r = [];
						var t = [];
						var a = [];
						var b = [];
						var price = [];

						/*날짜 */
						var html = "";
						/*평균*/
						var html2 = "";
						/*평년 */
						var html3 = "";
						/*서울 / 경동  */
						var html4 = "";
						/*서울 / 영등포  */
						var html5 = "";
						/*서울 / 복조리  */
						var html6 = "";

						html += "<th class='th' colspan='2'  style='border:3px solid #ddd;'>구분</th>";

						/*테이블 생성   */
						$
								.each(
										myitem,
										function(index, item) {

											if ($.inArray(item.regday, result) == -1) {
												result.push(item.regday);
												c.push(item.regday);
												html += "<th class='th' style='border:3px solid #ddd;'>"
														+ item.regday + "</th>";

											}
											if (item.countyname == "평균") {
												if ($.inArray(item.countyname,
														result) == -1) {
													result
															.push(item.countyname);

													html2 += "<td class='titletd' colspan='2' style='border:3px solid #ddd; text-align:center;' >"
															+ item.countyname
															+ "</td>";

												}

												html2 += "<td class='td' style='border:3px solid #ddd;'>"
														+ item.price + "</td>";

											}

											/* 지역 / 서울  */
											if (item.countyname == "서울") {
												if (item.marketname == "경동") {
													if ($.inArray(
															item.countyname,
															result) == -1) {
														result
																.push(item.countyname);

														html4 += "<td class='titletd' rowspan ='8' style='border:3px solid #ddd;'>"
																+ item.countyname
																+ "</td>";

													}
													if ($.inArray(
															item.marketname,
															result) == -1) {
														result
																.push(item.marketname);
														m.push(item.marketname);

														html4 += "<td class='titletd' style='border:3px solid #ddd;'>"
																+ item.marketname
																+ "</td>";
														/* price.push(item.price) */
													}

													price
															.push(parseInt(item.price
																	.replace(
																			",",
																			"")));

													html4 += "<td class='td' style='border:3px solid #ddd;'>"
															+ item.price
															+ "</td>";

												}

												if (item.marketname == "영등포") {
													if ($.inArray(
															item.countyname,
															result) == -1) {
														result
																.push(item.countyname);

														html5 += "<td class='titletd' style='border:3px solid #ddd;'>"
																+ item.countyname
																+ "</td>";

													}
													if ($.inArray(
															item.marketname,
															result) == -1) {
														result
																.push(item.marketname);
														r.push(item.marketname);
														html5 += "<td class='titletd' style='border:3px solid #ddd;'>"
																+ item.marketname
																+ "</td>";

													}
													t.push(parseInt(item.price
															.replace(",", "")));
													html5 += "<td class='td' style='border:3px solid #ddd;'>"
															+ item.price
															+ "</td>";
												}
												if (item.marketname == "복조리") {
													if ($.inArray(
															item.countyname,
															result) == -1) {
														result
																.push(item.countyname);

														html6 += "<td class='titletd' style='border:3px solid #ddd;'>"
																+ item.countyname
																+ "</td>";

													}
													if ($.inArray(
															item.marketname,
															result) == -1) {
														result
																.push(item.marketname);
														a.push(item.marketname);
														html6 += "<td class='titletd' style='border:3px solid #ddd;'>"
																+ item.marketname
																+ "</td>";

													}
													b.push(parseInt(item.price
															.replace(",", "")));
													html6 += "<td class='td' style='border:3px solid #ddd;'>"
															+ item.price
															+ "</td>";
												}

											}
											console.log(c)
											console.log(price)

										});
						Highcharts.chart('g', {

							title : {
								text : h1
							},
							xAxis : {
								categories : c
							},

							/* yAxis : {

							}, */
							legend : {
								layout : 'vertical',
								align : 'right',
								verticalAlign : 'middle'
							},

							series : [ {
								name : m,
								data : price

							}, {
								name : r,
								data : t
							}, {
								name : a,
								data : b
							}

							],

							responsive : {
								rules : [ {
									condition : {
										maxWidth : 500
									},
									chartOptions : {
										legend : {
											layout : 'horizontal',
											align : 'center',
											verticalAlign : 'bottom'
										}
									}
								} ]
							}

						});

						$(".tr").append(html);
						$(".tr2").append(html2);
						$(".tr4").append(html4);
						$(".tr5").append(html5);
						$(".tr6").append(html6);

					},

					error : function(request, status, errorData) {
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});

	}
</script>
<style type="text/css">
.j_title {
	style ="font-weight: 500;
	color: #383838;
	"
}

.j_title::after {
	content: '';
	display: inline-block;
	width: 6px;
	height: 6px;
	margin-left: 5px;
	background: #f1473a;
	border-radius: 100%;
}

.j_name_content_box {
	padding: 40px;
}

.graph_box {
	padding: 40px;
}

.table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.th {
	color: #222;
	background: #f7f7f7;
	border: solid 1px #c7c7c7;
	border-bottom: solid 1px #555;
	font-size: 1.15em;
	text-align: center;
	padding: 10px;
}

.td {
	color: #222;
	border: solid 1px #c7c7c7;
	text-align: center;
	padding: 10px;
}

.titletd {
	background: #fcfcfc;
	font-weight: bold;
	font-size: 1.3em;
	text-align: center;
	padding: 10px;
}

.button {
	/* border: 0;
	outline: 0; */
	background-color: white;
	color: #f1473a;
	border: 1px solid #f1473a;
	padding: 6px 6px 6px;
}

.select {
	width: 100px;
	padding: .8em .5em;
	font-family: "Helvetica", arial, sans-serif;
	font-size: 12px;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #999;
	border-radius: 0px;
	display: inline-block;
	margin: auto;
	text-align: center;
}

.inputdate {
	appearance: none;
	-webkit-appearance: none;
	color: #95a5a6;
	border: 1px solid #ecf0f1;
	font-family: "Helvetica", arial, sans-serif;
	font-size: 18px;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	padding: 5px;
	display: inline-block !important;
	visibility: visible !important;
	font-size: 18px;
}

#job_image {
	background-size: cover;
	width: 50px;
	height: 50px;
	float: left;
}

#job {
	font-weight: bold;
	font-size: 23pt;
	color: #7e5957;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>

		<!-- account-wrap -->


		<div id="container">
			<div class="inner-wrap">
				<br> <br> <br>

				<!--기간 시작-->
				<div class="period_box" style="padding: 20px;">
					<!-- <h3 class="j_title">기간</h3> -->
					<!-- <div id="job_image"
							style="background-image: url('/farm/resources/images/job.png')"></div> -->
						<div id="job">&nbsp;항목선택</div>
					<form style="padding: 4px; margin: 20px 0px;">
						<span style="color: #555;">시작날 :</span> <input type="date"
							id="start" name="firstname" style="margin-right: 40px;"
							class="inputdate"><span style="color: #555;">종료날 :
						</span> <input id="end" type="date" name="lastname" class="inputdate">
					</form>


					<table style="width: 100%;">
						<tbody>
							<tr>
								<td style="width: 16.6667%;">

									<p style="text-align: left; color: #555;">지역</p>
								</td>
								<td style="width: 16.6667%;">

									<p style="text-align: left; color: #555;">부류</p>
								</td>
								<td style="width: 16.6667%;">

									<p style="text-align: left; color: #555;">품목</p>
								</td>
								<td style="width: 16.6667%;">

									<p style="text-align: left; color: #555;">품종</p>
								</td>
								<td style="width: 16.6667%;">

									<p style="text-align: left; color: #555;">등급</p>
								</td>
								<td style="width: 16.6667%;"></td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<td style="width: 16.6667%;"><select id="h0" class="select">
										<option>지역선택</option>
										<option value="1101">서울</option>
										<option value="2300">인천</option>
										<option value="2100">부산</option>
										<option value="2200">대구</option>
								</select></td>

								<td style="width: 16.6667%;"><select id="h1" class="select">
										<option>부류선택</option>
										<option value="100">식량작물</option>
										<option value="200">채소류</option>
										<option value="300">특용작물</option>
										<option value="400">과일류</option>
								</select></td>
								<td style="width: 16.6667%;"><select id="h2" class="select">
										<option>품목선택</option>
								</select></td>
								<td style="width: 16.6667%;"><select id="h3" class="select">
										<option>품종선택</option>
								</select></td>
								<td style="width: 16.6667%;"><select id="h4" class="select">
										<option>등급선택</option>
								</select></td>
								<td style="width: 16.6667%;">

									<button onclick="selectbox()" class="button">조회하기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--기간 끝-->
				<hr style="border-color: #ddd; width: 100%;">
				<!--명칭 시작-->
				<div class="name_box" style="padding: 20px;">
				<!-- 	<h3 class="j_title">시세정보</h3> -->
					<div id="job_image"
							style="background-image: url('/farm/resources/images/quote01.png')"></div>
						<div id="job">&nbsp;시세정보</div>
					<div class="j_name_content_box">
						<p id="p1" style="margin: auto;">조회된 데이터가 없습니다</p>
						<table class="table" style="margin: auto;">
							<tr class="tr"></tr>
							<tr class="tr2"></tr>
							<tr class="tr4"></tr>
							<tr class="tr5"></tr>
							<tr class="tr6"></tr>
						</table>
					</div>
				</div>
				<!--명칭끝-->
				<hr style="border-color: #ddd; width: 100%;">
				<!--조건 시작-->
				<div class="condition_box" style="padding: 20px;">
					<!-- <h3 class="j_title">시세정보그래프</h3> -->
					<div id="job_image"
							style="background-image: url('/farm/resources/images/quote02.png')"></div>
							<div id="job">&nbsp;시세그래프</div>
					<div class="graph_box">
						<p id="p2" style="margin: auto;">조회된 데이터가 없습니다</p>
						<div id="g" style="margin: auto;"></div>
					</div>
				</div>
				<!--조건 끝 -->
			</div>
		</div>
		<!-- 내용 끝  -->
		<%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
</body>
</html>