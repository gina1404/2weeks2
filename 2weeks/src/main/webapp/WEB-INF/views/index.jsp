  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<section class="container">		
	<section id="home-covid-domestic" style="display:inline-block;width:45%; border:1px solid green;" >
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 1</div>
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 2</div>
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 3</div>
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 4</div>
	</section>
	<section id="home-covid-global" style="display:inline-block;width:45%;border:1px solid green;" >
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 1</div>
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 2</div>
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 3</div>
		<div style="width:20%; height:300px; display:inline-block; border:1px solid blue;">항목 4</div>
	</section>	
	<div>지역별 확산 현황</div>
		<section id="home-covid-chart" style="width:45%; min-height:500px; border:1px solid green;">
			<jsp:include page="/WEB-INF/views/covidUpdate/regionalKor.jsp"></jsp:include>
		</section>
	<section id="home-report&news"></section>
	<section id="home-community"></section>
</section>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


