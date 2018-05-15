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
	}else
		{
		$(".msgIcon").prop("src","/farm/resources/images/messenger_icon_green2.png");
		$(".msgbox").css("visibility","hidden");
		}
}


