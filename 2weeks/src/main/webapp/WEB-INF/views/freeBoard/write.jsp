<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<section class="content">
	<div class="container" role="main">
 		<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
				<div class="mb-3 title">
					<label for="title">제목</label>
					<input type="text"  name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<textarea name="content" id="editor"></textarea>
				</div>
				<div class="mb-3">
					<input type="file" name="file"/>
             		<input class="btn btn-primary btn-sm"  type="submit" value="업로드"/>
				</div>
			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">등록</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
	</div>
</section>




 
<script>
	$(function(){
      CKEDITOR.replace('editor',{
    	  filebrowserUploadUrl : '${pageContext.request.contextPath}/freeboard/fileupload.do'
      });
	})
</script>

<style>
.cke_editor_editor .cke_contents{ 
     min-height:550px; 
     min-width: 1000px;
     } 
.content{
	display: inline-block;
	margin-top: 100px;
}
</style>
</body>
</html>