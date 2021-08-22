<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="updates/domestic"/>
</jsp:include>
<
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6944e39f85fb8e5ca0d10ff408274b51"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script>
		
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/domestic/domestic.css">

<section class="container" style="display:flex;">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content" style="display:inline-block; padding-left:220px;">	
		<h2>국내 확산 현황</h2>
		<h5>업데이트 날짜 : ${day }</h5>
		
		<div class="Domestic" style="display:block;">
			<div class="topwrap">
			
				<div class="middlewrap">
					<div class="bottomwrap">
						<div class="bottomwrap-child">확진자</div>
						<div class="bottomwrap-child2"> <fmt:formatNumber value="${decide}" type="number"/>명</div>
						<div class="bottomwrap-child3"> 
							<div class=""></div>
							<div size="12" class="">
							</div>
						</div>
					</div>
					<div class="bottomwrap">
						<div class="bottomwrap-child">총 사망자</div>
						<div class="bottomwrap-child-died"><fmt:formatNumber value="${death }" type="number"/>명</div>
						<div color="grey" class="">
							<div class=""></div>
							<div size="12" class="">
							</div>
						</div>
					</div>
					
					<div class="bottomwrap">
						<div class="bottomwrap-child">격리해제 수</div>
						<div class="bottomwrap-child-recovery"><fmt:formatNumber value="${clearCnt}" type="number"/>명</div>
						<div color="green" class="">
								<div class=""></div>
								<div size="12" class="">
							</div>
						</div>
					</div>
					
					<div class="bottomwrap">
						<div class="bottomwrap-child">검사자 </div>
						<div class="bottomwrap-child-test"><fmt:formatNumber value="${accExamCnt}" type="number"/>명</div>
						<div color="blue" class="">
							
							<div class=""></div>
							<div size="12" class="">
					</div>
				</div>
			</div>
				
		</div>
	</div>
	
			<div>
				<canvas id="myChart" ></canvas>
			</div>

		</div>
		<div style="text-align: center;">
			<section id="domestic-covid-chart" style="width:45%; display:inline-block;">
				<jsp:include page="/WEB-INF/views/covidUpdate/regionalKor.jsp"></jsp:include>
			</section>
		</div>
	</div>
</section>

<script>
	
	var decideCnt =[];
	
	var accExamCnt = [];
	
	var clearCnt = [];
	
	var deathCnt = [];
	
	var stateDt = [];
	
	var todayDecideCnt = [];
	
	var todayDeathCnt = 0;

	$.ajax({
		type:'GET',
		url : "${pageContext.request.contextPath}/covid/getToday",
		dataType:"text",
		success:function(data){
			todayDeathCnt=data;
			
		}
		
			
	});
	
	$.ajax({
		type:'GET',
		url : "${pageContext.request.contextPath}/covid/getNumber",
		dataType:"json",
		success:function(data){
			$.each(data, function(idx, obj){
				stateDt.unshift(obj.stateDt);
				decideCnt.unshift(obj.decideCnt);
				accExamCnt.unshift(obj.accExamCnt);
				deathCnt.unshift(obj.deathCnt);
				clearCnt.unshift(obj.clearCnt);
				console.log(obj.clearCnt);
			});
			createChart();
		}
		
	});

	
	
	
	
	
var myChart = document.getElementById("myChart").getContext("2d");

	function createChart() {
		Chart.defaults.font.size = 18;
		var chart = new Chart(myChart, {
			type : "bar",
			data : {
				labels : stateDt,
				datasets : [ {
					label : "누적 확진자 수",
					minBarLength: 250,
					data : decideCnt,
					backgroundColor : "#f1c40f",

				}, 
				{
					label : "누적 격리해제 수",
					minBarLength: 250,
					data : clearCnt,
					backgroundColor : "#2ecc71"
				}, 
				{
					label : " 누적 검사 수",
					data : accExamCnt,
					backgroudColor : "#2ecc71"
				}, 
				{
					label : "누적 사망자 수",
					minBarLength: 250,
					data : deathCnt,
					backgroundColor : "#e74c3c",
				}, 
				]
			},
			  options: {
				    scales: {
				      yAxes: [{
				    	  beginAtZero: true,
				    	  gridLines:{
				        	color: "rgba(0, 0, 0, 0)",
				        }
				    	 
				      }],
				      yAxes: [{
				            gridLines: {
				                color: "rgba(0, 0, 0, 0)",
				            }   
				        }]
				    },
				    plugins: {
			            legend: {
			                labels: {
			                    // This more specific font property overrides the global property
			                    font: {
			                    	family : "Pretendard"
			                    }
				  }
			            }
				    }
			  }

		});
	}

</script>	
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	


