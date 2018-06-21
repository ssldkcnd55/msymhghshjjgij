
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

<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/modernizr.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/home.js"></script>
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
						<li class="active" rel="tab2">구인구직</li>
						<li rel="tab3">시세정보</li>
					</ul>
					<div class="tab_container">
						<!-- <div id="tab1" class="tab_content">
							<ul>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
								<li><a href="#">이것은 두 번째 탭의</a></li>
							</ul>
						</div> -->
						<!-- #tab1 -->
						<div id="tab2" class="tab_content"><table class="table2"></table><button class="button2" onclick="movejob()">더보기</button></div>
						<!-- #tab2 -->
						<div id="tab3" class="tab_content">
							<button class="button" onclick="movequote()">상세정보</button>
							<div id="myCarouselquote" class="carousel slide quote"
								data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li data-target="#myCarouselquote" data-slide-to="0" class="active">
									</li>
									<li data-target="#myCarouselquote" data-slide-to="1"></li>
									<li data-target="#myCarouselquote" data-slide-to="2"></li>
								</ol>

								<!-- Wrapper for slides -->
								<div class="carousel-inner quote"></div>

								<!-- Left and right controls -->
								<a class="left carousel-control" href="#myCarouselquote"
									data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#myCarouselquote"
									data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span> <span
									class="sr-only">Next</span>
								</a>
							</div>



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
								<div class="carousel-inner auction">
								
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