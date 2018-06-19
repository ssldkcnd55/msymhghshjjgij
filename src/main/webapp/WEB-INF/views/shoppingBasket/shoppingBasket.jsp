<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<!-- Notice.css -->
<link rel="stylesheet" type="text/css" href="/farm/resources/css/shopping_basket.css" />
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/ShoppingBasket.js"></script>
<link href="/farm/resources/css/marketDetail_modal.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Farm</title>
<script type="text/javascript">
var my_id = '${loginUser.member_id}';
</script>
</head>
<body>

<div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@ include file="../inc/header.jsp" %>
      </div>
      <div id="container">
         <div class="inner-wrap">
           
           
           <br><br>
         <div class="title_box">
         <div id="basket_image" style="background-image: url('/farm/resources/images/basket.png')"></div>
         <div id="basket"> &nbsp;장바구니</div>         
         </div>
         
         
         <br><br>
            <!-- select box -->            
            <table class="Notice_table">
               <tr >               
                    <th width="8%" ><input class="checkAll" type="checkbox"></th>
                  <th width="13%">전체선택</th>
                  <th width="47%">상품정보</th>
                  <th width="13%">수량</th>
                  <th width="13%">상품금액</th>
                  <th width="6%"></th>
               </tr>
               <c:forEach var="basket" items="${basketList}">
                <tr class="hover">
                  <td><input class="checkItem" type="checkbox" name="checkItem" value="${basket.market_no}"></td>
                  <td><center><a href="marketDetail.do?market_no=${basket.market_no}" target="_blank"><div class="images" style="background-image: url('/farm/resources/upload/marketUpload/${basket.market_img}');"></div></a></center></td>
                  <td id="Notice_td"><a href="marketDetail.do?market_no=${basket.market_no}" target="_blank">${basket.market_title }</a></td>
                  <td>
                  <div class="amount_box" >
                     <a href="javascript: controlCount(${basket.market_no},+1);"><div class="operator">+</div></a>
                     <input type="number" id="${basket.market_no}_count" class="count" value="${basket.buy_amount }" min="1">
                    <a href="javascript: controlCount(${basket.market_no},-1);"><div class="operator">-</div></a>
                 </div>
                  </td>
                  <td ><fmt:formatNumber value="${basket.market_price}" pattern="#,###" />원</td>
                  <td><a href="javascript: deleteConfirmBasket(${basket.market_no});"><div class="x">x</div></a></td>
                  <input id="${basket.market_no}_stack" type="hidden" value="${basket.stack}">
                  <input id="${basket.market_no}_price"  type="hidden" value="${basket.market_price}">
               </tr>
               
               </c:forEach>
               	<!-- 장바구니 모달창 -->
						<div id="myModal" class="modal">
							<div class="modal-content">
								<div class="md_top">
									<span class="md_top_title"><strong>장바구니 삭제</strong></span>
								</div>
								<div class="md_mid">
									<div class="md_mid_content">해당 상품을 장바구니에서 삭제 하시겠습니까?</div>
									<div class="md_mid_box">
									<a href="javascript: deleteBasket();" class="md_mid_close_a"> <span class="md_mid_close">삭제하기</span></a> 
									<a href="javascript: closeModal();" class="md_mid_basket_a"> <span class="md_mid_basket">취소하기</span></a>
									</div>
								</div>
							</div>
						</div><!-- 장바구니 모달 끝 -->
            </table>
            <br>
           <input id="selectAll_checkbox" type="checkbox" class="checkAll">
           <div id="selectAll" >전체선택 ( <p class="checkedCount">0</p> / <p class="fullCount">${fn:length(basketList) }</p> )</div>
           <a href="javascript: selectDelete();"><div class="select_delete">선택 삭제</div></a>
          
         <br><br>
            <!-- 하단 페이징, 검색 묶음 -->
                       
            <div id="bottom">
               <!-- 페이징 처리 -->
               <br><br><br>                  
         <br><br>  
                  <div class="order">주문금액</div>
                  <div class="delivery">배송비</div>
                  <div class="total">결제 예정금액</div>
               <br>
                  <div class="order_price"><span class="sPrice">0 원</span></div>
                  <div class="op2">+</div>
                  <div class="delivery_price"><span class="sPrice">0 원</span></div>
                  <div class="op2">=</div>
                  <div class="total_price"><span class="sPrice">0 원</span></div>               
         </div>

           <br><br><br><br><br><br><br>
        <div class="twobuttons">
        <a href="marketList.do"><div class="tbutton more">장터 더보기</div></a>
        <a href="javascript: clickPayment()"><div class="tbutton payment">주문결제</div></a>    
        </div>
         </div>
       
      </div>
      <!-- container끝 -->
    <%@ include file="../messenger/msg_box.jsp"%>
     <div id="footer">
         <%@  include file="../inc/foot.jsp" %>
      </div>
   </div>
   <!-- wrap끝  -->
</body>
</html>