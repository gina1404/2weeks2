<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2weeks</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/header.css">
</head>
<body style="margin:0; padding:0;">
	<header id="header">
		<!-- 로고 -->
		<div class="header-logo-area"><a class="header-logo" href="${path }/">2weeks</a></div>
				
		<!-- 검색 -->
		<div class="header-search-area">
			<input type="text" class="header-search">
			<img class="icon-header"src="${path }/resources/images/icons/search.svg"/>
		</div>
	            
		<!-- 기본 아이콘 -->
		<div class="header-icon-area">
			<div>
				<img class="header-divider" src="${path }/resources/images/icons/divider-virtical.svg"/>
			</div>
			<div class="header-icon">
				<img class="" src="${path }/resources/images/icons/darkmode.svg" />
			</div>
			<div class="header-icon">
				<img class="" src="${path }/resources/images/icons/language.svg"/>  
				</div>
					<c:if test="${userId eq null and member.user_Id eq null}">
	                	<div class="header-profile-text" onclick="location.href='${path}/member/login'" style="cursor:pointer;">join us</div>
	            	</c:if>
	            	<c:if test="${userId ne null}" >
	            		<div class="header-profile-text">${userId} </div>
	            		<input type="button" value="로그아웃" onclick="location.href='${path}/member/kakaologout'"/>
	            	</c:if>
	            	<c:if test="${member.user_Nic ne null }">
	            		<div class="header-profile-text">${member.user_Nic}님 </div>
	            		<input type="button" value="로그아웃" onclick="location.href='${path}/member/logout'"/>
	            	</c:if>	
	                <div class="header-profile-icon">
	                    <img class="" src="${path }/resources/images/icons/profile.svg" style="margin: 0;"/>
	                </div>
	                <!-- member profile 사진 받아올 경우 -->
	                <div class="header-profile-photo">
	                	<img class="" src="${path }/resources/images/icons/profile.svg" style="margin: 0;"/>
	                </div>
	            </div>
	</header>     