<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/member/signup.css" rel="stylesheet" />

<jsp:include page="/WEB-INF/views/common/header2.jsp"/>

<section class="container">

<div class="content">
<%--  <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/> --%>
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6 signup_box">
			<h3 class="text-center">
				SIGN UP
			</h3>
			<form:form modelAttribute="member" class="signup form" method="post" action="${path}/signup" enctype="multipart/form-data">
			<div class="row"><!--  프로필사진 -->
			 <div class="col-md-3">
				</div>
				<div class="col-md-6 profile">
					<div class="profile_input_box">
						<label for="profile_input" class="profile_input_label">프로필 사진</label>
						<div class="profile_imgbox">
							
                			<div><img id='image_section' class="preview_img" src='${path }/resources/images/member/profile3.jpg' alt='my_profile'/></div>
                			<div><label class="input-file-button" for="profile_input">Upload</label></div>	                		
	                		<input id="profile_input" class="input_img" type="file" name="upFile" />
						</div>
					</div>
				</div>
				<div class="col-md-3">
				</div>
			</div> <!--프로필사진끝  --> 
			
			<div class="row"> <!-- 아이디 -->
				<div class="col-md-12 user_id">
					<div class="id_input_box">
						<label for="user_id" class="id_label input_label">아이디</label>
		                <form:input path='user_Id' type='text' id='user_id' name='user_Id'/>
		                <div class="signup_guide">5~10자의 영문 대/소문자,숫자만 사용가능합니다.</div>
		                <div id="id_check"><form:errors color="red" path='user_Id' class="errors_message"/></div>	
					</div>
				</div>
			</div><!-- 아이디 끝 -->
			
			<div class="row"> <!-- 비밀번호 1 -->
				<div class="col-md-12 password1">
					<div class="pw_input_box">
						<label for="pw1" class="pw_label input_label">패스워드</label>
						<form:input path='user_Pw' id ='pw1' class="password1" type='password' name='user_Pw' /><span class="eye">👀</span>
						<div class="signup_guide">6자 이상 숫자,영문,특수문자(필수)를 사용하세요.</div>
						<form:errors path='user_Pw' class='errors_message'/>
					</div>
				</div>
			</div> <!--  비밀번호 1 끝 -->
			
			<div class="row"> <!-- 비밀번호 확인 -->
				<div class="col-md-12">
					<div class="pw2_input_box">
						<label for="pw2" class="pw2_label input_label">패스워드 재입력</label>						
						<form:input path='user_Pw2' id ='pw2' class="password2" type='password' name='user_Pw' />						
					</div>
				</div>
			</div>
			<div class="row"><!-- 이름 -->
				<div class="col-md-12">
					<div class="nm_input_box">
						<label for="user_Nm" class="nm_label input_label">이름</label>
		                <form:input path='user_Nm' id="user_Nm" type='text' name='user_Nm' />
	                	<form:errors path='user_Nm' class='errors_message'/>
					</div>
				</div>
			</div> <!-- 이름 끝-->
			
			<div class="row"><!-- 닉네임 -->
				<div class="col-md-12">
					<div class="nic_input_box">
						<label for="user_Nic" class="nm_label input_label">닉네임</label>
	                	<form:input path='user_Nic'  type='text' name='user_Nic' id="user_Nic"/>              		
                		<div id="nic_check"><form:errors path='user_Nic' class='errors_message'/></div>
					</div>
				</div>
			</div> <!-- 닉네임 끝 -->
			
<%-- 			<div class="row"><!-- 성별 -->
				<div class="col-md-12">
					<div class="gender_input box">
						<div class="form-check form-check-inline">
							<form:input path="user_Gender" id="gender_unck" class="form-check-input" type="radio" name="user_Gender" value="unchecked"/>
							<label class="form-check-label" for="gender_unck">선택안함</label>
						</div>
						<div class="form-check form-check-inline">	
							<form:input path="user_Gender" id="gender_women" class="form-check-input" type="radio" name="user_Gender" value="women"/>
							<label class="form-check-label" for="gender_women">여자</label>
						</div>
						<div class="form-check form-check-inline">		
							<form:input path="user_Gender" id="gender_men" class="form-check-input" type="radio" name="user_Gender" value="men"/>
							<label class="form-check-label" for="gender_men">남자</label>
						</div>
					</div>
				</div>
			</div> --%>
			<div class="row"> <!-- 폰번호입력 -->
				<div class="col-md-12">
					<div class="phone_input_box">
						<label for="user_Phone" class="phone_label input_label">전화번호</label>
			          	<form:input id="user_Phone" path="user_Phone" type="text" name="user_Phone" />
	                	<form:errors path="user_Phone" class="errors_message"/>
					</div>
				</div>
			</div>
			
			<div class="row"> <!-- 이메일입력 -->
				<div class="col-md-12">
					<div class="email_input_box">
						<label for="user_Email" class="phone_label input_label">본인 확인 이메일</label>
						<form:input path='user_Email' id="user_Email" class="email_input" type='email' name='user_Email' />
						<form:errors path="user_Email" class="errors_message"/>
							
					</div>
					
				 	<div class="email_check_input_box" id="email_check_input_fail">
                			<!-- <input class ="email_check_input" type="text" name ='emailcheck 'placeholder='인증번호를 입력해주세요' /> -->
                			<div class="email_check_message"></div>
            		</div>
            		
            		<div class="email_btn_box">           					
            			<button type="button" class="email_check_button">인증번호 전송</button>			
            		</div>
		
				</div>
			</div><!-- 이메일 끝 -->
			
			
			
			<button id="submit" type="submit" class="signup_btn center-block">
				SUBMIT
			</button>
			
		</div>
		</form:form>
		<div class="col-md-3">
		</div>
	</div>
	</div>
	
