<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Farm</title>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">
     	<div class="inner-wrap">
        <h1 class="logo"><a href="moveHome.do">Farm Main</a></h1>
        <ul class="main-menu">
					<li><a href="marketList.do">장터</a></li>
                    <li><a href="moveAuction.do">경매</a></li>
                    <li><a href="#">시세</a></li>
                    <li><a href="moveJob.do">구인구직</a></li>
                    <li><a href="moveAdminPage.do">관리자</a></li>
        </ul>
        <ul class="weather">
					<li><img src="/farm/resources/images/weather.jpg"></li>
                 	
		</ul> 
        <ul class="global-menu">
					<li class="search"></li>
                    <li class="s_input"><input name="search" type="text" style="visibility: collapse"></li>
                    <c:if test="${empty sessionScope.loginUser }">
                    <li><a href="moveLogin.do" title="로그인">로그인</a></li>
					<li><a href="moveSignUp.do" title="회원가입" >회원가입</a></li>
					</c:if>
					<c:if test="${! empty sessionScope.loginUser }">
					<li><a href="moveCustomerMypage.do">${loginUser.member_name}님</a></li>
					<li><a href="logout.do">로그아웃</a></li>
					</c:if>
				</ul>
                
        </div>    </div>
</body>
</html>