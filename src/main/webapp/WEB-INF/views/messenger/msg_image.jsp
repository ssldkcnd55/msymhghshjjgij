<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"src="/farm/resources/js/msg_image.js"></script>
<link href="/farm/resources/css/msg_image.css" rel="stylesheet"type="text/css" />
<script type="text/javascript">
var fileName='${img_name }';
</script>
</head>
<body>

<table class="table1">
<tr class="tr1"><td colspan="2"><span><img class="tr1Img" src="resources/upload/chatUpload/${img_name }"></span></td></tr>
<tr class="tr2"><td><a class="msg_img_down_btn" href='javascript: downloadImg()'><img class="msg_img_down_icon" src="resources/upload/chatUpload/down_icon_gray.png"><font>저장</font></a></td></tr>
</table>
<table class="table2">
<tr class="tr1"><td>
<c:forEach items="${images}" var="img">
<a href="javascript: changeImg('${img}')"><img class="images" src="resources/upload/chatUpload/${img}"></a>
</c:forEach>
</td></tr>

</table>


</body>
</html>