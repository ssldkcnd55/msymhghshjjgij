<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/bottommovemenu.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/qna.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/dailyList.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/marketDetail.css" rel="stylesheet" type="text/css" />
<!-- <link href="/farm/resources/css/auctionDetail.css" rel="stylesheet" type="text/css" /> -->
<link href="/farm/resources/css/marketDetail_modal.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/homeauction.css" rel="stylesheet" type="text/css" />

<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/tabMove.js"></script>
<script type="text/javascript" src="/farm/resources/js/marketDetail.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(function(){
	$('.goods-view-show-option-button').click(function(){
		if($('#flow-cart2').css('display') == 'none'){
			$('#flow-cart2').css('display','block');
		}else{
			$('#flow-cart2').css('display','none');
		}
    });
	$(".spanA").html(numberWithCommas(${market.market_price}));
	$('.flow_order_total_price').html(numberWithCommas(${market.market_price}));
	
});

</script>
<script type="text/javascript">
var change = 0;
var m_img = '${market.market_img}';

 
$(function(){
	$.ajax({
		url:"sellerMarketList.do",
		type:"post",
		data:{
			member_id:'${market.member_id}'
		},
		dataType: "JSON",
		success: function(data){
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "";
			jsonObj.list[i]
			for(var i in jsonObj.list){
				if(i == 0){
					outValues += "<div class='item active' align='center'>";
				}else if(i % 4 == 0){
					outValues += "<div class='item' align='center'>";
				}
				outValues += "<div class='margindiv'><a class='sellerLink' href='marketDetail.do?market_no="+jsonObj.list[i].market_no+"'><div class='sellerMarketList'><div class='img_box' style='background-image: url(\"/farm/resources/upload/marketUpload/"+jsonObj.list[i].market_img+"\"); background-size: cover;'></div>"
							+ "<div class='title_box'><p class='title'>"+jsonObj.list[i].market_title+"</p>"
							+ "<p class='content'>"+jsonObj.list[i].market_note+"</p><p class='content pr'>"+numberWithCommas(jsonObj.list[i].market_price)+"원</p></div></div></a></div>";
				
				if(i % 4 == 3){
					outValues += "</div>";
				}else if(i == Object.keys(jsonObj.list).length){
					outValues += "</div>";
				}
			}
			$(".carousel-inner").html(outValues);
			
		},error: function(request,status,errorData){
            alert("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData);
        }
	});
});


/* $(function(){
	$.ajax({
		url:"qnaList.do",
		type:"post",
		data:{market_no:${market.market_no}},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>날짜</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].market_qna_no+"</td>"
				+"<td id='QnA_td'><a href='#'>"+jsonObj.list[i].market_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].market_qna_question_date+"</td></tr>";
			}
			$(".QnA_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:qnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:qnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:qnaPage("+(endPage+1)+")'>&raquo;</a>";
				
			}else{
				values+="<a>&raquo;</a>";
			}
			$(".pagination").html(values);
		
			
		},error: function(request,status,errorData){
            alert("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData);
           }
	});
}); */
function dailyMake(){
	location.href="dailyMakeMove.do?market_no=${market.market_no}";
}
function qnaPage(page){
	$.ajax({
		url:"qnaList.do",
		type:"post",
		data:{
			market_no: ${market.market_no},
			page:page
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>날짜</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='QnA_td'><a href='/farm/marketQnaDetail.do?qna_no="+jsonObj.list[i].market_qna_no+"&member_id=${market.member_id}'>"+jsonObj.list[i].market_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].market_qna_question_date+"</td></tr>";
			}
			$(".QnA_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:qnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:qnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:qnaPage("+(endPage+1)+")'>&raquo;</a>";
				
			}else{
				values+="<a>&raquo;</a>";
			}
			$(".pagination").html(values);
		
			
		},error: function(request,status,errorData){
            alert("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData);
           }
	});
}

function qnaMake(){
	location.href ="/farm/MarketQnaMakeMove.do?market_no=${market.market_no}";
}

function writeReview(){
	location.href ="/farm/writeReviewMove.do?market_no=${market.market_no}";
}

function reviewPage(page){
	$.ajax({
		url:"reviewList.do",
		type:"post",
		data:{
			market_no:${market.market_no},
			Rpage:page 
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>날짜</th></tr>";
			
			 
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='QnA_td'><a href='reviewDeatil.do?review_no="+jsonObj.list[i].review_no+"&market_no=${market.market_no}'>"+jsonObj.list[i].review_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].review_date+"</td></tr>";
			}
			$(".review_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:reviewPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:reviewPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:reviewPage("+(endPage+1)+")'>&raquo;</a>";
				
			}else{
				values+="<a>&raquo;</a>";
			}
			$(".review_pagination").html(values);
		
			
		},error: function(request,status,errorData){
            alert("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData);
           }
	});
}
function dailyPage(){
	$.ajax({
		url:"dailyList.do",
		type:"post",
		data:{
			market_no:${market.market_no},
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><td class='history_start' colspan='3' align='center'>"
				+"<table class='history_title'><tr><td class='start_date' align='center'>농사시작일자</td></tr>"
				+"<tr><td class='start_date' align='center'>2018/01/01</td></tr></table></td></tr>"
				+"<tr><td class='space_left'></td><td></td></tr>";
			
			for(var i in jsonObj.list){
				if(i % 2 == 0){
					outValues += "<tr><td class='space_right'></td><td class='history_right' align='left'>"
						+"<table class='history_right_table' cellspacing='0' cellpadding='0'>"
						+"<tbody><tr><td class='history_right_table_td1' rowspan='3'></td>"
						+"<td class='history_right_table_td2' align='left' valign='top'>"
						+"<span class='history_right_table_span1'>"+jsonObj.list[i].daily_date+"</span>"
						+"</td></tr><tr><td align='left' class='hi_title'>"+jsonObj.list[i].daily_title+"</td></tr>"
						+"<tr><td align='left' class='hi_content_right'><a class='aTag' href='marketDailyDetail.do?daily_no="+jsonObj.list[i].daily_no+"&market_no=${market.market_no}'><div class='dailyContent left'>"+jsonObj.list[i].daily_contents
						+"<span class='more'>...더보기</span></div></a></td></tr></tbody></table></td></tr>";
				}else{
					outValues += "<tr><td valign='top' class='history_right' align='right'>"
						+"<table class='history_right_table' cellspacing='0' cellpadding='0'>"
						+"<tbody><tr><td align='right' class='hi_date' valign='top'><span class='history_right_table_span1'>"+jsonObj.list[i].daily_date+"</span></td>"
						+"<td rowspan='3' class='history_right_table_td1' ></td>"
						+"</tr><tr><td align='right' class='hi_title'>"+jsonObj.list[i].daily_title+"</td></tr>"
						+"<tr><td align='right' class='hi_content_right'><a class='aTag' href='marketDailyDetail.do?daily_no="+jsonObj.list[i].daily_no+"&market_no=${market.market_no}'><div class='dailyContent right'>"+jsonObj.list[i].daily_contents
						+"<span class='more'>...더보기</span></div></a></td></tr></tbody></table></td><td class='space_right2'></tr>";
				}
			}

			outValues += "<tr><td class='space_left'></td><td></td></tr><tr><td colspan='3' align='center'>"
				+"<table class='history_title' cellspacing='0'><tr><td class='start_date' align='center'>농사끝일자</td>"
				+"</tr><tr><td class='start_date' align='center'>2018/01/01</td></tr></table></td></tr><tr><td height='100'></td></tr>";
			$(".history_body").html(outValues);	

		},error: function(request,status,errorData){
            alert("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData);
        }
	});
}

function changeprice(){
	 change = ${market.market_price} * $("input[name='buy_amount']").val();
	 $(".flow_order_total_price").html(change+"원");
	  var amount = ${market.market_amount}-${market.remaining};
	 
	 if(amount < $("input[name='buy_amount']").val()){
		$("input[name='buy_amount']").val(amount);
		 alert("수량을 초과하였습니다.");
	 } 
			
}
</script>
<title>Farm</title>
</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<!-- account-wrap -->

		<div id="container">
			<div class="inner-wrap">
				<div class="mainTitle_box">
					<span class="mainTitle">${market.market_title }</span> &nbsp; <span
						class="release_date">출고예정일</span>&nbsp;<span class="date">${market.market_releasedate }</span>
				</div>
				<div class="mainImg_box"
					style="background-image: url('/farm/resources/upload/marketUpload/${market.market_img}'); background-size:cover;">

				</div>
				<div class="mainTitle_box">
					<div
						style="border-bottom: 1px solid #bdbdbd; padding-bottom: 20px;">
						<span class="mainTitle">${market.market_title }</span> &nbsp; <span
							class="release_date">출고예정일</span>&nbsp;<span class="date">${market.market_releasedate }</span>
					</div>
				</div>
				<div class="test">
					<p class="note_content">자연의 힘으로 길러낸 유기 농산물은 기후에 영향을 많이 받습니다. 예를
						들어 같은 파프리카라 하더라도 한기물과 한여름에 맞는 최고의 산지가 따로 있지요. 컬리는 1년 내내 전국을 뒤져
						최고만을 전해 드립니다.</p>
				</div>
				
				<div class="mainTitle_box"><div class="mainTitle">판매자의 다른 상품</div></div>
				
				<div style="width: 100%; height: 300px;margin-top:20px">
					<div id="myCarousel" class="carousel slide se" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner auction">
							<!-- <div class='item active' align='center'>
								<div class='sellerMarketList'>
									<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/apple.jpg'); background-size: cover;"></div>
									<div class="title_box">
										<p class="title">토마토를 팔아보까여</p>
										<p class="content">소개소개소개소개쇄쇄소새ㅗ개괘쇄쇄고새ㅙ괘쇄소새괘괘소새ㅙ</p>
										<p class="content">1000원</p>
									</div>
								</div>
								<div class='sellerMarketList'>
									<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/apple.jpg'); background-size: cover;"></div>
									<div class="title_box">
										<p class="title">토마토를 팔아보까여</p>
										<p class="content">소개소개소개소개쇄쇄소새ㅗ개괘쇄쇄고새ㅙ괘쇄소새괘괘소새ㅙ</p>
										<p class="content">1000원</p>
									</div>
								</div>
								<div class='sellerMarketList'>
									<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/apple.jpg'); background-size: cover;"></div>
									<div class="title_box">
										<p class="title">토마토를 팔아보까여</p>
										<p class="content">소개소개소개소개쇄쇄소새ㅗ개괘쇄쇄고새ㅙ괘쇄소새괘괘소새ㅙ</p>
										<p class="content">1000원</p>
									</div>
								</div>
								<div class='sellerMarketList'>
									<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/apple.jpg'); background-size: cover;"></div>
									<div class="title_box">
										<p class="title">토마토를 팔아보까여</p>
										<p class="content">소개소개소개소개쇄쇄소새ㅗ개괘쇄쇄고새ㅙ괘쇄소새괘괘소새ㅙ</p>
										<p class="content">1000원</p>
									</div>
								</div>
							</div>
							<div class='item' align='center'>
								<div class='sellerMarketList'>
									<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/apple.jpg'); background-size: cover;"></div>
									<div class="title_box">
										<p class="title">토마토를 팔아보까여</p>
										<p class="content">소개소개소개소개쇄쇄소새ㅗ개괘쇄쇄고새ㅙ괘쇄소새괘괘소새ㅙ</p>
										<p class="content">1000원</p>
									</div>
								</div>
								<div class='sellerMarketList'>
									<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/apple.jpg'); background-size: cover;"></div>
									<div class="title_box">
										<p class="title">토마토를 팔아보까여</p>
										<p class="content">소개소개소개소개쇄쇄소새ㅗ개괘쇄쇄고새ㅙ괘쇄소새괘괘소새ㅙ</p>
										<p class="content">1000원</p>
									</div>
								</div>
								<div class='sellerMarketList'></div>
								<div class='sellerMarketList'></div>
							</div>
							<div class='item' align='center'>
								<div class='sellerMarketList'>
									<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/apple.jpg'); background-size: cover;"></div>
									<div class="title_box">
										<p class="title">토마토를 팔아보까여</p>
										<p class="content">소개소개소개소개쇄쇄소새ㅗ개괘쇄쇄고새ㅙ괘쇄소새괘괘소새ㅙ</p>
										<p class="content">1000원</p>
									</div>
								</div>
								<div class='sellerMarketList'></div>
								<div class='sellerMarketList'></div>
								<div class='sellerMarketList'></div>
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
				<%-- <div class="note">
       				<center>
       				
       				<div class="note_img" style="background-image: url('/farm/resources/images/gift.png'); background-size: cover;"></div>
       				</center>
       				<p class="note_title">제주도부터 강원도까지,<br>
       				최고의 산지에서 난 농산물만을<br>
       				전해 드립니다.</p>
       				<p class="note_content">
       				자연의 힘으로 길러낸 유기 농산물은<br>
       				기후에 영향을 많이 받습니다. 예를 들어<br>
       				같은 파프리카라 하더라도 한기물과<br>
       				한여름에 맞는 최고의 산지가 따로<br>
       				있지요. 컬리는 1년 내내 전국을 뒤져<br>
       				최고만을 전해 드립니다.</p>
       			</div>
       			<div class="note">
       			<center>
       				<div class="note_img" style="background-image: url('/farm/resources/images/contract.png'); background-size: cover;"></div>
       				</center>
       				<p class="note_title">직영 혹은 농가와의<br>
       				계약재배를 통해 철저한 품질<br>
       				관리가 가능합니다.</p>
       				<p class="note_content">
       				자연의 힘으로 길러낸 유기 농산물은<br>
       				기후에 영향을 많이 받습니다. 예를 들어<br>
       				같은 파프리카라 하더라도 한기물과<br>
       				한여름에 맞는 최고의 산지가 따로<br>
       				있지요. 컬리는 1년 내내 전국을 뒤져<br>
       				최고만을 전해 드립니다.</p>
       			</div>
       			<div class="note">
       			<center>
       				<div class="note_img" style="background-image: url('/farm/resources/images/delivery.png'); background-size: cover;"></div>
       				</center>
       				<p class="note_title">국내 온라인 업체 최초로 식품 전용<br>
       				자체 물류 창고와 냉장 차량을<br>
       				이용해 더 신선 합니다.</p>
       				<p class="note_content">
       				자연의 힘으로 길러낸 유기 농산물은<br>
       				기후에 영향을 많이 받습니다. 예를 들어<br>
       				같은 파프리카라 하더라도 한기물과<br>
       				한여름에 맞는 최고의 산지가 따로<br>
       				있지요. 컬리는 1년 내내 전국을 뒤져<br>
       				최고만을 전해 드립니다.</p>
       			</div> --%>
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1"><div
							class="menu introduce">소개</div></li>
					<li class="tab-link" data-tab="tab-2"><div class="menu daily"
							onclick="dailyPage();">일지</div></li>
					<li class="tab-link" data-tab="tab-3"><div
							class="menu question" onclick="qnaPage(1);">문의</div></li>
					<li class="tab-link" data-tab="tab-4"><div id="menu"
							class="menu review" onclick="reviewPage(1);">후기</div></li>
				</ul>
				<!-- <div class="menu introduce">소개</div>
	       		<div class="menu daily">일지</div>
	       		<div class="menu question">문의</div>
	       		<div id="menu" class="menu review">후기</div> -->

				<!-- introduce_box -->
				<div id="tab-1" class="tab-content current">
					<div class="introduce_box">${market.market_intro }</div>
				</div>
				<!-- introduce_box -->

				<!-- Daily box -->
				<div id="tab-2" class="tab-content">
					<div class="daily_box">
						<c:if test="${loginUser.member_id eq market.member_id}">
							<button class="dailyMakeBtn" onclick="dailyMake()">일지쓰기</button>
						</c:if>
						<table class="history_body">

						</table>
						<!-- 농사일지 끝 -->

					</div>
				</div>
				<!-- Daily box -->

				<!-- qna_Box -->
				<div id="tab-3" class="tab-content">
					<button class="dailyMakeBtn" onclick="qnaMake();">QnA 등록</button>
					<div class="qna_box">

						<table class="QnA_table">

						</table>

						<!-- 하단 페이징, 검색 묶음 -->
						<div id="bottom">

							<!-- 페이징 처리 -->
							<div class="pagination"></div>

							<!-- 검색 -->
							<div class="search_box">
								<span class='green_window'> <input type='text'
									class='input_text' />
								</span>
								<button type='submit' class='sch_smit'>검색</button>
							</div>
						</div>
					</div>
				</div>
				<!-- qna Box -->

				<div id="tab-4" class="tab-content">
					<button class="dailyMakeBtn" onclick="writeReview();">후기
						쓰기</button>
					<div class="qna_box">

						<table class="review_table">

						</table>

						<!-- 하단 페이징, 검색 묶음 -->
						<div id="bottom">

							<!-- 페이징 처리 -->
							<div class="review_pagination"></div>

							<!-- 검색 -->
							<div class="search_box">
								<span class='green_window'> <input type='text'
									class='input_text' />
								</span>
								<button type='submit' class='sch_smit'>검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- account-wrap -->
		<%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
	
	<%-- <div class="goods-view-flow-cart __active" id="flow-cart">
		<div class="goods-view-flow-cart-wrapper">
			<button type="button" id="show-option-button"
				class="goods-view-show-option-button">
				<span class="goods-view-show-option-button-value">옵션선택</span>
			</button>

			<div class="goods-view-flow-cart __active" id="flow-cart2">
				<div class="goods-view-flow-cart-wrapper">
					<button type="button" id="show-option-button"
						class="goods-view-show-option-button __active">
						<span class="goods-view-show-option-button-value">옵션선택</span>
					</button>
					<div id="market-flow-cart-content"
						class="goods-view-flow-cart-content __active">


						<c:if test="${not empty sessionScope.loginUser  }">
							<form action="marketBuy.do" method="post">
								<input type="hidden" name="market_no"
									value="${market.market_no }"> <input type="hidden"
									name="member_id" value="${sessionScope.loginUser.member_id}">
									<!-- <div class="market_title"></div> -->
									<table class="tb">
									
									<tr>
										<td>${market.market_title}</td>
										
										<td><input type="number" name="buy_amount" min="1" value="1" class="amount_text"
										 
										oninput="changeprice();"></td>
									
										
									</tr>
									<tr>
										<td>가격</td>
										<td>${market.market_price }원</td>
									</tr>
									
									<tr>
										<td>현재 남은 수량</td>
										<td>${market.market_amount- market.remaining }</td>
									</tr>									
									<tr>
										<td>출하 예정일</td>
										<td>  </td>
										<td>${market.market_releasedate}</td>
									</tr>
									
									
									<tr>
										<td></td>
										<td>  </td>
										<td>총 상품 금액 : <span class="mkPrice">${market.market_price }원</span></td>
									</tr>
							 	<tr><td colspan="3"><a href="javascript: viewSelectBox() ">${market.member_id}</a> </td></tr>
									</table>
								<!-- sendMsg -->
						
								<div class="market_cart_right_div">
								<input type="submit" value="구매하기" class="market_buy"> <input type="button"
									value="장바구니" onclick="addBasket()" class="market_basket">
									</div>
							</form>

						</c:if>
						<c:if test="${empty sessionScope.loginUser  }">
						<div class="loginmessage">로그인이 필요한 서비스 입니다.</div>
						</c:if>
						
						<!-- 장바구니 모달창 -->
						<div id="myModal" class="modal">
							<div class="modal-content">
								<div class="md_top">
									<span class="md_top_title"><strong>장바구니 담기</strong></span>
								</div>
								<div class="md_mid">
									<div class="md_mid_content">선택하신 상품을 장바구니에 담았습니다.</div>
									<div class="md_mid_box">
									<a href="javascript: closeModal();" class="md_mid_close_a"> <span class="md_mid_close">계속쇼핑</span></a> 
									<a href="selectShoppingBasket.do" class="md_mid_basket_a"> <span class="md_mid_basket">장바구니</span></a>
									</div>
								</div>
							</div>
							<input type="hidden" id="market_no" value="${market.market_no }">
						</div><!-- 장바구니 모달 끝 -->
						
						<br> <br> <br> <br>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html> --%>
<div class="goods-view-flow-cart __active" id="flow-cart">
		<div class="goods-view-flow-cart-wrapper">
			<button type="button"  id="show-option-button" class="goods-view-show-option-button">
			<span class="goods-view-show-option-button-value">옵션선택</span></button>

			<div class="goods-view-flow-cart __active" id="flow-cart2">
					<div class="flow_order_seller">판매자 : <span style="font-weight: 600">${market.member_name}</span><!-- (<span>판매자아이디${market.member_id}</span>) -->
					<a href="javascript: sendProductMsg('${loginUser.member_id}','${market.member_id}'  )"><span>상품 문의</span></a> | <a href="javascript: sendMsg('${loginUser.member_id}','${market.member_id}' )"><span>1:1대화</span></a>
					</div>
					
				<div class="goods-view-flow-cart-wrapper">
					<button type="button" id="show-option-button"
						class="goods-view-show-option-button __active">
						<span class="goods-view-show-option-button-value">옵션선택</span>
					</button>
					<div id="market-flow-cart-content" class="goods-view-flow-cart-content __active">


						<c:if test="${not empty sessionScope.loginUser  }">
							<form action="marketBuy.do" method="post">
								<input type="hidden" name="market_no" value="${market.market_no }"> 
								<input type="hidden" name="member_id" value="${sessionScope.loginUser.member_id}">
							
								<div>
								<table class="flow_order_table">
							<tr><td class="flow_order_title">${market.market_title}<span class="flow_order_stock" style="margin-left: 10px"> | <span>${market.market_amount- market.remaining }</span>개 남음</span></td>
							<td><div class="amount_box" > <a href="javascript: countOperator(-1)"><div class="flow_order_operator">-</div></a>
                    		 <input type="number" name="buy_amount" class="flow_order_count" value="1" min="1">
                    		<a href="javascript: countOperator(+1)"><div class="flow_order_operator">+</div></a></div></td>
							<td class="flow_order_price"><span class='spanA'></span>원</td>
							<td class="flow_order_button"><input type="button" value="장바구니" onclick="addBasket()" class="flow_order_basket"></td></tr>
							<tr><td class="flow_order_total" colspan="3">총 상품 금액 : <span class="flow_order_total_price"></span>원</td>
							<td class="flow_order_button">	<input type="submit" value="구매하기" class="flow_order_buy"> </td>
							</tr>
								</table>
								</div>	
			
							</form>

						</c:if>
						<c:if test="${empty sessionScope.loginUser  }">
						<div class="loginmessage">로그인이 필요한 서비스 입니다.</div>
						</c:if>
						
						<!-- 장바구니 모달창 -->
						<div id="myModal" class="modal">
							<div class="modal-content">
								<div class="md_top">
									<span class="md_top_title"><strong>장바구니 담기</strong></span>
								</div>
								<div class="md_mid">
									<div class="md_mid_content">선택하신 상품을 장바구니에 담았습니다.</div>
									<div class="md_mid_box">
									<a href="javascript: closeModal();" class="md_mid_close_a"> <span class="md_mid_close">계속쇼핑</span></a> 
									<a href="selectShoppingBasket.do" class="md_mid_basket_a"> <span class="md_mid_basket">장바구니</span></a>
									</div>
								</div>
							</div>
							<input type="hidden" id="market_no" value="${market.market_no }">
						</div><!-- 장바구니 모달 끝 -->
						
						<br> <br> <br> <br>
					</div>					
				</div>
			</div>

		</div>
	</div>


</body>
</html>