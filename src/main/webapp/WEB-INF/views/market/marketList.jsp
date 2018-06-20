<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/marketList.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script>
	var count = 1;
	var ctype = null;
	var cname = null;
	var sort = "market_no";
	
</script>
<script type="text/javascript">
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	function mainCategory(a){
		count = 1;
		ctype = a.value;
		cname = null;
		$.ajax({
			url: "ajaxMoreMarket.do",
			type: "post",
			data : {ctype : ctype,
				sort :sort,
				page : count
				<c:if test="${search != null}">
			,search : "${search}"
				</c:if>},
			dataType: "JSON",
			success: function(data){
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				var outValues = "";
				var values = "";
				var count = 0;
				for(var i in jsonObj.list){
					count++;
					outValues += "<a href='marketDetail.do?market_no=" + jsonObj.list[i].market_no + "'>" +
					"<div class='market'><div class='img_box' style='background-image:url(\"/farm/resources/upload/marketUpload/"+ jsonObj.list[i].market_img+"\"); background-size: cover;'>"+
					"</div><div class='title_box'><p class='title'>";
					if(jsonObj.list[i].market_amount - jsonObj.list[i].remaining > 0){
						outValues += jsonObj.list[i].market_title;
					}else{
						outValues += "[품절]"+jsonObj.list[i].market_title;
					}
					outValues +="</p><p class='content'>"+jsonObj.list[i].market_note+"</p><p class='content price'>"+numberWithCommas(jsonObj.list[i].market_price)+"원</p></div></div></a>";
				}
				if(count>0){
					$(".market_box").html(outValues);	
				}else{
					$(".market_box").html("<div style='line-height: 250px;text-align:center;font-size:15pt;font-weight: bold;color:gray;'>"+
			                   "등록된 작물이 없습니다.</div>");
				}
				
				for(var i in jsonObj.list2){
					if(jsonObj.list2[i].category_name!='더미'){
						values += "<input type='radio' value='"+jsonObj.list2[i].category_name+"' onclick='smallCategory(this);' name='SmallCategory'> "+jsonObj.list2[i].category_name+"<br><br>";
					}
				}
				if(ctype == ""){
					values+="대분류를 선택해주세요.<br><br>";
				}
				$(".SmallCategory").html(values);
			},error: function(request,status,errorData){
				console.log("error code : " + request.status + "\nmessage" + 
						request.responseText + "\nerror" + errorData);
			}
		});
	}
	function marketMake(){
		location.href="/farm/moveMarketMake.do";
	}
	function smallCategory(value){
		count = 1;
		cname = $(value).val();
		ctype = null;
		$.ajax({
			url: "ajaxMoreMarket.do",
			type: "post",
			data : {cname : cname,
				sort :sort,
				page : count
				<c:if test="${search != null}">
			,search : "${search}"
				</c:if>},
			dataType: "JSON",
			success: function(data){
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				var outValues = "";
				var values = "";
				var count = 0;
				for(var i in jsonObj.list){
					count++;
					outValues += "<a href='marketDetail.do?market_no=" + jsonObj.list[i].market_no + "'>" +
					"<div class='market'><div class='img_box' style='background-image:url(\"/farm/resources/upload/marketUpload/"+ jsonObj.list[i].market_img+"\"); background-size: cover;'>"+
					"</div><div class='title_box'><p class='title'>";
					if(jsonObj.list[i].market_amount - jsonObj.list[i].remaining > 0){
						outValues += jsonObj.list[i].market_title;
					}else{
						outValues += "[품절]"+jsonObj.list[i].market_title;
					}
					outValues +="</p><p class='content'>"+jsonObj.list[i].market_note+"</p><p class='content price'>"+numberWithCommas(jsonObj.list[i].market_price)+"원</p></div></div></a>";
				}
				if(count>0){
					$(".market_box").html(outValues);	
				}else{
					$(".market_box").html("<div style='line-height: 250px;text-align:center;font-size:15pt;font-weight: bold;color:gray;'>"+
			                   "등록된 작물이 없습니다.</div>");
				}
			},error: function(request,status,errorData){
				console.log("error code : " + request.status + "\nmessage" + 
						request.responseText + "\nerror" + errorData);
			}
		});
	}
	
	/* 카테고리처리 */
	$(function(){
		
		$.ajax({
			url:"ajaxCategory.do",
			type:"post",
			dataType:"JSON",
			success: function(data){
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				var outValues = "<input type='radio' onclick='mainCategory(this);' name='MainCategory' checked='checked' value=''> 전체보기 <br><br>";
			for(var i in jsonObj.list){
				outValues+= "<input type='radio' name='MainCategory' onclick='mainCategory(this);' value='"+jsonObj.list[i].category_main+"'> "+jsonObj.list[i].category_main+"<br><br>";
			}
			$(".MainCategory").html(outValues);	
			},error: function(request,status,errorData){
				console.log("error code : " + request.status + "\nmessage" + 
						request.responseText + "\nerror" + errorData);
			}
			
		});
		
		$("input[name='MainCategory']").click(function(){
			alert('11');
			count = 1;
			ctype = $(this).val();
			cname = null;
			$.ajax({
				url: "ajaxMoreMarket.do",
				type: "post",
				data : {ctype : ctype,
					sort :sort,
					page : count
					<c:if test="${search != null}">
				,search : "${search}"
					</c:if>},
				dataType: "JSON",
				success: function(data){
					var objStr = JSON.stringify(data);
					var jsonObj = JSON.parse(objStr);
					var outValues = "";
					var values = "";
					var count = 0;
					for(var i in jsonObj.list){
						count++;
						outValues += "<a href='marketDetail.do?market_no=" + jsonObj.list[i].market_no + "'>" +
						"<div class='market'><div class='img_box' style='background-image:url(\"/farm/resources/upload/marketUpload/"+ jsonObj.list[i].market_img+"\"); background-size: cover;'>"+
						"</div><div class='title_box'><p class='title'>";
						if(jsonObj.list[i].market_amount - jsonObj.list[i].remaining > 0){
							outValues += jsonObj.list[i].market_title;
						}else{
							outValues += "[품절]"+jsonObj.list[i].market_title;
						}
						outValues +="</p><p class='content'>"+jsonObj.list[i].market_note+"</p><p class='content price'>"+numberWithCommas(jsonObj.list[i].market_price)+"원</p></div></div></a>";
					}
					$(".market_box").html(outValues);
					for(var i in jsonObj.list2){
						if(jsonObj.list2[i].category_name != "더미") {
							values += "<input type='radio' value='"+jsonObj.list2[i].category_name+"' onclick='smallCategory(this);' name='SmallCategory'>"+jsonObj.list2[i].category_name+"<br><br>";
						}
					}
					if(ctype == ""){
						values+="대분류를 선택해주세요.<br><br>";
					}
					if(count>0){
						$(".SmallCategory").html(outValues);	
					}else{
						$(".SmallCategory").html("<div style='line-height: 250px;text-align:center;font-size:15pt;font-weight: bold;color:gray;'>"+
				                   "등록된 작물이 없습니다.</div>");
					}
					
					
				},error: function(request,status,errorData){
					console.log("error code : " + request.status + "\nmessage" + 
							request.responseText + "\nerror" + errorData);
				}
			});
			
			
		});
			
		$("input[name='sortRadio']").click(function(){
			count = 1;
			sort = $(this).val();
			
			$.ajax({
				url: "ajaxMoreMarket.do",
				type: "post",
				data : {sort : sort,
					page : count,
					ctype : ctype,
					cname : cname
					<c:if test="${search != null}">
				,search : "${search}"
					</c:if>},
				dataType: "JSON",
				success: function(data){
					var objStr = JSON.stringify(data);
					var jsonObj = JSON.parse(objStr);
					var outValues = "";
					var count = 0;
					for(var i in jsonObj.list){
						count++;
						outValues += "<a href='marketDetail.do?market_no=" + jsonObj.list[i].market_no + "'>" +
						"<div class='market'><div class='img_box' style='background-image:url(\"/farm/resources/upload/marketUpload/"+ jsonObj.list[i].market_img+"\"); background-size: cover;'>"+
						"</div><div class='title_box'><p class='title'>";
						if(jsonObj.list[i].market_amount - jsonObj.list[i].remaining > 0){
							outValues += jsonObj.list[i].market_title;
						}else{
							outValues += "[품절]"+jsonObj.list[i].market_title;
						}
						outValues +="</p><p class='content'>"+jsonObj.list[i].market_note+"</p><p class='content price'>"+numberWithCommas(jsonObj.list[i].market_price)+"원</p></div></div></a>";
					}
					if(count>0){
						$(".market_box").html(outValues);	
					}else{
						$(".market_box").html("<div style='line-height: 250px;text-align:center;font-size:15pt;font-weight: bold;color:gray;'>"+
				                   "등록된 작물이 없습니다.</div>");
					}
				},error: function(request,status,errorData){
					console.log("error code : " + request.status + "\nmessage" + 
							request.responseText + "\nerror" + errorData);
				}
			});
		});
		
		
	});
