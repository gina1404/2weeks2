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
     <form name="boardFrm"  id="dataForm" action="${path}/freeboard/writeEnd.do"  method="post" enctype="multipart/form-data">
        <div class="row justify-content-md-center"> 				
            <div class="col-sm-9">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text">제목</label>
                  </div>            
                  <input type="text" class="form-control" name="post_Title">              
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3">
                    <select class="custom-select" id="category" name="category">
                    <option selected>분류</option>
                    <option value="자유">자유</option>
                    <option value="배달">배달</option>
                    <option value="재택근무">재택근무</option>
                  </select>  
                </div>
            </div>            
      </div>
      
      <hr>
      
 <!--      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea class="form-control" id="content" name="post_Content"></textarea>
                </div>
            </div> 
      </div>
    <div>
	<input type="file" name="attachments"  id="attach" multiple="multiple" style="border: 2px solid #ddd; outline: none;">
	 <label for="attach"><i class="far fa-file-image">파일추가 </i></label>
	<span style="font-size: 14px; color: gray;">※첨부파일은 최대 5개까지 등록이가능합니다.</span>
	</div>
	<div class="data_file_txt" id="data_file_txt" >
	</div>
		<div id="articlefileChange" class="bg-success">
		</div>
      <div class="row justify-content-md-center">
        <input type="submit" class="m-3 btn btn-outline-secondary"   value="등  록" style="width: 20%; font-weight: bold">
        </div>
     </form>
  </div>

</div> -->

      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea class="form-control" id="content" name="post_Content"></textarea>
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
        <input type="submit" class="m-3 btn btn-outline-secondary"   value="등   록" style="width: 20%; font-weight: bold">
        </div>
     </form>
        <input type="submit" class="m-3 btn btn-outline-secondary" id="back"   value="취   소" style="width: 20%; font-weight: bold">
  </div>
  

</div>
</section>











</section>



 
<script>

//해당 파일을 가져와서 배열에 담아주고 input file은 초기화 해준다.
//multiple 특성상 중복파일은 업로드가 되지 않기에 최기화를 해야 중복파일도 업데이트가 가능띠
/* 	$(document).ready(function(){
		$("#attach").on("change",fileCheck);
	});
	
	$(function () {
		$("#btn-upload").click(function(e){
			e.preventDefault();
			$("#attach").click();
		});
	});

	var fileCount = 0;
	var totalCount = 5;
	var fileNum = 0;
	var content_files = new Array();
	
	function fileCheck(e){
		var files = e.target.files;
		var filesArr =Array.prototype.slice.call(files);
		
		if(fileCount+filesArr.length> totalCount){
			alert('파일은 최대 ' + totalCount + '개까지 업로드 할 수 있습니다.');
			return;
		}else{
			fileCount = fileCount + filesArr.length;
		}
		
		//각각의 파일 배열담기 및 기타
		filesArr.forEach(function(f){
			var reader = new FileReader();
			
		reader.onload = function (e) {
			content_files.push(f);
			$("#articlefileChange").append('<div id="file'+ fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'+
			'<font style="font-size:16px">' + f.name + '</font>' 
			+'<img src ="${path }/resources/images/minus-5-xxl.png" style="width:20px; height:Auto; vertical-align:middle; cursor: pointer;"/>'+
			'</div>'
			);
			fileNum++;
		};
		
		reader.readAsDataURL(f);
	});
		console.log(content_files);
		//초기화
		$("#attach").val("");
		
}
	//파일 부분 삭제 함수
	
	function fileDelete(fileNum){
		var no = fileNum.replace(/[^0-9]/g,"");
		content_files[no].is_delete = true;
		$('#' + fileNum).remove();
		fileCount --;
		console.log(content_files);
	} */
	
	
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
		filebrowserImageUploadUrl : '${pageContext.request.contextPath}/freeboard/writeEnd.do ',
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