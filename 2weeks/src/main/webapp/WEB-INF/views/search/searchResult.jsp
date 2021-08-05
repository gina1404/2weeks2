<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<section class="container">	
	<!-- 커뮤니티 검색 결과 -->
	<section id="searchResult-community" style="width:100%; border:1px solid green;" >
		<div>${searchResult-community}</div>		
		<div><a>community 더 보기 -> </a></div>
	</section>
	
	<!-- 지식인 검색 결과 -->
	<section id="searchResult-knowledgeIn" style="width:100%; border:1px solid green;" >
			<div>${serchResult-knowledgeIn}</div>
			<div><a>지식인 더 보기 -> </a></div>
	</section>
	
	<!-- 외부 검색 결과 -->
	<section id="serchResult-external" style="width:100%; border:1px solid green;" >
		외부 검색 결과
		${searchResult-external-naver }
	</section>
	
</section>

<script>
	//검색 후 입력창 글씨 지워지지 않게
	$(document).ready(function(){
		$("#searchKeyword").val("${searchKeyword}");
	})
</script>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


