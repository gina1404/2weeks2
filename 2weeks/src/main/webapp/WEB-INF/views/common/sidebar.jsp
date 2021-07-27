<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/sidebar.css"> 

	<nav id="sidebar">		
		<div class="sidebar-default"> <!-- 스크롤 내려도 목록 고정되도록 -->
			<!-- 코로나 현황 -->
				<div class="wrap_sub_list"> 
					<div class="sidebar-list">
						<img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
						<div class="sidebar-title">Covid-19 updates</div>
					</div> 
					<div class="sidebar-list-hide">
		            	<div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Covid Domestic</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Vaccination</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Covid Global</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">News & Reports</div>
			            </div>
		            </div>
				</div>  
				
				<!-- 코로나 정보 -->
				<div class="wrap_sub_list">
					<div class="sidebar-list">
		                <img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
		                <div class="sidebar-title">Covid-19 info/guide</div>
	                </div>
					<div class="sidebar-list-hide">
						<div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Covid Info</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Quarantine</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Covid Test</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Vaccination</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Overseas Entry</div>
			            </div>
					</div>			
				</div>
				
				<!-- 지식인 -->
				<div class="wrap_sub_list">
					<div class="sidebar-list">
			            <img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
			            <div class="sidebar-title">KnowledgeIn</div>
					</div> 
				</div>
				
				<!-- 커뮤니티 -->
				<div class="wrap_sub_list">
					<div class="sidebar-list">
		                <img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
		                <div class="sidebar-title">Community</div>
		            </div>
		            <div class="sidebar-list-hide">
		            	<div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Specific</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Free</div>
			            </div>
		            </div>
				</div>
								
				<!-- 구분선 -->
				<div class="wrap_sub_list" style="height:fit-contents;">
					<img class="sidebar-divider" src="${path }/resources/images/icons/divider-horizontal.svg"/>
				</div>
	
				<!-- 챗봇 -->
				<div class="wrap_sub_list">
					<div class="sidebar-list">
						<img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
						<div class="sidebar-title">chatBot</div>
					</div>
				</div>
			</div>  
	</nav>   
 
    <script>  
	/* hover로 사이드바 열고 닫기 */
    /* hover일 때 색상 변경 */
    $(".wrap_sub_list").hover(function(){  
        $(this).children("div.sidebar-list-hide").slideDown("slow").siblings("div.sidebar-list-hide").slideUp("slow"); 
        $(this).css("background", "#7879F160");
        $(this).children("div.sidebar-list").css("background", "#7879F160");
    },  
    function(){  
		$(this).children("div.sidebar-list-hide").slideUp("slow");  
		$(this).css("background", "#E1E6FF");
		$(this).children("div.sidebar-list").css("background", "#E1E6FF");
            
    });
    </script>