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

<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!-- Notice.css -->
<script>
$(function(){
	$.ajax({
		url:"memberList.do",
		type:"post",
		data:{
			page:1
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='25%'>ID</th><th width='13%'>이름</th>"
			+"<th width='10%'>분류</th><th width='10%'>승인상태</th>"
			+"<th width='10%'>탈퇴여부</th><th width='20%'>경고횟수</th></tr>";
			
			for(var i in jsonObj.list){
				var member_id = jsonObj.list[i].member_id;
				var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
				var m = member_id.replace(regExp,"");
				
				switch(jsonObj.list[i].member_category){
				
				case '0' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
				+"<td>"+jsonObj.list[i].member_name+"</td><td>농업인"+jsonObj.list[i].member_category+"</td>"
				+"<td><button onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
				+"<td><button onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
				+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
				+"</tr>";break;
				case '1' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
				+"<td>"+jsonObj.list[i].member_name+"</td><td>일반회원"+jsonObj.list[i].member_category+"</td>"
				+"<td><button onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
				+"<td><button onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
				+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
				+"</tr>";break;
				case '2' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
				+"<td>"+jsonObj.list[i].member_name+"</td><td>관리자"+jsonObj.list[i].member_category+"</td>"
				+"<td><button onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
				+"<td><button  onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
				+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
				+"</tr>";break;
				}
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
		url:"memberList.do",
		type:"post",
		data:{
			page:page
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='25%'>ID</th><th width='13%'>이름</th>"
				+"<th width='10%'>분류</th><th width='10%'>승인상태</th>"
				+"<th width='10%'>탈퇴여부</th><th width='20%'>경고횟수</th></tr>";
				
				for(var i in jsonObj.list){
					var member_id = jsonObj.list[i].member_id;
					var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
					var m = member_id.replace(regExp,"");
					
					switch(jsonObj.list[i].member_category){
					
					case '0' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
					+"<td>"+jsonObj.list[i].member_name+"</td><td>농업인"+jsonObj.list[i].member_category+"</td>"
					+"<td><button onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
					+"<td><button onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					case '1' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
					+"<td>"+jsonObj.list[i].member_name+"</td><td>일반회원"+jsonObj.list[i].member_category+"</td>"
					+"<td><button onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
					+"<td><button onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					case '2' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
					+"<td>"+jsonObj.list[i].member_name+"</td><td>관리자"+jsonObj.list[i].member_category+"</td>"
					+"<td><button onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
					+"<td><button onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					}
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

function change_app(id) {
	//alert(id);
	$.ajax({
		url:"change_app.do",
		type:"post",
		data: {member_id:id},
		dataType: "JSON",
		success: function(data) {
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			console.log(jsonObj.member_approval);
			var member_id = jsonObj.member_id;
			var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
			var m = member_id.replace(regExp,"");
			$('#btnapp_'+ m).text(jsonObj.member_approval);
		}
		
		
	});
	
}


function change_withdraw(id) {
	$.ajax({
		url:"change_withdraw.do",
		type:"post",
		data: {member_id:id},
		dataType: "JSON",
		success: function(data) {
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			console.log(jsonObj.member_withdraw);
			var member_id = jsonObj.member_id;
			var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
			var m = member_id.replace(regExp,"");
			$('#btnwith_'+ m).text(jsonObj.member_withdraw);
		}
		
		
	});
}
</script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/notice.css" />
<meta charset="UTF-8">
<title>회원관리</title>
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
            <div class="title1 notice"><p class="titleP">회원관리</p></div>

            <!-- select box -->
            <div class="select_box">
               <select class="select">
                  <option value="1" selected="">최근등록순</option>
                  <option value="2">좋아요많은순</option>
                  <option value="3">조회많은순</option>
               </select>
            </div>

            <table class="Notice_table">
              
            </table>

            <!-- 하단 페이징, 검색 묶음 -->
            <div id="bottom">
               <!-- 페이징 처리 -->
               <div class="pagination">
                 
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
      <!-- container끝 -->
 <%@ include file="../messenger/msg_box.jsp"%>
      <div id="footer">
         <%@  include file="../inc/foot.jsp" %>
      </div>
   </div>
   <!-- wrap끝  -->
</body>
</html>