</section>

<script>
let emailCheck = $(".email_validation_button").text();
if(emailCheck="인증번호 확인"){
	$("#submit").attr("disabled","disabled");
}
	
	
	//아이디 중복체크
	$("#user_id").blur(function(){
		let user_id=$('#user_id').val();
		console.log(user_id);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?user_Id='+user_id,
			type : 'get',
			success: function(data) {
				
				console.log(data);
				//1 = 아이디 중복
				if(data == 1){
					$("#id_check").text("사용중인 아이디입니다.");
					$("#id_check").css("color","red");
					$("#submit").attr("disabled","disabled");
			
				}else{
					$("#id_check").text("사용 가능한 아이디입니다.");
					$("#id_check").css("color","blue");
					$("#submit").removeAttr("disabled");
				}				
				},
			error:function(data){
				console.log("중복확인실패");
			}
			});
		
		});
	
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
	
	//비밀번호 확인
	$(function(){
		$("#pw_success").hide();
		$("#pw_fail").hide();
		$("#pw2").keyup(function(){
			const pw1=$("#pw1").val();
			const pw2=$("#pw2").val();
			if(pw1 !="" || pw2 !=""){
				if(pw2 == ''){
					$(".pw2_label").html("<div>패스워드 재입력</div>");
				}
				if(pw1 == pw2){
					$("#pw_success").show();
					$("#pw_fail").hide();
					$("#pw_success").css("color","blue");
					$("#submit").removeAttr("disabled");
					$(".pw2_label").html("<span style ='float:right; color:#03c75a;'>일치합니다 :)</span>");
				}else{
					$("#pw_success").hide();
					$("#pw_fail").show();
					$("#pw_fail").css("color","red");
					$("#submit").attr("disabled","disabled");
					$(".pw2_label").html("<span style ='float:right; color:red'>다시 입력해주세요 :( </span>");
				}
			}
		});
	});
	
	//인증번호 이메일 전송
	let code = "";
	$(".email_check_button").click(function(){
		let text = $(".email_check_button").text();
		$("button").remove(".email_check_button");
		const email = $(".email_input").val(); //입력이메일
		const checkBox = $(".email_check_input"); // 인증번호 입력란
		const box = $(".email_check_input_box"); //인증번호 입력란 box
			
			
			$(".email_check_input_box").append("<input class='email_check_input' type='text' name='emailcheck' placeholder='인증번호 입력' />");
			
			$(".email_btn_box").html("<button type='button' class='email_validation_button'>인증번호 확인</button>");
			
			//$("button").remove(".email_check_button");
		
		$.ajax({
			url:'${pageContext.request.contextPath}/member/mailCheck?email='+email,
		    type:'get',
		    success:function(data){
		    	
		    	//console.log(data);
		    	checkBox.attr("disabled",false);
		    	box.attr("id","email_check_input_success");
		    	code = data;		    	
		    }
		});
		
	});
	//인증번호 비교
	$(document).on("click",".email_validation_button",function(){

		let text = $(".email_validation_button").text();
			console.log("발리데이션 버튼 작동확인");
			const inputCode = $(".email_check_input").val(); //사용자가 입력한 인증번호
			//const checkResult =$("#mail_check_input_box_warn"); //비교 결과
			console.log("inputCode"+inputCode);
			console.log("code"+code)
			if(inputCode==code){ //비교 일치
				//checkResult.html("인증번호가 일치합니다 :)");
				//checkResult.attr("class","correct");
				console.log("코드일치");
				$(".email_check_message").html("<div style='color:#03c75a;' class='check_success'>인증번호가 일치합니다 :) </div>");
				$("button").remove(".email_validation_button");	
				$("#submit").removeAttr("disabled");
			}else{ 				//불일치
				console.log("불일치");
				//checkResult.html("인증번호를 다시 확인해주세요!");
				//checkResult.attr("class","incorrect");
				$(".email_check_message").html("<div style='color:red' class='check_success'>인증번호가 불일치합니다 :( </div>");
				$("#submit").attr("disabled","disabled");
			}

		
	});
	
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
	
	//패스워드 숫자형식
	$(document).ready(function(){
		$('.eye').on('click',function(){
			$('.password1').toggleClass('active');
			if($('.password1').hasClass('active')){
				$(this).text('😎').prev('.password1').attr('type',"text");
				$('.password2').attr('type',"text");
			}else{
				$(this).text('👀').prev('.password1').attr('type','password');
				$('.password2').attr('type',"password");
			}
		});
	});
	
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>