<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 검색</title>
<style>
input {
	border: 1px white solid
}
</style>
</head>

<body>
	
	<c:if test="${empty nicList }">
		<p>검색하신 회원정보가 없습니다.</p>
	</c:if>

	<b>${search_Nic}</b> 검색 결과입니다. <br/><br/>
	<c:forEach var="list" items="${nicList}">
		<a href="${path}/message/send_msg?recv_nic=${list.user_Nic}&send_nic=${member.user_Nic}">${list.user_Nic }</a><br/><br/>

	</c:forEach>
	
	
	
</body>
</html>