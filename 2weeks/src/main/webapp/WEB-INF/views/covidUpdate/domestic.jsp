<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="updates/domestic"/>
</jsp:include>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6944e39f85fb8e5ca0d10ff408274b51"></script> -->
<section class="container">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="container">	
		<h2>국내 확산 현황</h2>
		
	
		<div style="text-align: center;">
			<section id="home-covid-chart" style="width:45%; display:inline-block;">
				<jsp:include page="/WEB-INF/views/covidUpdate/regionalKor.jsp"></jsp:include>
			</section>
		</div>
	</div>
</section>
		
		
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

