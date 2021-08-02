<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="자유게시판"/>
</jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
/* .flex-container {
  display: flex;
  height: 600px;
  flex-wrap: wrap;
  align-content: stretch;
  background-color: DodgerBlue;
}
.flex-container > div {
  background-color: #f1f1f1;
  width: 100px;
  margin: 10px;
  text-align: center;
  line-height: 75px;
  font-size: 30px;
} */
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

</style>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<section id="content">
	<div class="container">
		<div class="form-group row justify-content-center">
			<form action="${path }/freeboard/searchBoard.do" method="get">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType"
						id="searchType">
						<option value="title">제목 + 본문</option>
						<option value="reg_id">작성자</option>
						<option value="reply_context">댓글내용</option>
					</select>
				</div>
				<div class="w300" style="padding-right: 10px">
					<input type="text" class="form-control form-control-sm"
						name="keyword" id="keyword">
				</div>
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch"
						id="btnSearch" type="submit">검색</button>
				</div>
			</form>
		</div>


		<div class="row">
			<c:forEach var="b" items="${list }">
				<div class="card col-md-3 m-2">
					<div class="card-header m-3">
						<a href="#"><img
							src="${path }/resources/images/freeboardPic/default.png"
							class="card-img-top" alt="이미지"></a>
					</div>
					<div class="card-body">
						<p class="card-text category">${b.category } &nbsp; &nbsp; [${b.post_Dt }]</p>
						<h4 class="card-title">${b.post_Title }</h4>
						<p class="card-text">${b.post_Content }</p>
						<p class="card-text"><img src="${path}/resources/images/icons/profile.svg" class="profile " alt="프로필사진"> ${b.user_Id }</p>
						<div class="row">
						<div class='col-4'>
							<img alt="좋아요" src="${path }/resources/images/icons/heart.svg" class="heart">&nbsp;<p class="icon">${b.post_Like_Cnt }</p>
						</div>
						<div class="col-4">
							<img alt="조회수" src="${path }/resources/images/icons/eye-6.svg" class="eye">&nbsp;<p class="icon">${b.post_Cnt }</p>
						</div>
						<div class="col-4">
							<img alt="댓글수" src="${path }/resources/images/icons/comment.svg" class="comment">&nbsp;<p class="icon"></p>
						</div>
						</div>
						<a href="" class="btn btn-primary">더보기</a>
						<p class="card-text"></p>
					</div>
				</div>

			</c:forEach>
		</div>
		<div id="pagebar-container" class="m-5">${pageBar }</div>
	</div>

</section>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
