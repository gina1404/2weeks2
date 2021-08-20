<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>

<style>


.main{
float:left;

}

.main1{
float:left;

}
</style>
<section class="container">		
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


	<table class="table">
		<tr>
			<th>지역</th>
			<th>날짜</th>
			<th>전날 1차 접종</th>
			<th>전날 2차 접종</th>
			<th>금일 1차 접종</th>
			<th>금일 2차 접종</th>
			<th>총 1차 접종</th>
			<th>총 2차 접종</th>
		</tr>
		<c:forEach items="${items}" var="c">
			<tr>	

				<td>${c.baseDate }</td>	
				<td>${c.sido }</td>		
				<td>${c.accumulatedFirstCnt}</td>	
				<td>${c.accumulatedSecondCnt}</td>
				<td>${c.firstCnt}</td>
				<td>${c.totalFirstCnt}</td>
				<td>${c.totalsecondCnt}</td>		
				
			</tr>			
		</c:forEach>
	</table>
	
	
	
	
	
		
	
</section>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

