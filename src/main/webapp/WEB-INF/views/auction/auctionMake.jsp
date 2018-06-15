<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/auctionMake.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/editor/auctionnaver/js/HuskyEZCreator.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Farm</title>

<style type="text/css">
 #cma_image img{
 	height:250px;
 	width:auto;
 	float:center;
 }
</style>

<script type="text/javascript">

	/* 사진 */
	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$target.css('display', '');
				//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
				$target
						.html('<img src="' + e.target.result + '" border="0" alt="" />');
			}
			reader.readAsDataURL(html.files[0]);
		}
	}
	

	/* 경매등록 버튼 */
	function submitContents(){
		location.href="/farm/moveAcutionDetail.do";
	}
	
	//경매 등록 전 경매 시작 날짜 체크
	$(function(){
		$.ajax({
			url:"auction_startdateCheck.do",
			type:"post",
			dataType: "JSON",
			success: function(data){
				/* console.log(data); */
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);	
				/* alert("확인 sysdate : "+jsonObj.sysdate2); */
				
				var outValues ="";
					outValues +=
						"<input type='date' name='auction_startdate' class='input_datebox' required "+
						+"min='"+jsonObj.sysdate2+"'/>";
				 $("#start_date").html(outValues);
				
				}
			
			});
		
	});
	
	/* function auction_startdateCheck(){
		
		var startdate = $("#startdate").val();
		alert("startdate : "+startdate);
		var result = true;
		$.ajax({
			url:"auction_startdateCheck.do",
			type:"post",
			dataType: "JSON",
			success: function(data){
				console.log(data);
				var objStr = JSON.stringify(data);
				var jsonObj = JSON.parse(objStr);	
				alert("확인 sysdate : "+jsonObj.sysdate2);
				
				var outValues ="";
					outValues +=
						"<input type='date' name='auction_startdate' class='input_datebox' required "+
						+"min='"+jsonObj.sysdate2+"'>";
				 $(".start_date").html(outValues);
				 return true;
				}
			
			});
		return result;
	} */

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
				<div class="title1 auctionMake"><p class="titleP">경매 글쓰기</p></div>
				<form action="insertAuctionMake.do" method="post" enctype="multipart/form-data" >
				<input type="hidden" value="${loginUser.member_id}" name="member_id">
				<div class="main_width">
					<table class="jung_table">
						<tbody>
							<tr class="tr1">
								<td class="td1">
									<p class="p">상품명</p>
								</td>
								<td class="td2" colspan="3"><input type="text"
									name="auction_title"  placeholder="한글 10~15글자"> <!-- <input type="submit"
									 name="category_no" value="카테고리검색" class="input_text_box">
									<br> --></td>
							</tr>
							<tr class="tr1">
									<td class="td1">
										<p class="p">부제목</p>
									
									</td>
									<td class="td2" colspan="3"><input type="text"
									name="auction_note" placeholder="한글 60~65글자"></td>
							</tr>
							<tr class="tr1">
									<td class="td1">
										<p class="p">이미지</p>
									
									</td>
									<td class="td2" colspan="3">
									<div class="filebox">
											<input type="file" name="upfile" id="cma_file"
												accept="image/*" capture="camera"
												onchange="getThumbnailPrivew(this,$('#cma_image'))"
												style="margin-left: 2px;"  /> <br /> <br />
											<div id="cma_image" style="margin-left:200px;">
												<%-- <img src="/farm/resources/upload/auctionUpload/${auction.auction_img}"> --%></div>
										</div>
									</td>
							</tr>
								<tr class="tr1">
								<td class="td1">

									<p class="p">경매시작가</p>
								</td>
								<td colspan="3" class="td2"><input type="text"
									name="auction_startprice"> <br></td>
							</tr>
							<tr class="tr1">
								<td class="td1">

									<p class="p">즉시구매가</p>
								</td>
								<td colspan="3" class="td2"><input type="text"
									name="auction_directprice"> <input type="checkbox"
									 class="input_checkbox"
									style="margin-left: 15px;">즉시구매가설정안함<br></td>
							</tr>
							<tr class="tr1">
								<td class="td3">

									<p class="p">경매시작날짜</p>
								</td>
								<td class="td4" > <div id="start_date"></div>
								<!-- <input type="date" name="auction_startdate" id="startdate" 
									class="input_datebox" required> -->  <br></td>
								<td class="td3">

									<p class="p">경매마감날짜</p>
								</td>
								<td class="td4" > <input type="date" name="auction_enddate" 
									class="input_datebox" required> </td>
							</tr>
							<table class="jung_table2">
								<tbody>
									<tr class="tr2">
										<td class="main_width"><h3 class="h3">상품내용</h3></td>
									</tr>
								</tbody>
							</table>
						</tbody>
					</table>

					<table class="jung_table2">
						<tbody>
							<tr>
								<td class="main_width">
										<textarea name="auction_intro" id="auction_note" rows="10" cols="100"
											style="width: 100%; height: 600px; display: none;"></textarea>
									</td>
							</tr>
						</tbody>
					</table>

					<!-- <table class="jung_table3">
						<tbody>
							<tr class="tr1">

								<td class="td5">

									<p class="p">배송방법</p>
								</td>
								<td colspan="3" class="td6"><ul class="ui">
										<li class="li"><input type="checkbox" name="product_name">택배</li>
										<li class="li2"><input type="checkbox"
											name="product_name">직접전달</li>
									</ul> <br></td>
							</tr>
						</tbody>
					</table> -->
					<ul style="list-style: none;">
						<li class="li3" onclick="location.href='/#'">뒤로가기</li>
						<li class="li4"><input class="li4_input" type="submit" value="경매등록" onclick="submitContents();" ></li>
						<!-- <li class="li4" onclick="location.href='/#'">물품등록</li> -->
					</ul>
					<br><br><br><br>
				</div>
				</form>
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
			elPlaceHolder : "auction_note",
			sSkinURI : "/farm/resources/editor/auctionnaver/SmartEditor2Skin.html",
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
				//oEditors.getById["auction_note"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});

		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["auction_note"].exec("PASTE_HTML", [ sHTML ]);
		}

		function showHTML() {
			var sHTML = oEditors.getById["auction_note"].getIR();
			alert(sHTML);
		}

		function submitContents(elClickedObj) {
			oEditors.getById["auction_note"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("auction_note").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}

		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["auction_note"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</body>
</html>