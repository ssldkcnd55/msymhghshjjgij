<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/farm/resources/js/jquery-3.3.1.min.js"></script>


<!--  -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!--  -->
<!--  -->
<!-- Styles -->
<style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}					
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
/* var chart = AmCharts.makeChart( "chartdiv", {
  "type": "serial",
  "theme": "light",
  "dataProvider": [ {
    "country": "USA",
    "visits": 10
  }, {
    "country": "China",
    "visits": 18
  }, {
    "country": "Japan",
    "visits": 18
  }, {
    "country": "Germany",
    "visits": 13
  }, {
    "country": "UK",
    "visits": 11
  }, {
    "country": "France",
    "visits": 11
  }, {
    "country": "India",
    "visits": 98
  } ],
  "valueAxes": [ {
    "gridColor": "#FFFFFF",
    "gridAlpha": 0.2,
    "dashLength": 0
  } ],
  "gridAboveGraphs": true,
  "startDuration": 1,
  "graphs": [ {
    "balloonText": "[[category]]: <b>[[value]]</b>",
    "fillAlphas": 0.8,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "visits"
  } ],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "country",
  "categoryAxis": {
    "gridPosition": "start",
    "gridAlpha": 0,
    "tickPosition": "start",
    "tickLength": 20
  },
  "export": {
    "enabled": true
  }

} ); */

$(function(){
	var type = 1;
	$.ajax({
		url: "visitChart.do",
		type: "post",
		data: {type:type},
		dataType: "JSON",
		success: function(data){
			console.log(data);
            var objStr = JSON.stringify(data);
            var jsonObj = JSON.parse(objStr);
         
            //$("#chartdiv").remove();
            var chart = AmCharts.makeChart( "chartdiv", {
            	  "type": "serial",
            	  "theme": "light",
            	  "dataProvider": [ {
            	    "country": jsonObj.list[6].date,
            	    "visits": jsonObj.list[6].count
            	  }, {
            	    "country": jsonObj.list[5].date,
            	    "visits": jsonObj.list[5].count
            	  }, {
            	    "country": jsonObj.list[4].date,
            	    "visits": jsonObj.list[4].count
            	  }, {
            	    "country": jsonObj.list[3].date,
            	    "visits": jsonObj.list[3].count
            	  }, {
            	    "country": jsonObj.list[2].date,
            	    "visits": jsonObj.list[2].count
            	  }, {
            	    "country": jsonObj.list[1].date,
            	    "visits": jsonObj.list[1].count
            	  }, {
            	    "country": jsonObj.list[0].date,
            	    "visits": jsonObj.list[0].count
            	  } ],
            	  "valueAxes": [ {
            	    "gridColor": "#FFFFFF",
            	    "gridAlpha": 0.2,
            	    "dashLength": 0
            	  } ],
            	  "gridAboveGraphs": true,
            	  "startDuration": 1,
            	  "graphs": [ {
            	    "balloonText": "[[category]]: <b>[[value]]</b>",
            	    "fillAlphas": 0.8,
            	    "lineAlpha": 0.2,
            	    "type": "column",
            	    "valueField": "visits"
            	  } ],
            	  "chartCursor": {
            	    "categoryBalloonEnabled": false,
            	    "cursorAlpha": 0,
            	    "zoomable": false
            	  },
            	  "categoryField": "country",
            	  "categoryAxis": {
            	    "gridPosition": "start",
            	    "gridAlpha": 0,
            	    "tickPosition": "start",
            	    "tickLength": 20
            	  },
            	  "export": {
            	    "enabled": true
            	  }

            	} );
			}
		
		});
});

function show_Daily(){
	var type= 1;
	$.ajax({
		url: "visitChart.do",
		type: "post",
		data: {type:type},
		dataType: "JSON",
		success: function(data){
			console.log(data);
            var objStr = JSON.stringify(data);
            var jsonObj = JSON.parse(objStr);
         	var outvalues = "";
            $("#chartdiv").empty();
            
            var chart = AmCharts.makeChart( "chartdiv", {
          	  "type": "serial",
          	  "theme": "light",
          	  "dataProvider": [ {
          	    "country": jsonObj.list[6].date,
          	    "visits": jsonObj.list[6].count
          	  }, {
          	    "country": jsonObj.list[5].date,
          	    "visits": jsonObj.list[5].count
          	  }, {
          	    "country": jsonObj.list[4].date,
          	    "visits": jsonObj.list[4].count
          	  }, {
          	    "country": jsonObj.list[3].date,
          	    "visits": jsonObj.list[3].count
          	  }, {
          	    "country": jsonObj.list[2].date,
          	    "visits": jsonObj.list[2].count
          	  }, {
          	    "country": jsonObj.list[1].date,
          	    "visits": jsonObj.list[1].count
          	  }, {
          	    "country": jsonObj.list[0].date,
          	    "visits": jsonObj.list[0].count
          	  } ],
          	  "valueAxes": [ {
          	    "gridColor": "#FFFFFF",
          	    "gridAlpha": 0.2,
          	    "dashLength": 0
          	  } ],
          	  "gridAboveGraphs": true,
          	  "startDuration": 1,
          	  "graphs": [ {
          	    "balloonText": "[[category]]: <b>[[value]]</b>",
          	    "fillAlphas": 0.8,
          	    "lineAlpha": 0.2,
          	    "type": "column",
          	    "valueField": "visits"
          	  } ],
          	  "chartCursor": {
          	    "categoryBalloonEnabled": false,
          	    "cursorAlpha": 0,
          	    "zoomable": false
          	  },
          	  "categoryField": "country",
          	  "categoryAxis": {
          	    "gridPosition": "start",
          	    "gridAlpha": 0,
          	    "tickPosition": "start",
          	    "tickLength": 20
          	  },
          	  "export": {
          	    "enabled": true
          	  }

          	} );
			}
		
		});
	
	}

