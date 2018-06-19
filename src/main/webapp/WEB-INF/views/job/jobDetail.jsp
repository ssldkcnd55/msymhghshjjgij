<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript"></script>
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
						<div id="job_image"
							style="background-image: url('/farm/resources/images/job2.png')"></div>
						<div id="job">&nbsp;${job.job_title}</div>
						<%-- <p class="job_name">${job.job_name}</p> --%>						
						<%-- <p class="job_titleP">
							<span class="job_date">${job.job_date}</span>
						</p> --%>
					</div>				
					 <div class="job_imgbox" style="background-image: url('/farm/resources/upload/jobUpload/${job.job_img}'); background-size:cover;"></div>		
					<div>
						<table class="job_table">
							<tr>
								<th colspan="2">모집조건</th>
								<th colspan="2">채용담당자 정보</th>
							</tr>
							<tr>
								<td>시작일</td>
								<td>${job.job_startdate}</td>
								<td>담당자</td>
								<td>${job.member_id}</td>
							</tr>
							<tr>
								<td>마감일</td>
								<td>${job.job_enddate}</td>
								<td>연락처</td>
								<td>${job.job_tel}</td>
							</tr>
							<tr>
								<td colspan="4"><p
										style="padding: 5px 0 0 0; font-size: 10pt; color: #f37633; border-top: solid 1px #f0ebd8; margin: 0 0 20px 0;">*
										구직이 아닌 광고 등의 목적으로 연락처를 사용할 경우, 법적 처벌을 받을 수 있습니다.</p></td>
							</tr>
						</table>
						<!-- <div class="map_div" id="map">지도</div> -->
						<div id="map" style="width: 100%; height: 350px;"></div>
						<div class="content_div">상세모집요강</div>
						<div style="margin:0px;width:930px;float:left;;padding:10px;">${job.job_contents}</div>
					</div>
				</div>
			</div>
			<!-- container끝 -->
			<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=641c983cdbb6dc19fb95770474283025&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'${job.job_addr}',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === daum.maps.services.Status.OK) {

								var coords = new daum.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new daum.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new daum.maps.InfoWindow(
										{
											content : "<div style='width:150px;text-align:center;padding:6px 0;'>${job.job_name}</div>"
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
			<%@ include file="../messenger/msg_box.jsp"%>
		</div>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>

		</div>
	</div>
	<!-- wrap끝  -->
</body>
</html>