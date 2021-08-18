<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<c:set var="path" value="${pageContext.request.contextPath }"/>   
<%-- 
<section id="content">
	<div id="sidebar">
		<ul>= 코로나 감염 현황
				<li><a class="" href="${path }/covidUpdate/domestic.do">국내 확산 현황</a></li>
				<li>국내 백신 접종 현황</li>
				<li>해외 감염/접종 현황</li>
				<li><a class="" href="${path }/covidUpdate/report.do">보도자료 및 뉴스</a></li>
			</ul>
			<ul>= 코로나 정보
				<li>기본 정보, 자가진단</li>
				<li>사회적 거리두기, 자가격리</li>
				<li><a class="" href="${path }/covidInfo/center.do">검사</a></li>
				<li>백신</li>
			</ul>
			<ul>= 지식인</ul>
			<ul>= 커뮤니티
				<li>인증</li>
				<li>자유</li>
			</ul>
			<ul>= 오픈 채팅</ul>
			<ul>= 챗봇</ul>
			<ul>= 관리자</ul>
	</div>		
</section> --%>
		



<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/sidebar.css"> 

	<nav id="sidebar">		
		<div class="sidebar-default"> <!-- 스크롤 내려도 목록 고정되도록 -->
			<!-- 코로나 현황 -->
				<div class="wrap_sub_list"> 
					<div class="sidebar-list">
						<img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
						<a class="" href="${path }/covid/domestic.do">
							<div class="sidebar-title">Covid-19 updates</div>
						</a>
					</div> 
					<div class="sidebar-list-hide">
		            	<div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <a class="" href="${path }/covid/domestic.do">
			                	<div class="sidebar-title">Covid Domestic</div>			                
							</a>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <div class="sidebar-title">Vaccination</div>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <a href="${path }/covid/overseas.do">
			                	<div class="sidebar-title">Covid Global</div>
			                </a>
			            </div>
			            <div class="sidebar-list-sub">
			                <img class="sidebar-icon" src="${path }/resources/images/icons/darkmode.svg"/>
			                <a class="" href="${path }/covidUpdate/report.do">
			                	<div class="sidebar-title">News & Reports</div>
		                	</a>
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
		                <a class="" href="${path }/covidInfo/center.do">
		                	<div class="sidebar-title">Covid Test</div>
		                </a>
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
		            <div class="sidebar-title"><a href="${path }/KnowledgeIn/KnowledgeInMain.do">KnowledgeIn</a></div>
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
		                <div class="sidebar-title"><a href="${path }/freeboard/boardList.do">Free</a></div>
		            </div>
	            </div>
			</div>
			
			<!-- 채팅 -->
			<div class="wrap_sub_list">
				<div class="sidebar-list">
					<img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
					<a class="" href="${path }/chatting.do">
	                	<div class="sidebar-title">Chatting</div>
	                </a>						
				</div>					
			</div>							
		
			<!-- 구분선 -->
			<div class="wrap_sidebar-divider" style="height:fit-contents;">
				<img class="sidebar-divider" src="${path }/resources/images/icons/divider-horizontal.svg"/>
			</div>
	
				
				
				
				<!-- 챗봇 -> 플러그인으로 변경 -->
				<%-- <div class="wrap_sub_list">
					<div class="sidebar-list">
						<img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
						<div class="sidebar-title">chatBot</div>
					</div>
				</div> --%>
			</div>
			
			<!-- 관리자 페이지 -->
			<div class="wrap_sub_list">
				<div class="sidebar-list">
					<img class="sidebar-icon" src="${path }/resources/images/icons/language.svg"/>
					<a href="${path }/admin/adminPageList">
						<div class="sidebar-title">Admin</div>
					</a>
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
	

	
	
   

	/* list에 hover될 경우 색이 어두워짐 */
	$(".sidebar-list-sub").hover(function(){
		$(this).addClass("overlay");
	},
	function(){
		$(this).removeClass("overlay");
	});
    </script>