</script>
<script>
		function moreBtn(){
			count = count+1;
			$.ajax({
				url: "ajaxMoreMarket.do",
				type: "post",
				data : {page : count
						,ctype : ctype
						,cname : cname
						,sort : sort
					<c:if test="${search != null}">
				,search : "${search}"
					</c:if>},
				dataType: "JSON",
				success: function(obj){
					var objStr = JSON.stringify(obj);
					var jsonObj = JSON.parse(objStr);
					//문자열 변수 준비
					var outValues = $(".market_box").html();
					var count = 0;
					for(var i in jsonObj.list){
						count++;
						outValues += "<a href='marketDetail.do?market_no=" + jsonObj.list[i].market_no + "'>" +
								"<div class='market'><div class='img_box' style='background-image:url(\"/farm/resources/upload/marketUpload/"+ jsonObj.list[i].market_img+"\"); background-size: cover;'>"+
								"</div><div class='title_box'><p class='title'>";
						if(jsonObj.list[i].market_amount - jsonObj.list[i].remaining > 0){
							outValues += jsonObj.list[i].market_title;
						}else{
							outValues += "[품절]"+jsonObj.list[i].market_title;
						}
						outValues +="</p><p class='content'>"+jsonObj.list[i].market_note+"</p><p class='content price'>"+numberWithCommas(jsonObj.list[i].market_price)+"원</p></div></div></a>";
					}
					if(count>0){
						$(".market_box").html(outValues);	
					}else{
						/* $(".market_box").html("<div style='line-height: 250px;text-align:center;font-size:15pt;font-weight: bold;color:gray;'>"+
				                   "등록된 작물이 없습니다.</div>");*/
				          $('.more_market').attr('disabled', false);

				               
					} 
				},error: function(request,status,errorData){
					alert("error code : " + request.status + "\nmessage" + 
							request.responseText + "\nerror" + errorData);
				}
			});
		}
		
		
		
