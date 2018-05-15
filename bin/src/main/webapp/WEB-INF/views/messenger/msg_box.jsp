<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/msg_box.js"></script>
<link href="/farm/resources/css/messenger.css" rel="stylesheet" type="text/css" />
</head>
<body>

<span class="msgbox">
<iframe class="msgframe" src="moveMessenger.do"> 
 </iframe> 
</span>
<span  class="sidebox"> 
      <a href="#top_line" class="move_top_atag">
      <div class="move_top">↑<br>TOP</div></a>
      <br>
      <div class="shoppinglist">
      <!-- 최근본 목록 -->
      
      
      <div class="arrow">▲</div>
      
      <div class="recent_list">최근 본 상품</div>
      <div class="sh_list1" style="background-image: url('/farm/resources/images/pineapple.jpg');"></div>
      <div class="sh1_title">제스프리 <br>썬골드키위</div>
      <div class="sh_list2" style="background-image: url('/farm/resources/images/pineapple.jpg');"></div>
      <div class="sh1_title">제스프리 <br>썬골드키위</div>
      <div class="sh_list3" style="background-image: url('/farm/resources/images/pineapple.jpg');"></div>
      <div class="sh1_title last">제스프리 <br>썬골드키위</div>
      <div class="arrow bottom">▼</div>
      </div><br>
 
  <a href="javascript: msgIcon() "><img class="msgIcon" src="/farm/resources/images/messenger_icon_green2.png"></a><br>    
 
        </span>


</body>
</html>