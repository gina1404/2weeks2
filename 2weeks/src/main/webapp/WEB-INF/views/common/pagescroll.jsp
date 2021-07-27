<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/sidebar.css"> 

	<aside id="aside">
		<div class="pagescroll-button"><img class="" src="${path }/resources/images/icons/darkmode.svg"/></div>
	</aside>
	
	<style>
		
        .pagescroll-button{
            width:30px;
            height:30px;
            bottom:60px;
			position:fixed;
        }
	</style>