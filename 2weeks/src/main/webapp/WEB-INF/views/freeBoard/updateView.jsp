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
 <%-- <script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>  --%>
<script src="//cdn.ckeditor.com/4.11.4/full-all/ckeditor.js"></script>
<section class="content">
<div class="container" id="">
    <div class="content" style="width: 70%">
     <form name="boardFrm"  id="dataForm" method="post" action="${path }/freeboard/update" enctype="multipart/form-data">
        <div class="row justify-content-md-center">
            <div class="col-sm-9">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text">제목</label>
                  </div>            
                  <input type="text" class="form-control" name="title" value="${list.post_Title }">          
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3">
                    <select class="custom-select" id="category" name="category">
                    <option value="분류" ${list.category eq '분류' ? 'selected' : '' }>분류</option>
                    <option value="잡담" ${list.category eq '잡담' ? 'selected' : '' }>잡담</option>
                    <option value="배달" ${list.category eq '배달' ? 'selected' : '' }>배달</option>
                  </select>  
                </div>
            </div>            
      </div>
      
      <hr>
      
      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea class="form-control" id="content" name="content">${list.post_Content }</textarea>
                </div>
            </div> 
      </div>
    <div>
	<div class="form-group" id="file-list">
        <a href="#this" onclick="addFile()">파일추가</a>
        <div class="file-group">
            <input type="file" name="file"><a href='#this' name='file-delete'>삭제</a>
        </div>
    </div>
	 <label for="attach"><i class="far fa-file-image"/>파일추가</label>
	<span style="font-size: 14px; color: gray;">※첨부파일은 최대 5개까지 등록이가능합니다.</span>
	</div>
	<div class="data_file_txt" id="data_file_txt" >
	</div>
		<div id="articlefileChange" class="bg-success">
		</div>
      <div class="row justify-content-md-center">
        <input type="hidden" name="no" value="${list.post_Sq}"/>
        <input type="submit" class="m-3 btn btn-outline-secondary"   value="수   정" style="width: 20%; font-weight: bold">
        </div>
     </form>
        <input type="submit" class="m-3 btn btn-outline-secondary" id="back"   value="취   소" style="width: 20%; font-weight: bold">
  </div>
  

</div>
</section>



 
<script>


$(document).ready(function(){
	$("a[class='file-delete']").on("click",function(e){
		e.preventDefault();
		deleteFile($(this));
	});
})

	function addFile(){
	let str = "<div class='file-group'><input type='file' multiple='multiple' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
	$("#file-list").append(str);
	$("a[name='file-delete']").on("click",function(e){
		e.preventDefault();
		deleteFile($(this));
	});
		
	function deleteFile(obj){
		obj.parent().remove();
	}
}
	
	CKEDITOR.replace("content",{
		height : "300",
		width : "880",
		filebrowserImageUploadUrl : '${pageContext.request.contextPath}/freeboard/update',
	});
	
	

					
</script>
	




<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@600&display=swap');
.cke_editor_editor .cke_contents{ 
     min-height:550px; 
     min-width: 900px;
     } 
.content{
	display: block;
	margin-top: 100px;
	margin-left: 135px;
}
#articlefileChange{
	border : solid black 1px;
}

#attach{
   width: 0.1px;
	height: 0.1px;
	opacity: 0;
	overflow: hidden;
	position: absolute;
	z-index: -1;
	
}
#attach + label{
  display: inline-block;
  padding: 10px 20px;
  color: #999;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 2px solid #ebebeb;
  border-radius: 5px;
  font-family: 'Open Sans', sans-serif; 
}
#attach:focus + label,
#attach + label:hover{
	cursor:pointer;
}
</style>
</body>
</html>