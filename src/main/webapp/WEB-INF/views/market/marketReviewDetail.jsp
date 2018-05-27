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
<title>후기</title>


<script type="text/javascript">
/* 댓글 수정 */
	 function comment_modify() {
		$(".QnA_comment").html("<form action='/farm/marketQnaAnswer.do' method='post'><input type='hidden' value='${qna.market_qna_no }'"+
					"name='market_qna_no'><input type='hidden' value='${member_id }' name='member_id'><div class='QnA_comment_top_writer'>"+
					"<textarea class='answerArea' name='market_qna_answer'>${qna.market_qna_answer}</textarea>"+
					"<input type='submit' class='answerBtn' value='작성'></div></form>");
	}
	
	function comment_delete(){
		location.href ="deleteMarketQnaAnswer.do?market_qna_no=+${qna.market_qna_no}&member_id=${member_id}";
	}

	/* QnA수정 버튼 */
	function move_review_modify() {
		location.href = "marketReviewUpdateMove.do?market_qna_title=${qna.market_qna_title}"+
				"&market_qna_contents=${qna.market_qna_contents}&market_qna_no=${qna.market_qna_no}"+
				"&member_id=${member_id}";
	}
	function deleteReview(){
		location.href = "marketReviewDelete.do?market_qna_no=${qna.market_qna_no}&market_no=${qna.market_no}";
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

					<div class="QnA_title">후기</div>

					<div class="QnA_full">
						<table class="QnA_table">
							<tr>
								<td>${review.review_title }</td>
								<td>${review.member_id }</td>
								<td>${review.review_date }</td>
							</tr>
						</table>
						<c:if test="${loginUser.member_id eq review.member_id}">
							<div class="QnA_modify">
								<button onclick="move_review_modify();">수정</button>&nbsp;
								<button onclick="deleteReview();">삭제</button>
							</div>
						</c:if>
						<div class="QnA_note">
							<p>${review.review_contents }</p>
						</div>
						<br> <br>
					</div>
					<!-- QnA_full  -->
					

					<%-- <c:if test="${empty review.market_qna_answer}">
						<c:if test="${loginUser.member_id eq member_id}">
							<div class="QnA_comment_title">
								<h3>답변</h3>
							</div>
							<div class="QnA_comment">

								<form action="/farm/marketQnaAnswer.do" method="post">
									<input type="hidden" value="${qna.market_qna_no }" name="market_qna_no">
									<input type="hidden" value="${member_id }" name="member_id">
									<div class="QnA_comment_top_writer">
										<textarea class="answerArea" name="market_qna_answer"></textarea>
										<input type="submit" class="answerBtn" value="작성">

									</div>
								</form>
							</div>
						</c:if>
					</c:if>
					<c:if test="${!empty qna.market_qna_answer}">

						<div class="QnA_comment_title">
							<h3>답변</h3>
						</div>
						<div class="QnA_comment">
							<div class="QnA_comment_top_writer">
								<div class="QnA_comment_writer">
									<img alt="" src="/Farm/img/user.png">&nbsp; <span>${member_id }</span>&nbsp;
									<!-- 아이디 -->
									<span>${qna.market_qna_answer_date }</span>&nbsp;
									<!-- 작성일 -->
									<c:if test="${loginUser.member_id eq member_id}">
										<span onclick="comment_modify();">수정</span>&nbsp; <span
											onclick="comment_delete();">삭제</span>&nbsp;
											</c:if>
								</div>
								<p>${qna.market_qna_answer}</p>
							</div>
						</div>
					</c:if> --%>


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