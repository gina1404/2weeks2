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
<section class="container">	
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content">
		<!-- 커뮤니티 검색 결과 -->
		<section id="searchResult-community-detail" class="searchResult-area defaultBoxshadow" >
			<div class="searchResult-name">2weeks 커뮤니티 검색 결과</div>
			<c:choose>
				<c:when test="${!empty searchResultCom }">
					<c:forEach var="list" varStatus="i" items="${searchResultCom}" end="8">
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
					<div class="pagebar" style="text-align: center;">${pageBar }</div>
				</c:when>
				
				<c:otherwise>
					<div class="searchResult-list"> 커뮤니티 검색 결과가 없습니다 </div>
				</c:otherwise>
			</c:choose>
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


