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
	var check = 0;
	function comment_modify(a,contents,reply_no) {
		$(".p"+a).html("<form action='/farm/marketDailyReplyUpdate.do' method='post'>"
				+"<input type='hidden' value='${daily.daily_no }' name='daily_no'>"
				+"<input type='hidden' value='${loginUser.member_id }' name='member_id'>"
				+"<input type='hidden' value='"+reply_no+"' name='reply_no'>"
				+"<div class='QnA_comment_top_writer'><textarea required class='answerArea' name='reply_contents'>"+contents+"</textarea>"
				+"<input type='submit' class='answerBtn' value='작성'><button onclick='replyUpdateCancle("+a+",\""+contents+"\")' type='button'>X</button></div></form>");
	}
	function replyUpdateCancle(a,contents){
			$(".p"+a).html(contents);
	}
	/*  
	function comment_delete(){
		location.href ="deleteMarketQnaAnswer.do?market_qna_no=+${qna.market_qna_no}&member_id=${member_id}";
	} */

	/* QnA수정 버튼 */
	function move_daily_modify() {
		location.href = "marketDailyUpdateMove.do?daily_no=${daily.daily_no}";
	}
	function deleteDaily(){
		location.href = "marketDailyDelete.do?daily_no=${daily.daily_no}&market_no=${daily.market_no}";
	}
	
	function underReplyWrite(a,reply_no){
		if(check==0){
		$('.QnA_comment_top_writer.a'+a).append("<div class='underReplyWrite'><form action='/farm/marketDailyUnderReply.do' method='post'>"
			+"<input type='hidden' value='"+reply_no+"' name='reply_no'>"
			+"<input type='hidden' value='${daily.daily_no}' name='daily_no'>"
			+"<input type='hidden' value='${loginUser.member_id }' name='member_id'>"
			+"<div class='QnA_comment_top_writer'><textarea required class='answerArea' name='under_reply_content'></textarea>"
			+"<input type='submit' class='answerBtn' value='작성'><button onclick='underReplyCancle()' type='button'>X</button><br><br></div></form></div>");
			check = 1;
		}
		
	}
	function underReplyCancle(){
		check = 0;
		$('.underReplyWrite').remove();
	}
	function under_replyUpdateCancle(a,contents){
		$(".pu"+a).html(contents);
		check = 0;
	}
	function deleteReply(reply_no){
		location.href="marketReplyDelete.do?reply_no="+reply_no+"&daily_no=${daily.daily_no}";
	}
	function deleteUnderReply(reply_no){
		location.href="marketUnderReplyDelete.do?under_reply_no="+reply_no+"&no=${daily.daily_no}&type=0";
	}
	function under_comment_modify(a,contents,reply_no,under_reply_no) {
		if(check == 0){
		$(".pu"+a).html("<form action='/farm/marketDailyUnderReplyUpdate.do' method='post'>"
				+"<input type='hidden' value='"+reply_no+"' name='reply_no'>"
				+"<input type='hidden' value='${daily.daily_no}' name='daily_no'>"
				+"<input type='hidden' value='"+under_reply_no+"' name='under_reply_no'>"
				+"<input type='hidden' value='${loginUser.member_id }' name='member_id'>"
				+"<div class='QnA_comment_top_writer'><textarea required class='answerArea' name='under_reply_content'>"+contents+"</textarea>"
				+"<input type='submit' class='answerBtn' value='작성'><button onclick='under_replyUpdateCancle(\""+a+"\",\""+contents+"\")' type='button'>X</button></div></form>");
		check = 1;
		}
	}
	
