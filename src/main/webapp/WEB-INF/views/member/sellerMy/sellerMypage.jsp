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
		$('#selmyframe_'+before).hide();
		
		$('#'+check+' a').css("color","white");
		$('#selmyframe_'+check).show();
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
       <div id="container" class="mypageContainer">
        <div class="tabs">
         <div id="1" class="tab active"><a href="#1">회원정보</a></div>
         <div id="2" class="tab"><a href="#2">구매내역</a></div>
         <div id="3" class="tab"><a href="#3">판매내역</a></div>
         <div id="4" class="tab"><a href="#4">경매내역</a></div>
         <div id="5" class="tab"><a href="#5">QnA</a></div>
         </div>
         
        <div class="inner-wrap" style="margin:0;">
        
        
         
        <div class="info_box">
        <iframe id="selmyframe_1" src="moveSelMemberInfo.do">
        </iframe>
        <iframe id="selmyframe_2" src="moveSelPaymentHistory.do" hidden="true"> 
        </iframe>
        <iframe id="selmyframe_3" src="moveSelmarketHistory.do" hidden="true"> 
        </iframe>
        <iframe id="selmyframe_4" src="moveSelAuctionHistory.do" hidden="true"> 
        </iframe>
        <iframe id="selmyframe_5" src="moveSelQnaList.do" hidden="true"> 
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