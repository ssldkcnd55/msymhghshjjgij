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
.approval{
	border: 1px solid #7e5957;
    background: white;
    color: #7e5957;
    border-radius: 3px;
    height: 28px;
    width: 39%;
}
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
				+"<td>"+jsonObj.list[i].member_name+"</td><td>농업인</td>"
				+"<td><button class='approval' onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
				+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
				+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
				+"</tr>";break;
				case '1' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
				+"<td>"+jsonObj.list[i].member_name+"</td><td>일반회원</td>"
				+"<td> </td>"
				+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
				+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
				+"</tr>";break;
				}
			}
			$(".Member_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:memberPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:memberPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:memberPage("+(endPage+1)+")'>&raquo;</a>";
				
			}else{
				values+="<a>&raquo;</a>";
			}
			$(".pagination").html(values);
			
		},error: function(request,status,errorData){
	        console.log("error code : " + request.status + "\nmessage" + 
	                request.responseText + "\nerror" + errorData);
	       }
	});
});
function memberPage(page){
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
					+"<td>"+jsonObj.list[i].member_name+"</td><td>농업인</td>"
					+"<td><button class='approval' onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					case '1' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
					+"<td>"+jsonObj.list[i].member_name+"</td><td>일반회원</td>"
					+"<td> </td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					
					}
				}
				$(".Member_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:memberPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:memberPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:memberPage("+(endPage+1)+")'>&raquo;</a>";
				
			}else{
				values+="<a>&raquo;</a>";
			}
			$(".pagination").html(values);
			
		},error: function(request,status,errorData){
	        console.log("error code : " + request.status + "\nmessage" + 
	                request.responseText + "\nerror" + errorData);
	       }
	});
}

function change_app(id) {
	//alert(id);
	
	 if (confirm("정말 변경하시겠습니까??") == true){    //확인
		 
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
			$.ajax({
				url:"sellerSendmail.do",
				type:"post",
				data: {email:id},
				success: function() {
				}
			});	
		}else{   //취소
		    return;
		}
}


function change_withdraw(id) {
	
	 if (confirm("정말 변경하시겠습니까??") == true){    //확인
		 
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
					$('#btnwith_'+ m)
				}
			});
					
		 }else{   //취소
		    return;
		}
	
}
//필터적용 메소드
$(function(){
	$("#select_val").change(function(){
	var type = $(this).val();
	
		$.ajax({
			url:"changeList.do",
			type:"post",
			data: {type:type,page:1},
			dataType: "JSON",
			success: function(data) {
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
					+"<td>"+jsonObj.list[i].member_name+"</td><td>농업인</td>"
					+"<td><button class='approval' onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					case '1' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
					+"<td>"+jsonObj.list[i].member_name+"</td><td>일반회원</td>"
					+"<td> </td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					}
				}
				$(".Member_table").html(outValues);	
				
				var startPage= jsonObj.list[0].startPage;
				var endPage = jsonObj.list[0].endPage;
				var maxPage = jsonObj.list[0].maxPage;
				var currentPage = jsonObj.list[0].currentPage;
				var type = jsonObj.list[0].type;
				var values ="";
				if(startPage>5){
					values+= "<a href='javascript:memberChangePage("+(startPage-1)+")'>&laquo;</a>" 
				}else{
					values+="<a>&laquo;</a>";	
				}
				for(var i=startPage;i<=endPage;i++  ){
					if(i==currentPage){
						values+= "<a class='active'>"+i+"</a>";
					}else{
						values+= "<a href='javascript:memberChangePage("+i+");'>"+i+"</a>";
					}
				}
				if(endPage<maxPage){
					values+="<a href='javascript:memberChangePage("+(endPage+1)+")'>&raquo;</a>";
					
				}else{
					values+="<a>&raquo;</a>";
				}
				$(".pagination").html(values);
				
			},error: function(request,status,errorData){
		        console.log("error code : " + request.status + "\nmessage" + 
		                request.responseText + "\nerror" + errorData);
		       }
			
		  });
	}); 
});	 
	
//필터적용 페이징
function memberChangePage(page,type){
	var type = $("#select_val").val();
	
	$.ajax({
		url:"changeList.do",
		type:"post",
		data:{
			page:page,type:type
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
					+"<td>"+jsonObj.list[i].member_name+"</td><td>농업인</td>"
					+"<td><button class='approval' onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					case '1' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
					+"<td>"+jsonObj.list[i].member_name+"</td><td>일반회원</td>"
					+"<td> </td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					}
				}
				$(".Member_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:memberChangePage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:memberChangePage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:memberChangePage("+(endPage+1)+")'>&raquo;</a>";
				
			}else{
				values+="<a>&raquo;</a>";
			}
			$(".pagination").html(values);
			
		},error: function(request,status,errorData){
	        console.log("error code : " + request.status + "\nmessage" + 
	                request.responseText + "\nerror" + errorData);
	       }
	});
}

//검색메소드
function search_member(){
	var keyword = $('#search_keyword').val();
	var type = $('#search_filter').val();
	$.ajax({
		url:"searchMember.do",
		type:"post",
		data:{
			keyword:keyword,type:type,page:1
		},
		dataType: "JSON",
		success: function(data){
			
			console.log(data);
			console.log("검색실행");
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
					+"<td>"+jsonObj.list[i].member_name+"</td><td>농업인</td>"
					+"<td><button class='approval' onclick='change_app( \""+ jsonObj.list[i].member_id +"\" );' id='btnapp_"+ m +"'>"+jsonObj.list[i].member_approval+"</button></td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					case '1' : outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
					+"<td id='Notice_td'><a href='/farm/memberDetail.do?member_id="+jsonObj.list[i].member_id+"'>"+jsonObj.list[i].member_id+"</a></td>"
					+"<td>"+jsonObj.list[i].member_name+"</td><td>일반회원</td>"
					+"<td> </td>"
					+"<td><button class='approval' onclick='change_withdraw(\""+ jsonObj.list[i].member_id +"\")' id='btnwith_" + m +"'>"+jsonObj.list[i].member_withdraw+"</button></td>"
					+"<td>"+jsonObj.list[i].member_warning_count+"</td>"
					+"</tr>";break;
					}
				}
				$(".Member_table").html(outValues);	
			
		}
	});
}
</script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/admin_member.css" />
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
            <div class="title1 member"><p class="titleP">회원관리</p></div>

            <!-- select box -->
            <div class="select_box">
               <select class="select" id="select_val">
                  <option value="1" selected="">모두보기</option>
                  <option value="2">농업인</option>
                  <option value="3">일반회원</option>
                  <option value="4">미승인회원</option>
                  <option value="5">탈퇴회원</option>
                  <option value="6">경고누적수</option>
               </select>
            </div>

            <table class="Member_table">
              
            </table>

            <!-- 하단 페이징, 검색 묶음 -->
            <div id="bottom">
               <!-- 페이징 처리 -->
               <div class="pagination">
                 
               </div>
				
               <!-- 검색 -->
               <!-- <form action="search_member();" method="post"> -->
               <div class="search_box">
               		<select class="select2" id="search_filter">
               			<option value="1">이름</option>
               			<option value="2">ID</option>
              		 </select>
               <span class='green_window'> 
                  <input type='text' class='input_text' id='search_keyword'/>
               </span>
               <button type='submit' class='sch_smit' onclick="search_member();">검색</button>
               </div>
               <!-- </form> -->
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