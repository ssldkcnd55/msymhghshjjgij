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
			<%@  include file="../inc/header.jsp"%>
		</div>
		<!-- account-wrap -->

		
		<div id="container">
        	<div class="inner-wrap">
       	
		<!--  -->
			<h2>카테고리 관리</h2>
			<div class="category_top">
				<button class="big_add" onclick="add_category_big()"><div class='addCategory'>+</div>카테고리 추가</button>
			</div>
			
			<div class="category_list">
				
				
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
		dataType: "json",
		success: function(obj){
			console.log(obj);
			var jsonStr = JSON.stringify(obj);
			var json = JSON.parse(jsonStr);
			var category_big = ""; 
			
			for(var i in json.big) {
				category_big+='<button id="'+json.big[i].category_main+'" class="deleteBig" onclick="deleteBig(this)">'
				+'<div class="delImg"></div></button><button class="modifyBig" id="'+json.big[i].category_main+'2" onclick="updateBig(this)"><div class="modImg"></div></button><button class="accordion"  onclick="toggleList();">ㆍ'
				+json.big[i].category_main+'</button>'
				+'<div class="panel" id="'+json.big[i].category_main+'1" name="'+json.big[i].category_main+'"></div><hr class=\"line\">'
			}
			$('.category_list').append(category_big);
			//소분류 출력
			$.ajax({
				url:"category_name.do" ,
				type: "post",
				dataType: "json",
				success: function(obj){
					console.log(obj);
					var jsonStr = JSON.stringify(obj);
					var json = JSON.parse(jsonStr);
					var category_big = ""; 
					
					
					for(var i in json.name) {
						console.log(json.name[i].category_name);
						if(json.name[i].category_name != "더미") {
						$("#"+json.name[i].category_main+"1").append("<div class='ptag'><p class='ptitle'>"+json.name[i].category_name
								+"</p><div class='btn'><button class='Btn del' id='"+json.name[i].category_no
								+"' onclick='deleteName(this)'>삭제</button>"
								+"<button class='Btn mod' id='"+json.name[i].category_name+"1' onclick='updateName(this);'>수정</button></div></div>")
						}
						
					}
					$(".panel").append("<button class='addBtn' onclick='add_category_name(this);'><div class='plus'>+</div>항목추가</button>");
				}
				
			});
		}
		
	});

	
	
	//항목 삭제
	
	function deleteBig(str) {
		var inputString = prompt('최고관리자의 승인을 받았습니까? (Y or N)','N');
		
		if(inputString=='Y'){
			console.log(str.id);
			
			location.href = "delCategory_big.do?category_main="+ str.id;
		
		
		}else{
		console.log("bb");
		return false;
		}	
		
	}	
	function deleteName(str) {
		var inputString = prompt('정말 삭제하시겠습니까? (Y or N)','N');
		
		if(inputString=='Y'){
			console.log(str.id);
			
			location.href = "delCategory_name.do?category_no="+ str.id;
		}
		console.log(str.id);
	}
	
	
	//카테고리 대분류 추가 
	function add_category_big() {
		
		var input = prompt('대분류 카테고리의 이름을 적으세요.');
		if(input == null) {
			return false;
		}else{
			location.href='addCategory_main.do?category_main='+input;
		
		}
	}
	
	
	//카테고리 대분류 수정
	function updateBig(big) {
		var big_id = big.id
		var res = big_id.substring(0, big_id.length-1);
		var input = prompt('수정할 대분류 카테고리의 이름을 적으세요.');
		if(input == null) {
			return false;
		}else{
			location.href='updateCategory_main.do?category_main='+input+'&category_main_ori='+res;
		
		}
	}
	
	//카테고리 소분류 추가
	function add_category_name(str) {
		console.log($(str).closest('div').attr('name'));
		var main = $(str).closest('div').attr('name');
		var input = prompt('소분류 카테고리의 이름을 적으세요.');
		
		/* $.ajax({
			url:"addCategory_name2.do",
			data:{category_name:input,category_main:main},
			type:"post",
			datatype:"json",
			success:function(data){
				 var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				alert("성공!");
				$("#test").html("<h1>"+json.category_name+"</h1>");
			}
		}); */
		
		
		
		if(input == null) {
			return false;
		}else{
			location.href='addCategory_name.do?category_name='+input+"&category_main="+main;
		
		} 
	}
	
	//카테고리 소분류 수정
	function updateName(name) {
		var name_id = name.id;
		var res = name_id.substring(0, name_id.length-1);
		var input = prompt('수정할 소분류 카테고리의 이름을 적으세요.');
		if(input == null) {
			return false;
		}else{
			location.href='updateCategory_name.do?category_name='+input+'&category_name_ori='+res;
		
		}
	}
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