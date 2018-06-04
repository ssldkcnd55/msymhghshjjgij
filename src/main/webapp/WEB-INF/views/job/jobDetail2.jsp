<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<!-- Job_Detaile.css -->
<link rel="stylesheet" type="text/css"
	href="/farm/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="/farm/resources/css/jobDetail2.css" />
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
				<div class="job_box">
					<div class="job_title">
						<p class="job_name">김영민</p>
						<p class="job_titleP">토마토를 팔아보까여<span class="job_date">2018-01-02</span></p>
					</div>
					<div class="job_imgbox">
						사진
					</div>
					<div>
						<table class="job_table">
							<tr>
								<th colspan="2">모집조건</th>
								<th colspan="2">채용담당자 정보</th>
							</tr>
							<tr>
								<td>시작일</td>
								<td>2018-02-02</td>
								<td>담당자</td>
								<td>김영민</td>
							</tr>
							<tr>
								<td>마감일</td>
								<td>2018-01-01</td>
								<td>연락처</td>
								<td>02-123-1234</td>
							</tr>
							<tr>
								<td colspan="4"><p style="padding:5px 0 0 0;font-size:10pt;color:#f37633;border-top:solid 1px #f0ebd8;margin:0 0 20px 0;">* 구직이 아닌 광고 등의 목적으로 연락처를 사용할 경우, 법적 처벌을 받을 수 있습니다.</p></td>
							</tr>
						</table>
						<div class="map_div">지도</div>
						<div class="content_div">
							상세모집요강
						</div>
						<div style="padding:10px;">11111</div>
					</div>
				</div>
			</div>
			<!-- container끝 -->
			<%@ include file="../messenger/msg_box.jsp"%>
		</div>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>

		</div>
	</div>
	<!-- wrap끝  -->
</body>
</html>