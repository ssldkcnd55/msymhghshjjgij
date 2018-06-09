/**
 * 
 */


$(function(){
	$('.goods-view-show-option-button').click(function(){
		if($('#flow-cart2').css('display') == 'none'){
			$('#flow-cart2').css('display','block');
		}else{
			$('#flow-cart2').css('display','none');
		}
    });
});

 function countOperator(op)
{	
	 var amount=Number($('.flow_order_stock span').text());
	$(".flow_order_count").val(Number( $(".flow_order_count").val())+Number(op) );
	if($(".flow_order_count").val()<1)
		{
		$(".flow_order_count").val(1);
		}
	else if ($(".flow_order_count").val()>amount)
		{
		alert("수량을 초과하였습니다.");
		$(".flow_order_count").val(amount);
		}
	$('.flow_order_total_price').text( $(".flow_order_count").val() * $('.flow_order_price span').text() );
}	
 

 
 
 
 