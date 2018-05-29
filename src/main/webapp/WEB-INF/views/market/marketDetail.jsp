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
<link href="/farm/resources/css/marketDetail_modal.css" rel="stylesheet" type="text/css" />
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/tabMove.js"></script>
<script type="text/javascript">
$(function(){
	$('.goods-view-show-option-button').click(function(){
		if($('#flow-cart2').css('display') == 'none'){
			$('#flow-cart2').css('display','block');
		}else{
			$('#flow-cart2').css('display','none');
		}
    });
});

</script>
<script type="text/javascript">

///최근 본 상품 쿠키 (현준)///
 $(function(){

		var time = new Date();
		time.setDate(time.getDate() + 7);
		var oldtime = new Date();
		oldtime.setDate(oldtime.getDate() - 7);
		var decodedCookie = decodeURIComponent(document.cookie);
		var temp = decodedCookie.split(';');
		var ca=[];
		for(var i=0;i<temp.length;i++)
			{
				if(  temp[i].indexOf('farm_cookie_') != -1)
					{
					ca.push( temp[i] );
					}
			}
		var market_no= $('#market_no').val();
			
		if (document.cookie.indexOf(  'farm_cookie_'+market_no + "="+ market_no + "a") == -1) {
			//없음
			if (ca.length > 8) {
				document.cookie = ca[0] + "; expires=" + oldtime;
			}
		} else {
			//있음
			document.cookie = 'farm_cookie_'+market_no + "=" + market_no+ "a; expires=" + oldtime;
		}

		document.cookie = 'farm_cookie_'+ market_no + "=" + market_no+ "a; expires=" + time;

}); 
///쿠키 끝///

//장바구니 (현준)//
function addBasket()
{
	$.ajax({
		url:"addSoppingBasket.do",
		type:"post",
		data:{
			market_no: $('[name=market_no]').val(),
			member_id: $('[name=member_id]').val(),
			buy_amount: $('[name=buy_amount]').val()
		},
		success:function(){
			$('#myModal').css("display","block");
		},
		error: function(request,status,errorData){
			console.log("marketDetail.jsp / addBasket();")
			console.log("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData);
           }
	});
}
function closeModal()
{
	$('#myModal').css("display","none");
}



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
				+"<td id='QnA_td'><a href='reviewDeatil.do?review_no="+jsonObj.list[i].review_no+"'>"+jsonObj.list[i].review_title+"</a></td>"
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
						+"<tr><td align='left' class='hi_content_right'><a class='aTag' href='marketDailyDetail.do?daily_no="+jsonObj.list[i].daily_no+"'><div>"+jsonObj.list[i].daily_contents
						+"<span class='more'>...더보기</span></div></a></td></tr></tbody></table></td></tr>";
				}else{
					outValues += "<tr><td valign='top' class='history_right' align='right'>"
						+"<table class='history_right_table' cellspacing='0' cellpadding='0'>"
						+"<tbody><tr><td align='right' class='hi_date' valign='top'><span class='history_right_table_span1'>"+jsonObj.list[i].daily_date+"</span></td>"
						+"<td rowspan='3' class='history_right_table_td1' ></td>"
						+"</tr><tr><td align='right' class='hi_title'>"+jsonObj.list[i].daily_title+"</td></tr>"
						+"<tr><td align='right' class='hi_content_right'><a class='aTag' href='marketDailyDetail.do?daily_no="+jsonObj.list[i].daily_no+"'><div style='float:right;'>"+jsonObj.list[i].daily_contents
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
				<div class="title_box">
					<span class="title">${market.market_title }</span> &nbsp; <span
						class="release_date">출고예정일</span>&nbsp;<span class="date">${market.market_releasedate }</span>
				</div>
				<div class="img_box"
					style="background-image: url('/farm/resources/upload/marketUpload/${market.market_img}'); background-size:cover;">

				</div>
				<div class="title_box">
					<div
						style="border-bottom: 1px solid #bdbdbd; padding-bottom: 20px;">
						<span class="title">${market.market_title }</span> &nbsp; <span
							class="release_date">출고예정일</span>&nbsp;<span class="date">${market.market_releasedate }</span>
					</div>
				</div>
				<div class="test">
					<p class="note_content">자연의 힘으로 길러낸 유기 농산물은 기후에 영향을 많이 받습니다. 예를
						들어 같은 파프리카라 하더라도 한기물과 한여름에 맞는 최고의 산지가 따로 있지요. 컬리는 1년 내내 전국을 뒤져
						최고만을 전해 드립니다.</p>
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
					<button class="market_write" onclick="qnaMake();">QnA 등록</button>
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
					<button class="market_write" onclick="writeReview();">후기
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
	<div class="goods-view-flow-cart __active" id="flow-cart">
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
					<div id="flow-cart-content"
						class="goods-view-flow-cart-content __active">


						<c:if test="${not empty sessionScope.loginUser  }">
							<form action="marketBuy.do" method="post">
								<input type="hidden" name="market_no"
									value="${market.market_no }"> <input type="hidden"
									name="member_id" value="${sessionScope.loginUser.member_id}">
								<input type="number" name="buy_amount" min="1" value="1">
								<input type="submit" value="구매하기"> <input type="button"
									value="장바구니" onclick="addBasket()">
							</form>

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