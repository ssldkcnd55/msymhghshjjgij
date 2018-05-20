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
			<%@ include file="../inc/top_menu.jsp"%>
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
							<p>직장인들이 가장 살고 싶어하는 도시는 어디일까. 12일 취업포털 잡코리아와 아르바이트포털 알바몬에 따르면
								최근 직장인 1462명을 대상으로 ‘꼭 살아보고 싶은 꿈의 도시’에 관한 설문조사를 공동으로 진행한 결과 응답자의
								22.0%가 제주도가 선택해 1위로 나타났다. 제주도는 남녀 직장인, 기혼 및 미혼 직장인 등 모든 응답군에서
								선두를 차지한 것으로 나타났다. 2위는 응답자 가운데 12.0%의 선택을 받은 서울 강남이었다. 서울 강남을 ‘꿈의
								도시’로 꼽은 응답자 가운데서는 미혼자가 기혼자보다 훨씬 많았다. 이어 부산(4.9%), 서울 기타
								지역(4.4%), 호주 멜버른(3.5%) 등이 뒤를 이었다. 원문보기:
								http://news.donga.com/NewsStand/3/all/20180512/90043781/1#csidx284620139869a888d36a8f74f832532
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