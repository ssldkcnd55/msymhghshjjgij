<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="/farm/resources/css/admin_category.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"
	src="/farm/resources/js/jquery-3.3.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>관리자 카테고리</title>
</head>
<body>
<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/top_menu.jsp"%>
		</div>
		<!-- account-wrap -->

		
		<div id="container">
        	<div class="inner-wrap">
       	
		<!--  -->
			<h2>카테고리 관리</h2>
			<div class="category_top" >
				<button class="big_add">대분류 추가</button>
			</div>
			
			<div class="category_list">
				<button class="accordion">Section 1</button>
					<div class="panel">
  					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>

				<button class="accordion">Section 2</button>
					<div class="panel">
  					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
			</div>
			

		<!--  -->
 			 </div>
        </div>
		

		<!-- //account-wrap -->
		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>
	
	
	
	
	
	<!-- 스크립트 -->
	<script>
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
    	acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });
}
	
	//대분류 출력
	
	$.ajax({
		url:"category_big.do" ,
		type: "post",
		dateType: "json",
		success: function(obj){
			console.log(obj);
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			var category_big = ""; 
			
			for(var i in json.big) {
				category_big+=;
			}
		}
	});


</script>
	<!-- 스크립트 -->
</body>
</html> --%>