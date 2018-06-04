<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/messenger.js"></script>
<script type="text/javascript" src="/farm/resources/js/msg_box.js"></script>
<link href="/farm/resources/css/messenger.css" rel="stylesheet" type="text/css" />



<c:if test="${! empty sessionScope.loginUser}">
<script type="text/javascript">
loginPage();
login_id='${loginUser.member_id}';
my_name = '${loginUser.member_name}';
</script>
</c:if>


<script type="text/javascript">
var list1= '';
var list2 = '';
var list3 = '';
var len=0;
var index=0;
$(function(){
	
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
	var marketNoArray = [];
	for (var i = ca.length - 1; i >= 0; i--) {
		marketNoArray[i]=	ca[i].substring(ca[i].indexOf("=") + 1, ca[i].length-1);
	}
	

	
	var marketNo= { 'marketNo': marketNoArray }; 
	if(marketNo.marketNo.length>0){
	  $.ajax({
		url:"recentViewList.do",
		type:"post",
		data: marketNo,
		dataType : "json",
		success:function(data){
			 var objStr = JSON.stringify(data);
	         var c = JSON.parse(objStr);
	       len=c.ml.length;
	         list1= '';
	         list2= '';
	         list3= '';
	         var rv=c.ml.reverse();
	         for(var i=0 in rv)
	        	 {
	        	 if(i<3)
	        		 {
	        		 list1 += '<a href="marketDetail.do?market_no='+rv[i].no+'"><div class="sh_list'+((i%3)+1)+'" style="background-image: url(\'/farm/resources/upload/marketUpload/'+decodeURIComponent((rv[i].img).replace(/\+/g, '%20'))+'\');"></div><div class="sh1_title">'
	        				+decodeURIComponent((rv[i].title).replace(/\+/g, '%20'))+'</div></a>';
	        		 }
	        	 else if(i<6)
	        		 {
	        		 list2 += '<a href="marketDetail.do?market_no='+rv[i].no+'"><div class="sh_list'+((i%3)+1)+'" style="background-image: url(\'/farm/resources/upload/marketUpload/'+decodeURIComponent((rv[i].img).replace(/\+/g, '%20'))+'\');"></div><div class="sh1_title">'
     				+decodeURIComponent((rv[i].title).replace(/\+/g, '%20'))+'</div></a>';
	        		 }
	        	 else if(i<9)
	        		 {
	        		 list3 += '<a href="marketDetail.do?market_no='+rv[i].no+'"><div class="sh_list'+((i%3)+1)+'" style="background-image: url(\'/farm/resources/upload/marketUpload/'+decodeURIComponent((rv[i].img).replace(/\+/g, '%20'))+'\');"></div><div class="sh1_title">'
     				+decodeURIComponent((rv[i].title).replace(/\+/g, '%20'))+'</div></a>';
	        		 }
	        	 }       
	         $('.page1').html(list1);
	         
	        
	         
		},
		error : function(request, status, errorData) {
			console.log("msg_box.jsp/ onload")
	         console.log("error code : " + request.status + "\n"
	               + "message : " + request.responseText
	               + "\n" + "error : " + errorData);
	      }
	   });   
	}
});


function changeList(order)
{	
	
	

	switch (   index = parseInt ( (index + order) >= 0 ? (index+order) % (Math.ceil(len/3)) : ( Math.ceil(len/3) )-1 )  ) {
	case 0:
		$('.page1').html(list1);
		break;
	case 1:
		$('.page1').html(list2);
		break;
	case 2:
		$('.page1').html(list3);
		
	}
	
}

</script>

</head>
<body>

<c:if test="${ !empty sessionScope.loginUser }">
<span class="msgbox">
<iframe class="msgframe" src="moveMessenger.do"> 
 </iframe> 
</span>
</c:if>
<span  class="sidebox"> 
      <a href="#header" class="move_top_atag">
      <div class="move_top">↑<br>TOP</div></a>
      <br>
      <div class="shoppinglist">
			<!-- 최근본 목록 -->

			<a href="javascript: changeList(+1);"><div class="arrow">▲</div></a>

			<div class="recent_list">최근 본 상품</div>
			
			<div class="page1">
				
			</div>
			<a href="javascript: changeList(-1);"><div class="arrow_bottom">▼</div></a> 
		</div>
		<br>
 <c:if test="${ !empty sessionScope.loginUser }">
  <a href="javascript: msgIcon()" class="msgA"><img class="msgIcon" src="/farm/resources/images/messenger_icon_green2.png">
  
  <c:if test="${! empty chatList}">
					<c:forEach items="${chatList}" var="chat" varStatus="cList" >	
					<c:set var="alarm_count"  value="${chat.chat_history_alarm +alarm_count}" />	
				 	${chat_history_alarm }
					</c:forEach>
					<c:if test="${ alarm_count > 0}">
					<span class="msgAlarm"><c:out value="${alarm_count }"></c:out></span></c:if>
					</c:if>
  </a><br>    
 </c:if>
        </span>


</body>
</html>