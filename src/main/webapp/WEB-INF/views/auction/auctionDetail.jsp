<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link href="/farm/resources/css/payList.css" rel="stylesheet"
   type="text/css" />
   
<link href="resources/time/timeTo.css" rel="stylesheet"
   type="text/css" />
<link href="/farm/resources/css/auctionDetail.css" rel="stylesheet"
   type="text/css" />

<script type="text/javascript"
   src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/tabMove.js"></script>

<style type="text/css">
	#time > .first:nth-child(1){
		margin-right:13px;
	}
	.a> .first:nth-child(1){
		margin-right:13px;
	}
	.auction_backgroundtable{
	overflow-y: scroll;
	}
	.auction_backgroundtable tr td,.auction_backgroundtable tr th{	
		height:40px;
	}
	
	#background{
	text-decoration:none;
	color:black;
	}
	
	#hover:hover{
	background: #f7f4ea;
	}
	

</style>
   
<script type="text/javascript">
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
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
   
      location.href ="/farm/moveAuctionQnAMake.do?auction_no=${auction.auction_no}";
   }
   
   /* 경매 문의 List */
    function auctionQnA(page){
      var auction_no = '${auction.auction_no}';
      $.ajax({
         url:"AuctionQnAList.do",
         type:"post",
         data:{
            auction_no:auction_no,
            page:page
         },
         dataType: "JSON",
         success: function(data){
            console.log(data);
            var objStr = JSON.stringify(data);
            var jsonObj = JSON.parse(objStr);
            /* alert("jsonObj.list : "+jsonObj.list.length); */
            var outValues2 ="";
            if(jsonObj.list.length == 0){
               outValues2+= "<div style='width:100%; height:200px;margin-top:20%;text-align:center;font-size:20pt;font-weight: bold;color:gray;'>"+
               "등록된 문의가 없습니다.</div>";
            
            $(".qna_box").html(outValues2);   
            }
            else{
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
            }
            
         },error: function(request,status,errorData){
               alert("error code : " + request.status + "\nmessage" + 
                       request.responseText + "\nerror" + errorData);
              }
      });
   }
   
      
   
   /* 경매 입찰 등록 */
      function bidcheck(){
         var price = $('#biddingprice').val();
         var no = '${auction.auction_no}';
        /*  alert(price+", " + no); */
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
                
            }
         });
         return result;
      }
   
   //최고가 찍기
   $(function(){
      var no = '${auction.auction_no}';
      $.ajax({
         url:"selectprice.do",
         data:{
            auction_no : no
         },
         type:"post",
         dataType: "JSON",
         success: function(data){
            console.log(data);
            var objStr = JSON.stringify(data);
            var jsonObj = JSON.parse(objStr);   
             $("#topprice").text(numberWithCommas(jsonObj.auction_history_price)+"원"); 
         }
         
      });
   });
   
   
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
               /*   alert("count : "+biddingcount); 
                 alert("day :"+json.list[0].day); */
                 
                 if(json.list.length > 1){
                 if(json.list[0].day > 0 && biddingcount > 0){
                 var outValues = "";
                    outValues =
                       "<span class='s1'>입찰 수 : </span> <span>"+(biddingcount-1)+"</span>&nbsp;&nbsp;&nbsp; <span class='s1'>남은기간 : </span>"+
                      "<span>"+json.list[0].day+"</span>";
                 }
                    
                 $(".bidding_info").html(outValues);
                  
                   
               var outValues2 = 
                  "<table class='bidding_table' >"+
              	 "<tr>"+
                  "<th class='bidder'>입찰자</th>"+
                  "<th class='current_price'>입찰가</th>"+
                  "<th>입찰  시간</th>"+
             	  "</tr>";
               
                 for(var i in json.list){
                	 if(json.list[i].member_id != 'system' ){
                    outValues2 +=
                     "<tr>"+
                     "<td>"+json.list[i].member_id+"</td>"+
                     "<td>"+numberWithCommas(json.list[i].auction_history_price)+"원</td>"+
                     "<td>"+json.list[i].auction_history_date+"</td>"+
                     "</tr>";
                	 }
                 }
                  outValues2 += "</table>"; 
                 $(".bidding_history").html(outValues2);
        	  }
          else{
        	  var outValues3="";
        	 	outValues3 = 
        		  "<div style='width:100%; height:200px;margin-top:20%;text-align:center;font-size:20pt;font-weight: bold;color:gray;'>"+
              	  "등록된 문의가 없습니다.</div>";
        	  $(".bidding_history").html(outValues3);
          	}
          }
      });
          
   }

   
   //경매 남은 시간
   $(function(){
      /*  alert("${auction.auction_no}");  */
      $.ajax({
         url: "auction_timeRemaining.do",
         data:{
            auction_no:'${auction.auction_no}'
         },
         type:"post",
         success:function(obj){
             var objStr = JSON.stringify(obj);
             var jsonObj = JSON.parse(objStr);
             async: false;
             var outValues = ""; 
             var outValues2 = "";  
             var outValues3 = "";
             
            if(jsonObj.status == 1){
             $('.demo1').timeTo(new Date(jsonObj.auction_enddate)); 
             $('.a').timeTo(new Date(jsonObj.auction_enddate)); 
            var stop = 0;
            var upadte;
            //타이머 시간이 0이 될때
            update = setInterval(function(){
         	   stop = 0;
         	   $("#time li").each(function(){
          	  if( $(this).text()==0){
          		 stop += 0;
            	  }else{
            		  stop += 1;
            	  }
            	   console.log( $(this).text());
               });
					   if(stop == 0){
						   outValues3=  "경매 마감";
			               outValues2=  "경매 마감"; 
			               $("#time").html(outValues3);  
			               $(".a").html(outValues2); 
			               $(".button_buy").remove();
					   }   
            }, 1000);
            
           }
           
              if(jsonObj.status == 0){
            	  outValues="<span style='font-weight: bold;font-size:15pt;'>경매 준비중</span>";
                outValues2="경매 준비중";
             }else if(jsonObj.status == 2 || jsonObj.status ==3 || jsonObj.status ==4 ){
            	 outValues=  "경매 마감";
                outValues2=  "경매 마감";
             }
               $(".end").html(outValues);  
               $("#a").html(outValues2); 
             
         },error: function(request,status,errorData){
               alert("error code : " + request.status + "\nmessage" + 
                       request.responseText + "\nerror" + errorData);
              }
      });
   
   });
  
   
   //옥션 문의 검색창
   function auction_search(page){
      var auction_no = '${auction.auction_no}';
      var keyword = $("#auction_keyword").val();
      var select = $("#select_val").val();
      $.ajax({
         url : "auction_search2.do",
         type:"post",
         data : {
            keyword :keyword,
            select :select,
            page:1,
            auction_no :auction_no
         },
         dataType: "JSON",
         success: function(data){
            var objStr = JSON.stringify(data);
            var jsonObj = JSON.parse(objStr);
            
            var outValues = "";
             outValues += "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>작성일</th></tr>"; 
             if(jsonObj.list.size > 0){
             for(var i in jsonObj.list){
                  outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
                  +"<td id='QnA_td'><a href='/farm/moveauctionQnADetail.do?auction_qna_no="+jsonObj.list[i].auction_qna_no+"'>"+jsonObj.list[i].auction_qna_title+"</a></td>"
                  +"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].auction_qna_question_date+"</td></tr>";
               }
             }else{
                alert("검색된 결과가 없습니다.");
                auctionQnA(1);
               
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
   
 //경매 즉시 구매
	 function auction_Buy(){
		var buycheck = confirm("정말로 즉시 구매 하시겠습니까?");
		if(buycheck == true){
			/*  var input = document.getElementById('buy_button');
			input.setAttribute("disabled","disabled");
			var input2 = document.getElementById('bidding_button');
			input2.setAttribute("disabled","disabled");  */
			
			location.href="makeAuctionPayment.do?auction_no=${auction.auction_no}&member_id=${loginUser.member_id}";
		
		}
		
		
	}


   
   //경매 이력
   function Background(no){
      var auction_no = no.id;
      var member_id = '${auction.member_id}';
    /*   alert("auction_no : "+auction_no); */
      $.ajax({
         url : "auction_background.do",
         type:"post",
         data : {
            auction_no :auction_no,
            member_id :member_id
         },
         dataType: "JSON",
         success: function(data){
        	 console.log(data);
            var objStr = JSON.stringify(data);
            var jsonObj = JSON.parse(objStr);
            
            var outValues = "<tr id='table_tr_1' style='background: #ece6ce;width:60px;'><th >번호</th><th >판매자</th><th >제목</th></tr>"; 
            
            for(var i in jsonObj.list){
            	
                  outValues += 
                     "<tr id='hover'>"+
                     "<td style='text-align:center;'>"+(i*1+1)+"</td>"+
                     "<td style='text-align:center;'>"+jsonObj.list[i].member_id+"</td>"+
                     "<td style='text-align:center;'><a href='/farm/AuctionDetail.do?auction_no="+jsonObj.list[i].auction_no+"' id='background'>"+jsonObj.list[i].auction_title+"</a></td>"+
                     "</tr>";
               }
            $(".auction_backgroundtable").html(outValues);
          
             /*   outValues += 
               "<div style='width:100%; height:200px;margin-top:20%;text-align:center;font-size:20pt;font-weight: bold;color:gray;'>"+
               "경매 이력이 없습니다.</div>";
            $(".auction_background").html(outValues);
            } */
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
               &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <span class="end">&nbsp; &nbsp; 남은시간 : </span>
                 <span id="time" class="demo1"></span>&nbsp; 
                 <c:choose>
                  <c:when test="${loginUser.member_id eq auction.member_id && auction.auction_status eq 0}">
                     <span><button class="modify" onclick="auctionModify();">수정</button></span>
                     <span><button class="delete" onclick="auctionDelete();">삭제</button></span>
                  </c:when>
                  
                  <c:when test="${loginUser.member_category eq 2 }">
                  	<span><button class="modify" onclick="auctionModify();">수정</button></span>
                    <span><button class="delete" onclick="auctionDelete();">삭제</button></span>
                  </c:when>
                  <c:otherwise></c:otherwise>
                
                  </c:choose>
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
                     class="menu question" id="${auction.auction_no}" onclick="Background(this);">경매이력</div></li>
               <li class="tab-link" data-tab="tab-4">
                  <div id="menu"
                     class="menu review" onclick="auctionQnA(1);">문의</div>
               </li>
            </ul>

            <!-- introduce_box -->
            <div id="tab-1" class="tab-content current">
               <div class="introduce_box" style="height:auto;">${auction.auction_intro} </div>
            </div>
            <!-- introduce_box -->



            <!-- qna_Box -->
            <div id="tab-2" class="tab-content">
               <div class="auction_history_box">

                  <div class="bidding_top" style="height:500px;">
                     <div style="width:100%; text-align:center; ">
                     <h2 class="">입찰 내역</h2>
                     </div>

                     <!-- 경매정보 -->
                     <div class="bidding_info" style="width:100%; height:auto;">
                        <!-- <span class="s1">입찰 수 : </span> <span>10</span> <span class="s1">남은
                           시간 : </span> <span>4일 13시간 5분</span> <span class="s1">경매 기간 : </span>
                        <span>5일</span> -->
                     </div>

                     <!-- 경매정보  -->

                     <div class="bidding_history" ></div>
                     <!-- 입찰 테이블 -->
                     <!--  -->
                  </div>

               </div>
               <!-- qna Box -->
            </div>
            <!-- Daily box -->
            <div id="tab-3" class="tab-content">
               <div class="auction_background" style="width:97%;height:500px;padding:10px;border:3px solid #ddd;" >
               <h2 style="text-align:center;margin-bottom:40px;">경매 이력</h2>
               <div style="overflow-y: scroll;    height: 370px; overflow: auto;">
               <table class="auction_backgroundtable" style="width:90%;margin-left:45px;">
                  
               </table>
               </div>
               </div>
            </div>
            <!-- Daily box -->
            
            
      <!-- QnA box -->
             <div id="tab-4" class="tab-content" >
             <c:if test="${loginUser.member_category eq '1' && not empty sessionScope.loginUser}">
             <button class="auctionwrite_button" onclick="Auction_qnaMake();">문의 작성</button>
             </c:if>
             <div class="qna_box" >
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
                  <div class="pagination" >
                     <!-- <a href="#">&laquo;</a> <a href="#">1</a> <a href="#"
                        class="active">2</a> <a href="#">3</a> <a href="#">4</a> <a
                        href="#">5</a> <a href="#">&raquo;</a>  -->
                  </div>
                  
                  <!-- 검색 -->
               <div class="search_box">
                  <div class="auction_select_box" >
                     <select class="auction_select" id="select_val">
                        <option value="1" selected="">제목</option>
                        <option value="2">작성자</option>
                     </select>
                  </div>
                  <div style="float:right;">
                  <span class='green_window'> <input type='text'
                     class='input_text' id="auction_keyword"/>
                  </span>
                  <button type='button' class='sch_smit' onclick="auction_search(1);">검색</button>
                  </div>
               </div>
            </div>
         </div><!--qna_box -->
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
               
               <c:if test="${ empty sessionScope.loginUser  }">
               <div id="flow-cart-content"
                  class="goods-view-flow-cart-content __active">
                   <div style="padding-bottom:10px;padding-left:10px;font-weight: bold;font-size:13pt;">${auction.auction_title }</div>
                   <div style="background:#f3f3f3; height:100px;;width:100%;padding:5px;border:2px solid #e6e6e6;">
                  		<div style="width:100%; height:auto; font-weight: bold; font-size:15pt; color:gray; text-align:center;padding-top:32px;">
                  		로그인이 필요한 서비스입니다.
						</div>
                   </div>
               </div>
               </c:if>
               
               <c:if test="${not empty sessionScope.loginUser  }">
               <div id="flow-cart-content"
                  class="goods-view-flow-cart-content __active">
                  <form action="/farm/insertAuctionBidding.do" name="bidding" id="bidsubmit" method="post" onsubmit="return bidcheck();">
                  <input type="hidden" name="auction_no" value="${auction.auction_no}" id="no">
                  <input type="hidden" name="member_id" value="${loginUser.member_id}">
                  <div style="padding-bottom:10px;padding-left:10px;font-weight: bold;font-size:13pt;">${auction.auction_title }</div>
                  <div style="background:#f3f3f3; height:100px;;width:100%;padding:5px;border:2px solid #e6e6e6;">
                  
                  <div class="auction_cart_info_div">
                     <table class="auction_cart_info_table">
                        <tr>
                           <td class="2">시작일</td>
                           <td>:  </td>
                           <td>${auction.auction_startdate}</td>
                        </tr>
                        <tr>
                           <td class="2">마감일</td>
                           <td>:  </td>
                           <td>${auction.auction_enddate}</td>
                        </tr>
                        <tr>
                           <td class="2">즉시 구매 가격</td>
                           <td>:  </td>
                           <td><fmt:formatNumber value="${auction.auction_directprice}" pattern="#,###" />원</td>
                        </tr >
                     </table>
                  </div>
                  
                  <div class="auction_cart_center_div">
                     <table>
                        <tr >
                           <td>경매시작값</td>
                           <td>:  </td>
                           <td><fmt:formatNumber value="${auction.auction_startprice}" pattern="#,###" />원</td>
                        </tr>
                        <tr >
                           <td>최고가격</td>
                           <td >: </td>
                           <td id="topprice"></td> 
                        </tr>
                        <tr>
                           <td>입찰가격</td>
                           <td>:  </td>
                           <td><input type="number" placeholder="ex) 1000" style="height:20px;"
                           name="auction_history_price" id="biddingprice"/></td>
                        </tr>

                     </table>

                  </div>
                  
              
                <c:choose>
                 <c:when test="${auction.auction_status eq 1 }">
                  	<div class="auction_cart_right_div">
                        <table>
                           <tr >
                           <td class="a" colspan="3" style=" width:100%;padding:10px 0px 10px 0px;">
                           </td>
                           </tr>
                           <tr class="button_buy">
                              <td><input type="submit" id="bidding_button"
                                 class="auction_bidding" value="입찰" /></td>
                              <td><button type="button"  class="auction_buy" id="buy_button" onclick="auction_Buy();">즉시구매</button></td>
                           </tr>
                        </table>
                     </div>
                    </c:when>
                    
                    <c:otherwise>
                  		<table>
                           <tr>
                           	<td id="a" colspan="2" style="width:300px;; padding:35px 0px 0px 20px ; font-weight: bold;font-size:15pt;text-align:center;"></td>
                           </tr>
                         </table>
                   </c:otherwise>
                  
                  </c:choose>
               
                
                    </div>
                  </form>
               	
               </div>
               </c:if>
               
               <br><br><br><br>
            </div>
         </div>

      </div>
   </div>
   <script type="text/javascript" src="resources/time/jquery.time-to.js"></script>
<script type="text/javascript" src="resources/time/jquery.time-to.min.js"></script>
</body>
</html>