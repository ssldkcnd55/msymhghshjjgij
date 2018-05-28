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
<script>
	$(function(){
		$.ajax({
			url: "ajaxReviewReply.do",
			type: "post",
			data : {page : 1,
				review_no: ${review.review_no}
			},
			dataType: "JSON",
			success: function(obj){
				var objStr = JSON.stringify(obj);
				var jsonObj = JSON.parse(objStr);
				//문자열 변수 준비
				var outValues = "<div class='QnA_comment_title'><h3>댓글</h3></div><div class='QnA_comment'>";
				for(var i in jsonObj.list){
					outValues+="<div class='QnA_comment_top_writer'><div class='QnA_comment_writer'>"
						+"<img alt='' src='/Farm/img/user.png'>&nbsp; <span>"+jsonObj.list[i].member_id+"</span>&nbsp;"
						+"<span>"+jsonObj.list[i].reply_date+"</span>&nbsp;<span onclick='comment_modify();'>수정</span>&nbsp;"
						+"<span onclick='comment_delete();'>삭제</span>&nbsp;</div><p>"+jsonObj.list[i].reply_contents+"</p>"
						+"</div>";
				}
				<c:if test="${!empty loginUser}">
					outValues+="<form action='/farm/marketReviewReply.do' method='post'>"
						+"<input type='hidden' value='${review.review_no }' name='review_no'>"
						+"<input type='hidden' value='${loginUser.member_id }' name='member_id'>"
						+"<div class='QnA_comment_top_writer'><textarea class='answerArea' name='review_contents'></textarea>"
						+"<input type='submit' class='answerBtn' value='작성'></div></form>";
				</c:if>
				
				$(".board-wrap").append(outValues);
			},error: function(request,status,errorData){
				alert("error code : " + request.status + "\nmessage" + 
						request.responseText + "\nerror" + errorData);
			}
		});
	});


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