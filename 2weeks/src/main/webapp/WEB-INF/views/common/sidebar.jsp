<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/sidebar.css"> 

	<nav id="sidebar" class="side_bar">		
		<div class="sidebar-default"> <!-- 스크롤 내려도 목록 고정되도록 -->
			<!-- 코로나 현황 -->
			<div class="wrap_sub_list"> 
				<div class="sidebar-list">
					<img class="sidebar-icon" src="${path }/resources/images/icons/korea.png"/>
					<a class="" href="${path }/covid/domestic.do">
						<div class="sidebar-title">Covid-19 updates</div>
					</a>
				</div> 
				<div class="sidebar-list-hide">
					<div class="sidebar-list-sub">
						<a class="" href="${path }/covid/domestic.do">
							<div class="sidebar-title">Covid Domestic</div>			                
						</a>
					</div>
					<div class="sidebar-list-sub">
						<div class="sidebar-title">Vaccination</div>
					</div>
					<div class="sidebar-list-sub">
						<a href="${path }/covid/overseas.do">
							<div class="sidebar-title">Covid Global</div>
						</a>
					</div>
					<div class="sidebar-list-sub">
						<a class="" href="${path }/covidUpdate/report.do">
							<div class="sidebar-title">News & Reports</div>
						</a>
					</div>
				</div>
			</div>  
			
			<!-- 코로나 정보 -->
			<div class="wrap_sub_list">
				<div class="sidebar-list">
	                <img class="sidebar-icon" src="${path }/resources/images/icons/info.png"/>
	                <div class="sidebar-title">Covid-19 info/guide</div>
                </div>
				<div class="sidebar-list-hide">
					<div class="sidebar-list-sub">
		                <div class="sidebar-title">Covid Info</div>
		            </div>
		            <div class="sidebar-list-sub">
		                <div class="sidebar-title">Quarantine</div>
		            </div>
		            <div class="sidebar-list-sub">
		                <a class="" href="${path }/covidInfo/center.do">
		                	<div class="sidebar-title">Covid Test</div>
		                </a>
		            </div>
		            <div class="sidebar-list-sub">
		                <div class="sidebar-title" onclick="location.href='${path}/vaccine/vaccineCenter'" style="cursor:pointer;">Vaccination</div>
		            </div>
		            <div class="sidebar-list-sub">
		                <div class="sidebar-title">Overseas Entry</div>
		            </div>
				</div>			
			</div>
			
			<!-- 지식인 -->
			<div class="wrap_sub_list">
				<div class="sidebar-list">
		            <img class="sidebar-icon" src="${path }/resources/images/icons/know.png"/>
		            <div class="sidebar-title"><a href="${path }/KnowledgeIn/KnowledgeInMain.do">KnowledgeIn</a></div>
				</div> 
			</div>
			
			<!-- 커뮤니티 -->
			<div class="wrap_sub_list">
				<div class="sidebar-list">
	                <img class="sidebar-icon" src="${path }/resources/images/icons/commu.png"/>
	                <div class="sidebar-title"><a href="${path }/freeboard/boardList.do">Community</a></div>
	            </div>
			</div>
			
			<!-- 채팅 -->
			<div class="wrap_sub_list">
				<div class="sidebar-list">
					<img class="sidebar-icon" src="${path }/resources/images/icons/main_chat.png"/>
					<a class="" href="${path }/chatting.do">
	                	<div class="sidebar-title">Chatting</div>
	                </a>						
				</div>					
			</div>							
		
			<!-- 구분선 -->
			<div class="wrap_sidebar-divider" style="height:fit-contents;">
				<img class="sidebar-divider" src="${path }/resources/images/icons/divider-horizontal.svg"/>
			</div>
			
			<!-- 관리자 페이지 -->
			<div class="wrap_sub_list">
				<div class="sidebar-list">
					<img class="sidebar-icon" src="${path }/resources/images/icons/admin.png"/>
					<a href="${path }/admin/adminPageList">
						<div class="sidebar-title">Admin</div>
					</a>
				</div>
			</div>
			</div>
		</div>
	</nav>   
 
    <script>  
	/* hover로 사이드바 열고 닫기 */
    /* hover일 때 색상 변경 */
    $(".wrap_sub_list").hover(function(){  
        $(this).children("div.sidebar-list-hide").slideDown(1100).siblings("div.sidebar-list-hide").slideUp(1000); 
        $(this).css("background", "#8c8dfa60");
        $(this).children("div.sidebar-list").css("background", "#8c8dfa60");        
    },  
    function(){  
		$(this).children("div.sidebar-list-hide").slideUp(1000);  
		$(this).css("background", "#D3D8F4");
		$(this).children("div.sidebar-list").css("background", "#D3D8F4");
    });
	

	/* list에 hover될 경우 색이 어두워짐 */
	$(".sidebar-list-sub").hover(function(){
		$(this).addClass("overlay");
	},
	function(){
		$(this).removeClass("overlay");
	});
	$(".sidebar-list").hover(function(){
		$(this).addClass("overlay");
	},
	function(){
		$(this).removeClass("overlay");
	});
    </script>

