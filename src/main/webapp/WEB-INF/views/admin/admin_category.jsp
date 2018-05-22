<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<!-- <button class="accordion">Section 1</button>
					<div class="panel">
  					<p></p>
					</div> -->
				
				<button class="accordion" onclick="toggleList();">대분류</button>
					<div class="panel">
  						<button class="accordion" onclick="toggleList();">중분류</button>
							<div class="panel">
  							<p>div에 div 인거임ㅋㅋㅋㅋㅋ</p>
							</div>
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
	
	
	//대분류 출력
	
	$.ajax({
		url:"category_big.do" ,
		type: "post",
		dateType: "json",
		success: function(obj){
			console.log(obj);
			var jsonStr = JSON.stringify(obj);
			var json = JSON.parse(jsonStr);
			var category_big = ""; 
			
			/* for(var i in json.big) {
				category_big+='<button class="accordion" onclick="toggleList();">'
				+json.big[i].category_main+'</button>'
				+'<div class="panel" id="'+json.big[i].category_main+'"><button class="accordion" onclick="toggleList();">'
				+json.big[i].category_small+'</button>'
				+'<div class="panel" id="'+json.big[i].category_small+'"><p>데이터</p></div></div>'
			} */
			for(var i in json.big) {
				category_big+='<button onclick="deleteBig('+json.big[i].category_main+')">대분류삭제</button><button class="accordion" onclick="toggleList();">'
				+json.big[i].category_main+'</button>'
				+'<div class="panel" id="'+json.big[i].category_main+'"></div>'
			}
			$('.category_list').append(category_big);
		}
		
	});
	
	//소분류 출력
	
	$.ajax({
		url:"category_small.do" ,
		type: "post",
		dateType: "json",
		success: function(obj){
			console.log(obj);
			var jsonStr = JSON.stringify(obj);
			var json = JSON.parse(jsonStr);
			var category_big = ""; 
			
			for(var i in json.small) {
				$("#"+json.small[i].category_main).append('<button onclick="deleteSmall('+json.small[i].category_main+')">소분류삭제</button><button class="accordion" onclick="toggleList();">'
						+json.small[i].category_small+'</button>'
						+'<div class="panel" id="'+json.small[i].category_small+'"></div>')
			}
			$('.category_list').append(category_big);
		}
		
	});
	
	//상품 이름 출력
	$.ajax({
		url:"category_name.do" ,
		type: "post",
		dateType: "json",
		success: function(obj){
			console.log(obj);
			var jsonStr = JSON.stringify(obj);
			var json = JSON.parse(jsonStr);
			var category_big = ""; 
			
			for(var i in json.name) {
				$("#"+json.name[i].category_small).append("<p>"+json.name[i].category_name+"<button>항목삭제</button></p>")
			}
		}
		
	}); 


	/* 리스트 열림 */
	function toggleList() {
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
	
}
	
</script>
	<!-- 스크립트 -->
</body>
</html>