</script>
</head>
<body>
	<c:set var="count" value="1" />
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
						<input type="radio" name="sortRadio" checked="checked" value="market_no"> 최신순<br>
						<br> <input type="radio" name="sortRadio" value="buy"> 인기순 <br>
						<br> <input type="radio" name="sortRadio" value="market_price"> 가격순<br>

					</div>


					<!-- 카테고리 메뉴바 -->
					<div class="category_menu">
						<h4>대분류</h4>
					<div class="MainCategory">
						
							<!-- <input type="radio" name="MainCategory" value="채소류"> 채소류<br>
							<br> <input type="radio" name="MainCategory" value="과일류">
							과일류<br>
							<br> <input type="radio" name="MainCategory" value="곡식류">
							곡식류<br>
							<br> -->
				
						</div>
						<hr style="border: 0.5px solid #dddddd;">

						<h4>소분류</h4>
						<div class="SmallCategory">
							<p class="categoryP">대분류를 선택해주세요</p>
							<!-- <input type="radio" name="smallCategory"> 카테고리1<br><br>
	        	<input type="radio" name="smallCategory"> 카테고리2<br><br>
	        	<input type="radio" name="smallCategory"> 카테고리3<br><br>
	        	<input type="radio" name="smallCategory"> 카테고리4<br><br>
	        	<input type="radio" name="smallCategory"> 카테고리5<br><br> -->
						</div>
					</div>

				</div>
				<!-- 장터 -->
				<div class="right_box">
					<div class="market_box">
						<c:forEach var="m" items="${list }">
							<a href="marketDetail.do?market_no=${m.market_no }">
								<div class="market">
									<div class="img_box"
										style="background-image: url('/farm/resources/upload/marketUpload/${m.market_img}'); background-size: cover;"></div>
									<div class="title_box">
									<c:if test="${m.market_amount - m.remaining > 0}">
										<p class="title">${m.market_title }</p>
									</c:if>
									<c:if test="${m.market_amount - m.remaining <= 0}">
										<p class="title">[품절]${m.market_title }</p>
									</c:if>
										<p class="content">${m.market_note }</p>
										<p class='content'><fmt:formatNumber value="${m.market_price }" pattern="#,###" />원</p>
									</div>
								</div>
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