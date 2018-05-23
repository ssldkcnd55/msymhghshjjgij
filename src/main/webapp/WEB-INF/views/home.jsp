<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>Farm</title>
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



</head>

<body>

	<div id="top_line"></div>
	<div id="wrap">
		<c:import url="inc/top_menu.jsp"></c:import>

		<div id="container">
			<div class="inner-wrap">
				<div class="main_visual">
					<div class="flexslider" style="direction: rtl;border:none;">
						<ul class="slides">
							<li><img src="/farm/resources/images/banana.jpg" /></li>
							<li><img src="/farm/resources/images/apple.jpg" /></li>
							<li><img src="/farm/resources/images/blueberry.jpg" /></li>
							<li><img src="/farm/resources/images/jamong.jpg" /></li>
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
							<div id="tab2" class="tab_content">2222Mortal Kombat
								returns after a lengthy hiatus and puts players back into the
								Tournament for 2D fighting with gruesome combat.</div>
							<!-- #tab2 -->
							<div id="tab3" class="tab_content">3333Halo: Reach is the
								culmination of the superlative combat, sensational multiplayer,
								and seamless online integration that are the hallmarks of this
								superb series.</div>
							<!-- #tab3 -->
						</div>
						<!-- .tab_container -->
					<!-- #container -->


				</div>
				<div class="box"></div>
				<div class="box"></div>
				<div class="box2"></div>
			</div>

		</div>

		<!-- 채팅,최근 본 상품 목록 import jsp ,  footer 위에서 하면됨 -->
		<c:import url="messenger/msg_box.jsp"></c:import>

		<div id="footer">
			<c:import url="inc/foot.jsp"></c:import>

		</div>
	</div>

</body>
<script type="text/javascript"
	src="/farm/resources/js/jquery.flexslider.js"></script>

<script>
	$(function() {
		$('.flexslider').flexslider({
		/*  animation: "slide",
		 rtl: true */
		});
	});
	$(function () {

	    $(".tab_content").hide();
	    $(".tab_content:first").show();

	    $("ul.tabs li").click(function () {
	        $("ul.tabs li").removeClass("active").css("color", "#333");
	        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
	        $(this).addClass("active").css("color", "darkred");
	        $(".tab_content").hide()
	        var activeTab = $(this).attr("rel");
	        $("#" + activeTab).fadeIn()
	    });
	});
</script>
</html>
