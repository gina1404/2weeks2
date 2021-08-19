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
		<div class=" defaultBoxshadow" style="padding-top:20px;"> <!-- <- 진영 추가 (열기) -->
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
	</div> <!-- <- 진영 추가 (닫기) -->
</section>

<script>
	let move;
	$(".reportTitle").click(e=>{
		let aTag=$(e.target).next().val();		
		let url=aTag.split("','");
		for(let i=0; i<url.length; i++){
			if(url[2]!=""){				
				move="http://ncov.mohw.go.kr/tcmBoardView.do?brdId="+url[1]+
						"&brdGubun="+url[2]+
						"&dataGubun=&ncvContSeq="+url[3]+
						"&contSeq="+url[3]+
						"&board_id="+url[4].substring(0, 3)+"&gubun=BDJ";						
			}else {				
				move="http://ncov.mohw.go.kr/tcmBoardView.do?brdId=&brdGubun=&dataGubun=&ncvContSeq="+
						url[3]+"&contSeq="+url[3]+"&board_id=140&gubun=BDJ";
			}			
		}
		window.open(move);	
	});	
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>