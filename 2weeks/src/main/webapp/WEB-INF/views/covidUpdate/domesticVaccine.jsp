<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<style>
	header .content{
		padding-left:250px !important;
		margin-top:0;
	}
</style>
<style>
.table4_1{
	width:65%;
	border:0;
	text-align: center;
	margin-left: auto; 
	margin-right: auto;
	
}
.table4_1 th {
	background-color:#93DAFF;
	color:#000000
}
.table4_1,.table4_1 th,.table4_1 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_1 th,.table4_1 td {
	border: 1px solid #c1e9fe;
	border-width:1px 0 1px 0
}
.table4_1 tr {
	border: 1px solid #c1e9fe;
}
.table4_1 tr:nth-child(odd){
	background-color:#dbf2fe;
}
.table4_1 tr:nth-child(even){
	background-color:#fdfdfd;
}
.title{
text-align: center;
margin-left: auto; 
margin-right: auto;
color:gray;
font-family:pretendard;
font-size:30px;
font-weight: bold;
}
.datetime{
text-align: center;
margin-left: auto; 
margin-right: auto;
font-family:pretendard;
font-size:12px;
font-weight: bold;
float: right;
color: #8c8c8c;
position: relative;
top: -500px;
}
</style>
<section class="container">		
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="title">국내 백신 접종 현황</div>    

<hr width="65%">
<table class=table4_1>
<tr>
	<th>지역</th>
	<th>1차 접종</th>
	<th>누적 1차 접종 </th>
	<th>2차 접종</th>
	<th>누적 2차 접종</th>
</tr>
<c:forEach items="${items}" var="c">
			<tr>	
			
				<td>${c.sidoNm }</td>	
			<td><fmt:formatNumber value="${c.firstCnt}" groupingUsed="true"/>명</td>
			<td><fmt:formatNumber value="${c.firstTot}" groupingUsed="true"/>명</td>
			<td><fmt:formatNumber value="${c.secondCnt}" groupingUsed="true"/>명</td>
			<td><fmt:formatNumber value="${c.secondTot}" groupingUsed="true"/>명</td>
	
				
			</tr>	
		</c:forEach>
</table>
<div class="datetime">업데이트 일시: ${datetime}</div>
	
	
	
	
	
		
	
</section>
	 
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

