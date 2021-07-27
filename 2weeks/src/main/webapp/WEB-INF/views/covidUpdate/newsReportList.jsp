<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<link href="${pageContext.request.contextPath }/resources/css/covidReportList.css" rel="stylesheet" />

<section class="container">
	<h4>보도자료</h4>
	
	<p>총 <span>${totalContents }</span>건</p>	
	<table id="reportTab" class="striped">
		<tr id="reportTh">
			<th>번호</th>
			<th>제목</th>
			<th>담당</th>
			<th>작성일시</th>
			<th>첨부파일</th>
		</tr>		
		<c:forEach var="r" items="${reportList }"> 				
			<tr>
				<td>${r.no }</td>
				<td>${r.title }</td>
				<td>${r.team }</td>
				<td>${r.date }</td>
				<td>${r.attachment !=null?"💾":" "}
			</tr>
		</c:forEach>
	</table>
	
	<div id="reportPageBar">
		${pageBar }
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>