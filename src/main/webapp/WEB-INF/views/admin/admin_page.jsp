<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>


<!--  -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!--  -->
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/top_menu.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">


<!--  -->
		
<section id="main" style="margin-top:60px; margin-bottom:30px;">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="list-group">
      <a class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
    	관리목록 </a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
      	&nbsp;공지사항관리</a>
      <a href="/farm/moveAdminCategory.do" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;카테고리관리</a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;신고관리</a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;공지사항작성</a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>
      	&nbsp;유저검색</a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;판매관리</a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;경매관리</a>
    </div>
    



      </div>
      <div class="col-md-9">
          <div class="panel panel-default">
  <div class="panel-heading" style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">사이트 전체보기</h3>
  </div>
  <div class="panel-body">
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span>더미</h2>
       <h4>회원수</h4>
     </div>  
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true">더미</h2>
       <h4>등록 판매 수 </h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>더미</h2>
       <h4>등록 경매 수</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 2129</h2>
       <h4>Visitores</h4>
     </div>
   </div>
  </div>
</div>
<!-최신 강의->




<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">최신 판매</h3>
  </div>
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>판매명</th>
        <th>판매자</th>
        <th>등록일</th>
      </tr>
   
   <%-- 
   <% for (int i=0; i<5; i++){ %> --%>
    <tr>
      <td>더미</td>
      <td>더미</td>
      <td>더미</td>
    </tr>
   <%-- <%} %> --%>
   
    </table>

  </div>
</div>
 <!-최신유저 ->

<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">최신 유저
    </h3>
  </div>
 
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>이름</th>
        <th>메일</th>
        <th>가입일</th>
      </tr>
   <%-- <% for (int i=0; i<5; i++){ %> --%>
    <tr>
      <td>더미</td>
      <td>더미</td>
      <td>더미</td>
    </tr>
 <%--   <%} %> --%>
   </table>

  </div>
</div>

      </div>
    </div>
  </div>
</section>




<!--  -->
			</div>
		</div>

		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>


</body>
</html>