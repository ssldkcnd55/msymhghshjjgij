<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function setCookie() {
		var time = new Date();
		time.setDate(time.getDate()+7);
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');

		 document.cookie="cookie01=마켓넘버;expires="+time;
		document.cookie = "cookie" + (ca.length+1 % 8) + "=마켓넘버; expires=" + time;
	}
</script>
<meta charset="UTF-8">
<title>COOKIE test</title>
</head>
<body>
	<button onclick="setCookie();">쿠키생성</button>

</body>
</html>