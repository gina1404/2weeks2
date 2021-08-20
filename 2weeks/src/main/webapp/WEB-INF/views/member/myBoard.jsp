<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>


<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/css/member/myBoard.css" rel="stylesheet" />

<section class="container" style="display: flex; padding-bottom: 30px;">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content" style="margin-left: 220px;">
		<h3 id="boardLogo">나의 활동보기</h3>
		
		<div id="myBoard" class="boardListBack">
			<h4>내가 작성한 게시글</h4>
			<div class="boardList">
				<table class="myBoardTab table table-striped">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="r" items="${list }">
						<tr>
							<td>${r.post_Sq }</td>
							<td>
								<a href="${path }/freeboard/readView?no=${r.post_Sq}">
									[${r.category }] ${r.post_Title }
								</a>
							</td>
							<td>${r.user_Id }</td>
							<td>${r.post_Dt }</td>
							<td>${r.post_Cnt }</td>
						</tr>
					</c:forEach>
				</table>
				<div id="reportPageBar">
					${pageBar }
				</div>
			</div>
		</div>
		
		<!-- <div id="scrap" class="boardListBack">
			<h4>즐겨찾기</h4>
			<div class="boardList">
				<table class="myBoardTab table table-striped">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td>1</td>
						<td>abcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefg</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
					</tr>
				</table>
			</div>
		</div> -->
		
	</div>
	
</section>

<script>
	location.assign('member/mypage?cPage=1&loginId='+DUMMY);
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>