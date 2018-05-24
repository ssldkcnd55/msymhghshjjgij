<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!-- Job_Detaile.css -->
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/job_detail.css" />
<meta charset="UTF-8">
<title>Farm 구인구직 정보</title>
</head>
<body>

   <div id="top_line"></div>
   <div id="wrap">
      <div id="header">
         <%@ include file="../inc/header.jsp"%>
      </div>
      <div id="container">
         <div class="inner-wrap">
            <div class="board-wrap">
               <div id="top"></div>
               <div id="top_div">
                  <div class="Job_Detail_title">
                     <span><strong>구인구직 정보</strong></span>
                  </div>
                  <div id="job_detail_date">
                     <span><strong>등록 : 2018-05-09</strong></span>
                  </div>
                  <div id="job_detail_button">
                     <span><button>수정</button></span>
                  </div>
               </div>


               <!--  -->
               <div id="detail_note_top"></div>
               <div id="detail_note_farmname">김민선 농장</div>
               <br>
               <div id="detail_note_farmtitle">
                  <strong>딸기농장에서 함께 일하실분 모집합니다.</strong>
               </div>
               <br>
               <div id="detail_note_farmtitle_bottom"></div>


               <div>
                  <img alt="" src="/farm/resources/images/farm.jpg" id="img">&nbsp; <img
                     alt="" src="/farm/resources/images/momey.JPG" id="img">&nbsp; <img
                     alt="" src="/farm/resources/images/job_long.JPG" id="img">&nbsp; <img
                     alt="" src="/farm/resources/images/calendar.JPG" id="img">&nbsp; <img
                     alt="" src="/farm/resources/images/clock.JPG" id="img">&nbsp;
               </div>
               <br>
               <div id="detail_note_farmimg_bottom"></div>

               <!-- 모집조건 -->
               <div id="top_detail_condition">
                  <div id="detail_condition">
                     <strong>모집조건</strong> <br>
                     <br>
                     <div id="detail_condition_dead_date">
                        마감일 &nbsp; <input type="text" value="2018-05-10" readonly>
                        <br> 
                        인원 &nbsp; &nbsp; <input type="text" value="1 명"readonly> 
                        <br> 
                        성별 &nbsp; &nbsp; <input type="text"value="무관" readonly> 
                        <br> 
                        우대 &nbsp; &nbsp;<input type="text" value="가까운 지역" readonly>
                     </div>
                  </div>
               </div>
                  
                  <!-- 모집조건 -->
                  <div id="detail_condition_seller">
                     <strong>채용담당자 정보</strong>
                     <br> 
                     <br>
                     <div id="detail_condition_seller_detail">
                     담당자 &nbsp; <input type="text" value="김민선" readonly>
                     <br>
                     
                     연락처 &nbsp; <input type="text" value="010-6318-1880" readonly>
                     <br>
                     
                     * &nbsp; <input type="text"  value="구직이 아닌 광고 등의 목적으로 연락처를 " readonly>
                     <br>
                      &nbsp;&nbsp; &nbsp; <input type="text" value=" 이용할 경우 법적 처벌을 받을 수 있습니다." readonly>
                     </div>
                  </div>
                  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                  
               <div id="detail"><strong>상세모집요강</strong></div>
               <br>
               <div id="detail_note_farmimg_bottom"></div>
               <br><br>
               <div class="detail_note_area"></div>
               

               <br> <br> <br> <br> <br> <br>
               


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