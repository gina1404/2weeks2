<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="자유게시판"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/freeboard/boardList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

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
		<!-- 			첨부파일이 이미지 파일이면
		
					 	해당게시물에 첨부파일이 없으면 썸네일 -> 기본이미지 
					 	
					 	첨부파일이 있는지 없는지 어떻게 확인? ima는 첨부파일이 있는 것만 저장되어있다.
					 	
					    해당 게시물에 첨부파일이 있으면 첫번째 첨부파일이 썸네일 
					 		
					 	적용한 논리 :
					 	
					 	freeboard랑 attachment는 mapping을 시켜놨기 때문에 b.attachment로 접근 가능 join 
					 	var ="ima"로 변수명 지정
					 	if문을 활용하여 ima.atch_New가 없다면 어태치먼트가 없다는 뜻 그렇기 때문에 기본 디폴트 이미지를 출력
					 	있다면 첨부파일이 이미지 파일이면 출력 아니면 기본이미지를 출력해야한다. contains로 jpg,png,jpeg를 확인하여 출력한다.	
					 	그리고 저장된 이미지를 출력하는건 성능에 좋지 않은 것 같기에 
					 	이미지를 저장시에는 따로 썸네일 과정을 거쳐 이미지를 축소하여 따로 저장(총 2장을 저장 => 1.업로드된 이미지    2. 업로드된 이미지를 썸네일용으로 만들어서 저장)
					 		-->
					 	
		<div class="row" >
		<c:forEach var="b" items="${list }">
				<div class="card col-md-3 m-4" style="padding-left:-100px;">
					<div class="card-header m-3">
					<c:forEach var="ima" items="${b.attachments }" varStatus="vs">
						<c:choose>
							<c:when test="${ empty ima.atch_New}">
							 <a href="${path }/freeboard/readView?no=${b.post_Sq }"><img src="${path }/resources/images/freeboardPic/default.png"  class="card-img-top row" alt="기본이미지"> </a>
							</c:when>
							<c:otherwise>
							<c:choose>
							<c:when test="${fn:contains(ima, 'png')}">
								<c:if test="${vs.index == 0 }">
						 			<a href="${path }/freeboard/readView?no=${b.post_Sq }"><img src="${path }/resources/upload/freeboard/${ima.atch_New}" class="card-img-top row" alt="첨부파일"> </a>
						 		</c:if> 
						 	</c:when>
							<c:when test="${fn:contains(ima, 'jpg')}">
								<c:if test="${vs.index == 0 }">
						 			<a href="${path }/freeboard/readView?no=${b.post_Sq }"><img src="${path }/resources/upload/freeboard/${ima.atch_New}" class="card-img-top row" alt="첨부파일"> </a>
						 		</c:if> 
						 	</c:when>
							<c:when test="${fn:contains(ima, 'jpeg')}">
								<c:if test="${vs.index == 0 }">
						 			<a href="${path }/freeboard/readView?no=${b.post_Sq }"><img src="${path }/resources/upload/freeboard/${ima.atch_New}" class="card-img-top row" alt="첨부파일"> </a>
						 		</c:if> 
						 	</c:when>
						 	<c:otherwise>
						 		<a href="${path }/freeboard/readView?no=${b.post_Sq }"><img src="${path }/resources/images/freeboardPic/default.png"  class="card-img-top row" alt="기본이미지"> </a>
						 	</c:otherwise>
						 	</c:choose>
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
		<div id="pagebar-container" class="m-8">${pageBar }</div>


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
