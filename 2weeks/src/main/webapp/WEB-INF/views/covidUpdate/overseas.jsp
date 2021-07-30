<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
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
</style>

<section class="container">
	<h2 style="text-align: center;">전세계 해외 정보</h2>
	<div class="st-mainbar">
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
	<h2 style="text-align: center;">오늘의 확진자 수</h2>
	<div>
		<div>
			<div>오늘의 확진자수</div>
			<div>${realtodayDef }명</div>
		</div>
	</div>
	<!-- 그래프 영역 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<div class="Gr">
  		  <div id="chart_div" style="width: 900px; height: 500px;"></div>
		 <div id="piechart" style="width: 900px; height: 500px;"></div>
	</div>


	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>나라</th>
			<th>확진자</th>
		</tr>
		<tr>
			<td>1</td>
			<td>1</td>
			<td>1</td>
		</tr>
		<tr>
			<td>1</td>
			<td>1</td>
			<td>1</td>
		</tr>
		<tr>
			<td>1</td>
			<td>1</td>
			<td>1</td>
		</tr>
	</table>
	
	
	

</section>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
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


/* 막대그래프 */
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  // Some raw data (not necessarily accurate)
  var data = google.visualization.arrayToDataTable([
    ['Month', '확진자','사망자'],
    ['${Grlist[6].today}',  ${Grlist[6].today_Def}, ${Grlist[6].today_Death}],
    ['${Grlist[5].today}',  ${Grlist[5].today_Def},${Grlist[5].today_Death}],
    ['${Grlist[4].today}',  ${Grlist[4].today_Def},${Grlist[4].today_Death}],
    ['${Grlist[3].today}',  ${Grlist[3].today_Def},${Grlist[3].today_Death}],
    ['${Grlist[2].today}',  ${Grlist[2].today_Def},${Grlist[2].today_Death}],
    ['${Grlist[1].today}',  ${Grlist[1].today_Def},${Grlist[1].today_Death}],
    ['${Grlist[0].today}',  ${Grlist[0].today_Def},${Grlist[0].today_Death}],
  ]);

  var options = {
    title : '일별 총 확진자 통계',
    vAxis: {title: '명'},
    hAxis: {title: '일일별 통계'},
    seriesType: 'bars',
    series: {5: {type: 'line'}}
  };

  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}

</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
		