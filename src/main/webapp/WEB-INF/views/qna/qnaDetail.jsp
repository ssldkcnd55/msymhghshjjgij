<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!--QnA_Detail.css -->
<link rel="stylesheet" type="text/css"
	href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="/farm/resources/css/QnA_Detail.css" />
<title>QnA</title>


<script type="text/javascript">
	/* 댓글 수정 */
	function comment_modify() {
		$(".QnA_comment").html("<form action='/farm/qnaAnswer.do' method='post'><input type='hidden' value='${main_qna.main_qna_no }'"+
					"name='main_qna_no'><div class='QnA_comment_top_writer'>"+
					"<textarea class='answerArea' name='main_qna_answer'>${main_qna.main_qna_answer}</textarea>"+
					"<input type='submit' class='answerBtn' value='작성'></div></form>");
		
	}
	
	function comment_delete(){
		location.href ="deleteQnaAnswer.do?main_qna_no="+${main_qna.main_qna_no};
	}

	/* QnA수정 버튼 */
	function move_QnA_modify() {
		location.href = "qnaUpdateMove.do?main_qna_title=${main_qna.main_qna_title}"+
				"&main_qna_contents=${main_qna.main_qna_contents}&main_qna_no=${main_qna.main_qna_no}";
	}
	function deleteQna(){
		location.href = "mainQnaDelete.do?main_qna_no=${main_qna.main_qna_no}";
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

					<div class="QnA_title">문의사항</div>

					<div class="QnA_full">
						<table class="QnA_table">
							<tr>
								<td>${main_qna.main_qna_title }</td>
								<td>${main_qna.member_id }</td>
								<td>${main_qna.main_qna_date }</td>
							</tr>
						</table>
						<c:if test="${loginUser.member_id eq main_qna.member_id}">
						<div class="QnA_modify">
							<button onclick="move_QnA_modify();">수정</button>
							&nbsp;
							<button onclick="deleteQna();">삭제</button>
						</div>
						</c:if>
						<div class="QnA_note">
							<p>${main_qna.main_qna_contents }</p>
						</div>
						<br> <br>
					</div>
					<!-- QnA_full  -->

					<c:if test="${empty main_qna.main_qna_answer}">
						<c:if test="${loginUser.member_category eq '2'}">
							<div class="QnA_comment_title">
								<h3>답변</h3>
							</div>
							<div class="QnA_comment">

								<form action="/farm/qnaAnswer.do" method="post">
									<input type="hidden" value="${main_qna.main_qna_no }"
										name="main_qna_no">
									<div class="QnA_comment_top_writer">
										<textarea class="answerArea" name="main_qna_answer"></textarea>
										<input type="submit" class="answerBtn" value="작성">

									</div>
								</form>
							</div>
						</c:if>
					</c:if>
					<c:if test="${!empty main_qna.main_qna_answer}">

						<div class="QnA_comment_title">
							<h3>답변</h3>
						</div>
						<div class="QnA_comment">
							<div class="QnA_comment_top_writer">
								<div class="QnA_comment_writer">
									<img alt="" src="/Farm/img/user.png">&nbsp; <span>운영자</span>&nbsp;
									<!-- 아이디 -->
									<span>${main_qna.main_qna_answer_date }</span>&nbsp;
									<!-- 작성일 -->
									<c:if test="${loginUser.member_category eq '2'}">
										<span onclick="comment_modify();">수정</span>&nbsp; <span
											onclick="comment_delete();">삭제</span>&nbsp;
											</c:if>
								</div>
								<p>${main_qna.main_qna_answer}</p>
							</div>
						</div>
					</c:if>
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