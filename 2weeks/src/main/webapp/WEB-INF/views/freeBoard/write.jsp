<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>      
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<%-- <script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script> --%>
<script src="//cdn.ckeditor.com/4.11.4/full-all/ckeditor.js"></script>
<section class="content">
<div class="container" id="">
    <div class="content" style="width: 70%">
     <form name="boardFrm" action="${path }/freeboard/boardWriteEnd.do" method="post" enctype="multipart/form-data" >
        
        <div class="row justify-content-md-center">
            <div class="col-sm-9">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text">제목</label>
                  </div>            
                  <input type="text" class="form-control" name="title">              
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3">
                    <select class="custom-select" id="category" name="category">
                    <option selected>분류</option>
                    <option value="1">자유</option>
                    <option value="2">음식</option>
                    <option value="3">ㅇㅇㅇ</option>
                  </select>  
                </div>
            </div>            
      </div>
      
      <hr>
      
      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea class="form-control" id="content" name="content"></textarea>
                </div>
            </div> 
      </div>
      
      <div class="row justify-content-md-center">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text"></span>
              </div>
              <input type="text" class="form-control">
            </div>
      </div>
      
      <div class="row justify-content-md-center">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
              </div>
              <div class="custom-file">
                  &nbsp;<input type="file" class="btn btn-outline-secondary" id="exampleFormControlFile1">
              </div>
            </div>
      </div>
      <div class="row justify-content-md-center">
        <input type="submit" class="btn btn-outline-secondary"   value="등  록" style="width: 20%; font-weight: bold">
        </div>
     </form>
  </div>
</div>
</section>




 
<script>



	CKEDITOR.replace("content",{
		height : "300",
		width : "880",
		filebrowserImageUploadUrl : '${pageContext.request.contextPath}/freeboard/fileupload.do ',
	});
					
</script>
	




<style>
.cke_editor_editor .cke_contents{ 
     min-height:550px; 
     min-width: 900px;
     } 
.content{
	display: block;
	margin-top: 100px;
	margin-left: 135px;
}
</style>
</body>
</html>