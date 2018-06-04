/**
 * 
 */


function sendMsgByMarket (my_id,your_id)
{
	msgIcon();
	  /*insertChat(my_id,your_id);*/
	ws = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?state=msg&your_id=" + your_id + "&chat_no=" + 1);
	ws.onopen = function() {
		ws.send("테스트 메세지입니다4");
	}
}	

function viewSelectBox(){
	var htmlCode = '<div class="viewSelectBox" style="position:absolute;  z-index:10; width:100px; height:80px;"><a href="">상품문의</a><br><a href="">1:1대화</a></div>';
	$('.market_cart_right_div').append(htmlCode);
	
}