<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<style>
 .profile_view{
            border : 1px solid white;
            width: 100px;
            height: 100px;
            border-radius: 100px;
            }
            
 .preview_img{
 		width:100%;
 		height:100%;
 		border-radius:100px;
 }

</style>

<section class="container"> 
프사,닉네임,비밀번호,전화번호

	<form id="myForm" action="${path}/member/myinfo" method="post" enctype="multipart/form-data">
		<p>
			<label>ID</label> 
			<input type="text" id="id" name="user_Id" readonly value="${member.user_Id}"> 
		</p>
		<p>
			<label>프로필 사진</label> 
	            <div class="profile_view">
                	<img id='image_section' class="preview_img" src='${path}/resources/upload/member/profile${ member.user_Pfrename }' alt='my_profile'/>
                </div>
			<input type="file" id="profile_input" name="upFile" value="${member.user_Pf}" > 
		</p>
		<p>
			<label>닉네임</label> 
			<input type="text" name="user_Nic" value="${ member.user_Nic }"> 
		</p>
		<p>
			<label>전화번호</label> 
			<input type="text" name="user_Phone" value="${ member.user_Phone }"> 
		</p>
		<p>
			<button type="submit">회원정보 변경</button>
		</p>
	</form>
			<input type="button" value="비밀번호 변경" onclick="popupPw();">

<script>
	
	//이미지 미리보기
	function readURL(input){
		if(input.files && input.files[0]){
			let reader = new FileReader();
			
			reader.onload=function(e){
				$("#image_section").attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행
	$("#profile_input").change(function(){
		readURL(this);
	});
	
	//비밀번호 변경 팝업
	function popupPw(){
        var url = "${path}/member/updatePw";
        var name = "패스워드 변경";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
	
</script>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>