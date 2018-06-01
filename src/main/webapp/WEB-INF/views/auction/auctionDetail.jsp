<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/bottommovemenu.css" rel="stylesheet"
	type="text/css" />	
<link href="/farm/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/qna.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/dailyList.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/marketDetail.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/auctionDetail.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/payList.css" rel="stylesheet"
	type="text/css" />

<!-- <link href="/farm/resources/css/QnA_Detail.css" rel="stylesheet"
	type="text/css" /> -->

<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
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
	
	/* 경매 문의 List */
	 function auctionQnA(page){
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
					+"<td id='QnA_td'><a href='/farm/moveauctionQnADetail.do?auction_qna_no="+jsonObj.list[i].auction_qna_no+"'>"+jsonObj.list[i].auction_qna_title+"</a></td>"
					+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].auction_qna_question_date+"</td></tr>";
				}
				$(".QnA_table").html(outValues);	
				
				var startPage= jsonObj.list[0].startPage;
				var endPage = jsonObj.list[0].endPage;
				var maxPage = jsonObj.list[0].maxPage;
				var currentPage = jsonObj.list[0].currentPage;
				
				var values ="";
				if(startPage>5){
					values+= "<a href='javascript:auctionQnA("+(startPage-1)+")'>&laquo;</a>" 
				}else{
					values+="<a>&laquo;</a>";	
				}
				for(var i=startPage;i<=endPage;i++  ){
					if(i==currentPage){
						values+= "<a class='active'>"+i+"</a>";
					}else{
						values+= "<a href='javascript:auctionQnA("+i+");'>"+i+"</a>";
					}
				}
				if(endPage<maxPage){
					values+="<a href='javascript:auctionQnA("+(endPage+1)+")'>&raquo;</a>";
					
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
	
	   
	
	/* $(function(){
		$('input#submit').click(function(event){
			var price = $('#biddingprice').val();
			var no = ${auction.auction_no};
			alert(price+", " + no);
			
			$.ajax({
				url:"checkAuction_history_price.do",
				type:"post",
				data:{
					auction_no:no
				},
				dataType: "JSON",
				success: function(data){
					console.log(data);
					var objStr = JSON.stringify(data);
					var jsonObj = JSON.parse(objStr);	
					
					if(jsonObj.startprice >= price) {
						alert("경매 시작가보다 높은 금액을 입력해 주세요.");
						return false;
					}else if(jsonObj.directprice <= price){
						alert("즉시 구매가 보다 높은 금액을 입력하셨습니다.");
						return false;
					}else if(jsonObj.price >= price) {
						alert("현재 최고 입찰가보다 높은 금액을 입력해 주세요.")
						return false;
					}else {
						var con_test = confirm("정말 입찰하시겠습니까?")
						if(con_test == true) {
							$('#bidsubmit').submit();
							} else {
							return false;
							}
					}
						
				}
			})
		}); 
	}); */
		 
	
	
	/* 경매 입찰 등록 */
		function bidcheck(){
			var price = $('#biddingprice').val();
			var no = ${auction.auction_no};
			alert(price+", " + no);
			var result = true;
			$.ajax({
				url:"checkAuction_history_price.do",
				type:"post",
				data:{
					auction_no:no
				},
				async: false,
				dataType: "JSON",
				success: function(data){
					/* console.log(data); */
					var objStr = JSON.stringify(data);
					var jsonObj = JSON.parse(objStr);	
					
					if(jsonObj.startprice >= price) {
						alert("경매 시작가보다 높은 금액을 입력해 주세요.");
						result= false;
					}else if(jsonObj.directprice <= price){
						alert("즉시 구매가 보다 높은 금액을 입력하셨습니다.");
						result= false;
					}else if(jsonObj.price >= price) {
						alert("현재 최고 입찰가보다 높은 금액을 입력해 주세요.")
						result= false;
					}else {
						var con_test = confirm("정말 입찰하시겠습니까?")
						if(con_test == true) {
							return true;
							} else {
							result= false;
							}
					}
					 var outValues3 = $("#topprice").html();
					 outValues3 +=
		        		"<td>최고가격</td>"+
						"<td>:  </td>"+
						"<td>"+jsonObj.price+"</td>"
		        	
		        $("#topprice").html(outValues3); 
					
				}
			});
			return result;
		}
	
	
	
	//경매 입찰 List (입찰내역)
	function auction_biddingList(no){
		var auction_no = no.id;
		
		$.ajax({
			url:"auction_biddingList.do",
			type:"post",
			data:{
				auction_no:auction_no
			},
			dataType: "JSON",
		    success:function(data){
					/* alert(data.toString()); */
					var objStr = JSON.stringify(data);
			        var json = JSON.parse(objStr);
			        
			        var biddingcount = json.list[0].biddingcount;
			       /*  alert("count : "+biddingcount); */
			        var outValues = $(".bidding_info").html();
			        	outValues +=
			        		"<span class='s1'>입찰 수 : </span> <span>"+biddingcount+"</span> <span class='s1'>남은시간 : </span>"+
						    "<span>4일 13시간 5분</span> <span class='s1'>경매 기간 : </span><span>5일</span>"
			        	
			        $(".bidding_info").html(outValues);
			       	
			        var outValues2=$(".bidding_table").html();
			        for(var i in json.list){
			        	outValues2 +=
			        		"<tr>"+
							"<td>"+json.list[i].member_id+"</td>"+
							"<td>"+json.list[i].auction_history_price+"</td>"+
							"<td>"+json.list[i].auction_history_date+"</td>"+
							"</tr>"
			        }
			        $(".bidding_table").html(outValues2);
			 }
			 
		});
			 
	}
	
	//경매 남은 시간
	var aTime;
	/* $(function(){
		/* aTime = setTimeout(function(){auctionTime();}, 1000); 
		aTime = setInterval(() => {
			
		}, milliseconds);("auctionTime();", 1000); 
	}); */
	
	/* aTime = setInterval(function(){auctionTime()},1000); */
	
	/* var number =1000/60/60/24; */
		aTime =window.setTimeout(function(){auctionTime()},1000);
	
	function auctionTime(){
		 alert("${auction.auction_no}"); 
		$.ajax({
			url: "auction_timeRemaining.do",
			data:{
				auction_no:'${auction.auction_no}'
			},
			type:"post",
			success:function(obj){
				/*  alert("남은 시간 체크");
				 console.log(obj); */
				 var objStr = JSON.stringify(obj);
		         var jsonObj = JSON.parse(objStr);
		         
		         var today = jsonObj.today;
		         alert("today :"+today);
		         var startdate = jsonObj.auction_startdate;
		         alert("startdate :"+startdate);
		         var enddate = jsonObj.auction_enddate;
		         alert("enddate :"+enddate);
		         
		         var day =(enddate - today)/1000/60/60/24);
		         alert("day : "+day);
		         
		         var dayRound = Math.floor(day);
		         alert("dayRound : "+dayRound);
		         
		         var hours =((enddate - today)/1000/60/60) - (24*dayRound);
		         var hoursRound = Math.floor(hours);
		         
		         var minutes = ((enddate - today)/1000/60) - (24 * 60 * daysRound) - (60 * hoursRound);
		         var minutesRound = Math.floor(minutes);
		         
		         var seconds = ((enddate - today)/1000) - (24*60*60*daysRound) -  (60*60*hoursRound)
		         - (60*minutesRound);
		         var secondsRound = Math.round(seconds);
		         
		         sec ="초.";
		         min ="분, ";
		         hr ="시간, ";
		         dy="일,";
		         
		       var outValues = $("#time").html(); 
		       if(jsonObj.status == 1){
		         outValues+="남은시간 : "+
		         dayRound+dy+hoursRound+hr+minutesRound+min+secondsRound+sec;
		         

		        	 /* jsonObj.day+"일&nbsp;"+jsonObj.hour+"시간 &nbsp;"+
		        	 jsonObj.min+"분 &nbsp;";  */
		       }else if(jsonObj.status == 0){
		    	   outValues+="경매 준비중";
		       }else if(jsonObj.status == 2){
		    	   outValues+=  "경매 마감";
		       }
		         $("#time").html(outValues);  
		         
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
					<span class="title">${auction.auction_title }</span> &nbsp; 
					<span class="release_date">경매 시작일</span>&nbsp;<span class="date">${auction.auction_startdate}</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
					&nbsp; &nbsp; &nbsp; 
					  <span id="time"> </span>&nbsp; 
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
							class="release_date">경매 마감일</span>&nbsp;<span class="date">${auction.auction_enddate}</span>
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
					<li class="tab-link" data-tab="tab-2"><div class="menu daily" id="${auction.auction_no}" onclick="auction_biddingList(this);">입찰내역</div></li>
					<li class="tab-link" data-tab="tab-3"><div
							class="menu question">경매이력</div></li>
					<li class="tab-link" data-tab="tab-4"><div id="menu"
							class="menu review" onclick="auctionQnA(1);">문의</div></li>
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
							<div style="width:100%; margin-left:45%;">
							<h2 class="">입찰 내역</h2>
							</div>

							<!-- 경매정보 -->
							<div class="bidding_info">
								<!-- <span class="s1">입찰 수 : </span> <span>10</span> <span class="s1">남은
									시간 : </span> <span>4일 13시간 5분</span> <span class="s1">경매 기간 : </span>
								<span>5일</span> -->
							</div>

							<!-- 경매정보  -->

							<div class="bidding_history">
								<table class="bidding_table">
									<tr>
										<th class="bidder">입찰자</th>
										<th class="current_price">입찰가</th>
										<th>입찰 시간</th>
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
	                  <!-- <a href="#">&laquo;</a> <a href="#">1</a> <a href="#"
	                     class="active">2</a> <a href="#">3</a> <a href="#">4</a> <a
	                     href="#">5</a> <a href="#">&raquo;</a>  -->
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
	
		<div class="goods-view-flow-cart __active" id="flow-cart">
		<div class="goods-view-flow-cart-wrapper">
			<button type="button" id="show-option-button"
				class="goods-view-show-option-button">
				<span class="goods-view-show-option-button-value">입찰</span>
			</button>

			<div class="goods-view-flow-cart __active" id="flow-cart2">
				<div class="goods-view-flow-cart-wrapper">
					<button type="button" id="show-option-button"
						class="goods-view-show-option-button __active">
						<span class="goods-view-show-option-button-value">입찰</span>
					</button>
					
					<div id="flow-cart-content"
						class="goods-view-flow-cart-content __active">
						<!-- <form action="/farm/insertAuctionBidding.do" onsubmit="return checkAuction_bidding()"  method="post"> -->
						<form action="/farm/insertAuctionBidding.do" name="bidding" id="bidsubmit" method="post" onsubmit="return bidcheck();">
						<input type="hidden" name="auction_no" value="${auction.auction_no}" id="no">
						<input type="hidden" name="member_id" value="${loginUser.member_id}">
						<div class="auction_cart_info_div">
							<table class="auction_cart_info_table">
								<tr>
									<td colspan="2" class="1">${auction.auction_title }</td>
								</tr>
								<tr>
									<td class="2">시작일</td>
									<td>:  </td>
									<td>${auction.auction_startdate }</td>
								</tr>
								<tr>
									<td class="2">마감일</td>
									<td>:  </td>
									<td>${auction.auction_enddate}</td>
								</tr>
								<tr>
									<td class="2">즉시 구매 가격</td>
									<td>:  </td>
									<td>${auction.auction_directprice}</td>
								</tr >
							</table>
						</div>
						
						<div class="auction_cart_center_div">
							<table>
								<tr>
									<td>경매시작값</td>
									<td>:  </td>
									<td>${auction.auction_startprice}</td>
								</tr>
								<tr id="topprice">
									<!-- <td>최고가격</td>
									<td>:  </td>
									<td ></td>  -->
								</tr>
								<tr>
									<td>입찰가격</td>
									<td>:  </td>
									<td><input type="number" placeholder="ex) 1000" style="height:20px;"
									name="auction_history_price" id="biddingprice"/></td>
								</tr>

							</table>

						</div>
						
						<div class="auction_cart_right_div">
							<table>
								<tr>
									<td><input type="submit" id="submit" class="auction_bidding" value="입찰" /></td>
									<td><button class="auction_buy">즉시구매</button></td>
								</tr>
					
							</table>
						</div>
						</form>
					
					</div>
					
					<br><br><br><br>
				</div>
			</div>

		</div>
	</div>
</body>
</html>