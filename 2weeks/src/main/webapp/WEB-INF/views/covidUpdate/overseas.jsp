<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2Weeks"/>
</jsp:include>

<style>

	.st-mainbar{
		background-color: white;
		border: 1px solid rgb(207,207,207,0,25);
		box-shadow: rgba(0,0,0,0,024) -1px 1px 1px;
		z-index: -1;
		padding: 12px;
		border-radius: 16px;
		margin-bottom: 18px;
	}
	.st-bar1{
		margin: 0px 10px;
		padding: 6px 8px;
		border-radius: 12px;
		justify-content: space-around;
		display: flex;
		flex-direction: row;
	}
	.st-bar-decide{
		-webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	}
	.st-bar-decide-title{
		text-align: center;
		font-size: 12px;
		opacity: 0.7;
		margin-bottom: 0px;
		display: flex;
		flex-direction: row;
	}
	.st-bar-decide-count{
		text-align: center;
		font-size: 18px;
		font-weight: bold;
		opacity: 1;
		margin-bottom: 4px;
		color: rgb(235,83,116);
		display: flex;
		flex-direction: row;
	}
	.st-bar-death{
		-webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
        display: flex;
    flex-direction: column;
}
	.st-bar-death-title{
		text-align: center;
		font-size: 12px;
		opacity: 0.7;
		margin-bottom: 0;
		    display: flex;
    flex-direction: row;
	}
	.st-bat-death-count{
		text-align: center;
		font-size: 18px;
    font-weight: bold;
    opacity: 1;
    margin-bottom: 4px;
    display: flex;
    flex-direction: row;
	}
	.gritem{
	display: inline-block;
	}
	.st-bat-death-countt{
	text-align: center;
	font-size: 18px;
    font-weight: bold;
    opacity: 1;
    margin-bottom: 4px;
    
    flex-direction: row;
	}

</style>

<section class="container" style="display: flex; padding-bottom: 30px; position: relative; right: 150px;" >
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<div class="content gridContainer" style="margin-left: 300px; " >
	<h2 style="text-align: center;">전세계 해외 정보</h2><br><br>
	<div class="st-mainbar" style="border: 1px gray solid;">
		<div class="st-bar1">
			<div class="st-bar-decide">
				<div class="st-bar-decide-title">확진자</div>
				<div class="st-bar-decide-count">${totalDef }명</div>
			</div>
			<div class="st-bar-death">
				<div class="st-bar-death-title">사망자</div>
				<div class="st-bat-death-count">${totalDet }명</div>
			</div>
		</div>
	</div>
	<br>
	<div>
		<div class="st-mainbar" style="border: 1px gray solid;">
			<div  style="font-size: 15px; text-align: center; ">오늘의 확진자수</div><br>
			<div class="st-bat-death-countt" style="text-align: center;">${realtodayDef }명</div>
		</div>
	</div>
	<!-- 그래프 영역 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<div class="Gr"  >
	<!-- 	<div style="display: block;">
		  <select id="searchType" size="1">
		  	<option value="chart_div" selected="selected">일별확진자</option>
		  	<option value="chart_di" >일별 사망자</option>
		  </select>
  		</div> -->
 			<div id="search-chart_div">
		 		 <div id="chart_div"  class="gritem" style="width: 390px;height: 500px;"></div>
				 <div id="piechart" class="gritem" style="width: 390px; height: 500px; " ></div>
		 	</div>
 			<div id="search-chart_di">
		 		 <div id="chart_di"  class="gritem" style="width: 390px;height: 500px;"></div>
				<div id="regions_div" class="gritem" style="width: 390px; height: 500px;"></div>
		 	</div>
	</div>
	<br><br><br>

	<table class="table table-striped table-hover">
		<tr>
			<th>나라</th>
			<th>확진자</th>
			<th>사망자</th>
			<th>사망률</th>
		</tr>
		<c:forEach items="${list }" var="c">
			<tr>
				<td>${c.nationNm }</td>
				<td>${c.natDefCnt }</td>			
				<td>${c.natDeathCnt }</td>	
				<td><fmt:formatNumber value="${c.natDeathRate }" pattern=".00"></fmt:formatNumber>%</td>
				<%-- <td id="pc">${c.natDeathRate }</td> --%>
			</tr>			
		</c:forEach>
	</table>
	
	
	</div>

</section>



<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>






/* 파이그래프 영역 */
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['${pielist[0].nationNm}',     ${pielist[0].defCount}],
    ['${pielist[1].nationNm}',     ${pielist[1].defCount}],
    ['${pielist[2].nationNm}',     ${pielist[2].defCount}],
    ['${pielist[3].nationNm}',     ${pielist[3].defCount}],
    ['${pielist[4].nationNm}',     ${pielist[4].defCount}],
    ['${pielist[5].nationNm}',     ${pielist[5].defCount}],
    ['${pielist[6].nationNm}',     ${pielist[6].defCount}]
  ]);

  var options = {
    title: 'G7 국가 확진자 비율'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
}


/* 파이그래프 영역 */
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChar);

function drawChar() {

  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['${pielist[0].nationNm}',     ${pielist[0].defCount}],
    ['${pielist[1].nationNm}',     ${pielist[1].defCount}],
    ['${pielist[2].nationNm}',     ${pielist[2].defCount}],
    ['${pielist[3].nationNm}',     ${pielist[3].defCount}],
    ['${pielist[4].nationNm}',     ${pielist[4].defCount}],
    ['${pielist[5].nationNm}',     ${pielist[5].defCount}],
    ['${pielist[6].nationNm}',     ${pielist[6].defCount}]
  ]);

  var options = {
    title: 'G7 국가 확진자 비율'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechar'));

  chart.draw(data, options);
}


