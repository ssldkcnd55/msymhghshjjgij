/**
 * 
 */
var ws_main = null;
/*var ws = null;*/
var login_id = null;


/**/
Notification.requestPermission().then(function(result) {
	if (result === 'denied') {
		return;
	}
	if (result === 'default') {		
		return;
	}
});


/**/

function loadListPage()
{
   $.ajax({
      url : "getChatList.do",
      type : "post",
      dataType : "json",
      success : function(resultData) {

         var objStr = JSON.stringify(resultData);
         var c = JSON.parse(objStr);
         var a_count = 0;
         var con = '';
         // //
         if (c.cl.length > 0) {
            for ( var i in c.cl) {
               a_count += c.cl[i].alarm;

               con += '<a href=\'javascript: move_msg_table('
                     + c.cl[i].chat_no
                     + ',"'
                     + login_id
                     + '","'
                     + c.cl[i].member_id
                     + '" );\'>';
               con += '<table><tr><td class="list_profile" rowspan="2"><img src="/farm/resources/upload/memberUpload/'
                     + decodeURIComponent((c.cl[i].member_img)
                           .replace(/\+/g, '%20'))
                     + '"></td>';
               con += '<td class="list_name">'
                     + decodeURIComponent((c.cl[i].member_name)
                           .replace(/\+/g, '%20'))
                     + '</td>';
               con += '<td class="list_time">'
                     + trans_time(c.cl[i].date.slice(-5))
                     + '</td></tr>';
           	if( decodeURIComponent((c.cl[i].contents).replace(/\+/g, '%20')).indexOf("openImgPage(") != -1 ){
				con += '<tr><td colspan="2"><span class="list_content"><img class="list_content_img_icon" src="resources/upload/chatUpload/img_icon.png"><span class="list_content_img_span">사진</span></span>';
			}else if(decodeURIComponent((c.cl[i].contents).replace(/\+/g, '%20')).indexOf("openFilePage") != -1)
			{
				con += '<tr><td colspan="2"><span class="list_content"><img class="list_content_img_icon" src="resources/upload/chatUpload/file_down_icon.png"><span class="list_content_img_span">파일</span></span>';
				}
           	else{
			con += '<tr><td colspan="2"><span class="list_content">'+decodeURIComponent((c.cl[i].contents).replace(/\+/g, '%20')) + '</span>';
			}
               if (c.cl[i].alarm > 0) {
                  con += '<span class="list_alarm">'
                        + c.cl[i].alarm + '</span>';
               }
               con += '</td></tr></table></a>';

            }
            $('.msgframe').contents().find(
                  '.chat_list_table').html(con);
         } else {
            $('.msgframe').contents().find(
                  '.chat_list_table')
                  .html('<div class="searchNotFoundID">진행중인 대화가 없습니다.</div><div class="searchNotFoundMsg">아이디 또는 이름을 검색하여 대화를 시작하세요.</div></div>');
         }

         ///
         
         if (a_count > 0) {
            if ($('.msgAlarm').html() == undefined) {
               $('.msgA').append(
                     '<span class="msgAlarm">' + a_count
                           + '</span>');
            } else {
               $('.msgAlarm').text(a_count);
            }
            //alert("dddd");
            //alert(  $('.msgframe').contents().find('.messenger_back_th').html()  )
            $('.msgframe').contents().find('.messenger_back_th').html('<div class="messenger_back_count">'+a_count+'</div>');
            
         }else
            {
            if ($('.msgAlarm').html() != undefined)
               {
               $('.msgA').html('<img class="msgIcon" src="/farm/resources/images/messenger_back_2.png">')
               }
            $('.msgframe').contents().find('.msgA').html('');
            }

      },
      error : function(request, status, errorData) {
    	  console.log("msg_box.js / loadListPage()");
         console.log("error code : " + request.status + "\n"
               + "message : " + request.responseText
               + "\n" + "error : " + errorData);
      }
   });   
}

function loginPage() {
   ws_main = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?state=login");

   ws_main.onmessage = function(event) {
      if (event.data == 'new') {
    	  
         loadListPage();
      }
      else if (event.data =='mom')
    	  {
    	  loadListPage();
    	  }
      else if(event.data =='sel'){
    	  /**/
    	  var title = "판매알람";
    	  var options = {
    	  	body : my_name+"회원님의 상품이 판매되었습니다.",
    	  	icon : "/farm/resources/images/Farmlogo.png"
    	  }

    	  var myNotification = new Notification(title, options);
    	  myNotification.onclick = function(event) {
    	  	  event.preventDefault(); 
    	  	  window.open('판매상세페이지.do', '_blank');
    	  	}
    	  /**/
      }
   }
}

// 아이콘 따라다니는 코드
$(function() {

   $(".sidebox").css("top", $(window).height() - 700);
   $(".msgbox").css("top", $(window).height() - 650);

   var currentPosition = parseInt($(".sidebox").css("top"));

   $(window).scroll(
         function() {
            var scrollBottom = $("body").height() - $(window).height()
                  - $(window).scrollTop(); // 스크롤바텀값
            var position = $(window).scrollTop();

            if (scrollBottom > ($("#footer").height() + 60)) {
               $(".sidebox").stop().animate({
                  "top" : position + currentPosition + "px"
               }, 400);
               $(".msgbox").stop().animate({
                  "top" : position + currentPosition + 24 + "px"
               }, 400);
            } else {
               $(".sidebox").css(
                     "top",
                     $("body").height()
                           - ($("#footer").height()
                                 + $(".sidebox").height() + 100)
                           + "px");
               $(".msgbox").css( "top",
                     $("body").height() - ($("#footer").height() + $(".msgbox").height() + 100) + "px");
            }
         });

});

function pageupIcon() {

}

// 아이콘 클릭
function msgIcon() {
   if (
	  $(".msgIcon").attr("src") == "/farm/resources/images/messenger_icon_green2.png") {
      $(".msgIcon")
            .prop("src", "/farm/resources/images/messenger_back_2.png");
      $(".msgbox").css("visibility", "visible");
      loadListPage();

   } else {
      $(".msgIcon").prop("src",
            "/farm/resources/images/messenger_icon_green2.png");
      $(".msgbox").css("visibility", "hidden");

      
   }
}

function trans_time(time) {
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