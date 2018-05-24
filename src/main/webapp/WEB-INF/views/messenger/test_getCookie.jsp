<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript" src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function getCookie(){
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = ca.length-1; i >=0; i--) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
        	console.log(c.substring(c.indexOf("=")+1, c.length));
        }
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
</head>
<body>
<button onclick="getCookie();">쿠키확인</button>
</body>
</html>