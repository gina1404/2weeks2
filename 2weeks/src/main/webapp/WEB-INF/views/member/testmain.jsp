<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 메인(삭제예정)</title>
</head>
<body>
<c:if test="${userId eq null }">
	<input type="button" value="로그인" onclick="location.href='${path}/member/login'"/>
</c:if>

<c:if test="${userId ne null}">
	<h1>${userId }님 </h1>
	<input type="button" value="로그아웃" onclick="location.href='${path}/member/kakaologout'"/>

</c:if>



</body>
</html>