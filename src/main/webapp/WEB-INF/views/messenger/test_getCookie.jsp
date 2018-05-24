<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<link href="/farm/resources/css/messenger.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	var index = 0;
	function getCookie() {
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for (var i = ca.length - 1; i >= 0; i--) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				console.log(c.substring(c.indexOf("=") + 1, c.length));
			}
		}
	}
	function changeList(order) {

		var list_size = 3;
	
		var name1='가나다라a마바사아나다라a나다라a자이이이a나다라a나다라asdasd이이ㅇㅇ'
		
		var list1 = '<a href="javascript: return false;"><div class="sh_list1" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title">'
		+name1.substring(0,6)+'<br>'+name1.slice(6)+'</div></a>';
		list1 += '<a href="javascript: return false;"><div class="sh_list2" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title">가나다라마바사아자</div></a>';
		list1 += ' <a href="javascript: return false;"> <div class="sh_list3" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title last">1111111111111111</div></a>';

		var list2 = null;
		var list3 = null;

		switch (list_size) {
		case 3:
			list3 = '<a href="javascript: return false;"><div class="sh_list1" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title">3333333333333333</div></a>';
			list3 += '<a href="javascript: return false;"><div class="sh_list2" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title">3333333333333333</div></a>';
			//list3 += ' <a href="javascript: return false;"> <div class="sh_list3" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title last">3333333333333333</div></a>';

		case 2:
			list2 = '<a href="javascript: return false;"><div class="sh_list1" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title">2222222222222222</div></a>';
			list2 += '<a href="javascript: return false;"><div class="sh_list2" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title">2222222222222222</div></a>';
			list2 += ' <a href="javascript: return false;"> <div class="sh_list3" style="background-image: url(\'/farm/resources/images/pineapple.jpg\');"></div><div class="sh1_title last">2222222222222222</div></a>';
		}


		switch (  (index = (index + order) >= 0 ? (index+order) : list_size-1    ) % list_size ) {
		case 0:
			$('.page1').html(list1);
			break;
		case 1:
			$('.page1').html(list2);
			break;
		case 2:
			$('.page1').html(list3);
		}

	}

	///
	/*  
	 market_no  
	 market_title
	 */

	///
</script>
<meta charset="UTF-8">
<title>COOKIE test</title>

<style type="text/css">
.shoppinglist>a {
	text-decoration: none;
	color: black;
}

.page1 a {
	text-decoration: none;
	color: black;
	height: auto;
	width: auto;
	display: inline-block;
}

.page1 a:hover {
	background-color: #ede7cf;
}

.shoppinglist {
	height: 490px;
}


.sh1_title, .sh1_title_last {
    font-size: 10pt;
    text-align: center;
    height: 36px;
    width: 94px;
    overflow: hidden;
}

.arrow_bottom{
position: absolute;
top: 543px;
}

</style>

</head>
<body>
	<button onclick="getCookie();">쿠키확인</button>
	<button onclick="changeList();">리스트 변경</button>
	<span class="sidebox"> <a href="#top_line" class="move_top_atag">
			<div class="move_top">
				↑<br>TOP
			</div>
	</a> <br>
		<div class="shoppinglist">
			<!-- 최근본 목록 -->


			<a href="javascript: changeList(+1);"><div class="arrow">▲</div></a>

			<div class="recent_list">최근 본 상품</div>
			
			<div class="page1">
				<a href="javascript: return false;"><div class="sh_list1"
						style="background-image: url('/farm/resources/images/pineapple.jpg');"></div>
					<div class="sh1_title">토마토팔아요ㅁㄴㅇㅁㄴㅇㅁㅇasdadasd토마토팔아요ㅁㄴㅇㅁㄴㅇㅁㅇasdadasd</div></a>
					 
					<a href="javascript: return false;"><div class="sh_list2"
						style="background-image: url('/farm/resources/images/pineapple.jpg');"></div>
					<div class="sh1_title">토마토팔아요ㅁㄴㅇㅁㄴㅇㅁㅇasdadasd</div></a> <a href="javascript: return false;">
					<div class="sh_list3"
						style="background-image: url('/farm/resources/images/pineapple.jpg');"></div>
					<div class="sh1_title_last">토마토팔아요ㅁㄴㅇㅁㄴㅇㅁㅇasdadasd토마토팔아요ㅁㄴㅇㅁㄴㅇㅁㅇasdadasd</div>
				</a>
</div>
			

			


			<a href="javascript: changeList(-1);"><div class="arrow_bottom">▼</div></a>
		</div>
		<br>

	</span>

</body>
</html>