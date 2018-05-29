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
	
	/* QnA수정 버튼 */
	function moveAuctionQnAModify(){
		location.href="/farm/moveAuctionQnAModify.do?auction_qna_no=${auctionqna.auction_qna_no}";
	}
	
	
	/* 수정 버튼 누르면 수정할수 있게 열림 */
	function seller_QnAanswer_Modify(){
		var answer = $('#qna_answer_td').text();
		$(".remove").html(
				"<div class='QnA_comment_title2'>"+
				"<table class='QnA_MODIFY2'><tr><td style='width:90%'>답글</td>"+
				"<td style='width:5%'><button onclick='seller_QnAanswer_Modify();'>수정</button></td>"+
				"<td style='width:5%'><button onclick='seller_QnAanswer_del();'>삭제</button></td></tr></table>"+
				"<div class='QnA_comment_write'>"+
				"<table class='commont_modify2'><tr>"+
				"<td>${loginUser.member_name}</td>"+
				"<td><textarea rows='5' cols='85' name='auction_qna_answer' id='qna_answer'>"
				+answer+"</textarea></td>"+
				"<td><input type='button' value='확인' onclick='qna_answer_submit();' class='commont_modify2_button' /></td>"+
				"</tr></table></form></div></div></div>"
		);
	}
	
	 /*  판매자 QnA 답글 수정 버튼   */
	function qna_answer_submit(){
		/*  var auction_qna_answer ="${auctionqna.auction_qna_answer}"; 
		이러면 수정하려는 내용은 못가져오고 디테일로 뿌릴때 가져온 기존 답글 내용만 가져오게됩니다
		그래서 수정전의 내용을 가지고 update문으로 가니까 update가 안된다고 생각한것입니다*/
		var answer = $('#qna_answer').val(); //textarea에 id값을 줘서 입력한 값을 가져옵니다
		$.ajax({
			url:"seller_QnAanswer_Modify.do",
			type:"post",
			data:{
				auction_qna_no:${auctionqna.auction_qna_no},
				auction_qna_answer:answer
			},
			
			 datatype:"json",
			 success:function(json){
				console.log(json);
				
				 var jsonStr = JSON.stringify(json);
		         var json = JSON.parse(jsonStr);
		        
		        $('.QnA_comment_write').html(
		        "<table class='comment_modify3'id='comment_table'>"
					+"<tr>"
						+"<td>${loginUser.member_name}</td>"
						+"<td style='padding-left;'>"+json.auction_qna_answer_date+"</td>"
					+"</tr>"
					+"<tr>"
						+"<td colspan='2' id='qna_answer_td'>"+json.auction_qna_answer+"</td>"
					+"</tr>"
				+"</table>"
				); 
			 }
		});
	} 
	 
	 //답글 삭제
	 function seller_QnAanswer_del(){
		 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			    location.href ="/farm/delete_auction_qna_answer.do?auction_qna_no=${auctionqna.auction_qna_no}";
			}else{   //취소
			    return;
			}
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
							<!-- <form action="updateauctionQnA_Answer.do" method="post" onsubmit="return seller_QnAanswer_Modify();"> -->
							<form action="updateauctionQnA_Answer.do" method="post">
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
									</form>
								</c:when>
								
								<c:otherwise>
									<div class='QnA_comment_title2'>
										<div class='more'>
											<table class='QnA_MODIFY2'>
												<tr>
													<td style='width: 90%'>답글</td>
													<td style='width: 5%'>
														<button onclick="seller_QnAanswer_Modify(this);">수정</button></td>
													<td style='width: 5%'><button onclick="seller_QnAanswer_del();">삭제</button></td>
												</tr>
											</table>
											<div class='QnA_comment_write'>
												<table class='comment_modify3'id='comment_table'>
													 <tr>
														<td>${loginUser.member_name}</td>
														<%-- <td>${auctionqna.auction_qna_answer_date}</td>  --%>
													</tr>
													<tr>
														<td colspan="2" id="qna_answer_td">${auctionqna.auction_qna_answer}</td>
													</tr>
												</table>
					
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							<!-- </form> -->
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