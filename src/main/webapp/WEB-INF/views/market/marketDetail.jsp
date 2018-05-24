<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/qna.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/dailyList.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/marketDetail.css" rel="stylesheet" type="text/css" />
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/tabMove.js"></script>
<script>
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
				+"<td id='QnA_td'><a href='/farm/marketQnaDetail.do?qna_no="+jsonObj.list[i].market_qna_no+"'>"+jsonObj.list[i].market_qna_title+"</a></td>"
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
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].review_no+"</td>"
				+"<td id='QnA_td'><a href='#'>"+jsonObj.list[i].review_title+"</a></td>"
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
					<span class="title">${market.market_title }</span> &nbsp;
					<span class="release_date">출고예정일</span>&nbsp;<span class="date">${market.market_releasedate }</span>
				</div>
        		<div class="img_box" style="background-image: url('/farm/resources/upload/marketUpload/${market.market_img}'); background-size:cover;">
        			
        		</div>
        		<div class="title_box">
        			<div style="border-bottom: 1px solid #bdbdbd; padding-bottom:20px;">
					<span class="title">${market.market_title }</span> &nbsp;
					<span class="release_date">출고예정일</span>&nbsp;<span class="date">${market.market_releasedate }</span>
					</div>
				</div>
				<div class="test">
				<p class="note_content">자연의 힘으로 길러낸 유기 농산물은
       				기후에 영향을 많이 받습니다. 예를 들어
       				같은 파프리카라 하더라도 한기물과
       				한여름에 맞는 최고의 산지가 따로
       				있지요. 컬리는 1년 내내 전국을 뒤져
       				최고만을 전해 드립니다.</p></div>
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
				    <li class="tab-link current" data-tab="tab-1"><div class="menu introduce">소개</div></li>
				    <li class="tab-link" data-tab="tab-2"><div class="menu daily">일지</div></li>
				    <li class="tab-link" data-tab="tab-3"><div class="menu question" onclick="qnaPage(1);">문의</div></li>
				    <li class="tab-link" data-tab="tab-4"><div id="menu" class="menu review" onclick="reviewPage(1);">후기</div></li>
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
       			
       			 <table class="history_body" >
      <tr>   
         <td class="history_start" colspan="3" align="center">
         <!-- 농사 시작일자 넣는 부분 -->
            <table class="history_title">
               <tr>
                  <td class="start_date" align="center">농사시작일자</td>
               </tr>
               <tr>
                  <td class="start_date" align="center">2018/01/01</td>
               </tr>
            </table>
         <!-- 농사 시작일자 넣는 부분 끝 -->   
         </td>
      </tr>
         <!-- 공백 -->
         <tr>
            <td class="space_left"></td>
            <td></td>
         </tr>   
         <!-- 공백 끝 -->
         
         
         <!-- 일지란 시작 오른쪽 -->
         <tr>
            <td class="space_right"></td>
            <td class="history_right" align="left">
               <table class="history_right_table" cellspacing="0" cellpadding="0" >
                  <tbody>
                     <tr>
                        <td class="history_right_table_td1" rowspan="3" ></td>
                        <td class="history_right_table_td2" align="left" valign="top">
                           <span class="history_right_table_span1">2017-08-16 15:37:01</span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="hi_title">안녕하세요 타노스입니다.</td>
                     </tr>
                     <tr>
                        <td align="left" class="hi_content_right">
                           <div>지구 침공 예정입니다. 돌은 3개 모았구요. 지구에 2개있다고 해서<br>
                           아이우에오아이우오<br>
                           아이우에오앙이우이에<br>
                              <span class="more">...더보기</span>
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>
         </tr>
         <!-- 일지란 끝 -->
         <!-- 공백 -->
         <tr>
            <td class="space_left"></td>
            <td></td>
         </tr>
         <!-- 공백끝 -->
         <!-- 일지란 시작 왼쪽  -->
         <tr>
            <td class="space_left"></td>
            <td></td>
         </tr>
         <tr>
            <td valign="top" class="history_right" align="right" onclick="">
               <table class="history_right_table" cellspacing="0" cellpadding="0">
                  <tbody>
                     <tr>
                        <td align="right" class="hi_date" valign="top">
                           <span class="history_right_table_span1">2017-08-17 15:37:01</span>
                        </td>
                        <td rowspan="3" class="history_right_table_td1" ></td>
                     </tr>
                     <tr>
                        <td align="right" class="hi_title">안녕하세요 타노스입니다.</td>
                     </tr>
                     <tr>
                        <td align="right" class="hi_content_right">
                           <div style="float: right;">지구 침공중입니다. 비전 이마에서 때어냈습니다.<br>
                           아이우에오아이우오<br>
                           아이우에오앙이우이에<br>
                              <span class="more">...더보기</span>
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>
            <td class="space_right2"></td>
         </tr>
         <!-- 일지란 끝 왼쪽 -->
         <!-- 공백 -->
         <tr>
            <td class="space_left"></td>
            <td></td>
         </tr>
         <!-- 공백끝 -->
         <!-- 일지란 시작 오른쪽 -->
         <tr>
            <td class="space_left"></td>
            <td></td>
         </tr>   
         <tr>
            <td class="space_right"></td>
            <td valign="top"  class="history_right" align="left" onclick="">
               <table cellspacing="0" cellpadding="0" class="history_right_table">
                  <tbody>
                     <tr>
                        <td rowspan="3" class="history_right_table_td1"></td>
                        <td align="left" class="hi_date" valign="top">
                           <span class="history_right_table_span1">2017-08-16 15:37:01</span>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="hi_title">안녕하세요 타노스입니다.</td>
                     </tr>
                     <tr>
                        <td align="left" class="hi_content_right">
                           <div style="float: left;">돌다모아서 인구의 반을 줄였습니다 이제 쉽니다<br>
                           아이우에오아이우오<br>
                           아이우에오앙이우이에<br>
                              <span class="more">...더보기</span>
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>
         </tr>
         <!-- 일지란 끝 -->
            <!-- 공백 -->
         <tr>
            <td class="space_left"></td>
            <td></td>
         </tr>
         <tr>
            <td class="space_left"></td>
            <td></td>
         </tr>
         <!-- 공백끝 -->
         <tr>   
            <td colspan="3" align="center">
         <!-- 농사 끝일자 넣는 부분 -->
               <table class="history_title" cellspacing="0">
                  <tr>
                     <td class="start_date" align="center">농사끝일자</td>
                  </tr>
                  <tr>
                     <td class="start_date" align="center">2018/01/01</td>
                  </tr>
               </table>
         <!-- 농사 끝일자 넣는 부분 끝 -->   
            </td>
         </tr>
         <tr>
            <td height="100"></td>
         </tr>
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
	              
	              <!--   <tr>
	                  <td>10</td>
	                  <td id="QnA_td">문의사항_04</td>
	                  <td>김민선</td>
	                  <td>2018-05-06</td>
	               </tr> -->
	            </table>
	
	            <!-- 하단 페이징, 검색 묶음 -->
	            <div id="bottom">
	            
	               <!-- 페이징 처리 -->
	               <div class="pagination">
	                  <!-- <a href="#">&laquo;</a> <a href="#">1</a> <a href="#"
	                     class="active">2</a> <a href="#">3</a> <a href="#">4</a> <a
	                     href="#">5</a> <a href="#">&raquo;</a> -->
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
	       	
	       	<div id="tab-4" class="tab-content">
	       	<button class="market_write" onclick="writeReview();">후기 쓰기</button>
		       	<div class="qna_box">
	
	            <table class="review_table">
	              
	              <!--   <tr>
	                  <td>10</td>
	                  <td id="QnA_td">문의사항_04</td>
	                  <td>김민선</td>
	                  <td>2018-05-06</td>
	               </tr> -->
	            </table>
	
	            <!-- 하단 페이징, 검색 묶음 -->
	            <div id="bottom">
	            
	               <!-- 페이징 처리 -->
	               <div class="review_pagination">
	                  <!-- <a href="#">&laquo;</a> <a href="#">1</a> <a href="#"
	                     class="active">2</a> <a href="#">3</a> <a href="#">4</a> <a
	                     href="#">5</a> <a href="#">&raquo;</a> -->
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
 			  </div>
        </div>

		<!-- account-wrap -->
		 <%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
</body>
</html>