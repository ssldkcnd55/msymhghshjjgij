<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/marketMake.css" rel="stylesheet" type="text/css" />
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/editor/marketnaver/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<meta charset="UTF-8">
<title>Farm</title>

<script type="text/javascript">
	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$target.css('display', '');
				/* $target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시 */
			  $target.html('<img class="backimg" src="' + e.target.result + '" border="0" alt="" />'); 
				
				$target.css('text-align','left');
				$target.css('line-heigt','0px');
				$target.css('border','none');
						/* $target.css('background-image',e.target.result); */
			}
			reader.readAsDataURL(html.files[0]);
		}
	}
</script>
<script>
$(function(){
	
	$.ajax({
		url : "ajaxCategory.do",
		type : "post",
		dataType : "JSON",
		success : function(obj) {
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			
			var outValues = "<option value=''>분류 선택</option>";
			
			for ( var i in jsonObj.list) {
				outValues += "<option value='"+jsonObj.list[i].category_main+"'>"+jsonObj.list[i].category_main+"</option>";
			}
			$('#CategoryMain').html(outValues);
		},error : function(request, status, errorData) {
			console.log("error code : " + request.status + "\nmessage"
					+ request.responseText + "\nerror" + errorData);
		}
	});

	 $('#CategoryMain').change(function(){
		$.ajax({
			url : "ajaxCategoryName.do",
			type : "post",
			data : {
				
				category_main : $(this).val()
			},
			dataType : "JSON",
			success : function(obj) {
				var objStr = JSON.stringify(obj);
				var jsonObj = JSON.parse(objStr);
				$('#CategoryName').removeAttr('disabled'); 
				var outValues = "<option value=''>분류 선택</option>";
				
				for ( var i in jsonObj.list) {
					outValues += "<option value='"+jsonObj.list[i].category_no+"'>"+jsonObj.list[i].category_name+"</option>";
				}
				$('#CategoryName').html(outValues);
			},error : function(request, status, errorData) {
				console.log("error code : " + request.status + "\nmessage"
						+ request.responseText + "\nerror" + errorData);
			}
		});
	}); 
	 $('#CategoryName').change(function(){
		 $('#category_no').val($(this).val());
	 });
 });
function categoryCheck(){
	if($('#category_no').val() != ''){
		return true;
	}else{
		alert('카테고리를 선택해주세요.');
		return false;
	}
}
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
				<br> <br>
				<h2 style="text-align: center; margin: auto;">장터등록</h2>
				<br> <br> <br>

				<div class="div">
				<form action="insertMarketMake.do" method="post" enctype="multipart/form-data" onsubmit='return categoryCheck()'>
					<input type="hidden" name="member_id" value="${loginUser.member_id }">
					<input type="hidden" name="category_no" id="category_no" value="">
					<table class="jung_table">
						<tbody>
							<tr class="tr">
								<td class="td">
									<p class="p">판매제목</p>
								</td>
								<td colspan="3" class="td2"><input type="text"
									name="market_title" class="input_text_box"> <br></td>
							</tr>
							<tr class="tr">
								<td class="td">

									<p class="p">부제목</p>
								</td>
								<td colspan="3" class="td2"><input type="text"
									name="market_note" class="input_text_box"> <br></td>
							</tr>
							<tr class="tr">
								<td class="td">

									<p class="p">카테고리</p>
								</td>
								<td colspan="3" class="td2" id="categoryTd" style="font-size: 10pt">
									대분류 <select id='CategoryMain'></select>
									   소분류  <select id="CategoryName" disabled></select>
								</td>
							</tr>
							<tr class="tr">
								<td class="td">

									<p class="p">이미지</p>
								</td>
								<td colspan="3" class="td2" style="height: 370px;">

										<div class="filebox">
										<div>
											<input type="file" name="upfile" id="cma_file"
												accept="image/*" capture="camera" 
												onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br /> <br />
											<div id="cma_image" class="cma_image">이미지를 선택해 주세요</div>
											</div>
										</div>
								</td>
							</tr>
							<tr class="tr">
								<td class="td3">

									<p class="p">출고예정일</p>
								</td>
								<td class="td4"><input type="date" name="market_releasedate"
									class="input_date_box"> <br></td>

							</tr>
							<tr class="tr">
								<td class="td">

									<p class="p">판매가격</p>
								</td>
								<td colspan="3" class="td2"><input type="number"
									name="market_price" class="input_text_box2" placeholder="가격입력">
									원 <br></td>
							</tr>
							<tr class="tr">
								<td class="td">
									<p class="p">판매수량</p>
								</td>
								<td colspan="3" class="td2"><input type="number"
									name="market_amount" class="input_text_box2" placeholder="수량입력">
									kg <br></td>
							</tr>
							<table class="jung_table2">
								<tbody>
									<tr class="tr2">
										<td class="td5"><h3 class="h3">판매내용</h3></td>
									</tr>
								</tbody>
							</table>
						</tbody>
					</table>

					<table class="jung_table2">
						<tbody>
							<tr>
								<td style="width: 100%;">
										<textarea name="market_intro" id="ir1" rows="10" cols="100"
											style="width: 100%; height: 250px; display: none;"></textarea>
								</td>
							</tr>
						</tbody>
					</table>

					<!-- <table class="jung_table2" style="margin-top: 30px;">
						<tbody>
							<tr class="tr">
								<td class="td">
									<p class="p">배송방법</p>
								</td>
								<td colspan="3" class="td2"><ul class="ui">
										<li class="li"><input type="checkbox" name="product_name">택배</li>
										<li class="li2"><input type="checkbox"
											name="product_name">직접전달</li>
									</ul> <br></td>
							</tr>
						</tbody>
					</table> -->
						<input class="li4_input" type="button" value="뒤로가기">
						<input class="li4_input submit" type="submit" value="판매등록" onclick="submitContents();">
				</form>
				</div>
				
			</div>
		</div>
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
		}

		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
			/* alert(document.getElementById("ir1").value); */
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