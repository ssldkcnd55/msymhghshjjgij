<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: gray;}
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 42%;
	padding: 16px;
	border: 16px solid #7e5957;
	background-color: white;
	overflow: auto;	
}

.report_textarea {
	width: 99%; 
	height: 135px; 
	margin-bottom: 15px;
	border: 2px solid #adabab;
	
}

.report_close {
	border: none;
    width: 13%;
    height: 33px;
    border-radius: 7px;
    /* color: black; */
    background: #7e59575e;
}

.report {
	border: 1px solid #7e5957;
    background: white;
    color: #7e5957;
    border-radius: 3px;
    height: 36px;
}
</style> 
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!-- Notice.css -->
<script>
$(function(){
	$.ajax({
		url:'reportList.do',
		type:'post',
		data:{page:1
		},
		dataType:'json',
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='8%'>번호</th><th width='10%'>분류</th><th width='15%'>신고된 후기</th>"
							+"<th width='13%'>신고내용</th><th width='12%'>신고날짜</th><th width='10%'>처리 상황</th><th width='8%'>처리</th></tr>";
			
		 	for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'>"+jsonObj.list[i].report_category+"</td>"
				+"<td><a href='reviewDeatil.do?review_no="+jsonObj.list[i].review_no+"'>리뷰페이지로<a/></td>"
				+"<td><button id='"+jsonObj.list[i].report_contents+"' onclick='viewContents(this);' class='report'>신고내용보기</button></td>"
				+"<td>"+jsonObj.list[i].report_date+"</td><td id='st"+jsonObj.list[i].report_no+"'>"+jsonObj.list[i].report_status+"</td>"
				+"<td><button id='"+jsonObj.list[i].report_no+"' onclick='changeStatus(this);' class='report'>신고처리</button></td></tr>";
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
		url:"reportList.do",
		type:"post",
		data:{
			page:page
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='8%'>번호</th><th width='10%'>분류</th><th width='15%'>신고된 후기</th>"
				+"<th width='13%'>신고내용</th><th width='12%'>신고날짜</th><th width='10%'>처리 상황</th><th width='8%'>처리</th></tr>";

			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'>"+jsonObj.list[i].report_category+"</td>"
				+"<td><a href='reviewDeatil.do?review_no="+jsonObj.list[i].review_no+"'>리뷰페이지로<a/></td>"
				+"<td><button class='report' id='"+jsonObj.list[i].report_contents+"' onclick='viewContents(this);'>신고내용보기</button></td>"
				+"<td>"+jsonObj.list[i].report_date+"</td><td id='st"+jsonObj.list[i].report_no+"'>"+jsonObj.list[i].report_status+"</td>"
				+"<td><button class='report' id='"+jsonObj.list[i].report_no+"' onclick='changeStatus(this);'>신고처리</button></td></tr>";
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
 

function modal() {
	location.href = "#open";
}

function closemodal() {
	location.href = "#close";
}

function viewContents(str) {
	
	var report_contents = str.id; 
	$("#report_contents").text(report_contents);
	location.href = "#open";
	
}

function changeStatus(str) {
	var report_no = str.id;
	var con = confirm("상태 변경 처리 하시겠습니까?"); 
	
	if(con == true) {
		$.ajax({
			url:"changeReportStatus.do",
			type:"post",
			data:{
				report_no:report_no
			},
			dataType: "JSON",
			success: function(data){
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				$("#st"+jsonObj.report_no).text(jsonObj.report_status);
				alert("처리완료!");
			}
				
		});
	}else {
		return;
	}
	
}


//필터적용메소드
$(function(){
	$("#select_val").change(function(){
	var type = $(this).val();
		alert(type);
		$.ajax({
			url:"changeReportList.do",
			type:"post",
			data: {type:type,page:1},
			dataType: "JSON",
			success: function(data){
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);
				
				var outValues = "<tr><th width='8%'>번호</th><th width='10%'>분류</th><th width='15%'>신고된 후기</th>"
								+"<th width='13%'>신고내용</th><th width='12%'>신고날짜</th><th width='10%'>처리 상황</th><th width='8%'>처리</th></tr>";
				
			 	for(var i in jsonObj.list){
					outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'>"+jsonObj.list[i].report_category+"</td>"
					+"<td><a href='reviewDeatil.do?review_no="+jsonObj.list[i].review_no+"'>리뷰페이지로<a/></td>"
					+"<td><button class='report' id='"+jsonObj.list[i].report_contents+"' onclick='viewContents(this);'>신고내용보기</button></td>"
					+"<td>"+jsonObj.list[i].report_date+"</td><td id='st"+jsonObj.list[i].report_no+"'>"+jsonObj.list[i].report_status+"</td>"
					+"<td><button class='report' id='"+jsonObj.list[i].report_no+"' onclick='changeStatus(this);'>신고처리</button></td></tr>";
				} 
				$(".Notice_table").html(outValues);
				
				
				var startPage= jsonObj.list[0].startPage;
				var endPage = jsonObj.list[0].endPage;
				var maxPage = jsonObj.list[0].maxPage;
				var currentPage = jsonObj.list[0].currentPage;
				
				var values ="";
				if(startPage>5){
					values+= "<a href='javascript:reportChangePage("+(startPage-1)+")'>&laquo;</a>" 
				}else{
					values+="<a>&laquo;</a>";
				}
				for(var i=startPage;i<=endPage;i++  ){
					if(i==currentPage){
						values+= "<a class='active'>"+i+"</a>";
					}else{
						values+= "<a href='javascript:reportChangePage("+i+");'>"+i+"</a>";
					}
				}
				if(endPage<maxPage){
					values+="<a href='javascript:reportChangePage("+(endPage+1)+")'>&raquo;</a>";
					
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
	});
	
	
function reportChangePage(page){
	var type = $("#select_val").val();
	$.ajax({
		url:"changeReportList.do",
		type:"post",
		data:{
			page:page,type:type
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='8%'>번호</th><th width='10%'>분류</th><th width='15%'>신고된 후기</th>"
				+"<th width='13%'>신고내용</th><th width='12%'>신고날짜</th><th width='10%'>처리 상황</th><th width='8%'>처리</th></tr>";

			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'>"+jsonObj.list[i].report_category+"</td>"
				+"<td><a href='reviewDeatil.do?review_no="+jsonObj.list[i].review_no+"'>리뷰페이지로<a/></td>"
				+"<td><button class='report' id='"+jsonObj.list[i].report_contents+"' onclick='viewContents(this);'>신고내용보기</button></td>"
				+"<td>"+jsonObj.list[i].report_date+"</td><td id='st"+jsonObj.list[i].report_no+"'>"+jsonObj.list[i].report_status+"</td>"
				+"<td><button class='report' id='"+jsonObj.list[i].report_no+"' onclick='changeStatus(this);'>신고처리</button></td></tr>";
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
               <select class="select" id="select_val">
                  <option value="0" selected="">모두보기</option>
                  <option value="1">불량/욕설</option>
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
				
				
					<!--신고 모달창  -->
    					<div class="white_content" id="open">
        					<div>
            					<h1>신고내용</h1>
            						<div>
            							<div id="report_contents" class="report_textarea">신고내용</div>
            						</div>
            						<div style="text-align: center;">
            							<button onclick="closemodal();" class="report_close">닫기</button>
            						</div>
        					</div>
    					</div>
    					
					<!-- 신고 모달창 끝 -->
               <!-- 검색 -->
               <div class="search_box">
               <!-- <span class='green_window'> 
                  <input type='text'class='input_text' />
               </span>
               <button type='submit' class='sch_smit'>검색</button> -->
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