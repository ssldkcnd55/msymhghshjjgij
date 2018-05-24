<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<script type="text/javascript"
   src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link href="/farm/resources/css/header.css" rel="stylesheet"
   type="text/css" />
<script type="text/javascript">
   $(function() {
      $
            .ajax({
               url : 'Weather.do',
               type : 'get',
               dataType : 'json',
               success : function(data) {
                  var myItem = data.response.body.items.item;
                  var img = "";
                  var img_text = "";
                  var t3h_check = 0;
                  var sky_check = 0;

                  for ( var i in myItem) {
                     console.log(i);
                     if (myItem[i].category == "T3H" && t3h_check == 0) {
                        img_text = myItem[i].fcstValue + "℃";
                        t3h_check = 1;
                     }

                     if (myItem[i].category == "SKY" && sky_check == 0) {
                        sky_check = 1;
                        var fv = myItem[i].fcstValue;
                        if (fv >= 0 && fv <= 2) {
                           img = "resources/images/logo.jpg";
                        } else if (fv >= 3 && fv <= 5) {
                           img = "resources/images/logo.jpg";
                        } else if (fv >= 6 && fv <= 8) {
                           img = "resources/images/logo.jpg";
                        } else if (fv >= 9 && fv <= 10) {
                           img = "resources/images/logo.jpg";
                        }
                     }
                  }

                  $("#weather_img").attr("src", img);
                  $("#w_text").html(img_text);
               },
               error : function(request, status, errorData) {
                  alert("error code : " + request.status + "\n"
                        + "message : " + request.responseText + "\n"
                        + "error : " + errorData);
               }
            });
   });
</script>
</head>

<body>
      <div id="header">
         <div class="inner-wrap">
            <div class="userMenu">
               <ul class="list_menu">
               <c:if test="${empty sessionScope.loginUser }">
                  <li class="menu1 none_sub"><a href="moveSignUp.do" class="link_menu">회원가입</a></li>
                  <li class="menu1 none_sub"><a href="moveLogin.do" class="link_menu">로그인</a></li>
               </c:if>
               <c:if test="${! empty sessionScope.loginUser }">
               	  <li class="menu1 none_sub"><a href="moveCustomerMypage.do" class="link_menu">${loginUser.member_name}님</a></li>
                  <li class="menu1 none_sub"><a href="logout.do" class="link_menu">로그아웃</a></li>
               </c:if>

                  <li class="menu1"><a href="#" class="link_menu">고객센터</a></li>
                  <li class="menu1 lst"><a href="moveNotice.do" class="link_menu">공지사항 </a></li>
                  <li class="menu1 lst"><a href="moveAdminPage.do" class="link_menu">관리자 </a></li>

                  <li class="menu1"><a href="/farm/moveQnAPage.do" class="link_menu">고객센터</a></li>
                  <li class="menu1 lst"><a href="/farm/moveNoticePage.do" class="link_menu">공지사항 </a></li>

               </ul>
            </div>
            <div class="header_main">
               <div class="header_main_img">
                  <a href="moveHome.do"><img
                     src="https://res.kurly.com/pc/img/1801/img_delivery.gif"></a>
               </div>
               <h1 class="h1">
                  <a href="moveHome.do"><img src="/farm/resources/images/kurly_logo_5.png"></a>
               </h1>
            </div>
            <div class="tabMenu">
               <div class="tabMenu_inner">
                  <ul class="tab_menu">
                     <li><a href="marketList.do">장터</a></li>
                     <li><a href="AuctionList_controller.do">경매</a></li>
                     <li><a href="#">시세</a></li>
                     <li><a href="moveJob.do">구인구직</a></li>
                  </ul>
                  <div class="search_box">
                     <input class="search" type="text"> <input type="image"
                        src="/farm/resources/images/search1.png"
                        class="btn_search">
                  </div>
                  <div class="cart_count">
                     <div class="inner_cartcount">
                        <a href="/shop/goods/goods_cart.php" class="btn_cart"> <img class="cart_img"
                           src="/farm/resources/images/shoppingBasket.png" alt="장바구니">
                           <span class="num realtime_cartcount" id="cart_item_count">0</span>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="bg"></div>
            <%-- <h1 class="logo">
               <a href="moveHome.do">Farm Main</a>
            </h1>
            <ul class="main-menu">
               <li><a href="marketList.do">장터</a></li>
               <li><a href="AuctionList_controller.do">경매</a></li>
               <li><a href="#">시세</a></li>
               <li><a href="moveJob.do">구인구직</a></li>
               <li><a href="moveAdminPage.do">관리자</a></li>
            </ul>
            <ul class="weather">
               <li><img id="weather_img"><b id="w_text"></b></li>

            </ul>
            <ul class="global-menu">
               <li class="search"></li>
               <li class="s_input"><input name="search" type="text"
                  style="visibility: collapse"></li>
               <c:if test="${empty sessionScope.loginUser }">
                  <li><a href="moveLogin.do" title="로그인">로그인</a></li>
                  <li><a href="moveSignUp.do" title="회원가입">회원가입</a></li>
               </c:if>
               <c:if test="${! empty sessionScope.loginUser }">
                  <li><a href="moveCustomerMypage.do">${loginUser.member_name}님</a></li>
                  <li><a href="logout.do">로그아웃</a></li>
               </c:if>
            </ul> --%>
         </div>
      </div>
</body>
</html>