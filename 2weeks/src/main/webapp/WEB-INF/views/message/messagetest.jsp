<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>

<section class="container"> 
메세지 테스트 페이지

<span id="recMs" name="recMs" style="float:right;cursor:pointer;margin-right:10px;color:pink;">
			<img src="${path}/resources/images/msgicon.png" style="width:15px;"></span>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>