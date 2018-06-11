/**
 * 
 */



function printInfoRelief() {
	$('.InfoReliefDiv').css("display", "block");
}
function removeInfoRelief() {
	$('.InfoReliefDiv').css("display", "none");
}

function findAddr() {
	new daum.Postcode({
		oncomplete : function(data) {
			$('#new_user_addr').val(data.postcode + " " + data.address);
		}
	}).open();
}


$(function() {
	
	$('#order_price').text(numberWithComma(order_price) + "원");
	$('#total_price').text(numberWithComma(order_price + delivery_price) + "원");

	$('[name=delivery]').change(function() {
		if ($(this).val() == 'original_delivery') {
			$('.infoTable').removeAttr("hidden");
			$('.newInfo').prop("hidden", "hidden");
		} else {
			$('.newInfo').removeAttr("hidden");
			$('.infoTable').prop("hidden", "hidden");
		}
	});

	$('#request')
			.change(
					function() {
						if ($('#request').val() == '직접 입력') {

							$('#request')
									.after(
											'<div id="dir_req" class="messagebox" hidden="hidden"><input type="text"  name="message" placeholder=" 배송 요청 사항을 입력해주세요"> </div>');
						} else {
							$('#dir_req').remove();
						}

					});
	$('#new_request')
			.change(
					function() {
						if ($('#new_request').val() == '직접 입력') {

							$('#new_request')
									.after(
											'<div id="new_dir_req" class="messagebox" hidden="hidden"><input type="text"  name="message" placeholder=" 배송 요청 사항을 입력해주세요"> </div>');
						} else {
							$('#new_dir_req').remove();
						}

					});

});

