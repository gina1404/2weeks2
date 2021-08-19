<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<c:set var="path" value="${pageContext.request.contextPath }"/> 
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="${path}/resources/css/common/main.css" rel="stylesheet" type="text/css" >

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>

<section class="container" style="display: flex; padding-bottom: 30px;">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>			
	<div class="content gridContainer" style="margin-left: 220px;">
		<div class="item 1st">1</div>
		<div class="item 1st">2</div>
		<div class="item 1st">3</div>
		<div class="item 1st">4</div>
		<div class="item 1st">5</div>
		<div class="item 1st">6</div>
		<div class="item 1st">7</div>
		<div class="item 1st">8</div>
		<div class="item 2nd">a</div>
		<div class="item 2nd">
			<div class="report">
				<div>
					<a id="reportMove" href="${path }/covidUpdate/report.do">
						보도자료
					</a>	
				</div>
				<table id="reportTab" class="table table-striped">
					<c:forEach var="r" items="${reportList }">
						<tr>
							<td class="reportTitle" style="text-overflow: ellipsis;"> ${r.title } </td>
							<input type="hidden" value="${r.url }">
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="report">
				<div>뉴스</div>
			</div>			
		</div>
		<div class="item 3rd">가</div>
	</div>	
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


