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

<meta charset="UTF-8">
<title>COOKIE test</title>

<script type="text/javascript">

	Notification.requestPermission().then(function(result) {
		if (result === 'denied') {
			return;
		}
		if (result === 'default') {		
			return;
		}
	});

	var title = "판매알람";
	var options = {
		body : "***회원님의 상품이 판매되었습니다.",
		data : "testData",
		icon : "/farm/resources/images/Farmlogo.png"
	}
	
	var myNotification = new Notification(title, options);
	myNotification.onclick = function(event) {
		  event.preventDefault(); 
		  window.open('판매상세페이지.do', '_blank');
		}
</script>

<style type="text/css">
</style>
</head>
<body>



</body>
</html>