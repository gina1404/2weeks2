<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>      
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="게시글 작성"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/freeboard/write.css">
<script src="//cdn.ckeditor.com/4.11.4/full-all/ckeditor.js"></script>
<style>

</style>
<section class="content" id="containerWrapper">
<div class="container" >
    <div class="row container" id="writeContainer" style="width: 100%">
     <form name="boardFrm"  id="dataForm" action="${path}/freeboard/writeEnd.do"   method="post" enctype="multipart/form-data">
        <div class="row justify-content-md-center"> 				
            <div class="col-sm-9">
            <div class="input-group mb-3">
							<div class="checks etrans">
								<input type="checkbox" name="anonymous" id="ex_chk3" > <label id="anonWrap"
									for="ex_chk3">익명 사용</label>
							</div>
							<div class="input-group-prepend">
                    <label class="input-group-text">제목</label>
                  </div>            
                  <input type="text" class="form-control" name="post_Title">              
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3">
                    <select class="custom-select" id="category" name="category">
                    <option value="자유" selected>자유</option>
                    <option value="배달">배달</option>
                    <option value="재택근무">재택근무</option>
                  </select>  
                </div>
            </div>            
      </div>
      
      <hr>

      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea class="form-control" id="post_Content" name="post_Content"></textarea>
                </div>
            </div> 
      </div>
    <div>
	<div class="form-group" id="file-list">
        <a href="#this" onclick="addFile()"><label for="attach"><i class="far fa-file-image">파일추가</i></label></a>
        <div class="file-group">
            <input type="file" name="file"><a href='#this' name='file-delete'>삭제</a>
        </div>
    </div>
	 
	<span style="font-size: 14px; color: gray;">※첨부파일은 최대 5개까지 등록이가능합니다.</span>
	</div>
	<div class="data_file_txt" id="data_file_txt" >
	</div>
		<div id="articlefileChange" class="bg-success">
		</div>
      <div class="row justify-content-md-center">
        <input type="submit" class="m-3 btn btn-outline-secondary" onclick="editorContent();"  value="등   록" style="width: 20%; font-weight: bold">
        <input type="button" class="m-3 btn btn-outline-secondary" id="back-cancle"   value="취   소" style="width: 20%; font-weight: bold">
        </div>
     </form>
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
	
	CKEDITOR.replace("post_Content",{
		height : "300",
		width : "880",
		filebrowserImageUploadUrl : '${pageContext.request.contextPath}/freeboard/writeEnd.do ',
	});
					

	 
	 $("#back-cancle").on("click",function(){
		 history.back();
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
