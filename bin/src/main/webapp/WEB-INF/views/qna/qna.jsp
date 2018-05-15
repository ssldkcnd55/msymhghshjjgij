<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>

<!-- QnA.css -->
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/qna.css" />
<meta charset="UTF-8">
<title>QnA 게시판</title>
</head>
<body>

   <div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@  include file="../inc/top_menu.jsp"%>
      </div>
      <div id="container">
         <div class="inner-wrap">
         <div class="board-wrap">
            <div class="QnA_title">문의사항</div>

            <!-- select box -->
            <div class="select_box">
               <select class="select">
                  <option value="1" selected="">최근등록순</option>
                  <option value="2">좋아요많은순</option>
                  <option value="3">조회많은순</option>
               </select>
            </div>

            <table class="QnA_table">
               <tr>
                  <th width="12%">번호</th>
                  <th width="50%">제목</th>
                  <th width="13%">작성자</th>
                  <th width="15%">날짜</th>
               </tr>
               <tr id="hover">
                  <td>1</td>
                  <td id="QnA_td"><a href="">문의사항_01</a></td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr id="hover">
                  <td>2</td>
                  <td id="QnA_td">문의사항_02</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr id="hover">
                  <td>3</td>
                  <td id="QnA_td">문의사항_03</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr>
                  <td>4</td>
                  <td id="QnA_td">문의사항_04</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr>
                  <td>5</td>
                  <td id="QnA_td">문의사항_04</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr>
                  <td>6</td>
                  <td id="QnA_td">문의사항_04</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr>
                  <td>7</td>
                  <td id="QnA_td">문의사항_04</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr>
                  <td>8</td>
                  <td id="QnA_td">문의사항_04</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr>
                  <td>9</td>
                  <td id="QnA_td">문의사항_04</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
               <tr>
                  <td>10</td>
                  <td id="QnA_td">문의사항_04</td>
                  <td>김민선</td>
                  <td>2018-05-06</td>
               </tr>
            </table>

            <!-- 하단 페이징, 검색 묶음 -->
            <div id="bottom">
               <!-- 페이징 처리 -->
               <div class="pagination">
                  <a href="#">&laquo;</a> <a href="#">1</a> <a href="#"
                     class="active">2</a> <a href="#">3</a> <a href="#">4</a> <a
                     href="#">5</a> <a href="#">&raquo;</a>
               </div>

               <!-- 검색 -->
               <div class="search_box">
               <span class='green_window'> 
                  <input type='text'class='input_text' />
               </span>
               <button type='submit' class='sch_smit'>검색</button>
               </div>
            </div>
         </div>
         </div>
      </div>
      <!-- container끝 -->
       <%@ include file="../messenger/msg_box.jsp"%>
      <div id="footer">
         <%@  include file="../inc/foot.jsp"%>
      </div>
   </div>
   <!-- wrap끝  -->
</body>
</html>