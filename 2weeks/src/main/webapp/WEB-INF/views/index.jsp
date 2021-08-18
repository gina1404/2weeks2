<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/> 
<link href="${path}/resources/css/common/main.css?after=" rel="stylesheet" type="text/css" >
 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>


<section class="container">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>			
	<div class="content gridContainer">
		<div class="item 1st">1</div>
		<div class="item 1st">2</div>
		<div class="item 1st">3</div>
		<div class="item 1st">4</div>
		<div class="item 1st">5</div>
		<div class="item 1st">6</div>
		<div class="item 1st">7</div>
		<div class="item 1st">8</div>
		<div class="item 2nd">a</div>
		<div class="item 2nd">b</div>
		<div class="item 3rd">가</div>
	</div>	
</section>
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


