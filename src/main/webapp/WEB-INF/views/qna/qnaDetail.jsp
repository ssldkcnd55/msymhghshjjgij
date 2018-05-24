<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

					<div class="QnA_title">공지사항</div>

					<div class="QnA_full">
						<table class="QnA_table">
							<tr>
								<td>홈페이지 공지사항</td>
								<td>김민선</td>
								<td>2018-05-12</td>
							</tr>
						</table>
						<div class="QnA_modify">
							<button onclick="move_QnA_modify();">수정</button>
							&nbsp;
							<button>삭제</button>
						</div>
						<div class="QnA_note">
							<p>
							</p>
						</div>
						<br> <br>
					</div>
					<!-- QnA_full  -->


					<div class="QnA_comment_title">
						<h3>댓글</h3>
					</div>
					<div class="QnA_comment">

						<div class="QnA_comment_top_writer">
							<div class="QnA_comment_writer">
								<img alt="" src="/Farm/img/user.png">&nbsp; 
								<span>아이디</span>&nbsp;
								<span>2018-05-14</span>&nbsp; 
								<span  onclick="comment_modify">수정</span>&nbsp;
								<span onclick="comment_delete">삭제</span>&nbsp;
							</div>
							<p>
							안녕하세요. 사랑하는 고객님, 마켓컬리 대표 김슬아입니다. 마켓컬리와 함께 따뜻한 연말 보내시길
							바랍니다. 오늘은 마켓컬리의 환불 정책과, 이와 관련한 후기게시판의 용도에 대해서 설명 드리고자 합니다.
							</p>

						</div>
						
						<div class="QnA_comment_top_writer">
							<div class="QnA_comment_writer">
								<img alt="" src="/Farm/img/user.png">&nbsp; 
								<span>아이디</span>&nbsp;
								<span>2018-05-14</span>&nbsp; 
								<span>수정</span>&nbsp;
								<span>삭제</span>&nbsp;
							</div>
							<p>
							안녕하세요. 사랑하는 고객님, 마켓컬리 대표 김슬아입니다. 마켓컬리와 함께 따뜻한 연말 보내시길
							바랍니다. 오늘은 마켓컬리의 환불 정책과, 이와 관련한 후기게시판의 용도에 대해서 설명 드리고자 합니다.
							</p>
							<table class="commont_modify">
								<tr>
									<td><textarea rows="4" cols="4"></textarea></div></td>
									<td><input type="submit" value="등록"/></td>
								</tr>
							</table>

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