<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/editor/marketnaver/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/qnaMake.css" rel="stylesheet" type="text/css" />

<meta charset="UTF-8">
<title>Farm</title>

</head>
<body>
	<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">
				<div class="title qna"><p class="titleP">후기 쓰기</p></div>

				<div class="div">
				<form action="marketReviewUpdate.do" method="post">
					<table class="jung_table">
						<tbody>
							<tr class="tr">
								<td class="td">
									<p class="p">제목</p>
								</td>
								<td colspan="3" class="td2"><input type="text" value="${review.review_title}"
									name="review_title" class="input_text_box"> <br></td>
							</tr>
							<table class="jung_table2">
								<tbody>
									<tr class="tr2">
										<td class="td3"><h3 class="h3">내용</h3></td>
									</tr>
								</tbody>
							</table>
						</tbody>
					</table>

					<table class="jung_table2">
						<tbody>
							<tr>
								<td style="width: 100%;">
									
										<textarea name="review_contents" id="ir1" rows="10" cols="100"
											style="width: 100%; height: 250px; display: none;">${review.review_contents}</textarea>
									</td>
							</tr>
						</tbody>
					</table>
					<input class="li4_input" type="button" value="뒤로가기">
						<input class="li4_input submit" type="submit" value="글쓰기" onclick="submitContents();">
						
						<input type="hidden" name="review_no" value="${review.review_no }">
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
			sSkinURI : "/farm/resources/editor/marketnaver/SmartEditor2Skin.html",
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