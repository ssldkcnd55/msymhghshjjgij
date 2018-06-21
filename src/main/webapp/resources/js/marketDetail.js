/**
 * 
 */

/*function sendMsgByMarket (my_id,your_id)
{
	msgIcon();
	  insertChat(my_id,your_id);
	ws = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?state=msg&your_id=" + your_id + "&chat_no=" + 1);
	ws.onopen = function() {
		ws.send("테스트 메세지입니다4");
	}
}	*/

function viewSelectBox(){
	var htmlCode = '<div class="viewSelectBox" style="position:absolute;  z-index:10; width:100px; height:80px;"><a href="">상품문의</a><br><a href="">1:1대화</a></div>';
	$('.market_cart_right_div').append(htmlCode);
	
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 function countOperator(op)
{	
	 var amount=Number($('.flow_order_stock span').text());
	$(".flow_order_count").val(Number( $(".flow_order_count").val())+Number(op));
	if($(".flow_order_count").val()<1)
		{
		$(".flow_order_count").val(1);
		}
	else if ($(".flow_order_count").val()>amount)
		{
		alert("수량을 초과하였습니다.");
		$(".flow_order_count").val(amount);
		}
	$('.flow_order_total_price').text( numberWithCommas($(".flow_order_count").val() * uncomma($('.flow_order_price span').text()) ));
}	
 
$(function(){
	$('.flow_order_total_price').text( $(".flow_order_count").val() * $('.flow_order_price span').text() );
	$('.goods-view-show-option-button').on('click',function(){
	 if( $('.goods-view-show-option-button').css("top") == '-70px')
		$('.goods-view-show-option-button').css("top","-100px");
	 else 
		 $('.goods-view-show-option-button').css("top","-70px");
	 });
	
	
});
	 
 
/*최근본상품*/
$(function(){
	var time = new Date();
	time.setDate(time.getDate() + 7);
	var oldtime = new Date();
	oldtime.setDate(oldtime.getDate() - 7);
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
	var market_no= $('#market_no').val();
		
	if (document.cookie.indexOf(  'farm_cookie_'+market_no + "="+ market_no + "a") == -1) {
		//없음
		if (ca.length > 8) {
			document.cookie = ca[0] + "; expires=" + oldtime;
		}
	} else {
		//있음
		document.cookie = 'farm_cookie_'+market_no + "=" + market_no+ "a; expires=" + oldtime;
	}

	document.cookie = 'farm_cookie_'+ market_no + "=" + market_no+ "a; expires=" + time;


}); 
///쿠키 끝///

//장바구니 (현준)//
function addBasket()
{
$.ajax({
	url:"addSoppingBasket.do",
	type:"post",
	data:{
		market_no: $('[name=market_no]').val(),
		member_id: $('[name=member_id]').val(),
		buy_amount: $('[name=buy_amount]').val()
	},
	success:function(){
		$('#myModal').css("display","block");
	},
	error: function(request,status,errorData){
		console.log("marketDetail.jsp / addBasket();")
		console.log("error code : " + request.status + "\nmessage" + 
                request.responseText + "\nerror" + errorData);
       }
});
}
function closeModal()
{
$('#myModal').css("display","none");
}
 
 //////////////////////////메시지보내기
function sendProductMsg(my_id,your_id){

	$('.msgframe').get(0).contentWindow.insertChat(my_id,your_id);
	if (
			  $(".msgIcon").attr("src") == "/farm/resources/images/messenger_icon_green2.png") {
		      $(".msgIcon")
		            .prop("src", "/farm/resources/images/messenger_back_2.png");
		      $(".msgbox").css("visibility", "visible");
		      loadListPage();
		   }
	if(my_id!=your_id){
	var msg="";
	////
	var msg = '<div class="qes_alarm_head"><img src="/farm/resources/images/sell_icon_white.png" />상품 문의</div>';
	msg+='<img class="qes_alarm_img" style="width:180px; margin-top:4px;" src="/farm/resources/upload/marketUpload/'+m_img+'">';	
	msg+='<table class="qes_alarm_table"><tr><td>상품명</td><td>사과</td></tr>';
	msg+='<tr><td>가격</td><td>3000원</td></tr>';
	msg+='</table>';
	////
	setTimeout(function() {
		 $('.msgframe').get(0).contentWindow.ws.send(msg);
		 },100);
	}
}
function sendMsg(my_id,your_id)
{
	
	$('.msgframe').get(0).contentWindow.insertChat(my_id,your_id);
	if ( $(".msgIcon").attr("src") == "/farm/resources/images/messenger_icon_green2.png") {
		      $(".msgIcon")
		            .prop("src", "/farm/resources/images/messenger_back_2.png");
		      $(".msgbox").css("visibility", "visible");
		      loadListPage();

		   }
	
}