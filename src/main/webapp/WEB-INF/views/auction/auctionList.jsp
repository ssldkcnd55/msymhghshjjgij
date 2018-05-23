<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Auction</title>

<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/marketList.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/auctionList.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script>
	var count = 1;
</script>
<script type="text/javascript">
	
	function auction_write(){
		location.href="/farm/moveAcution_write.do";
	}
</script>
	
<script>
	function more_auction(){
		count = count+1;
		$.ajax({
			
			url: "moreAuctionList.do",
			type:"post",
			data: {page: count},
			dataType: "JSON",
			success: function(obj){
				console.log(obj);
				var objStr = JSON.stringify(obj);
				var jsonObj = JSON.parse(objStr);
				var outValues = $(".auction_box").html();
				for(var i in jsonObj.list){
					outValues += 
					"<a href='AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no +"'>"+
	       			"<div class='market'><div class='img_box' style='background-image: url(\"/farm/resources/upload/auctionUpload/"+jsonObj.list[i].auction_img+"\"); background-size: cover;'></div>"+
	       			"<div class='title_box'><p class='title' style='text-align:center;'>"+jsonObj.list[i].auction_title+"</p> <p class='content' style='text-align:center;'>"+jsonObj.list[i].auction_intro+"</p></div></div></a>"   
	       			
				}
				$(".auction_box").html(outValues);
				},error: function(request,status,errorData){
					alert("error code : " + request.status + "\nmessage" + 
							request.responseText + "\nerror" + errorData);
				}
		});
	}
	
</script>

</head>

<body>
	<c:set var="count" value="1"/>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/top_menu.jsp"%>
		</div>
		<!-- account-wrap -->

		<div id="container">
        	<div class="inner-wrap"> 
        	<!-- 경매 등록버튼 -->
        	<button class="auction_write" onclick="auction_write();">경매 등록</button>
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
        	
        	<!-- 경매 -->
        	<div class="right_box">
        	<div class="auction_box">
        	<c:forEach items="${list}" var="list" varStatus="status">
        	<a href="AuctionDetail.do?auction_no=${list.auction_no }">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/upload/auctionUpload/${list.auction_img}'); background-size: cover;" ></div>
       			<div class="title_box"><p class="title" style="text-align:center;">${list.auction_title}</p> <p class="content" style="text-align:center;">${list.auction_intro}</p></div></div>   
       		</a>
       		</c:forEach>    
      	    </div>
       			<button class="more_market" onclick="more_auction();">장터 더보기 ▼</button>
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