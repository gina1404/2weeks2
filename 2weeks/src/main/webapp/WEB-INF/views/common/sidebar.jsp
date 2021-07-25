<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>   

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
				<li>검사</li>
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
</section>
		



