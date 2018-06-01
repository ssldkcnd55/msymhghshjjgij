<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: green;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: gray;}
</style> 
<script type="text/javascript" src="/farm/resources/js/date.js"></script>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!-- Notice.css -->
<script>
$(function(){
	$.ajax({
		url:"noticeList.do",
		type:"post",
		data:{
			page:1
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>후기 제목</th>"
							+"<th width='13%'>신고내용</th><th width='15%'>신고날짜</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'><a href='/farm/noticeDetail.do?notice_no="+jsonObj.list[i].notice_no+"'>"+jsonObj.list[i].notice_title+"</a></td>"
				+"<td>운영자</td><td>"+jsonObj.list[i].notice_date+"</td></tr>";
			}
			$(".Notice_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:noticePage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:noticePage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:noticePage("+(endPage+1)+")'>&raquo;</a>";
				
			}else{
				values+="<a>&raquo;</a>";
			}
			$(".pagination").html(values);
			
		},error: function(request,status,errorData){
	        alert("error code : " + request.status + "\nmessage" + 
	                request.responseText + "\nerror" + errorData);
	       }
	});
});
function noticePage(page){
	$.ajax({
		url:"noticeList.do",
		type:"post",
		data:{
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
				+"<td id='Notice_td'><a href='/farm/marketNoticeDetail.do?notice_no="+jsonObj.list[i].notice_no+"'>"+jsonObj.list[i].notice_title+"</a></td>"
				+"<td>운영자</td><td>"+jsonObj.list[i].notice_date+"</td></tr>";
			}
			$(".Notice_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:noticePage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:noticePage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:noticePage("+(endPage+1)+")'>&raquo;</a>";
				
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


<script type="text/javascript">
function testdate(){
	/* var d = Date.today().next().thursday();
	var d2 = Date.today().add(5).days(); */
	var d1 = Date.parse('07.15.2019');
	var n = -2;
	/* var d2 = Date.today().set({ day: 15, hour: 8, minute: 30 }); */
	var d2 = d1.add(n).hour();
	
	alert(d2);	
}
 


</script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/notice.css" />
<meta charset="UTF-8">
<title>Farm 신고관리</title>
</head>
<body>

<div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@ include file="../inc/header.jsp" %>
      </div>
      <div id="container">
         <div class="inner-wrap">
         <div class="board-wrap">
            <div class="title1 notice"><p class="titleP">신고관리</p></div>

            <!-- select box -->
            <div class="select_box">
               <select class="select">
                  <option value="1" selected="">불량/욕설</option>
                  <option value="2">허위사실</option>
                  <option value="3">처리완료</option>
                  <option value="4">처리중</option>
               </select>
            </div>

            <table class="Notice_table">
              
            </table>

            <!-- 하단 페이징, 검색 묶음 -->
            <div id="bottom">
               <!-- 페이징 처리 -->
               <div class="pagination">
                 
               </div>
				
				
				<!--  -->
				<div id="testdate" style="width: 40%; height: 350px; border:1px solid black;"></div>
				<button onclick="testdate();">ㅇㅇ</button>
				<!--  -->
				
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
      <!-- container끝 -->
 <%@ include file="../messenger/msg_box.jsp"%>
      <div id="footer">
         <%@  include file="../inc/foot.jsp" %>
      </div>
   </div>
   <!-- wrap끝  -->
</body>
</html>