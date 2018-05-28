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

	var product_name = $('.product_title:first').text();
	var name;
	var tel;
	var addr;
	var request;
	if ($('.product_title').length > 1) {
		product_name += "외 " + ($('.product_title').length - 1) + "종";		
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
		tel=$('#new_user_phone').val();
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
			console.log(data);
			
			var IMP = window.IMP;
			IMP.init('imp31374305');

			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : product_name,
				amount : order_price + delivery_price,
				buyer_email : my_id,
				buyer_name : name,
				buyer_tel : tel,
				buyer_addr : addr,
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					console.log(msg);
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					console.log(msg);
				}
			});
			
		},
		error:function(data)
		{
			console.log("payment.js / insertFirstPayment ajax");
		}
	});
	
	

}
