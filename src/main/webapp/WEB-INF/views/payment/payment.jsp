<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/farm/resources/css/payment.css"/>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>결제 페이지</title>
</head>
<body>
<div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@  include file="../inc/header.jsp"%>
      </div>
      <div id="container">
         <div class="inner-wrap">
         <!--  -->
        <div class="title1 payment"><p class="titleP">주문/결제</p></div>
      <!--  <div class="wrapper" align="center"> -->
          <!-- 상품정보 -->
          <div class="product">
             <table class="pay_top_table">
                <tr>
                   <th colspan="2"><div class="product_title">상품정보</div></th>
                   <th>판매자</th>
                   <th>배송비</th>
                   <th>수량</th>
                   <th>주문금액</th>
                </tr>
                <tr>
                   <td><span><img src="/farm/resources/images/logo.jpg"></span></td>
                   <td><div>
                     <strong>일원딸기</strong>    
                     <p>일원딸기 딸기</p>            
                   </div></td>
                   <td>주경네</td>
                   <td>2,500원</td>
                   <td>1개</td>
                   <td>120,000원</td>
                   
                </tr>
                
                <tr>
                   <td><span><img src="/farm/resources/images/logo.jpg"></span></td>
                   <td><div>
                     <strong>일원딸기</strong>    
                     <p>일원딸기 딸기</p>            
                   </div></td>
                   <td>주경네</td>
                   <td>2,500원</td>
                   <td>1개</td>
                   <td>120,000원</td>
                   
                </tr>
                <tr>
                   <td><span><img src="/farm/resources/images/logo.jpg"></span></td>
                   <td><div>
                     <strong>일원딸기</strong>    
                     <p>일원딸기 딸기</p>            
                   </div></td>
                   <td>주경네</td>
                   <td>2,500원</td>
                   <td>1개</td>
                   <td>120,000원</td>
                   
                </tr>
          
                <tr>
                   <td><span><img src="/farm/resources/images/logo.jpg"></span></td>
                   <td><div>
                     <strong>일원딸기</strong>    
                     <p>일원딸기 딸기</p>            
                   </div></td>
                   <td>주경네</td>
                   <td>2,500원</td>
                   <td>1개</td>
                   <td>120,000원</td>
                   
                </tr>
                
                
                
             
             
             </table>
          
          </div>
          <!-- 상품정보 -->
          
          
          
          
         <!-- 배달지 -->
         <div class="top_delivery_checkout">
         <div class="delivery" >
            <br>
            <div class="delivery_title">
               <strong>배송지 정보</strong>
            </div>
            <br>
            <br>
            <br>
            <div class="delivery_choice">
               배송지 선택  
            </div>&nbsp;
            <div class="delivery_choice_radio">
               <input type="radio" name="original_delivery" value="delivery" />기본배송지 &nbsp;
               <input type="radio" name="new_delivery" value="delivery" />신규배송지   &nbsp;
               <br><br>
               <hr>
            </div>                            
            
            <div class="delivery_username" >
            <br>
            <div class="delivery_table">
            <table class="table">
               <tr>
                  <td><input type="text" value="오주경" name="user_name"readonly></td>
               </tr>
               <tr>
                  <td><input type="text" name="user_phone"value="010-1212-1313"> </td>
                  <td><input type="radio" name="relief_number" value="delivery_username_phone"/>안심번호서비스 사용</td>
               </tr>
               <tr>
                  <td colspan="2" class="table_colspan"><input type="text" name="useradd" value="서울특별시 강서구 화곡 아파트 7층"></td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input type="text" class="messagebox" name="message" placeholder=" 배송 요청 사항을 입력해주세요">
                  </td>
               </tr>
      
            </table>
            </div>
            <br>
            <div class="delivery_warning">
               <p>2016년 8월 1일부터는 5자리 우편번호 사용이 의무화됩니다.</p>
               <p>도서산간 지역의 경우 추후 수령 시 추가 배송비가 과금될 수 있습니다.</p>
            </div>
            
            </div>
            
            


         </div>
               <!-- 배달지 -->
          
          <!-- 결제창 -->
          <div class="checkout">
             <div>
                <h4 align="left" style="margin-left:20px;">결제금액</h4>
                <span class="price">120,000</span>&nbsp;원
             </div>
             <hr>
             <table>
                <tr>
                   <th style="text-align:left;">총 상품 금액</th>
                   <td style="text-align:right;width:30%;">120,000원</td>
                </tr>
               <tr>
                  <th style="text-align:left;">배송비</th>
                   <td style="text-align:right;width:30%;">(+) 0원</td>
               </tr>   
                         
             </table>
             <hr>
             <br>
          
          <div>
          <input type="submit" value="결제하기" class="buy"/>
          </div>
          </div>
         </div>          
          
         <!-- 결제창 -->      
         
       <!-- </div>    -->
       
         
         


         </div>
      </div>
 <%@ include file="../messenger/msg_box.jsp"%>
      <div id="footer">
         <%@  include file="../inc/foot.jsp"%>
      </div>
   </div>


</body>
</html>
