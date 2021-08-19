<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/covid/covidReportList.css" rel="stylesheet" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>

<section class="container">	
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content">
		<h4 id="reportLogo">보도자료</h4>
		
		<p id="reportListCnt">총 <span>${totalContents }</span>건</p>	
		<table id="reportTab" class="table table-striped">
			<tr id="reportTh">
				<th>번호</th>
				<th>제목</th>
				<th>담당</th>
				<th>작성일시</th>
				<th>첨부파일</th>
			</tr>		
			<c:forEach var="r" items="${reportList }"> 				
				<tr>
					<td>${r.no }</td>
					<td class="reportTitle">${r.title }</td>
					<input type="hidden" value="${r.url }">
					<td>${r.team }</td>
					<td>${r.date }</td>
					<td>${r.attachment !=null?"💾":" "}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div id="reportPageBar">
			${pageBar }
		</div>
	</div>
</section>

<script>
	$(".reportTitle").click(e=>{
		let url=$(e.target).next().val();
		
		console.log(url.substring(url.indexOf(",''")));
		
		//fn_tcm_boardView('/tcmBoardView.do','3','31','5739','312', 'ALL');
		//fn_tcm_boardView('/tcmBoardView.do','','','366664','', 'ALL');
		//http://ncov.mohw.go.kr/tcmBoardView.do?brdId=3&brdGubun=31&dataGubun=&ncvContSeq=5830&contSeq=5830&board_id=312&gubun=BDJ
		//http://ncov.mohw.go.kr/tcmBoardView.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=366865&contSeq=366865&board_id=140&gubun=BDJ
		//window.open("http://naver.com");
		
	});
	
	
	
	
	
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>