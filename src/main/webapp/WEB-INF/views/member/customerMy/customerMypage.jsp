<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/customerMy/mypage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Farm</title>
<script type="text/javascript">
$(function(){
	$('div .tabs .tab').click(function(){
		var before=$('.active').attr("id");
		var check=$(this).attr("id");
		$('div .tabs .tab').removeClass('active');
		
		$(this).addClass('active');
		$('#'+before+' a').css("color","#462114");
		$('#cusmyframe_'+before).hide();
		
		$('#'+check+' a').css("color","white");
		$('#cusmyframe_'+check).show();
	});	
	
	var tab = document.location.href.split('#').pop();
	$('#'+tab+' a').trigger("click");
});
</script>
</head>
<body>
<div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@ include file="../../inc/header.jsp" %>
      </div>
       <div id="container">
        <div class="inner-wrap">
         <div class="tabs">
         <div id="1" class="tab active"><a href="#1">회원정보</a></div>
         <div id="2" class="tab"><a href="#2">경매내역</a></div>
         <div id="3" class="tab"><a href="#3">구매내역</a></div>
         <div id="4" class="tab"><a href="#4">QnA</a></div>
         </div>
         
        <div class="info_box">
        <iframe id="cusmyframe_1" src="moveMemberInfo.do">
        </iframe>
        <iframe id="cusmyframe_2" src="auctionHistory.do" hidden="true"> 
        </iframe>
        <iframe id="cusmyframe_3" src="paymentHistory.do" hidden="true"> 
        </iframe>
        <iframe id="cusmyframe_4" src="moveQna_List.do" hidden="true"> 
        </iframe>
         <!-- <hr class="hr1"> -->      
        </div>
         
         </div>         
        </div>      
         <%@ include file="../../messenger/msg_box.jsp"%>
        <div id="footer">
         <%@  include file="../../inc/foot.jsp"%>
      </div>
      </div>
</body>
</html>