function show_Monthly() {
	var type = 2;
	$.ajax({
		url: "visitChart.do",
		type: "post",
		data: {type:type},
		dataType: "JSON",
		success: function(data){
			console.log(data);
            var objStr = JSON.stringify(data);
            var jsonObj = JSON.parse(objStr);
            
            $("#chartdiv").empty();
            
            var chart = AmCharts.makeChart( "chartdiv", {
          	  "type": "serial",
          	  "theme": "light",
          	  "dataProvider": [ {
          	    "country": jsonObj.list[5].month,
          	    "visits": jsonObj.list[5].count
          	  }, {
          	    "country": jsonObj.list[4].month,
          	    "visits": jsonObj.list[4].count
          	  }, {
          	    "country": jsonObj.list[3].month,
          	    "visits": jsonObj.list[3].count
          	  }, {
          	    "country": jsonObj.list[2].month,
          	    "visits": jsonObj.list[2].count
          	  }, {
          	    "country": jsonObj.list[1].month,
          	    "visits": jsonObj.list[1].count
          	  }, {
          	    "country": jsonObj.list[0].month,
          	    "visits": jsonObj.list[0].count
          	  } ],
          	  "valueAxes": [ {
          	    "gridColor": "#FFFFFF",
          	    "gridAlpha": 0.2,
          	    "dashLength": 0
          	  } ],
          	  "gridAboveGraphs": true,
          	  "startDuration": 1,
          	  "graphs": [ {
          	    "balloonText": "[[category]]: <b>[[value]]</b>",
          	    "fillAlphas": 0.8,
          	    "lineAlpha": 0.2,
          	    "type": "column",
          	    "valueField": "visits"
          	  } ],
          	  "chartCursor": {
          	    "categoryBalloonEnabled": false,
          	    "cursorAlpha": 0,
          	    "zoomable": false
          	  },
          	  "categoryField": "country",
          	  "categoryAxis": {
          	    "gridPosition": "start",
          	    "gridAlpha": 0,
          	    "tickPosition": "start",
          	    "tickLength": 20
          	  },
          	  "export": {
          	    "enabled": true
          	  }

          	} );
            
          }
	});
}
</script>
<!--  -->
<link href="/farm/resources/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<div id="top_line"></div>
	<div id="wrap">
		<div id="header">
			<%@  include file="../inc/header.jsp"%>
		</div>
		<div id="container">
			<div class="inner-wrap">


<!--  -->
		
<section id="main" style="margin-top:60px; margin-bottom:30px;">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="list-group">
      <a class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
    	관리목록 </a>
      <a href="/farm/moveNotice.do" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
      	&nbsp;공지사항관리</a>
      <a href="/farm/moveAdminCategory.do" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;카테고리관리</a>
      <a href="/farm/moveAdminReport.do" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;신고관리</a>
      <a href="/farm/moveNotcie_write.do" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;공지사항작성</a>	
      <a href="/farm/moveAdminMember.do" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>
      	&nbsp;유저검색</a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;판매관리</a>
      <a href="" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      	&nbsp;경매관리</a>
    </div>
    



      </div>
      <div class="col-md-9">
          <div class="panel panel-default">
  <div class="panel-heading" style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">사이트 전체보기</h3>
  </div>
  <div class="panel-body">
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span>더미</h2>
       <h4>회원수</h4>
     </div>  
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true">더미</h2>
       <h4>등록 판매 수 </h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>더미</h2>
       <h4>등록 경매 수</h4>
     </div>
   </div>
   <div class="col-md-3">
     <div class="well dash-box">
       <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 2129</h2>
       <h4>Visitores</h4>
     </div>
   </div>
  </div>
</div>
<!-최신 강의->




<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">최신 판매</h3>
  </div>
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>판매명</th>
        <th>판매자</th>
        <th>등록일</th>
      </tr>
   
   <%-- 
   <% for (int i=0; i<5; i++){ %> --%>
    <tr>
      <td>더미</td>
      <td>더미</td>
      <td>더미</td>
    </tr>
   <%-- <%} %> --%>
   
    </table>

  </div>
</div>
 <!-최신유저 ->

<div class="panel panel-default">
  <div class="panel-heading"style="background-color:  #095f59;">
    <h3 class="panel-title" style="color:#ffffff">최신 유저
    </h3>
  </div>
 
  <div class="panel-body">
    <table class="table table-striped table-hover">
      <tr>
        <th>이름</th>
        <th>메일</th>
        <th>가입일</th>
      </tr>
   <%-- <% for (int i=0; i<5; i++){ %> --%>
    <tr>
      <td>더미</td>
      <td>더미</td>
      <td>더미</td>
    </tr>
 <%--   <%} %> --%>
   </table>

  </div>
</div>

      </div>
    </div>
    <br><br>
    <!--차트  -->
    <button onclick="show_Daily();">일별접속량</button>&nbsp;<button onclick="show_Monthly();">월별접속량</button>
    <div id="chartdiv"></div>	
    <!--  -->
  </div>
</section>




<!--  -->
			</div>
		</div>

		<div id="footer">
			<%@  include file="../inc/foot.jsp"%>
		</div>
	</div>


</body>
</html>