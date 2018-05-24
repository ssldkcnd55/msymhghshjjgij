<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>

<!-- <script type="text/javascript">
	function setCookie() {
		var time = new Date();
		time.setDate(time.getDate()+7);
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');

		document.cookie = "cookie" +  ((ca.length+1) % 8) + "=마켓넘버; expires=" + time;
	}
</script> -->

<script type="text/javascript">
	function setCookie() {
		var time = new Date();
		time.setDate(time.getDate() + 7);
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');

		if (document.cookie.indexOf($('#market_no').val() + "="+ $('#market_no').val() + "a") == -1) 
		{//없음
			if (ca.length > 8) {
				var oldtime = new Date();
				oldtime.setDate(oldtime.getDate() - 7);
				document.cookie = ca[0] + "; expires=" + oldtime;
			}
		} else {
			//있음
			var oldtime = new Date();
			oldtime.setDate(oldtime.getDate() - 7);
			document.cookie = $('#market_no').val() + "=" + $('#market_no').val()+ "a; expires=" + oldtime;
		}

		document.cookie = $('#market_no').val() + "=" + $('#market_no').val()+ "a; expires=" + time;
	}

	function getCookie() {
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		
		for (var i = ca.length - 1; i >= 0; i--) {
				console.log(ca[i].substring(ca[i].indexOf("=") + 1, ca[i].length-1));
		}
	}
</script>

<meta charset="UTF-8">
<title>COOKIE test</title>
</head>
<body>
	<input type="text" id="market_no">
	<button onclick=" setCookie(  ); ">쿠키생성</button>
	<button onclick="getCookie();">쿠키확인</button>

</body>
</html>