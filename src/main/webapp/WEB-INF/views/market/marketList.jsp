<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<!-- 영미낭 --> 
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/marketList.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script>
	var count = 1;
</script>
<script type="text/javascript">
	function marketMake(){
		location.href="/farm/moveMarketMake.do";
	}
</script>
<script>

		function moreBtn(){
			count = count+1;
			$.ajax({
				url: "ajaxMoreMarket.do",
				type: "post",
				data : {page : count},
				dataType: "JSON",
				success: function(obj){
					var objStr = JSON.stringify(obj);
					var jsonObj = JSON.parse(objStr);
					//문자열 변수 준비
					var outValues = $(".market_box").html();
					for(var i in jsonObj.list){
						outValues += "<a href='marketDetail.do?market_no=" + jsonObj.list[i].market_no + "'>" +
								"<div class='market'><div class='img_box' style='background-image:url(\"/farm/resources/upload/marketUpload/"+ jsonObj.list[i].market_img+"\"); background-size: cover;'>"+
								"</div><div class='title_box'><p class='title'>"+jsonObj.list[i].market_title +
								"</p><p class='content'>"+jsonObj.list[i].market_note+"</p></div></div></a>";
					}
					$(".market_box").html(outValues);
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
	<div id="wrap">
			<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>

		<!-- account-wrap -->

	
		<div id="container">
        	<div class="inner-wrap"> 
        	<c:if test="${loginUser.member_category eq '0'}">
        		<button class="market_write" onclick="marketMake();">장터 등록</button>
        	</c:if>
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
        	<div class="market_box">
        	<c:forEach var="m" items="${list }">
        		<a href="marketDetail.do?market_no=${m.market_no }">
        		<div class="market"><div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/${m.market_img}'); background-size: cover;" ></div>
       			<div class="title_box"><p class="title">${m.market_title }</p> <p class="content">${m.market_note }</p></div></div>
       			</a>
        	</c:forEach>
        	</div>
       			<button class="more_market" onclick="moreBtn();">장터 더보기 ▼</button>
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