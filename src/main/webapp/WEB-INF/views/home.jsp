<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>Farm</title>

<link href="/farm/resources/css/homeauction.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/flexslider-rtl.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/flexslider.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/flexslider-rtl-min.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/home.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/mainquote.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/modernizr.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function() {
		/* 홈에 경매리스트 */
		$
				.ajax({
					url : "homeAuctionList.do",
					type : "post",
					dataType : "JSON",
					success : function(obj) {
						var objStr = JSON.stringify(obj);
						var jsonObj = JSON.parse(objStr);
						var count = 1;
						var outValues1 = "<div class='item active' align='center'><table class='auction_table'>"
								+ "<tr><th>상품</th><th>가격</th></tr>";

						var outValues2 = "<div class='item' align='center'><table class='auction_table'>"
								+ "<tr><th>상품</th><th>가격</th></tr>";

						var outValues3 = "<div class='item' align='center'><table class='auction_table'>"
								+ "<tr><th>상품</th><th>가격</th></tr>";

						for ( var i in jsonObj.list) {
							if (i < 4) {
								outValues1 += "<tr><td><a class='aTag1' href='AuctionDetail.do?auction_no="
										+ jsonObj.list[i].auction_no
										+ "'><div><div class='auction_img' style='background-image: url(\"/farm/resources/upload/auctionUpload/"
										+ jsonObj.list[i].auction_img
										+ "\");'></div>"
										+ "<div>"
										+ jsonObj.list[i].auction_title
										+ "</div></td><td>현재가  <span class='currentPrice'>"
										+ jsonObj.list[i].auction_startprice
										+ "</span>원<br><span class='directPrice'>즉구가 "
										+ jsonObj.list[i].auction_directprice
										+ "원</span></div></a></td></tr>";
							} else if (i < 8) {
								outValues2 += "<tr><td><a class='aTag1' href='AuctionDetail.do?auction_no="
										+ jsonObj.list[i].auction_no
										+ "'><div><div class='auction_img' style='background-image: url(\"/farm/resources/upload/auctionUpload/"
										+ jsonObj.list[i].auction_img
										+ "\");'></div>"
										+ "<div>"
										+ jsonObj.list[i].auction_title
										+ "</div></td><td>현재가  <span class='currentPrice'>"
										+ jsonObj.list[i].auction_startprice
										+ "</span>원<br><span class='directPrice'>즉구가 "
										+ jsonObj.list[i].auction_directprice
										+ "원</span></div></a></td></tr>";
							} else if (i < 12) {
								outValues3 += "<tr><td><a class='aTag1' href='AuctionDetail.do?auction_no="
										+ jsonObj.list[i].auction_no
										+ "'><div><div class='auction_img' style='background-image: url(\"/farm/resources/upload/auctionUpload/"
										+ jsonObj.list[i].auction_img
										+ "\");'></div>"
										+ "<div>"
										+ jsonObj.list[i].auction_title
										+ "</div></td><td>현재가  <span class='currentPrice'>"
										+ jsonObj.list[i].auction_startprice
										+ "</span>원<br><span class='directPrice'>즉구가 "
										+ jsonObj.list[i].auction_directprice
										+ "원</span></div></a></td></tr>";
							}
							count++;

						}

						outValues1 += "</table></div>";
						outValues2 += "</table></div>";
						outValues3 += "</table></div>";
						if (count == 1) {
							$(".carousel-inner").html("등록된 경매가 없습니다.");
						} else if (count < 6) {
							$(".carousel-inner").html(outValues1);
						} else if (count < 10) {
							$(".carousel-inner").html(outValues1 + outValues2);
						} else {
							$(".carousel-inner").html(
									outValues1 + outValues2 + outValues3);
						}

					},
					error : function(request, status, errorData) {
						alert("error code : " + request.status + "\nmessage"
								+ request.responseText + "\nerror" + errorData);
					}
				});

		/* 홈에 신상품  리스트*/
		$
				.ajax({
					url : "homeNewMarketList.do",
					type : "post",
					dataType : "JSON",
					success : function(obj) {
						var objStr = JSON.stringify(obj);
						var jsonObj = JSON.parse(objStr);
						var outValues1 = "<div class='big_title'><h2 >신상품</h2></div><div class='box_border'>";
						var outValues2 = "<div class='big_title'><a href='marketList.do'><div class='seeMore'>더보기 ></div></a></div><div class='box_border1'>";

						outValues1 += "<a href='marketDetail.do?market_no="
								+ jsonObj.list[0].market_no
								+ "'><div class='box' style='background-image: url(\"/farm/resources/upload/marketUpload/"
								+ jsonObj.list[0].market_img
								+ "\");'></div>"
								+ "<div class='box_nametag'><div class='box_title'>"
								+ jsonObj.list[0].market_title + "</div>"
								+ "<div class='box_price'>"
								+ jsonObj.list[0].market_price
								+ "원</div></div></a></div>";

						outValues2 += "<a href='marketDetail.do?market_no="
								+ jsonObj.list[1].market_no
								+ "'><div class='box' style='background-image: url(\"/farm/resources/upload/marketUpload/"
								+ jsonObj.list[1].market_img
								+ "\");'></div>"
								+ "<div class='box_nametag'><div class='box_title'>"
								+ jsonObj.list[1].market_title + "</div>"
								+ "<div class='box_price'>"
								+ jsonObj.list[1].market_price
								+ "원</div></div></a></div>";

						$(".bigbox1").html(outValues1);
						$(".bigbox2").html(outValues2);

						$(function() {
							$('.flexslider').flexslider({
								animation : Modernizr.touch ? "slide" : "fade"
							});

							$(".tab_content").hide();
							$(".tab_content:first").show();

							$("ul.tabs li").click(
									function() {
										$("ul.tabs li").removeClass("active")
												.css("color", "#333");
										//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
										$(this).addClass("active").css("color",
												"darkred");
										$(".tab_content").hide()
										var activeTab = $(this).attr("rel");
										$("#" + activeTab).fadeIn()
									});
						});

					},
					error : function(request, status, errorData) {
						alert("error code : " + request.status + "\nmessage"
								+ request.responseText + "\nerror" + errorData);
					}
				});

		/* 홈에 메인사진(인기 리스트) */
		$
				.ajax({
					url : "homePopularMarketList.do",
					type : "post",
					dataType : "JSON",
					success : function(obj) {
						var objStr = JSON.stringify(obj);
						var jsonObj = JSON.parse(objStr);
						var outValues = "";

						for ( var i in jsonObj.list) {
							outValues += "<li><a href='marketDetail.do?market_no="
									+ jsonObj.list[i].market_no
									+ "'><img src='/farm/resources/upload/marketUpload/"+jsonObj.list[i].market_img+"'/><div class='pretty'>"
									+ "<div class='pmarketTitle'>"
									+ jsonObj.list[i].market_title
									+ "<div class='nmarketPrice'>"
									+ jsonObj.list[i].market_price
									+ "</div></div>" + "</div></a></li>";
						}

						$(".slides").html(outValues);

					},
					error : function(request, status, errorData) {
						alert("error code : " + request.status + "\nmessage"
								+ request.responseText + "\nerror" + errorData);
					}
				});

	});
	/*메인 시세 api  */
	window.onload = function() {

		$
				.ajax({
					url : '/farm/MainQuoteApi.do',
					type : 'post',
					dataType : 'json',
					success : function(data) {
						var jsonStr = JSON.stringify(data);
						var jsonData = JSON.parse(jsonStr);
						var myitem = jsonData.price
						console.log(myitem);
						var html = "";
						$.each(myitem, function(index, item) {

							html += "<td>" + item.category_name + "</td>";
							console.log(item.category_name)

						});
						$("").html(html);

					},
					error : function(request, status, errorData) {
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});

	}
</script>
</head>

<body>
	<div id="wrap">
		<c:import url="inc/header.jsp"></c:import>

		<div id="container">
			<div class="inner-wrap">


				<div class="main_visual">
					<div class="flexslider" style="direction: rtl; border: none;">
						<ul class="slides">
							<!-- <li><img src="/farm/resources/images/banana.jpg" />
							<div class="pretty">
							<div class="pmarketTitle">
					[영미네 농장] 신선한 바나나 한송이
					<div class="nmarketPrice">8,700원</div></div>
					</div></li>
							
							<li><img src="/farm/resources/images/apple.jpg" /></li>
							<li><img src="/farm/resources/images/blueberry.jpg" /></li>
							<li><img src="/farm/resources/images/jamong.jpg" /></li> -->
						</ul>

					</div>


				</div>
				<div class="tab_main">
					<ul class="tabs">
						<li class="active" rel="tab1">공지사항</li>
						<li rel="tab2">구매랭킹</li>
						<li rel="tab3">공지사항</li>
					</ul>
					<div class="tab_container">
						<div id="tab1" class="tab_content">
							<ul>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
							</ul>
						</div>
						<!-- #tab1 -->
						<div id="tab2" class="tab_content">2222Mortal Kombat returns
							after a lengthy hiatus and puts players back into the Tournament
							for 2D fighting with gruesome combat.</div>
						<!-- #tab2 -->
						<div id="tab3" class="tab_content"></div>
						<div class="con"></div>


					</div>
					<!-- #tab3 -->
				</div>
				<!-- .tab_container -->
				<!-- #container -->


			</div>


			<div class="bigbox1">
				<!-- <div class="big_title">
						<h2 >신상품</h2>
						
					</div>
				
					<div class="box_border">
						<div class="box"
							style="background-image: url('/farm/resources/images/1481854976669l0.jpg');"></div>

						<div class="box_nametag">
							<div class="box_title">[영미네 농장] 신선한 수박</div>

							<div class="box_price">10,500원</div>
						</div>
					</div> -->
			</div>


			<div class="bigbox2">
				<!-- <div class="big_title">
					<a href="marketList.do"><div class="seeMore">더보기 ></div></a>
					</div>
					<div class="box_border1">
						<div class="box"
							style="background-image: url('/farm/resources/images/1483669170519l0.jpg');"></div>
						<div class="box_nametag">
							<div class="box_title">[영미네 농장] 팜 후레쉬 부어스첸 2종</div>

							<div class="box_price">10,500원</div>
						</div>
					</div> -->
			</div>

			<div class="bigbox3">
				<div class="big_title2">
					<a href="AuctionList_controller.do"><div class="seeMore">더보기
							></div></a>
					<h2>경매</h2>

				</div>
				<div class="box_border2">
					<div class="box2">

						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<!-- <div class="item active" align="center">
										<table class="auction_table">
											<tr>

												<th>상품</th>
												<th>가격</th>
												
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/고구마.jpg');"></div>
													<div>유기농 고구마 1kg</div></td>
												<td>현재가  <span class="currentPrice">5,700</span>원<br><span class="directPrice">즉구가  7,000원</span></td>
												

											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/아산 맑은 토마토.jpg');"></div>
													<div>아산 맑은 토마토 1박스</div></td>
												<td>10,500원</td>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/아산 맑은 포도.jpg');"></div>
													<div>아산 맑은 포도</div></td>
												<td>10,500원</td>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/청주 사과.jpg');"></div>
													<div>청주 사과</div></td>
												<td>10,500원</td>
											</tr>


										</table>
									</div>

									<div class="item" align="center">
										<table class="auction_table">
											<tr>

												<th>상품</th>
												<th>판매가</th>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/고구마.jpg');"></div>
													<div>유기농 고구마 2kg</div></td>
												<td>5,700원</td>
												
												</td>

											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/아산 맑은 토마토.jpg');"></div>
													<div>아산 맑은 토마토 1박스</div></td>
												<td>10,500원</td>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/아산 맑은 포도.jpg');"></div>
													<div>아산 맑은 포도</div></td>
												<td>10,500원</td>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/청주 사과.jpg');"></div>
													<div>청주 사과</div></td>
												<td>10,500원</td>
											</tr>


										</table>
									</div>

									<div class="item" align="center">
										<table class="auction_table">
											<tr>

												<th>상품</th>
												<th>판매가</th>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/고구마.jpg');"></div>
													<div>유기농 고구마 3kg</div></td>
												<td>5,700원</td>
												<td style="color: red; font-weight: bold;">진<br>행<br>중
												</td>

											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/아산 맑은 토마토.jpg');"></div>
													<div>아산 맑은 토마토 1박스</div></td>
												<td>10,500원</td>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/아산 맑은 포도.jpg');"></div>
													<div>아산 맑은 포도</div></td>
												<td>10,500원</td>
											</tr>

											<tr>
												<td><div class="auction_img"
														style="background-image: url('/farm/resources/images/청주 사과.jpg');"></div>
													<div>청주 사과</div></td>
												<td>10,500원</td>
											</tr>
	

										</table>
									</div> -->
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>





	</div>

	<!-- 채팅,최근 본 상품 목록 import jsp ,  footer 위에서 하면됨 -->
	<c:import url="messenger/msg_box.jsp"></c:import>

	<div id="footer">
		<c:import url="inc/foot.jsp"></c:import>

	</div>


</body>

<script type="text/javascript"
	src="/farm/resources/js/jquery.flexslider.js"></script>

<script>
	
</script>
</html>
