<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/search/searchResult.css">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<section class="container" style="display:flex; padding-bottom:200px;">	
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content" style="display:inline-block; padding-left:220px; ">
		<!-- 커뮤니티 검색 결과 -->
		<section id="searchResult-community" class="searchResult-area" >
			<div class="searchResult-name">2weeks 검색 결과</div>
			<c:forEach var="list" varStatus="i" items="${searchResultCommunity}" end="8">
				<div class="searchResult-list">					
					<div class="searchResult-profile"><img class="" src="${path }/resources/images/icons/two.svg"/></div>
					<div class="searchResult-blogName" onclick="">${list.category }</div>
			       	<div class="searchResult-vertical-divider"></div>
			       	<div class="searchResult-date">${list.post_Dt }</div>
					<div class="searchResult-title" onclick="location.href='${path}/freeboard/readView?no=${list.post_Sq}'">${list.post_Title }</div>
					<div class="searchResult-content">
						<!-- 미리보기 글자수 제한 -->
						<c:choose>
							<c:when test="${fn:length(list.post_Content) gt 200 }">
								<c:out value="${fn:substring(list.post_Content,0,200)}"/>...
							</c:when>
							<c:otherwise>
								<c:out value="${list.post_Content}"/>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<c:if test ="${not i.last}"><hr></c:if>									
			</c:forEach>
			<div class="searchResult-detail"><div onclick="pageContext.forward('searchResultDetail.jsp')">커뮤니티 검색 결과 더 보기 <span>→</span></div></div>
		
		</section>
		<br><br><br>
		<!-- 지식인 검색 결과 -->
		<%-- <section id="searchResult-knowledgeIn" style="width:80%; border:1px solid green;" >
				<div>${searchResultKnowledgeIn}</div>
				<div><a>지식인 더 보기 -> </a></div>
		</section> --%>
		
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


