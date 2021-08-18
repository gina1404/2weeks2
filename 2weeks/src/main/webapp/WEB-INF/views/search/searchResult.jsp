<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/search/searchResult.css">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<section class="container">	
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content">
		<!-- 커뮤니티 검색 결과 -->
		<section id="searchResult-community" style="width:80%; border:1px solid green; display:inline-block;" >
			<div>${searchResultCommunity}</div>		
			<div><a>community 더 보기 -> </a></div>
		</section>
		
		<!-- 지식인 검색 결과 -->
		<section id="searchResult-knowledgeIn" style="width:80%; border:1px solid green;" >
				<div>${searchResultKnowledgeIn}</div>
				<div><a>지식인 더 보기 -> </a></div>
		</section>
		
		<!-- 외부 검색 결과 -->
		<section id="searchResult-external" class="searchResult-area">
			<div class="searchResult-name">외부 검색 결과</div>
			<c:forEach var="list" varStatus="i" items="${searchResultExternalNaver}">
				<div class="searchResult-list">					
					<div class="searchResult-profile"><img class="" src="${path }/resources/images/icons/naver.png"/></div>
					<div class="searchResult-blogName" onclick="window.open('${list.bloggerlink }');">${list.bloggername }</div>
		          	<div class="searchResult-vertical-divider"></div>
		          	<div class="searchResult-date">${list.postdate }</div>
					<div class="searchResult-title" onclick="window.open('${list.link }');">${list.title }</div>
					<div class="searchResult-content">${list.description }</div>
				</div>
			<c:if test ="${not i.last}"><hr></c:if>					
			</c:forEach>
			<div class="searchResult-detail"><div onclick="window.open('https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${searchKeyword}')">외부 검색 결과 더 보기 <span>→</span></div></div>
		</section>
	<br><br><br><br><br><br>
	</div>
</section>

<script>
	//검색 후 입력창 글씨 지워지지 않게
	$(document).ready(function(){
		$("#searchKeyword").show().val("${searchKeyword}");
	});
</script>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


