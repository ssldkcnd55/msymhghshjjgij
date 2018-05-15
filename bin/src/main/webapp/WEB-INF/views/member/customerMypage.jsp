<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/mypage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/farm/resources/js/tabMove.js"></script>
<meta charset="UTF-8">
<title>Farm</title>
</head>
<body>
<div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@ include file="../inc/top_menu.jsp" %>
      </div>
       <div id="container">
         <div class="inner-wrap">
         
         <div class="tabs">
         <div class="tab first">회원정보</div>
         <div class="tab">경매내역</div>
         <div class="tab">판매내역</div>
         <div class="tab">QnA</div>
         <div class="tab">구인구직</div>
         <div class="tab last">판매이력</div>
         </div>
         
        <div class="info_box">
         
         <div class="Info show">
         <div class="Info_title">회원정보</div>
         <hr class="hr">
         <br>
         <div class="Info_content">
         <td><div class="profile "></div></td>
         <table class="update_table">
         <tr>        
         <td>아이디</td>
         <td><input class="member_input" type="text" value="rhgutjs333@naver.com" readonly="readonly"></td>
         </tr>
         <tr>
         <td>비밀번호</td>
         <td><input class="member_input" type="password"></td>
         </tr>
         <tr>
         <td>비밀번호 확인</td>
         <td><input class="member_input" type="password"></td>
         </tr>
         <tr>
         <td>이름</td>
         <td><input class="member_input" type="text" value="고현선"></td>
         </tr>
         <tr>
         <td>주소</td>
         <td><input class="member_input" type="text" value="경기도 성남시 중원구 금광2동 3873번지 월드맨션 102호"><button>주소검색</button></td>
         </tr>
        
         </table>
         
         
         </div>
         
         </div>
         <!-- <hr class="hr1"> -->      
        </div>
         
         </div>         
        </div>      
         <%@ include file="../messenger/msg_box.jsp"%>
        <div id="footer">
         <%@  include file="../inc/foot.jsp"%>
      </div>
      </div>
</body>
</html>