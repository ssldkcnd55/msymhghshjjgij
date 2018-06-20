/**
 * 
 */
var delete_no=[];


function clickPayment()
{	var buy_no=[];
	$('[name=checkItem]').each(function() {
		if ($(this).is(":checked") == true) {
			buy_no.push($(this).val()); 
		}
	});
	//console.log(buy_no.toString() )
	
	if(buy_no.length>0)
	{
	location.href= "makePayment.do?buy_no="+buy_no.toString();
	}
}
function getBasketCount(member_id)
{
	$.ajax({
		url:"selectBasketCount.do",
		type:"post",
		data:{"member_id":member_id},
		success: function(data)
		{
			$('#cart_item_count').text(data);
			
		},error: function(request,status,errorData){
			console.log("header.jsp/getBasketCount");
             console.log("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData); 
           }
	});
}
function deleteConfirmBasket(market_no)
{
//confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?");
	delete_no.push(market_no);

	$('#myModal').css("display","block");
}
function closeModal()
{	
	delete_no=[];
	$('#myModal').css("display","none");
}

function selectDelete()
{
	var delCount=0;
	$('[name=checkItem]').each(function() {
		if ($(this).is(":checked") == true) {
			delete_no.push($(this).val());
			delCount++;
		}
	});
	if(delCount>0)
	$('#myModal').css("display","block");
}	

function controlCount(market_no, operator) {
	var mcount = Number($('#' + market_no + '_count').val());
	var op = Number(operator);

	if (mcount + op < 1){
		deleteConfirmBasket(market_no)
		//$('#' + market_no + '_count').val(1);
		}
	else if( (mcount + op) > $("#"+market_no+"_stack").val() )
		{
		alert("남은 수량을 초과하였습니다.");
		$('#'+market_no+'_count').val( $("#"+market_no+"_stack").val() );
		}
	else{
		$.ajax({
			url:"updateBasketAmount.do",
			type:"post",
			data:{
				'market_no':market_no,
				'buy_amount':mcount+op },
			success:function(data){
				$('#' + market_no + '_count').val(mcount + op);
			},
			error:function(){
				console.log("ShoppingBasket.js / controlCount()");
			}
	
		});
		
		}
	setPrice();
}
function numberWithComma(a) {// 숫자 천단위 콤마
	return a.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var count = 0;

$(function() {

	$('.checkAll').change(function() {
		// 전체선택
		if ($(this).is(":checked") == true) {
			$('[name=checkItem]').prop("checked", true);
			$('.checkAll').prop("checked", true);
			count=$('.fullCount').text();
		} else {
			$('[name=checkItem]').prop("checked", false);
			$('.checkAll').prop("checked", false);
			count=0;
		}
		setPrice();
		$('.checkedCount').text(count);
	});

	$('[name=checkItem]').change(function() {
		// 개별 선택
		if ($(this).is(":checked") == true) {
			count++;
		} else {
			count--;
		}
		$('.checkedCount').text(count);
		setPrice();
	});

});
function setPrice() {
	var order_price = 0;
	var delivery_price = 0;
	$('[name=checkItem]').each(function() {
				if ($(this).is(":checked") == true) {
					order_price += $('#' + $(this).val() + '_price').val() * $('#' + $(this).val() + '_count').val();
					delivery_price += 2500;
				}
			});
	$('.order_price .sPrice').text(numberWithComma(order_price) + ' 원');
	$('.delivery_price .sPrice').text(numberWithComma(delivery_price) + ' 원');
	$('.total_price .sPrice').text(numberWithComma(order_price + delivery_price) + ' 원');
}
function deleteBasket()
{	

	$.ajax({
		url:"deleteSoppingBasket.do",
		type:"post",
		dataType : "json",
		data:{"deleteNo":delete_no.toString()},
		success:function(data){	
			var objStr = JSON.stringify(data);
			var js = JSON.parse(objStr);
		
		$('.hover').remove();
		//var code='<tr><th width="8%" ><input class="checkAll" type="checkbox"></th><th width="13%">전체선택</th><th width="47%">상품정보</th><th width="13%">수량</th><th width="13%">상품금액</th><th width="6%"></th></tr>';
		var code='';
			for ( var i in js.bl)
				{
					code+='<tr class="hover"><td><input class="checkItem" type="checkbox" name="checkItem" value="'+js.bl[i].no+'"></td>';
					code+='<td><center><a href="marketDetail.do?market_no='+js.bl[i].no+'"><div class="images" style="background-image: url(\'/farm/resources/upload/marketUpload/'+decodeURIComponent((js.bl[i].img).replace(/\+/g, '%20'))+'\');"></div></a></center></td>';
					code+='<td id="Notice_td"><a href="marketDetail.do?market_no='+js.bl[i].no+'">'+decodeURIComponent((js.bl[i].title).replace(/\+/g, '%20'))+'</a></td>';
					code+='<td><div class="amount_box"><a href="javascript: controlCount('+js.bl[i].no+',+1);"><div class="operator">+</div></a><input type="number" id="'+js.bl[i].no+'_count" class="count" value="'+js.bl[i].amount+'" min="0"><a href="javascript: controlCount('+js.bl[i].no+',-1);"><div class="operator">-</div></a></div></td>';
					code+='<td >'+numberWithComma(js.bl[i].price)+'원</td>';
					code+='<td><a href="javascript: deleteConfirmBasket('+js.bl[i].no+');"><div class="x">x</div></a></td><input id="'+js.bl[i].no+'_stack" type="hidden" value="'+js.bl[i].stack+'"><input id="'+js.bl[i].no+'_price"  type="hidden" value="'+js.bl[i].price+'"></tr>';
					
				}
			
			$('.Notice_table').append(code);
		
			$('#myModal').css("display","none");
			$('.checkAll').prop("checked", false);
			setPrice();
			$('.fullCount').text(js.bl.length);
			$('.checkedCount').text(0);
			
			$('.checkItem').change(function() {
				// 개별 선택
				if ($(this).is(":checked") == true) {
					count++;
				} else {
					count--;
				}
				$('.checkedCount').text(count);
				setPrice();
			});
			getBasketCount(my_id);
		},
		error: function(request,status,errorData){
			console.log("ShoppingBasket.js / deleteBasket();")
            console.log("error code : " + request.status + "\nmessage" + 
                    request.responseText + "\nerror" + errorData);
           }
	});
	
}