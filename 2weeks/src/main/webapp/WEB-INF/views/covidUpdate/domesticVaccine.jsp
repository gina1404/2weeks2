<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<style>


.main{
float:left;

}

.main1{
float:left;

}
</style>
<section class="container">		

		<!-- <div class="main" style="width:1500px; height:500px; border:1px solid green"> -->
		<div class="main" style="width:750px; height:400px; border:1px solid green">
		<span style="font-family: pretendard">Korea 1st inoculation</span>
	
			<div style="width:750px; height:200px; border:1px solid red">
			
				<span style="font-family: pretendard">All</span>
				
				</div>
				
			<div style="width:750px; height:200px; border:1px solid yellow">
			
				<span style="font-family: pretendard">Today</span>
				
				</div>
		</div>
		
		
		
	<div class="main1" style="width:750px; height:400px; border:1px solid green">
	
			<span style="font-family: pretendard">Inoculation Completed</span>
			
			<div style="width:750px; height:200px; border:1px solid red">
			
				<span style="font-family: pretendard">All</span>
				
				</div>
				
			<div style="width:750px; height:200px; border:1px solid yellow">
			
				<span style="font-family: pretendard">Today</span>
				
				</div>
	
			</div>	
<br>

<div>

<span style="font-family: pretendard">Statistics on vaccination status by province and province</span>	

</div>

	
	
		
	
</section>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

