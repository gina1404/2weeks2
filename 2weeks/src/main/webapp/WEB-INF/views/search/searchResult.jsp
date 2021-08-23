<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/search/searchResult.css">
<style>
	header .content{
		padding-left:220px !important;
		margin-top:0 ;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<section class="container" style="display:flex; padding-bottom:200px;">	
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content" style="display:inline-block; padding-left:220px;">
		<!-- 커뮤니티 검색 결과 -->
		<section id="searchResult-community" class="searchResult-area" >
			<div class="searchResult-name">2weeks 커뮤니티 검색 결과</div>
			<c:choose>
				<c:when test="${!empty searchResultCommunity }">
					<c:forEach var="list" varStatus="i" items="${searchResultCommunity}" end="5">
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
					<div class="searchResult-detail"><div onclick="location.href='${path}/searchResult/community.do?searchKeyword=${searchKeyword }'">커뮤니티 검색 결과 더 보기 (총 ${searchResultCommunityCount }개)<span>→</span></div></div>
				</c:when>
				
				<c:otherwise>
					<div class="searchResult-list"> 커뮤니티 검색 결과가 없습니다 </div>
				</c:otherwise>
			</c:choose>
		</section>
		<br><br><br>
		
		<!-- 지식인 검색 결과 -->
		<section id="searchResult-knowledgeIn" class="searchResult-area" >
			<div class="searchResult-name">2weeks 지식인 검색 결과</div>
			<c:choose>
				<c:when test="${!empty searchResultKnowledgeIn }">
					<c:forEach var="list" varStatus="i" items="${searchResultKnowledgeIn}" end="5">
						<div class="searchResult-list">					
							<div class="searchResult-profile"><img class="" src="${path }/resources/images/icons/two.svg"/></div>
							<div class="searchResult-blogName" onclick="">${list.category }</div>
					       	<div class="searchResult-vertical-divider"></div>
					       	<div class="searchResult-date">${list.kin_Date }</div>
							<div class="searchResult-title" onclick="location.href='${path}/KnowledgeIn/KnowledgeInList.do?sq=${list.kin_Sq}'">${list.kin_Title }</div>
							<div class="searchResult-content">
								<!-- 미리보기 글자수 제한 -->
								<c:choose>
									<c:when test="${fn:length(list.kin_Content) gt 200 }">
										<c:out value="${fn:substring(list.kin_Content,0,200)}"/>...
									</c:when>
									<c:otherwise>
										<c:out value="${list.kin_Content}"/>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<c:if test ="${not i.last}"><hr></c:if>									
					</c:forEach>
					<div class="searchResult-detail"><div onclick="location.href='${path}/searchResult/knowledgeIn.do?searchKeyword=${searchKeyword }'">지식인 검색 결과 더 보기 (총 ${searchResultKnowledgeInCount }개)<span>→</span></div></div>
				</c:when>
				
				<c:otherwise>
					<div class="searchResult-list"> 지식인 검색 결과가 없습니다 </div>
				</c:otherwise>
			</c:choose>
		</section>
		<br><br><br>
		
		<!-- 외부 검색 결과 -->
		<section id="searchResult-external" class="searchResult-area">
			<div class="searchResult-name">외부 검색 결과</div>
			<c:forEach var="list" varStatus="i" items="${searchResultExternalNaver}" end="5">
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
		$("#header-main-area").addClass("defaultBoxshadow");
		$("#searchKeyword").show().val("${searchKeyword}");
	});
</script>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