</script>
<script>
	$(function(){
		$.ajax({
			url: "ajaxDailyReply.do",
			type: "post",
			data : {page : 1,
				daily_no: ${daily.daily_no}
			},
			dataType: "JSON",
			success: function(obj){
				var objStr = JSON.stringify(obj);
				var jsonObj = JSON.parse(objStr);
				var loginMember_id = "${loginUser.member_id}";
				//문자열 변수 준비
				var outValues = "<div class='QnA_comment_title'><h3>댓글</h3></div><div class='QnA_comment'>";
				for(var i in jsonObj.list){
					outValues+="<div class='QnA_comment_top_writer a"+i+"'><div class='QnA_comment_writer'>"
						+"<img alt='' src='/Farm/img/user.png'>&nbsp; <span>"+jsonObj.list[i].member_id+"</span>&nbsp;"
						+"<span>"+jsonObj.list[i].reply_date+"</span>&nbsp;";
					<c:if test="${!empty loginUser}">
						outValues+="<div class='underReply' onclick='underReplyWrite("+i+","+jsonObj.list[i].reply_no+")'>┗답글</div>";
					</c:if> 
					
					if(jsonObj.list[i].reply_contents != null){
						
						if(loginMember_id == jsonObj.list[i].member_id){
							outValues+="<span 
							       +
							       class='modifiedSpan' onclick='comment_modify("+i+",\""+jsonObj.list[i].reply_contents+"\","+jsonObj.list[i].reply_no+");'>수정</span>&nbsp;<span class='deleteSpan' onclick='deleteReply("+jsonObj.list[i].reply_no+");'>삭제</span>&nbsp;"
						}
						outValues+="</div><p class='p"+i+"'>"+jsonObj.list[i].reply_contents+"</p></div>";
					}else{
						outValues+="</div><p class='p"+i+"' style='color:#bdbdbd;'>삭제된 댓글입니다.</p></div>";
					}
					
						for(var j in jsonObj.list2){
							if(jsonObj.list[i].reply_no == jsonObj.list2[j].reply_no){
								outValues+="<div class='QnA_comment_top_writer' style='width:930px;padding-left:30px;'><div class='QnA_comment_writer'>"
									+"<img alt='' src='/Farm/img/user.png'>&nbsp; <span>└"+jsonObj.list2[j].member_id+"</span>&nbsp;"
									+"<span>"+jsonObj.list2[j].under_reply_date+"</span>&nbsp;";
								if(loginMember_id == jsonObj.list2[j].member_id){
									outValues+="<span onclick='under_comment_modify(\""+i+""+j+"\",\""+jsonObj.list2[j].under_reply_content+"\","+jsonObj.list2[j].reply_no+","+jsonObj.list2[j].under_reply_no+");'>수정</span>&nbsp;<span onclick='deleteUnderReply("+jsonObj.list2[j].under_reply_no+");'>삭제</span>&nbsp;";
								}
								outValues+="</div><p class='pu"+i+""+j+"'>"+jsonObj.list2[j].under_reply_content+"</p></div>";
							}
						}
				}
				<c:if test="${!empty loginUser}">
					outValues+="<form action='/farm/marketDailyReply.do' method='post'>"
						+"<input type='hidden' value='${daily.daily_no }' name='daily_no'>"
						+"<input type='hidden' value='${loginUser.member_id }' name='member_id'>"
						+"<div class='QnA_comment_top_writer'><textarea required class='answerArea' name='reply_contents'></textarea>"
						+"<input type='submit' class='answerBtn' value='작성'></div></form>";
				</c:if>
				var startPage= 1;
				var endPage = 1;
				var maxPage = 1;
				var currentPage = 1;
				if(Object.keys(jsonObj.list).length > 0){
					var startPage= jsonObj.list[0].startPage;
					var endPage = jsonObj.list[0].endPage;
					var maxPage = jsonObj.list[0].maxPage;
					var currentPage = jsonObj.list[0].currentPage;
				}
				
				var values ="<div class='pagination'>";
				if(startPage>5){
					values+= "<a href='javascript:qnaPage("+(startPage-1)+")'>&laquo;</a>" 
				}else{
					values+="<a>&laquo;</a>";	
				}
				for(var i=startPage;i<=endPage;i++  ){
					if(i==currentPage){
						values+= "<a class='active'>"+i+"</a>";
					}else{
						values+= "<a href='javascript:qnaPage("+i+");'>"+i+"</a>";
					}
				}
				if(endPage<maxPage){
					values+="<a href='javascript:qnaPage("+(endPage+1)+")'>&raquo;</a>";
					
				}else{
					values+="<a>&raquo;</a>";
				}
				values+="</div>"
				$(".board-wrap").append(outValues);
				$(".board-wrap").append(values);
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

					<div class="QnA_title">일지</div>

					<div class="QnA_full">
						<table class="QnA_table">
							<tr>
								<td>${daily.daily_title }</td>
								<td> </td>
								<td>${daily.daily_date }</td>
							</tr>
						</table>
						<c:if test="${loginUser.member_id eq daily.member_id}">
							<div class="QnA_modify">
								<button onclick="move_daily_modify();">수정</button>&nbsp;
								<button onclick="deleteDaily();">삭제</button>
							</div>
						</c:if>
						<div class="QnA_note">
							<p>${daily.daily_contents }</p>
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