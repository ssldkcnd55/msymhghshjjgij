<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="MyHtml">
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/farm/resources/css/customerMy/cusqna.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<script type="text/javascript">

function market(page){
	$.ajax({
		url:"cus_qna_list.do",
		type:"post",
		data:{
			page:1,
			member_id : '${loginUser.member_id}'
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>날짜</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td><a target='_blank' href='/farm/marketQnaDetail.do?qna_no="+jsonObj.list[i].market_qna_no+"'>"+jsonObj.list[i].market_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].market_qna_question_date+"</td></tr>";
			}
			$(".View_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:marketQnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:marketQnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:marketQnaPage("+(endPage+1)+")'>&raquo;</a>";
				
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
function marketQnaPage(page){
	$.ajax({
		url:"cus_qna_list.do",
		type:"post",
		data:{
			page:page,
			member_id : '${loginUser.member_id}'
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>날짜</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td><a target='_blank' href='/farm/marketQnaDetail.do?qna_no="+jsonObj.list[i].market_qna_no+"'>"+jsonObj.list[i].market_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].market_qna_question_date+"</td></tr>";
			}
			$(".View_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:marketQnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:marketQnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:marketQnaPage("+(endPage+1)+")'>&raquo;</a>";
				
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

function main(){
	$.ajax({
		url:"mainqnaList.do",
		type:"post",
		data:{
			page:1,
			member_id : '${loginUser.member_id}'
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>날짜</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td><a href='/farm/qnaDetail.do?main_qna_no="+jsonObj.list[i].main_qna_no+"'>"+jsonObj.list[i].main_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].main_qna_date+"</td></tr>";
			}
			$(".View_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:mainQnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:mainQnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:mainQnaPage("+(endPage+1)+")'>&raquo;</a>";
				
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
function mainQnaPage(page){
	$.ajax({
		url:"mainqnaList.do",
		type:"post",
		data:{
			page:page,
			member_id : '${loginUser.member_id}'
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>날짜</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td><a href='/farm/qnaDetail.do?main_qna_no="+jsonObj.list[i].main_qna_no+"'>"+jsonObj.list[i].main_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].main_qna_date+"</td></tr>";
			}
			$(".View_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:mainQnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:mainQnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:mainQnaPage("+(endPage+1)+")'>&raquo;</a>";
				
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

function auction(){
	$.ajax({
		url:"cus_auction_qna_list.do",
		type:"post",
		data:{
			page:1,
			member_id : '${loginUser.member_id}'
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>작성일</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td><a href='/farm/moveauctionQnADetail.do?auction_qna_no="+jsonObj.list[i].auction_qna_no+"'>"+jsonObj.list[i].auction_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].auction_qna_question_date+"</td></tr>";
			}
			$(".View_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:auctionQnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:auctionQnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:auctionQnaPage("+(endPage+1)+")'>&raquo;</a>";
				
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

function auctionQnaPage(page){
	$.ajax({
		url:"cus_auction_qna_list.do",
		type:"post",
		data:{
			page:page,
			member_id : '${loginUser.member_id}'
		},
		dataType: "JSON",
		success: function(data){
			console.log(data);
			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<tr><th width='12%'>번호</th><th width='50%'>제목</th><th width='13%'>작성자</th><th width='15%'>작성일</th></tr>";
			
			for(var i in jsonObj.list){
				outValues += "<tr id='hover'><td>"+jsonObj.list[i].rnum+"</td>"
				+"<td><a href='/farm/moveauctionQnADetail.do?auction_qna_no="+jsonObj.list[i].auction_qna_no+"'>"+jsonObj.list[i].auction_qna_title+"</a></td>"
				+"<td>"+jsonObj.list[i].member_id+"</td><td>"+jsonObj.list[i].auction_qna_question_date+"</td></tr>";
			}
			$(".View_table").html(outValues);	
			
			var startPage= jsonObj.list[0].startPage;
			var endPage = jsonObj.list[0].endPage;
			var maxPage = jsonObj.list[0].maxPage;
			var currentPage = jsonObj.list[0].currentPage;
			
			var values ="";
			if(startPage>5){
				values+= "<a href='javascript:auctionQnaPage("+(startPage-1)+")'>&laquo;</a>" 
			}else{
				values+="<a>&laquo;</a>";	
			}
			for(var i=startPage;i<=endPage;i++  ){
				if(i==currentPage){
					values+= "<a class='active'>"+i+"</a>";
				}else{
					values+= "<a href='javascript:auctionQnaPage("+i+");'>"+i+"</a>";
				}
			}
			if(endPage<maxPage){
				values+="<a href='javascript:auctionQnaPage("+(endPage+1)+")'>&raquo;</a>";
				
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
$(function (){
	market();
	$('select').change(function(){
		if($('select option:selected').val() == 'Market'){
			market();
		}else if($('select option:selected').val() == 'Main'){
			main();
		}else if($('select option:selected').val() == 'Auction'){
			auction();
		}
	})
});

</script>
<meta charset="UTF-8">
<title>title</title>
</head>
<body style="margin:0">
<hr style="margin :0px; border:0.5px solid #7e5957">
	
<select id="sele">
	<option value="Market">Market</option>
	<option value="Main">Main</option>
	<option value="Auction">Auction</option>
</select>

<table class="View_table" style="margin-left:10px;">
</table>
<div id="bottom">
	<div class="pagination">
    </div>
</div>
</body>
</html>