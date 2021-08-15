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
<link href="${pageContext.request.contextPath }/resources/css/member/signup.css" rel="stylesheet" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="container">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6 signup_box">
			<h3 class="text-center">
				SIGN UP
			</h3>
			<form:form modelAttribute="member" class="signup form" method="post" action="${path}/signup" enctype="multipart/form-data">
		
			<div class="row"> <!-- 아이디 -->
				<div class="col-md-12 user_id">
					<div class="id_input_box">
						<label for="user_id" class="id_label input_label">아이디</label>
		                <form:input path='user_Id' type='text' id='user_id' name='user_Id'/>
		                <div class="signup_guide">5~10자의 영문 대/소문자,숫자만 사용가능합니다.</div>
		                <div id="id_check"><form:errors color="red" path='user_Id' class="user_Id_errors"/><br/></div>	
					</div>
				</div>
			</div><!-- 아이디 끝 -->
			
			<div class="row"> <!-- 비밀번호 1 -->
				<div class="col-md-12 password1">
					<div class="pw_input_box">
						<label for="pw1" class="pw_label input_label">패스워드</label>
						<form:input path='user_Pw' id ='pw1' type='password' name='user_Pw' />
						<div class="signup_guide">6자 이상 숫자, 영 대/소문자, 특수문자(필수)를 사용하세요.</div>
						<form:errors path='user_Pw' class='user_Pw_errors'/><br/>
					</div>
				</div>
			</div> <!--  비밀번호 1 끝 -->
			
			<div class="row"> <!-- 비밀번호 확인 -->
				<div class="col-md-12">
					<div class="pw2_input_box">
						<label for="pw2" class="pw2_label input_label">패스워드 재입력</label>						
						<form:input path='user_Pw2' id ='pw2' type='password' name='user_Pw' />						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h3>
						h3. Lorem ipsum dolor sit amet.
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h3>
						h3. Lorem ipsum dolor sit amet.
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h3>
						h3. Lorem ipsum dolor sit amet.
					</h3>
				</div>
			</div>
				<div class="row"> <!--  프로필사진 -->
				<div class="col-md-12 profile">
					<label for="profile_input" class="profile_input_label">프로필 사진</label>
					<div class="profile_imgbox">
						<div class="profile_view center-block">
                			<img id='image_section' class="preview_img" src='${path }/resources/images/member/profile2.jpg' alt='my_profile'/>
                		</div>
                		<input id="profile_input center-block" class="input_img" type="file" name="upFile"/>
					</div>
				</div>
			</div> <!--프로필사진끝  --> 
			<button type="button" class="btn btn-success">
				Button
			</button>
		</div>
		</form:form>
		<div class="col-md-3">
		</div>
	</div>
</div>

<script>
	
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
					$(".pw2_label").html("패스워드 재입력 <span style ='float:right; color:#03c75a;'>일치합니다 :)</span>");
				}else{
					$("#pw_success").hide();
					$("#pw_fail").show();
					$("#pw_fail").css("color","red");
					$("#submit").attr("disabled","disabled");
					$(".pw2_label").html("패스워드 재입력 <span style ='float:right; color:red'>다시 입력해주세요 :( </span>");
				}
			}
		});
	});
	
	//인증번호 이메일 전송
	let code = "";
	$(".email_check_button").click(function(){
		const email = $(".email_input").val(); //입력이메일
		const checkBox = $(".email_check_input"); // 인증번호 입력란
		const box = $(".email_check_input_box"); //인증번호 입력란 box
		
		$.ajax({
			url:'${pageContext.request.contextPath}/member/mailCheck?email='+email,
		    type:'get',
		    success:function(data){
		    	
		    	console.log(data);
		    	checkBox.attr("disabled",false);
		    	box.attr("id","email_check_input_success");
		    	code = data;		    	
		    }
		});
	});
	//인증번호 비교
	$(".email_check_input").blur(function(){
		const inputCode = $(".email_check_input").val(); //사용자가 입력한 인증번호
		const checkResult =$("#mail_check_input_box_warn"); //비교 결과
		
		if(inputCode==code){ //비교 일치
			checkResult.html("인증번호가 일치합니다 :)");
			checkResult.attr("class","correct");
			$("#submit").removeAttr("disabled");
		}else{ 				//불일치
			checkResult.html("인증번호를 다시 확인해주세요!");
			checkResult.attr("class","incorrect");
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
	
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>