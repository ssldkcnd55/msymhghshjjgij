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
        <div class="inner-wrap">
        <div class="tabs" style="display:inline-block">
	         <div id="1" class="tab active">회원정보</div>
	         <div id="2" class="tab">경매내역</div>
	         <div id="3" class="tab">구매내역</div>
	         <div id="4" class="tab">QnA</div>
	         <div id="5" class="tab">경매낙찰내역</div>
         </div>
         
        <div class="info_box" >
	        <iframe id="cusmyframe_1" src="moveCusMemberInfo.do">
	        </iframe>
	        <iframe id="cusmyframe_2" src="moveAuctionHistory.do" hidden="true"> 
	        </iframe>
	        <iframe id="cusmyframe_3" src="movePaymentHistory.do" hidden="true"> 
	        </iframe>
	        <iframe id="cusmyframe_4" src="moveQna_List.do" hidden="true"> 
	        </iframe>
	        <iframe id="cusmyframe_5" src="moveAuctionBidding.do" hidden="true"> 
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