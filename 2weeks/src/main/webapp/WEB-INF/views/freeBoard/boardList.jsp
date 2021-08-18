<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="자유게시판"/>
</jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
 .category{
 	font-size:12px;
 }
.container {
  padding-right: 30px;
  padding-left: 30px;
  margin-right: auto;
  margin-left: 20%;
  margin-top:5%;
}
.profile{
	width:24px;
	height:24px;
}
.heart {
width:13px;
height:13px;
}
.eye{
width:13px;
height:13px;
}
.comment{
width:13px;
height:13px;
}
.icon{
font-size: 8px;
}
a{
text-decoration: none;
}

</style>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<section id="content">
	<div class="container">
		<div class="form-group row justify-content-center">
			<form  action="${path }/freeboard/searchBoard.do"  method="get">
				<div class="input-group mb-3">
						<select name="searchType" class="form-control" id="searchType">
							<option value="POST_TITLE" ${FreeBoard.searchType eq POST_TITLE ? 'selected' : '' }>제목</option>
							<option value="post_Content" ${FreeBoard.searchType eq 'post_Content' ? 'selected' : '' }>내용</option>
							<option value="user_Id" ${FreeBoard.searchType eq 'user_Id' ? 'selected' : '' }>작성자</option>
							<%-- <option value="tc" ${FreeBoard.searchType eq 'tc' ? 'selected' : '' }>제목/내용</option>
							<option value="tw" ${FreeBoard.searchType eq 'tw' ? 'selected' : '' }>제목/작성자</option>
							<option value="cw" ${FreeBoard.searchTypeeq eq 'cw' ? 'selected' : '' }>내용/작성자</option>
							<option value="tcw" ${FreeBoard.searchType eq 'tcw' ? 'selected' : '' }>전체</option> --%>
						</select>
						<input type="text" class="form-control serachInput" placeholder="Search" name="keyword" value="${fb.keyword }" >
					<div class="input-group-append">
						<button class="btn btn-success" type="submit" onclick="return searchInput();">Go</button>
					</div>
				</div>
			</form>
		</div>
		<div class="row" >
		<c:forEach var="b" items="${list }">
				<div class="card col-md-3 m-2">
					<div class="card-header m-3">
					 <c:forEach var="ima" items="${attachments }"> 
					 
					 <c:choose>
					 <c:when test="${attachments ==null }">
						<a href="${path }/freeboard/readView?no=${b.post_Sq }"><img src="${path }/resources/images/freeboardPic/default.png" class="card-img-top row" alt="이미지"> </a>
					 </c:when>
					 <c:otherwise>
					 	<a href="${path }/freeboard/readView?no=${b.post_Sq }"><img src="${path }/resources/upload/freeboard/${ima.atch_New}" class="card-img-top row" alt="이미지"> </a>
					 </c:otherwise>	
					</c:choose>		
					</c:forEach>	
					</div>
					<div class="card-body cardContent">
						${b.category } &nbsp; &nbsp; [${b.post_Dt }]
						<h4 class="card-title"><a href="${path }/freeboard/readView?no=${b.post_Sq }"><c:out value="${b.post_Title }"/> </a></h4>
						<c:choose>
						<c:when test="${fn:length(b.post_Content) gt 26 }">
							 ${fn:substring(b.post_Content, 0, 25)} 
						</c:when>
							<c:otherwise>
							${b.post_Content }
							</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${b.open_Yn == 'on'}">
						<p class="card-text"><img src="${path}/resources/images/icons/profile.svg" class="profile " alt="프로필사진"> 익명</p>
						</c:when>
						<c:otherwise>
						<p class="card-text"><img src="${path}/resources/images/icons/profile.svg" class="profile " alt="프로필사진"> ${b.user_Id }</p>
						</c:otherwise>
						</c:choose>
						<div class="row">
						<div class='col-4'>
							<img alt="좋아요" src="${path }/resources/images/icons/heart.svg" class="heart">&nbsp;<p class="icon">${b.post_Like_Cnt }</p>
						</div>
						<div class="col-4">
							<img alt="조회수" src="${path }/resources/images/icons/eye-6.svg" class="eye">&nbsp;<p class="icon">${b.post_Cnt }</p>
						</div>
						<div class="col-4">
							<img alt="댓글수" src="${path }/resources/images/icons/comment.svg" class="comment">&nbsp;<p class="icon">${b.replyNo }</p>
						</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div>
			
		<button id="btn-add" class="btn btn-outline-success" onclick="location.assign('${path}/freeboard/write.do')">
				글쓰기
		</button>
			</div>
		</div>
		<div id="pagebar-container" class="m-5">${pageBar }</div>


</section>
<script>

	function searchInput(){
		var text = $('.serachInput').val();
		if (text.replace(/\s|　/gi, "").length == 0) {
		    alert("검색칸에 입력해주세요.");
		    $(".serachInput").focus();
		    return false;
		  }
	}

</script> 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
