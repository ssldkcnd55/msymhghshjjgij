<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>


</head>

<body>

<div id="top_line"></div>
	<div id="wrap">
	<c:import url="inc/top_menu.jsp"></c:import>
        
   		<div id="container">
        	<div class="inner-wrap">
       			<div class="main_visual"></div>
                <div class="tab_main"></div>
                <div class="box"></div>
                <div class="box"></div>
                <div class="box2"></div>
 			 </div>

        </div>
        
        <!-- 채팅,최근 본 상품 목록 import jsp ,  footer 위에서 하면됨 -->
        <c:import url="messenger/msg_box.jsp"></c:import>

     <div id="footer">
     <c:import url="inc/foot.jsp"></c:import>

 </div></div>
    
</body>
</html>
