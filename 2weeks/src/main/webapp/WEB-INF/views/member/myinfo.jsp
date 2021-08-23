<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/member/myinfo.css" rel="stylesheet" />

<jsp:include page="/WEB-INF/views/common/header2.jsp"/>

<section class="container">
<div class="content">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6 myinfo_box">
			<h3 class="text-center">
				MY INFO
			</h3>
			<form id="myForm" action="${path}/member/myinfo" method="post" enctype="multipart/form-data">
			<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 profile"> <!-- 프로필사진 수정 -->
				<div class="profile_input_box">
					<label for="profile_input" class="profile_input_label">프로필 사진</label>
					<div class="profile_imgbox">				
               			<div><img id='image_section' class="preview_img" src='${path}/resources/upload/member/profile${ member.user_Pfrename }' alt='my_profile'/></div>
               			<div><label class="input-file-button" for="profile_input">Upload</label></div>	                		
                		<input id="profile_input" class="input_img" type="file" name="upFile" />
					</div>
				</div>
			</div><!-- 프로필사진 수정 끝 -->
			<div class="col-md-3"></div>
			</div>
			<div class="row">
			<div class="col-md-12">
				<div class="id_box">
					<label for="id">아이디</label> 
					<input type="text" id="id" name="user_Id" readonly value="${member.user_Id}">
				</div>
			</div>
			</div>
			<div class="row">
			<div class="col-md-12">
				<div class="nic_box">
					<label for="user_Nic">닉네임</label> 
					<input type="text" id="user_Nic" name="user_Nic" value="${ member.user_Nic }">
					<div id="nic_check"></div>
				</div>
			</div>
			</div>
			<div class="row">
			<div class="col-md-12">
				<div class="phone_box">
					<label for="user_Phone">전화번호</label> 
					<input type="text" id="user_Phone" name="user_Phone" value="${ member.user_Phone }"> 
				</div>
			</div>
			</div>
			<div class="info_btn_box">
			<button class="info_button" id="submit" type="submit">회원정보 변경</button>
			<div style="width:20px;"></div>
			<button class="info_button" type="button" onclick="popupPw();">비밀번호 변경</button>
			</div>
		</div> <!--myinfobox 끝  -->
		</form>
		<div class="col-md-3">
		</div>
	</div>
	</div>
</section>







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
        var option = "width = 550, height = 600, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
	
	//닉네임 중복체크
	$("#user_Nic").blur(function(){
		let user_Nic=$('#user_Nic').val();
		console.log(user_Nic);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/nicCheck?user_Nic='+user_Nic,
			type : 'get',
			success: function(data) {
				
				console.log(data);
				//1 = 아이디 중복
				if(data == 1){
					$("#nic_check").text("사용중인 닉네임입니다.");
					$("#nic_check").css("color","red");
					$("#submit").attr("disabled","disabled");
			
				}else{
					$("#nic_check").text("사용 가능한 닉네임입니다.");
					$("#nic_check").css("color","blue");
					$("#submit").removeAttr("disabled");
				}				
				},
			error:function(data){
				console.log("중복확인실패");
			}
			});
		
		});
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>