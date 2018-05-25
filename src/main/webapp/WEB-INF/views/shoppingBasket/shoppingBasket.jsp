<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Notice.css -->
<link rel="stylesheet" type="text/css" href="/farm/resources/css/shopping_basket.css" />
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>

<meta charset="UTF-8">
<title>Farm</title>
</head>
<body>

<div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@ include file="../inc/header.jsp" %>
      </div>
      <div id="container">
         <div class="inner-wrap">
           <!--  <div class="Notice_title">장바구니</div> -->
           
           <br><br>
         <div class="title_box">
         <div id="basket_image" style="background-image: url('/farm/resources/images/basket.png')"></div>
         <div id="basket"> &nbsp;장바구니</div>         
         </div>
         
         
         <br><br>
            <!-- select box -->            
            <table class="Notice_table">
               <tr class="hover">               
                    <th width="8%" ><input type="checkbox"></th>
                  <th width="13%">전체선택</th>
                  <th width="47%">상품정보</th>
                  <th width="13%">수량</th>
                  <th width="13%">상품금액</th>
                  <th width="6%"></th>
               </tr>
               <c:forEach var="basket" items="${basketList}">
                <tr class="hover">
                  <td><input type="checkbox"></td>
                  <td><center><a href="marketDetail.do?market_no=${basket.market_no}"><div class="images" style="background-image: url('/farm/resources/upload/marketUpload/${basket.market_img}');"></div></a></center></td>
                  <td id="Notice_td"><a href="marketDetail.do?market_no=${basket.market_no}">${basket.market_title }</a></td>
                  <td>
                  <div class="amount_box" >
                     <a href="marketDetail.do?market_no=${basket.market_no}"><div class="operator">+</div></a>
                     <input type="number" class="count" value="${basket.buy_amount }">
                    <a href="marketDetail.do?market_no=${basket.market_no}"><div class="operator">-</div></a>
                 </div>
                  </td>
                  <td>${basket.market_price}원</td>
                  <td><a href="marketDetail.do?market_no=${basket.market_no}"><div class="x">x</div></a></td>
               </tr>
               
               </c:forEach>
              
              <!--  <tr class="hover">
                  <td><input type="checkbox"></td>
                  <td><center><a href="#"><div class="images" style="background-image: url('/farm/resources/images/pineapple.jpg');"></div></a></center></td>
                  <td id="Notice_td"><a href="#">[스미후루]감숙왕 파인애플</a></td>
                  <td>
                  <div class="amount_box" >
                     <a href="#"><div class="operator">+</div></a>
                     <input type="text" class="count">
                    <a href="#"><div class="operator">-</div></a>
                 </div>
                  </td>
                  <td>9700원</td>
                  <td><a href="#"><div class="x">x</div></a></td>
               </tr>
               
               
               <tr class="hover">
                  <td><input type="checkbox"></td>
                  <td><center><a href="#"><div class="images" style="background-image: url('/farm/resources/images/pineapple.jpg');"></div></a></center></td>
                  <td id="Notice_td"><a href="">아르헨티나 자연산 홍새우</a></td>
                  <td>
                  <div class="amount_box" >
                     <a href="#"><div class="operator">+</div></a>
                     <input type="text" class="count">
                    <a href="#"><div class="operator">-</div></a>
                 </div>
                  </td>
                  <td>9700원</td>
                  <td><a href="#"><div class="x">x</div></a></td>
               </tr> -->
               
               
            </table>
            <br>
           <input id="selectAll_checkbox" type="checkbox">
           <div id="selectAll">전체선택 (2/2)</div>
           <a href="#"><div class="select_delete">선택 삭제</div></a>
          
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
                  <div class="order_price"><span class="sPrice">9,700 원</span></div>
                  <div class="op2">+</div>
                  <div class="delivery_price"><span class="sPrice">2,500 원</span></div>
                  <div class="op2">=</div>
                  <div class="total_price"><span class="sPrice">12,200 원</span></div>               
         </div>

           <br><br><br><br><br><br><br>
        <div class="twobuttons">
        <a href="#"><div class="tbutton more">장터 더보기</div></a>
        <a href="#"><div class="tbutton payment">주문결제</div></a>    
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