function numberWithComma(a) {// 숫자 천단위 콤마
	return a.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function payment() {

	
	
	var product_name = $('.product_title_strong:first').text();
	var name;
	var tel;
	var addr;
	var request;
	
	if ($('.product_title_strong').length > 1) {
		product_name += "외 " + ($('.product_title_strong').length - 1) + "종";		
	}
	if ($('[name=delivery]:checked').val() == "original_delivery") {
		name=$('#user_name').val();
		tel=$('#user_phone').val();
		addr=$('#user_addr').val();
		if ($('#request').val() == '직접 입력'){
		request=$('#dir_req input').val();}
		else{
		request=$('#request').val();}
			
	} else {
		name=$('#new_user_name').val();
		if(name=='')
			{
			alert('이름을 입력하세요.');
			return;
			}
		tel=$('#new_user_phone').val();
		if(tel=='')
			{
			alert('연락처를 입력하세요.');
			return;
			}
		if($('#new_user_addr').val()=='')
			{
			alert('주소를 입력하세요.');
			return;
			}
		if($('#new_user_addr_detail').val()=='')
			{
			alert('상세주소를 입력하세요.')
			return;
			}
		addr=$('#new_user_addr').val()+" "+$('#new_user_addr_detail').val();
		if ($('#new_request').val() == '직접 입력'){
			request=$('#new_dir_req input').val();}
			else{
			request=$('#new_request').val();}
	}
	

	
	//group_no를 얻기위해 첫번째 상품만 가 등록한다.
	//이후 결제가 완료되면 해당 group_no로 다른 상품도 등록
	//만약 결제가 실패하면 등록했던 첫번째 상품 삭제
	$.ajax({
		url:"insertFirstPayment.do",
		type : "post",
		data:{
			market_no : product_market_no[0],
			member_id : my_id,
			buy_amount : product_buy_amount[0]
		},
		success:function(data){
			console.log("name:"+product_name);
			var group_no = data;
			var IMP = window.IMP;
			IMP.init('imp31374305');

			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : product_name,
				amount : /*order_price + delivery_price*/100,
				buyer_email : my_id,
				buyer_name : name,
				buyer_tel : tel,
				buyer_addr : addr,
			}, function(rsp) {
				if (rsp.success) {
	
					////////////////////본 결제
					var objList=[];
					for(var i=0; i < product_market_no.length; i++)
						{
						var obj = new Object();
						obj={'group_no':group_no, 'market_no':product_market_no[i],'member_id':my_id,'buy_amount':product_buy_amount[i],'buy_addr': addr,'buy_tel':tel,'buy_name':name,'buy_request':request};
						objList.push(JSON.stringify(obj) );
						}
				
					$.ajax({
							url: "insertNewPayment.do",
							type: "post",
							dataType:"json",
							data: { "objList" : JSON.stringify(objList), "sellerInfo":JSON.stringify(sellerInfo)},					
							success: function(resultData) {

								var objStr = JSON.stringify(resultData);
								var c = JSON.parse(objStr);
								var ws=[];
								var msgList=[];
								for(var i in c.rl)
									{
									var msg = '<div class="sell_alarm_head"><img src="/farm/resources/images/sell_icon_white.png" />판매 알림</div>';
									msg+='<img class="sell_alarm_img" style="width:180px; margin-top:4px;" src="/farm/resources/upload/marketUpload/'+c.rl[i].img+'">';	
									msg+='<table class="sell_alarm_table"><tr><th colspan="2"><font class="sell_alarm_name">'+c.rl[i].member_name+'</font>님의<br>상품이 판매되었습니다.</th></tr>';
									msg+='<tr><td>주문번호</td><td>'+c.rl[i].buy_no+'</td></tr>'
									msg+='<tr><td>상품명</td><td>'+c.rl[i].titme+'</td></tr>';
									msg+='<tr><td>가격</td><td>'+numberWithComma(c.rl[i].price)+'원</td></tr>';
									msg+='<tr><td>수량</td><td>'+numberWithComma(c.rl[i].amount)+'개</td></tr>';
									msg+='<tr><td>배송비</td><td>2,500원</td></tr>';
									msg+='<tr><td>결제금액</td><td>'+numberWithComma(c.rl[i].total)+'원</td></tr>';						
									msg+='</table>';
									msg+='<table class="sell_alarm_table"><tr><td>구매자</td><td>'+rsp.buyer_name+'</td></tr>';
									msg+='<tr><td>email</td><td>'+rsp.buyer_email+'</td></tr>';
									msg+='<tr><td>연락처</td><td>'+rsp.buyer_tel+'</td></tr>';
									msg+='<tr><td>주소</td><td>'+rsp.buyer_addr+'</td></tr>';
									msg+='</table>';

									msgList[i]=msg;
									ws[i] = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?state=mar&your_id=" + c.rl[i].your_id + "&chat_no=" + c.rl[i].chat_no  );
									}
							
								function sendMsg(index)
								{
									 if(index >= ws.length){
										 moveComplePage();
									 }
									else
										{ 
										ws[index].onopen= function(){ ws[index].send( msgList[index]) };
										ws[index].onmessage = function(){
											ws[index].close();
											sendMsg(index+1);
										};
										 } 
								}
								sendMsg(0);
								function moveComplePage(){
								var code= '<form id="completeSubmit" action="movePaymentComplete.do" method="post">';
								code += '<input name="group_no" value="'+group_no+'" type="hidden" />';
								code += '<input name="name" value="'+rsp.name+'" type="hidden" />';
								code += '<input name="paid_amount" value="'+rsp.paid_amount+'" type="hidden" />';
								code += '<input name="buyer_name" value="'+rsp.buyer_name+'" type="hidden" />';
								code += '<input name="buyer_email" value="'+rsp.buyer_email+'" type="hidden" />';
								code += '<input name="buyer_tel" value="'+rsp.buyer_tel+'" type="hidden" />';
								code += '<input name="buyer_addr" value="'+rsp.buyer_addr+'" type="hidden" />';
								code += '</form>';
								$('.inner-wrap').append(code);
								$('#completeSubmit').submit();
								}
							},
							error:function(){
								console.log("payment.js/ payment() /  insertFirstPayment.do ajax / insertNewPayment.do ajax ");
							}
					});
					////////////////////본결제 끝
					
				} else {
					//예비 데이터 삭제 컨트롤 실행
					$.ajax({
						url:"deleteFirstPayment.do",
						type : "post",
						data:{"group_no":group_no},			
						success:function(){
							console.log("payment.js/ payment() / deleteFirstPayment.do success ");
						},
						error:function(){
							console.log("payment.js/ payment() /  insertFirstPayment.do ajax / deleteFirstPayment.do ajax ");
						}
						
					});
					
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					console.log(msg);
				}
			});
			
		},
		error:function(data)
		{
			console.log("payment.js / payment() /  insertFirstPayment ajax");
		}
	});
	
	

}
