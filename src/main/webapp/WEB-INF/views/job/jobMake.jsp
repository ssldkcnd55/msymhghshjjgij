<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/jobMake.css" rel="stylesheet" type="text/css" />
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
				<div class="title1 jobMake"><p class="titleP">구인구직 글쓰기</p></div>

				<div class="div">
					<table class="jung_table">
						<tbody>
							<tr class="tr">
								<td class="td">
									<p class="p">구인제목</p>
								</td>
								<td colspan="3" class="td1"><input type="text"
									name="product_name" class="input_text_box"> <br></td>
							</tr>
							<tr class="tr">
								<td class="td">

									<p class="p">구인주소</p>
								</td>
								<td colspan="3" class="td1"><input type="text"
									name="product_name" class="input_text_box2">
									<button onclick="juso()" class="button">주소검색</button> <br>
									<input type="text" name="product_name" class="input_text_box3"
									placeholder="상세주소입력"></td>
							</tr>
							<tr class="tr">
								<td class="td">

									<p class="p">구인전화번호</p>
								</td>
								<td colspan="3" class="td1"><select class="select">
										<option></option>
										<option>010</option>
										<option>011</option>
										<option>017</option>
								</select><input type="text" name="product_name" class="input_text_box4">
									<input type="text" name="product_name" class="input_text_box4"><br></td>
							</tr>
							<tr class="tr">
								<td class="td2">

									<p class="p">구인시작날짜</p>
								</td>
								<td class="td3"><input type="date" name="product_name"
									class="input_date_box"> <br></td>
								<td class="td2">

									<p class="p">구인마감날짜</p>
								</td>
								<td class="td3"><input type="date" name="product_name"
									class="input_date_box"></td>
							</tr>
							<table class="jung_table2">
								<tbody>
									<tr class="tr1">
										<td class="td4"><h3 class="h3">구인구직내용</h3></td>
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
										<textarea name="ir1" id="ir1" rows="10" cols="100"
											style="width: 100%; height: 250px; display: none;"></textarea>
									</form></td>
							</tr>
						</tbody>
					</table>
					<ul class="ui">
						<li class="li3" onclick="location.href='/#'">뒤로가기</li>
						<li class="li4" onclick="location.href='/#'">구인등록</li>
					</ul>
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