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
				
		<!-- 키워드 검색 -->
		<div class="header-search-area">			
			<input id="searchKeyword" type="text" name="searchKeyword" style="display:none;" onKeypress="javascript:if(event.keyCode==13) {fn_searchKeyword()}"> <!-- 입력창 -->
			<img id="searchKeywordSubmit" class="header-icon" src="${path }/resources/images/icons/search.svg"/> <!-- 돋보기 버튼 -->
		</div>
	            
		<!-- 기본 아이콘 -->
		<div class="header-icon-area">
			<div> <!-- 구분선 -->
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

	<!-- 키워드 검색  -->
	<script>	
		/* 검색 함수 선언 */
		function fn_searchKeyword(){
			// 검색어가 입력되지 않을 경우 경고 알림					
			if($("#searchKeyword").val()==""){ //검색어가 null
				alert('검색어를 입력해 주세요.');
				$("#searchKeyword").focus();
				return false;
			}else if($("#searchKeyword").val().length<2){ //검색어가 2글자 미만
				alert('두 글자 이상 입력해 주세요.');
				$("#searchKeyword").val("");
				$("#searchKeyword").focus();
				return false;
			}else{ //검색어를 컨트롤러에 전달
				location.href='${path }/searchResult.do?searchKeyword='+$('input[name=searchKeyword]').val();
			}
		}
		
		$(document).ready(function(){
			$("#searchKeywordSubmit").click(function(){ 
				$("#searchKeyword").show(); //돋보기 아이콘을 클릭하면 입력창이 보이게 보이게 됨
				$("#searchKeyword").focus();			
			
				//검색
				$("#searchKeywordSubmit").click(fn_searchKeyword);						
			});
		});
	</script>