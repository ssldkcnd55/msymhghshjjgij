<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/farm/resources/css/jobMake.css" rel="stylesheet"
	type="text/css" />
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="naver/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<meta charset="UTF-8">
<title>Farm</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js">
	
</script>
<script type="text/javascript">
	function juso() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				console.log(data.roadAddress);
				$("#loc").val(data.roadAddress);
			}
		}).open();
	};
</script>
</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">
				<div class="title1 jobMake">
					<p class="titleP">구인구직 글쓰기</p>
				</div>

				<div class="div">
					<form action="jobMake.do" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="member_id"
							value="${loginUser.member_id }">
						<table class="jung_table">
							<tbody>
								<tr class="tr">
									<td class="td">
										<p class="p">제목</p>
									</td>
									<td colspan="3" class="td1"><input type="text"
										name="job_title" class="input_text_box"> <br></td>
								</tr>
								<tr class="tr">
									<td class="td">

										<p class="p">주소</p>
									</td>
									<td colspan="3" class="td1"><input type="text"
										name="job_addr" id="loc" class="input_text_box2">
										<button onclick="juso()" class="button">주소검색</button> <br>
										<!-- <input type="text" name="job_addr2" class="input_text_box3"
									placeholder="상세주소입력"> --></td>
								</tr>
								<tr class="tr">
									<td class="td">
										<p class="p">농장프로필</p>
									</td>
									<td colspan="3" class="td1">
										<!-- <img
										src="/farm/resources/images/default_user.png" id="profile"
										style="text-align: center" alt="이미지를 선택해주세요"></img> -->
										<input type="file" id="file-1" class="inputfile inputfile-1"
										accept='image/gif,image/jpeg,image/pnp'
										data-multiple-caption="{count} files selected" name="upfile"
										onchange="readURL(this);" style="width: 1px; height: 1px;" />
										<label for="file-1" style="background: #7e5957;"><svg
												xmlns="http://www.w3.org/2000/svg" width="20" height="17"
												viewBox="0 0 20 17">
										<path
													d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z" /></svg>
											<span style="font-size: 12pt;">프로필 사진</span></label>
									</td>
								</tr>
								<tr class="tr">
									<td class="td">
										<p class="p">전화번호</p>
									</td>
									<td colspan="3" class="td1">
										<!-- <select class="select"
									name="job_tel">
										<option></option>
										<option>010</option>								
								</select> --> <input type="text" name="job_tel1"
										class="input_text_box4"> -<input type="text"
										name="job_tel2" class="input_text_box4"> -<input
										type="text" name="job_tel3" class="input_text_box4">
									</td>
								</tr>
								<tr class="tr">
									<td class="td2">

										<p class="p">구인시작날</p>
									</td>
									<td class="td3"><input type="date" name="job_startdate"
										class="input_date_box"> <br></td>
									<td class="td2">

										<p class="p">구인마감날</p>
									</td>
									<td class="td3"><input type="date" name="job_enddate"
										class="input_date_box"></td>
								</tr>
								<table class="jung_table2">
									<tbody>
										<tr class="tr1">
											<td class="td4"><h3 class="h3">상세내용</h3></td>
										</tr>
									</tbody>
								</table>
							</tbody>
						</table>

						<table class="jung_table3">
							<tbody>
								<tr>
									<td style="width: 100%;"><form
											action="sample/viewer/index.php" method="post">
											<textarea name="job_contents" id="ir1" rows="10" cols="100"
												style="width: 100%; height: 250px; display: none;"></textarea>
										</form></td>
								</tr>
							</tbody>
						</table>
						<!--
						<ul class="ui">
							<li class="li3" onclick="location.href='/#'">뒤로가기</li>
							<li class="li4" onclick="location.href='/#'"><input
								type="submit" value="구인등록"></li>
						</ul> -->
						<input class="li4_input" type="button" value="뒤로가기"> <input
							class="li4_input submit" type="submit" value="구인등록"
							onclick="submitContents();">
					</form>
				</div>
			</div>
		</div>
		<%@ include file="../messenger/msg_box.jsp"%>
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
	<script type="text/javascript">
		var oEditors = [];

		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "/farm/naver/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : false, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});

		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
		}

		function showHTML() {
			var sHTML = oEditors.getById["ir1"].getIR();
			alert(sHTML);
		}

		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}

		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</body>
</html>