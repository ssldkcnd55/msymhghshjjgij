/**
 * 
 */
//아이콘 따라다니는 코드
$(function(){

	  $(".sidebox").css("top", $(window).height()-650 );  
	  $(".msgbox").css("top", $(window).height()-676 ); 
	  
 	 var currentPosition = parseInt($(".sidebox").css("top")); 
 	 
	    $(window).scroll(function() { 
	    	 var scrollBottom = $("body").height() - $(window).height() - $(window).scrollTop(); //스크롤바텀값
	       var position = $(window).scrollTop(); 
	      
	      
	     if(scrollBottom > ($("#footer").height() + 60 ) ){
	    	   $(".sidebox").stop().animate({"top":position+currentPosition+"px"},400); 
	    	   $(".msgbox").stop().animate({"top":position+currentPosition+24+"px"},400); 
	    	 }
	     else
	    	 {
	    	 $(".sidebox").css("top",  $("body").height() - ( $("#footer").height()+$(".sidebox").height()+100 ) +"px");
	    	 $(".msgbox").css("top",  $("body").height() -($("#footer").height()+$(".msgbox").height()+100) +"px");
	    	 }
	    });  
	    
	    
 
	}); 

function pageupIcon()
{
	
}

//아이콘 클릭
function msgIcon()
{	
	if( $(".msgIcon").attr("src") == "/farm/resources/images/messenger_icon_green2.png" ){
		
	$(".msgIcon").prop("src","/farm/resources/images/messenger_back_2.png");
	$(".msgbox").css("visibility","visible");
	
	$.ajax({
		url : "getChatList.do",
		type : "post",
		dataType :"json",
		success : function(resultData) {
			$('.msgframe').prop("src","moveMessenger.do");
		

		},
		error : function(request, status, errorData) {
			alert("error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
		}
	});
		
	}else
		{
		$(".msgIcon").prop("src","/farm/resources/images/messenger_icon_green2.png");
		$(".msgbox").css("visibility","hidden");
		}
}

function trans_time(time)
{
	var msg_hour = time.substring(0, 2);

	var msg_min = time.substring(3, 5)
	var msg_time = null;

	if (msg_hour == 00) {
		msg_time = '오전  12';
	} else if (msg_hour < 10) {
		msg_time = '오전  ' + msg_hour.substring(1, 2);
	} else if (msg_hour < 12) {
		msg_time = '오전  ' + msg_hour;

	} else if (msg_hour == 12) {
		msg_time = '오후 ' + msg_hour;
	} else if (msg_hour > 12) {
		msg_time = '오후 ' + (msg_hour - 12);
	}
	msg_time += ":" + msg_min;
	
	return msg_time;
	
}
