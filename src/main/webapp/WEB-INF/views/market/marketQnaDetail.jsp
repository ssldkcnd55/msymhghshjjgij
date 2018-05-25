<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!--QnA_Detail.css -->
<link rel="stylesheet" type="text/css" href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/farm/resources/css/QnA_Detail.css" />
<title>QnA</title>


<script type="text/javascript">
/* 댓글 수정 */
	 function comment_modify(num){
		$(".galcomUpdate"+i).after(
				
				);
		
		
	}
	
	/* QnA수정 버튼 */
	function move_QnA_modify(){
		location.href="/farm/moveQnA_write.do";
	}
	
	
	
</script>


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

					<div class="QnA_title">질문</div>

					<div class="QnA_full">
						<table class="QnA_table">
							<tr>
								<td>${qna.market_qna_title }</td>
								<td>${qna.member_id }</td>
								<td>${qna.market_qna_question_date }</td>
							</tr>
						</table>
						<div class="QnA_modify">
							<button onclick="move_QnA_modify();">수정</button>
							&nbsp;
							<button>삭제</button>
						</div>
						<div class="QnA_note">
							<p>${qna.market_qna_contents }</p>
						</div>
						<br> <br>
					</div>
					<!-- QnA_full  -->


					<div class="QnA_comment_title">
						<h3>답변</h3>
					</div>
					<div class="QnA_comment">
						<div class="QnA_comment_top_writer">
							<div class="QnA_comment_writer">
								<img alt="" src="/Farm/img/user.png">&nbsp; 
								<span>운영자</span>&nbsp;
								<span>${qna.market_qna_answer_date}</span>&nbsp; 
								<span  onclick="comment_modify">수정</span>&nbsp;
								<span onclick="comment_delete">삭제</span>&nbsp;
							</div>
							<p>
							${qna.market_qna_answer }
							</p>

						</div>
						
						
					</div>


				</div>
				<!-- board-wrap -->
			</div>
			<!-- inner-wrap -->
			<!-- container끝 -->

			<div id="footer">
				<%@  include file="../inc/foot.jsp"%>
			</div>
		</div>
		<!-- wrap끝  -->
</body>
</html>