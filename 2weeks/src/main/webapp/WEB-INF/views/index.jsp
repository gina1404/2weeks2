<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/> 
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/main.css">
 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>


<section class="container">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>			
	<div class="content gridContainer">
		<div class="item">1</div>
		<div class="item">2</div>
		<div class="item">3</div>
		<div class="item">4</div>
		<div class="item">5</div>
		<div class="item">6</div>
		<div class="item">7</div>
		<div class="item">8</div>
		<div class="item">a</div>
		<div class="item">b</div>
		<div class="item">가</div>
	</div>	
</section>
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