/* 막대그래프 */
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  // Some raw data (not necessarily accurate)
  var data = google.visualization.arrayToDataTable([
    ['Month', '확진자'],
    ['${Grlist[6].today}',  ${Grlist[6].today_Def}],
    ['${Grlist[5].today}',  ${Grlist[5].today_Def}],
    ['${Grlist[4].today}',  ${Grlist[4].today_Def}],
    ['${Grlist[3].today}',  ${Grlist[3].today_Def}],
    ['${Grlist[2].today}',  ${Grlist[2].today_Def}],
    ['${Grlist[1].today}',  ${Grlist[1].today_Def}],
    ['${Grlist[0].today}',  ${Grlist[0].today_Def}],
  ]);

  var options = {
    title : '일별 총 확진자 통계',
    vAxis: {title: '명'},
    hAxis: {title: '일별'},
    seriesType: 'bars',
    
    series: {
        0: { color: '#0066FF' },
        1: { color: '#0066FF' },

      }
    
  };

  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}


google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualizatio);

function drawVisualizatio() {
  // Some raw data (not necessarily accurate)
  var date = google.visualization.arrayToDataTable([
	  	['Month', '사망자'],
	    ['${Grlist[6].today}',  ${Grlist[6].today_Death},],
	    ['${Grlist[5].today}',  ${Grlist[5].today_Death}],
	    ['${Grlist[4].today}', ${Grlist[4].today_Death}],
	    ['${Grlist[3].today}', ${Grlist[3].today_Death}],
	    ['${Grlist[2].today}', ${Grlist[2].today_Death}],
	    ['${Grlist[1].today}', ${Grlist[1].today_Death}],
	    ['${Grlist[0].today}',  ${Grlist[0].today_Death}],
  ]);

  var optioe = {
    title : '일별 총 사망자 통계',
    vAxis: {title: '명'},
    hAxis: {title: '일별'},
    seriesType: 'line',
    /* series: {2: {type: 'line'}}, */
	series: {
            0: { color: '#CC0033' },
            1: { color: '#CC0033' },

          }
  };

  var chart = new google.visualization.ComboChart(document.getElementById('chart_di'));
  chart.draw(date, optioe);
}
 
  
	$("#searchType").change(e=>{
		const aa=$("#search-chart_div");
		const dd=$("#search-chart_di");
		
		aa.css("display","none");
		dd.css("display","none"); 

		
		$("#search-"+$(e.target).val()).css("display","inline-block");
	});
 
/*    	$(function(){
		$("#searchType").change();
	});    */

    google.charts.load('current', {
        'packages':['geochart'],
      });
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
          ['Country', 'Popularity'],
          ['United States', ${list[0].natDeathCnt}],
          ['${list[1].nationNmEn}', ${list[1].natDeathCnt}],
          ['${list[2].nationNmEn}', ${list[2].natDeathCnt}],
          ['${list[3].nationNmEn}', ${list[3].natDeathCnt}],
          ['United Kingdom', ${list[4].natDeathCnt}],
          ['${list[5].nationNmEn}', ${list[5].natDeathCnt}],
          ['${list[6].nationNmEn}', ${list[6].natDeathCnt}],
          ['${list[7].nationNmEn}', ${list[7].natDeathCnt}],
          ['${list[8].nationNmEn}', ${list[8].natDeathCnt}],
          ['${list[9].nationNmEn}', ${list[9].natDeathCnt}],
          ['${list[10].nationNmEn}', ${list[10].natDeathCnt}],
          ['${list[11].nationNmEn}', ${list[11].natDeathCnt}],
          ['${list[12].nationNmEn}', ${list[12].natDeathCnt}],
          ['${list[13].nationNmEn}', ${list[13].natDeathCnt}],
          ['${list[14].nationNmEn}', ${list[14].natDeathCnt}],
          ['${list[15].nationNmEn}', ${list[15].natDeathCnt}],
          ['${list[16].nationNmEn}', ${list[16].natDeathCnt}],
          ['${list[17].nationNmEn}', ${list[17].natDeathCnt}],
          ['${list[18].nationNmEn}', ${list[18].natDeathCnt}],
          ['${list[19].nationNmEn}', ${list[19].natDeathCnt}],
          ['${list[20].nationNmEn}', ${list[20].natDeathCnt}],
          ['${list[21].nationNmEn}', ${list[21].natDeathCnt}],
          ['${list[22].nationNmEn}', ${list[22].natDeathCnt}],
          ['${list[23].nationNmEn}', ${list[23].natDeathCnt}],
          ['${list[24].nationNmEn}', ${list[24].natDeathCnt}],
          ['${list[25].nationNmEn}', ${list[25].natDeathCnt}],
          ['${list[26].nationNmEn}', ${list[26].natDeathCnt}],
          ['${list[27].nationNmEn}', ${list[27].natDeathCnt}],
          ['${list[28].nationNmEn}', ${list[28].natDeathCnt}],
          ['${list[29].nationNmEn}', ${list[29].natDeathCnt}],
          ['${list[30].nationNmEn}', ${list[30].natDeathCnt}],

        ]);

        var options = {
        		color: '#CC0033'
        };

        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
      }

</script>

		
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		