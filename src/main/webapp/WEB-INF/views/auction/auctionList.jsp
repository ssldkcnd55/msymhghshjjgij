<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	$(function(){
		$.ajax({
			url :"ajaxAuctionList.do",
			type : "POST",
			data :{
				page : 1
			},
			dataType: "JSON",
			success: function(data){
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				
				var outValues="";
				
				for(var i in jsonObj.list){
					outValues +=
						"<a href='AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no +"'>"+
		       			"<div class='market'><div class='img_box' style='background-image: url(\"/farm/resources/upload/auctionUpload/"+jsonObj.list[i].auction_img+"\"); background-size: cover;'></div>"+
		       			"<div class='title_box'><p class='title' style='text-align:center;'>"+jsonObj.list[i].auction_title+"</p> <p class='content' style='text-align:center;'>"+jsonObj.list[i].auction_note+"</p></div> "+
		       			"</div></a>";
		       			
				}
				$(".auction_box").html(outValues);
				
			},error: function(request,status,errorData){
				alert("error code : " + request.status + "\nmessage" + 
						request.responseText + "\nerror" + errorData);
			}
			
		});
	});
	

	function more_auction(){
		count = count+1;
		$.ajax({
			url: "moreAuctionList.do",
			type:"post",
			data: {
				page: count
			},
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
	       			"<div class='title_box'><p class='title' style='text-align:center;'>"+jsonObj.list[i].auction_title+"</p> <p class='content' style='text-align:center;'>"+jsonObj.list[i].auction_note+"</p></div> "+
	       			"</div></a>" ;
				}
				$(".auction_box").html(outValues);
				
				},error: function(request,status,errorData){
					alert("error code : " + request.status + "\nmessage" + 
							request.responseText + "\nerror" + errorData);
				}
		});
	}

	//경매 카테고리
	$(function(){
	$("input[name='check']").click(function(){
	var type = $(this).val();	
	/* alert("type : "+type); */
	$.ajax({
		url :"left_boxChangeList.do",
		type:"post",
		data: {
			type:type,
			page:1
		},
		dataType: "JSON",
		success: function(data) {
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			var select = jsonObj.list[0].type; 
			/* alert("select : "+select); */
			var outValues ="";
			
			if(jsonObj.list.length != 0 ){
				for(var i in jsonObj.list){
				console.log(jsonObj.list[i].type);
				 outValues += 
				"<a href='AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no +"'>"+
       			"<div class='market'><div class='img_box' style='background-image: url(\"/farm/resources/upload/auctionUpload/"+jsonObj.list[i].auction_img+"\"); background-size: cover;'></div>"+
       			"<div class='title_box'><p class='title' style='text-align:center;'>"+jsonObj.list[i].auction_title+"</p> <p class='content' style='text-align:center;'>"+jsonObj.list[i].auction_note+"</p></div> "+
       			"</div></a>";
				}
				$(".auction_box").html(outValues);
			}else{
				alert("선택된 항목의 결과가 없습니다.");
			}
				
			
			$(".more_remove").html();
				outValues =
					"</div>"+
   					"<button class='more_market'  onclick='more_auctionCategory("+select+");' style='background-color:#A17977;margin-bottom:20px;''>경매 더보기 ▼</button>"+
   					"</div>";
			$(".more_remove").html(outValues);
			
			
			},error: function(request,status,errorData){
			alert("error code : " + request.status + "\nmessage" + 
					request.responseText + "\nerror" + errorData);
				}
			
		});
	});
});
	
//경매 카테고리 more 버튼
	
	function more_auctionCategory(select){
	count = count+1;
	/* alert("타입 : "+select); */
	$.ajax({
		url: "moreAuctionCategory.do",
		type:"post",
		data: {
			page: count,
			atype:select
		},
		dataType: "JSON",
		success: function(obj){
			
			console.log(obj);
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			
			if(jsonObj.list.lenght != 0){
				
			var outValues = $(".auction_box").html();
			for(var i in jsonObj.list){
			outValues+=
				"<a href='AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no+"'>"+
       			"<div class='market'><div class='img_box' style='background-image: url(\"/farm/resources/upload/auctionUpload/"+jsonObj.list[i].auction_img+"\"); background-size: cover;'></div>"+
       			"<div class='title_box'><p class='title' style='text-align:center;'>"+jsonObj.list[i].auction_title+"</p> <p class='content' style='text-align:center;'>"+jsonObj.list[i].auction_note+"</p></div> "+
       			"</div></a>";
			}
			$(".auction_box").html(outValues);
			}else{
				alert("결과가 없습니다.");
				
			}
		
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
			<%@  include file="../inc/header.jsp"%>
		</div>
		<!-- account-wrap -->

		<div id="container">
        	<div class="inner-wrap"> 
        	<!-- 경매 등록버튼 -->
        	<c:if test="${loginUser.member_category eq '0'}">
        	<button class="auction_write" onclick="auction_write();">경매등록</button>
        	</c:if>
        	<div class="left_box">
        	
        	<!-- 정렬 메뉴바 -->
        	<div class="sort" style="height:auto;padding-bottom:15px;" id="select_val">
	        	<h4>정렬</h4>
	        	<input type="radio"  name="check" value="3"   value="auction_no"> 최신순<br><br>
	        	<input type="radio"  name="check" value="0"> 경매 대기<br><br>
	        	<input type="radio" name="check" value="1"> 경매 중<br><br>
	        	<input type="radio" name="check" value="2"> 경매 마감<br>
        	</div>
        	
        	<!-- 카테고리 메뉴바 -->
        	<!-- <div class="category_menu" >
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
        	</div> -->
        	
        	</div>
        	
        	<!-- 경매 -->
        	<div class="right_box">
        	<div class="auction_box">
        	<%-- <c:forEach items="${list}" var="list" varStatus="status">
        	<a href="AuctionDetail.do?auction_no=${list.auction_no }">
       			<div class="market"><div class="img_box" style="background-image: url('/farm/resources/upload/auctionUpload/${list.auction_img}'); background-size: cover;" ></div>
       			<div class="title_box"><p class="title" style="text-align:center;">${list.auction_title}</p> <p class="content" style="text-align:center;">${list.auction_note}</p></div>
       			</div>   
       		</a>
       		</c:forEach>   --%> 
      	    </div>
      	    <div class="more_remove">
       			<button class="more_market" onclick="more_auction();" style="background-color:#A17977;margin-bottom:20px;">경매 더보기 ▼</button>
       		</div>
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