<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 영미낭 --> 
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/marketList.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>

</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
			<div id="header">
			<%@  include file="../inc/top_menu.jsp"%>
		</div>

		<!-- account-wrap -->

	
		<div id="container">
        	<div class="inner-wrap"> 
        	<div class="left_box">
        	
        	<!-- 정렬 메뉴바 -->
        	<div class="sort">
        	<h4>정렬</h4>
        	<input type="checkbox" > 최신순<br><br>
        	<input type="checkbox" > 마감임박순<br><br>
        	<input type="checkbox" > 가격순<br>
        	
        	</div>
        	
        	
        	<!-- 카테고리 메뉴바 -->
        	<div class="category_menu" >
        	<h4>카테고리</h4>
        	<input type="checkbox" > 카테고리1<br><br>
        	<input type="checkbox" > 카테고리2<br><br>
        	<input type="checkbox" > 카테고리3<br><br>
        	<hr style="color:#bdbdbd">
        	
        	<h4>카테고리</h4>
        	<input type="checkbox" > 카테고리1<br><br>
        	<input type="checkbox" > 카테고리2<br><br>
        	<input type="checkbox" > 카테고리3<br><br>
        	<input type="checkbox" > 카테고리4<br><br>
        	<input type="checkbox" > 카테고리5<br><br>
        	
        	</div>
        	
        	</div>
        	
        	
        	<!-- 장터 -->
        	<div class="right_box">
        	<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/jamong.jpg'); background-size: cover;" ></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>   
       			    	</a>	
       			    	
       			    	<a href="moveMarketDetail.do">	
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/bean.jpg'); background-size: cover;" ></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			</a>
       			<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/duroop.jpg'); background-size: cover;"></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			</a>
       			<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/banana.jpg'); background-size: cover;"></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			       			</a>
       			       			<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/rice.jpg'); background-size: cover;"></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			</a>
       			<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/pepper.jpg'); background-size: cover;"></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			</a>
       			<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/jamong.jpg'); background-size: cover;"></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			       			</a>
       			       			<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/images/jamong.jpg'); background-size: cover;"></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			</a>
       			<a href="moveMarketDetail.do">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/images/jamong.jpg'); background-size: cover;"></div>
       			<div class="title_box"><p class="title">플로리다 자몽</p> <p class="content">자몽속이 꽉찬 자몽을 더욱 합리적인 가격에!</p></div></div>
       			</a>
       			<button class="more_market">장터 더보기 ▼</button>
       		</div>	
       			
       			
 			 </div>
        </div>
		

		<!-- //account-wrap -->
		 <%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
</body>
</html>