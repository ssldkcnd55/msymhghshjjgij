/**
 * 
 */
//안심번호? 표시 
function printInfoRelief() {
	$('.InfoReliefDiv').css("display", "block");
}
function removeInfoRelief() {
	$('.InfoReliefDiv').css("display", "none");
}

//daum 주소 검색 api
function findAddr() {
	new daum.Postcode({
		oncomplete : function(data) {
			$('#new_user_addr').val(data.postcode + " " + data.address);
		}
	}).open();
}


$(function() {	
	$('[name=delivery]').change(function() {
		if ($(this).val() == 'original_delivery') {
			$('.infoTable').removeAttr("hidden");
			$('.newInfo').prop("hidden", "hidden");
		} else {
			$('.newInfo').removeAttr("hidden");
			$('.infoTable').prop("hidden", "hidden");
		}
	});

	$('#request').change(
					function() {
						if ($('#request').val() == '직접 입력') {

							$('#request')
									.after('<div id="dir_req" class="messagebox" hidden="hidden"><input type="text"  name="message" placeholder=" 배송 요청 사항을 입력해주세요"> </div>');
						} else {
							$('#dir_req').remove();
						}
					});
	$('#new_request').change(function() {
						if ($('#new_request').val() == '직접 입력') {
							$('#new_request')
									.after('<div id="new_dir_req" class="messagebox" hidden="hidden"><input type="text"  name="message" placeholder=" 배송 요청 사항을 입력해주세요"> </div>');
						} else {
							$('#new_dir_req').remove();
						}
					});
});

function numberWithComma(a) {// 숫자 천단위 콤마
	return a.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function payment() {

	var product_name = $('.product_title_strong:first').text()+"(경매)";
	var name;
	var tel;
	var addr;
	var request;
	

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

			var IMP = window.IMP;
			IMP.init('imp31374305');

			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : product_name,
				amount : /*order_price*/100,
				buyer_email : my_id,
				buyer_name : name,
				buyer_tel : tel,
				buyer_addr : addr,
			}, function(rsp) {
				if (rsp.success) {
					////////////////////본 결제
			
					$.ajax({
							url: "insertAuctionPayment.do",
							type: "post",
							dataType:"json",
							data: {
								"auction_no":auction_no,
								"your_id":your_id,
								"member_id":my_id,
								"buy_addr":addr,
								"buy_tel":tel,
								"buy_name":name,
								"buy_request":request						
							},					
							success: function(resultData) {
								
								var c = JSON.parse(JSON.stringify(resultData));
								var buy_no = c.buy_no;
								var chat_no = c.chat_no;
					
								var msg = '<div class="sell_alarm_head"><img src="/farm/resources/images/sell_icon_white.png" />판매 알림</div>';
								msg+='<img class="sell_alarm_img" style="width:180px; margin-top:4px;" src="/farm/resources/upload/auctionUpload/'+obj.img+'">';	
								msg+='<table class="sell_alarm_table"><tr><th colspan="2"><font class="sell_alarm_name">'+obj.your_name+'</font>님의<br>상품이 판매되었습니다.</th></tr>';
								msg+='<tr><td>주문번호</td><td>'+buy_no+'</td></tr>'
								msg+='<tr><td>상품명</td><td>'+obj.title+'</td></tr>';
								msg+='<tr><td>가격</td><td>'+numberWithComma(obj.price)+'원</td></tr>';
								msg+='<tr><td>배송비</td><td>2,500원</td></tr>';
								msg+='<tr><td>결제금액</td><td>'+numberWithComma(obj.order_price)+'원</td></tr>';						
								msg+='</table>';
								msg+='<table class="sell_alarm_table"><tr><td>구매자</td><td>'+rsp.buyer_name+'</td></tr>';
								msg+='<tr><td>email</td><td>'+rsp.buyer_email+'</td></tr>';
								msg+='<tr><td>연락처</td><td>'+rsp.buyer_tel+'</td></tr>';
								msg+='<tr><td>주소</td><td>'+rsp.buyer_addr+'</td></tr>';
								msg+='</table>';

		
								ws = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?state=mar&your_id=" + your_id + "&chat_no=" + chat_no  );
								ws.onopen=function(){
									ws.send(msg);
								}
								
								function moveComplePage(){
								var code= '<form id="completeSubmit" action="movePaymentComplete.do" method="post">';
								code += '<input name="group_no" value="'+buy_no+'" type="hidden" />';
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
								moveComplePage();
							},
							error:function(){
								console.log("payment.js/ payment() /  insertFirstPayment.do ajax / insertNewPayment.do ajax ");
							}
					});
					////////////////////본결제 끝
					
				} else {
					//예비 데이터 삭제 컨트롤 실행
					
					
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					console.log(msg);
				}	
});
}

