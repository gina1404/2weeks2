<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
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
	<h2 style="text-align: center;">국내 코로나 확진 현황</h2>
	<div class="st-mainbar">
		<div class="st-bar1">
			<div class="st-bar-decide">
				<div class="st-bar-decide-title">확진자</div>
				<div class="st-bar-decide-count"><fmt:formatNumber value="${decide }" type="number"/>명</div>
			</div>
			<div class="st-bar-death">
				<div class="st-bar-death-title">사망자</div>
				<div class="st-bat-death-count"><fmt:formatNumber value="${death }" type="number"/> 명</div>
			</div>
		</div>
	</div>
	<h2 style="text-align: center;">오늘의 확진자 수</h2>
	<div>
	<h5 style="text-align: right; font-size:12px;">등록일 : ${day } </h5>
		<div>
			<div>오늘의 확진자수</div>
			<div>명</div>
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
			<th>나라</th>
			<th>확진자</th>
			<th>사망자</th>
			<th>사망률</th>
		</tr>
		<%-- <c:forEach items="${list }" var="c"> --%>
			<tr>
				<td></td>
				<td></td>			
				<td></td>	
				<td><fmt:formatNumber value="" pattern=".00"></fmt:formatNumber>%</td>
				<%-- <td id="pc">${c.natDeathRate }</td> --%>
			</tr>			
		<%-- </c:forEach> --%>
	</table>
	
	
	

</section>

<script>
$(document).ready(function(){
		getCase();
		console.log("DSDD");
	
	function getCase(){
		$.ajax({
			url:'${path}/domesitc/cases/',
			method:"get",
			
		})
	}
	
	
});
</script>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>