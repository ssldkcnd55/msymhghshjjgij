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
<link rel="stylesheet" type="text/css" href="/farm/resources/css/auctionQnADetail.css" />

<title>경매 QnA Detail 정보</title>


<script type="text/javascript">
	/*  댓글 수정 
	 function comment_modify(num){
		$(".galcomUpdate"+i).after(
				
				);
	} */
	
	/* QnA수정 버튼 */
	function moveAuctionQnAModify(){
		location.href="/farm/moveAuctionQnAModify.do?auction_qna_no=${auctionqna.auction_qna_no}";
	}
	
	
	/* 수정 버튼 누르면 수정할수 있게 열림 */
	function seller_QnAanswer_Modify(){
		$(".remove").html(
				"<div class='QnA_comment_title2'>"+
				"<table class='QnA_MODIFY2'><tr><td style='width:90%'>답글</td><td style='width:5%'><button onclick='seller_QnAanswer_Modify();'>수정</button></td><td style='width:5%'><button>삭제</button></td></tr></table>"+
				"<div class='QnA_comment_write'>"+
				"<table class='commont_modify2'><tr>"+
				"<td>${loginUser.member_name}</td>"+
				"<td><textarea rows='5' cols='85' name='auction_qna_answer'>${auctionqna.auction_qna_answer}</textarea></td>"+
				"<td><input type='button' value='확인' onclick='qna_answer();' class='commont_modify2_button' /></td>"+
				"</tr></table></form></div></div></div>"
		);
	}
	
	 /*  판매자 QnA 답글 수정 버튼   */
	function qna_answer(){
		 var auction_qna_answer ="${auctionqna.auction_qna_answer}";
		$.ajax({
			url:"seller_QnAanswer_Modify.do",
			type:"post",
			data:{
				auction_qna_no:${auctionqna.auction_qna_no},
				auction_qna_answer:auction_qna_answer
			},
			
			 datatype:"JSON",
			 succes:function(data){
				console.log(data);
				 var jsonStr = JSON.stringify(data);
		         var json = JSON.parse(jsonStr);
		         $(".commont_modify3").html(
		        		"<td>${loginUser.member_id}</td><td>json.auction_qna_answer_date</td></tr>"+
		 				"<tr><td>json.auction_qna_answer</td></tr>"+
		 				"</tr></table></form></div></div>" 
		         );
			 }
		});
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
								<td style="width: 75%">${auctionqna.auction_qna_title }</td>
								<td style="width: 15%">${auctionqna.member_id }</td>
								<td style="width: 10%">${auctionqna.auction_qna_question_date }</td>
							</tr>
						</table>
						<div class="QnA_modify">
							<button onclick="moveAuctionQnAModify();">수정</button>
							&nbsp;
							<button>삭제</button>
						</div>
						<div class="QnA_note">
							<p>${auctionqna.auction_qna_contents }</p>
						</div>
						<br> <br>
					</div>
					<!-- QnA_full  -->

					<!-- QnA 답글 -->
						<div class="remove">
							<form action="updateauctionQnA_Answer.do" method="post" onsubmit="return seller_QnAanswer_Modify();">
						
							<c:choose>
								<c:when test="${empty auctionqna.auction_qna_answer}">
									<div class="QnA_comment_title">
										<p>답글</p>
										<div class="QnA_comment_write">

											<input type="hidden" name="auction_qna_no"
												value="${auctionqna.auction_qna_no}">
											<table class="commont_modify2">
												<tr>
													<td>${loginUser.member_name}</td>
													<td><textarea rows="5" cols="85"
															name="auction_qna_answer"></textarea></td>
													<td><input type="submit" value="등록"
														class="commont_modify2_button" /></td>
												</tr>
											</table>
										</div>
									</div><!-- QnA_comment_title -->
								</c:when>
								
								<c:otherwise>
									<div class='QnA_comment_title2'>
										<div class='more'>
											<table class='QnA_MODIFY2'>
												<tr>
													<td style='width: 90%'>답글</td>
													<td style='width: 5%'>
														<button><a href="javascript:seller_QnAanswer_Modify();">수정</a></button></td>
													<td style='width: 5%'><button>삭제</button></td>
												</tr>
											</table>
											<div class='QnA_comment_write'>
												<table class='commont_modify3'>
													<tr>
														<td>${loginUser.member_name}</td>
													</tr>
													<tr>
														<td>${auctionqna.auction_qna_answer}</td>
													</tr>
													
												</table>
					
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							</form>
						</div><!-- 전체 remove -->
					
	<%-- <div class="QnA_comment">
						<div class="QnA_comment_top_writer">
							<div class="QnA_comment_writer">
								<img alt="" src="/Farm/img/user.png">&nbsp; 
								<span>${auctionqna.member_id}</span>&nbsp;
								<span>${auctionqna.auction_qna_answer_date}</span>&nbsp; 
								<span>수정</span>&nbsp;
								<span>삭제</span>&nbsp;
							</div>
							<p>
							${auctionqna.auction_qna_answer}
							</p>
							< action="updateauctionQnA_Answer.do" method="post">
							<input type="hidden" name="auction_qna_no" value="${auctionqna.auction_qna_no}">
							<table class="commont_modify2">
								<tr>
									<td >판매자</td>
									<td ><textarea rows="5" cols="90" name="auction_qna_answer"></textarea></div></td>
									<td><input type="submit" value="등록" class="commont_modify2_button"/></td>
									
								</tr>
							</table>
							</form>
						</div>
					</div> --%>


				</div><!-- board-wrap -->
			</div><!-- inner-wrap -->
			<!-- inner-wrap -->
			<!-- container끝 -->

			<div id="footer">
				<%@  include file="../inc/foot.jsp"%>
			</div>
		</div><!-- container -->
		</div><!-- wrap -->
		
</body>
</html>