function paymentTest(){
	 
	var product_name = $('.product_title_strong:first').text()+"(경매)";
	var name;
	var tel;
	var addr;
	var request;
	
	console.log(obj.img);
	
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
	
	$.ajax({
		url: "insertAuctionPayment.do",
		type: "post",
		dataType:"json",
		data: {
			"auction_no":auction_no,
			"your_id":your_id,
			"member_id":my_id,
			"buy_addr":addr,
			"buy_tel":tel,
			"buy_name":name,
			"buy_request":request						
		},					
		success: function(resultData) {
			
			var c = JSON.parse(JSON.stringify(resultData));
			var buy_no = c.buy_no;
			var chat_no = c.chat_no;

			var msg = '<div class="sell_alarm_head"><img src="/farm/resources/images/sell_icon_white.png" />판매 알림</div>';
			msg+='<img class="sell_alarm_img" style="width:180px; margin-top:4px;" src="/farm/resources/upload/auctionUpload/'+obj.img+'">';	
			msg+='<table class="sell_alarm_table"><tr><th colspan="2"><font class="sell_alarm_name">'+obj.your_name+'</font>님의<br>상품이 판매되었습니다.</th></tr>';
			msg+='<tr><td>주문번호</td><td>'+buy_no+'</td></tr>'
			msg+='<tr><td>상품명</td><td>'+obj.title+'</td></tr>';
			msg+='<tr><td>가격</td><td>'+numberWithComma(obj.price)+'원</td></tr>';
			msg+='<tr><td>배송비</td><td>2,500원</td></tr>';
			msg+='<tr><td>결제금액</td><td>'+numberWithComma(obj.order_price)+'원</td></tr>';						
			msg+='</table>';
		/*	msg+='<table class="sell_alarm_table"><tr><td>구매자</td><td>'+rsp.buyer_name+'</td></tr>';
			msg+='<tr><td>email</td><td>'+rsp.buyer_email+'</td></tr>';
			msg+='<tr><td>연락처</td><td>'+rsp.buyer_tel+'</td></tr>';
			msg+='<tr><td>주소</td><td>'+rsp.buyer_addr+'</td></tr>';
			msg+='</table>';*/


			ws = new WebSocket("ws://127.0.0.1:7777/farm/chat.do?state=mar&your_id=" + your_id + "&chat_no=" + chat_no  );
			ws.onopen=function(){
				ws.send(msg);
				var msg2 = obj.your_name+"님  / 상품 : "+obj.title+"이 판매 되었습니다.";
				$.ajax({
					url: "kakaoRefresh.do",
					type: "post",
					success : function(data){
						if(data != 1){
							$.post("kakaoMessage.do", 
								{ content : msg2,
								  refresh : data
							});
						}
					}
				}); 
			}
			
			/*function moveComplePage(){
			var code= '<form id="completeSubmit" action="movePaymentComplete.do" method="post">';
			code += '<input name="group_no" value="'+buy_no+'" type="hidden" />';
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
			moveComplePage();*/
		},
		error:function(){
			console.log("payment.js/ payment() /  insertFirstPayment.do ajax / insertNewPayment.do ajax ");
		}
});
}
