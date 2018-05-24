<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/qna.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/dailyList.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/marketDetail.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/payList.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/auctionDetail.css" rel="stylesheet"
	type="text/css" />
<!-- <link href="/farm/resources/css/QnA_Detail.css" rel="stylesheet"
	type="text/css" /> -->

<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/tabMove.js"></script>

<script type="text/javascript">
	/* 삭제 버튼 */
	function auctionDelete(){
		location.href="/farm/auctionDelete.do?auction_no=${auction.auction_no}";
	}
	
	/* 수정 버튼 */
	function auctionModify(){
		location.href="/farm/auctionModify.do?auction_no=${auction.auction_no}";
	}
	
	/* QnA 등록으로 가는 버튼 */
	function Auction_qnaMake(){
		/* location.href ="/farm/AuctionQnAMake.do?auction_no=${auction.auction_no}"; */
		location.href ="/farm/moveAuctionQnAMake.do?auction_no="+${auction.auction_no};
	}
	
	/* 경매문의 List */
	 function auctionQnAReview(page){
		$.ajax({
			url:"AuctionQnAList.do",
			type:"post",
			data:{
				auction_no:${auction.auction_no},
				page:page
			},
			dataType: "JSON",
			success: function(data){
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				
				var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>작성일</th></tr>";
				
				for(var i in jsonObj.list){
					outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='QnA_td'><a href='/farm/auctionQnaDetail.do?auction_qna_no="+jsonObj.list[i].auction_qna_no+"'>"+jsonObj.list[i].auction_qna_title+"</a></td>"
					+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].auction_qna_question_date+"</td></tr>";
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
	
	
</script>
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
					<span class="title">${auction.auction_title }</span> &nbsp; <span
						class="release_date">경매 시작일</span>&nbsp;<span class="date">${auction.auction_startdate}</span>
						<span><button class="modify" onclick="auctionModify();">수정</button></span>
						<span><button class="delete" onclick="auctionDelete();">삭제</button></span>
				</div>
				<div class="img_box"
					style="background-image: url('/farm/resources/upload/auctionUpload/${auction.auction_img}'); background-size: cover;">

				</div>
				<div class="title_box">
					<div
						style="border-bottom: 1px solid #bdbdbd; padding-bottom: 20px;">
						<span class="title">${auction.auction_title }</span> &nbsp; <span
							class="release_date">경매 시작일</span>&nbsp;<span class="date">${auction.auction_startdate}</span>
					</div>
				</div>
				<div class="note">
					<div class="note_img"
						style="background-image: url('/farm/resources/images/gift.png'); background-size: cover;"></div>
					<p class="note_title">
						제주도부터 강원도까지,<br> 최고의 산지에서 난 농산물만을<br> 전해 드립니다.
					</p>
					<p class="note_content">
						자연의 힘으로 길러낸 유기 농산물은<br> 기후에 영향을 많이 받습니다. 예를 들어<br> 같은
						파프리카라 하더라도 한기물과<br> 한여름에 맞는 최고의 산지가 따로<br> 있지요. 컬리는 1년
						내내 전국을 뒤져<br> 최고만을 전해 드립니다.
					</p>
				</div>
				<div class="note">
					<div class="note_img"
						style="background-image: url('/farm/resources/images/contract.png'); background-size: cover;"></div>
					<p class="note_title">
						직영 혹은 농가와의<br> 계약재배를 통해 철저한 품질<br> 관리가 가능합니다.
					</p>
					<p class="note_content">
						자연의 힘으로 길러낸 유기 농산물은<br> 기후에 영향을 많이 받습니다. 예를 들어<br> 같은
						파프리카라 하더라도 한기물과<br> 한여름에 맞는 최고의 산지가 따로<br> 있지요. 컬리는 1년
						내내 전국을 뒤져<br> 최고만을 전해 드립니다.
					</p>
				</div>
				<div class="note">
					<div class="note_img"
						style="background-image: url('/farm/resources/images/delivery.png'); background-size: cover;"></div>
					<p class="note_title">
						국내 온라인 업체 최초로 식품 전용<br> 자체 물류 창고와 냉장 차량을<br> 이용해 더 신선
						합니다.
					</p>
					<p class="note_content">
						자연의 힘으로 길러낸 유기 농산물은<br> 기후에 영향을 많이 받습니다. 예를 들어<br> 같은
						파프리카라 하더라도 한기물과<br> 한여름에 맞는 최고의 산지가 따로<br> 있지요. 컬리는 1년
						내내 전국을 뒤져<br> 최고만을 전해 드립니다.
					</p>
				</div>
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1"><div
							class="menu introduce">소개</div></li>
					<li class="tab-link" data-tab="tab-2"><div class="menu daily">입찰내역</div></li>
					<li class="tab-link" data-tab="tab-3"><div
							class="menu question">경매이력</div></li>
					<li class="tab-link" data-tab="tab-4"><div id="menu"
							class="menu review" onclick="auctionQnAReview(1);">문의</div></li>
				</ul>

				<!-- introduce_box -->
				<div id="tab-1" class="tab-content current">
					<div class="introduce_box" style="height:auto;">${auction.auction_intro} </div>
				</div>
				<!-- introduce_box -->



				<!-- qna_Box -->
				<div id="tab-2" class="tab-content">
					<div class="auction_history_box">

						<div class="bidding_top">
							<h2 class="history_title">입찰 내역</h2>

							<!-- 경매정보 -->
							<div class="bidding_info">
								<span class="s1">입찰 수 : </span> <span>10</span> <span class="s1">남은
									시간 : </span> <span>4일 13시간 5분</span> <span class="s1">경매 기간 : </span>
								<span>5일</span>
							</div>

							<!-- 경매정보  -->

							<div class="bidding_history">
								<table class="bidding_table">
									<tr>
										<th class="bidder">입찰자</th>
										<th class="current_price">입찰가</th>
										<th>입찰 시간</th>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>
									<tr>
										<td>ojk**</td>
										<td>5000원</td>
										<td>2018/05/11 20:30:25</td>
									</tr>


								</table>
							</div>
							<!-- 입찰 테이블 -->
							<!--  -->
						</div>

					</div>
					<!-- qna Box -->
				</div>
				<!-- Daily box -->
				<div id="tab-3" class="tab-content">
					<div class="daily_box"></div>
				</div>
				<!-- Daily box -->
				
				
				<!-- QnA box -->
	       	<div id="tab-4" class="tab-content" >
	       	<button class="auctionwrite_button" onclick="Auction_qnaMake();">문의 작성</button>
		       	<div class="qna_box">
				
	            <table class="QnA_table">
	              
	              <!-- <tr>
	                  <td>번호</td>
	                  <td >제목</td>
	                  <td>작성자</td>
	                  <td>작성일</td>
	               </tr> --> 
	            </table>
	
	            <!-- 하단 페이징, 검색 묶음 -->
	            <div id="bottom">
	            
	               <!-- 페이징 처리 -->
	               <div class="pagination">
	                  <a href="#">&laquo;</a> <a href="#">1</a> <a href="#"
	                     class="active">2</a> <a href="#">3</a> <a href="#">4</a> <a
	                     href="#">5</a> <a href="#">&raquo;</a> 
	               </div>
	
	               <!-- 검색 -->
	               <div class="search_box">
	               <span class='green_window'> 
	                  <input type='text'class='input_text' />
	               </span>
	               <button type='submit' class='sch_smit'>검색</button>
	               </div>
	            </div>
			</div>
         </div>
	      <!-- qna Box -->
	       	
			</div><!-- inner-wrap -->
		</div>
		<!-- account-wrap -->
		<%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
</body>
</html>