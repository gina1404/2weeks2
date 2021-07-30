<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


	<section id="signup" class="container">   
        <div class="signup">
            <h3>회원가입(기능구현중)</h3><br/>
            <form:form modelAttribute="member" class="signup form" method="post" action="${path}/signup" enctype="multipart/form-data">
            <div class="profile">   
                <div class="profile_view">
                	<img id='image_section' class="preview_img" src='${path }/resources/images/member/profile2.jpg' alt='my_profile'/>
                </div>
                프로필 사진<input id="profile_input" type="file" name="upFile"/>
                		<%-- <form:errors path='user_Pf'/> --%>
                </div>
                
                <form:input path='user_Id' type='text' id='user_id' name='user_Id' placeholder="아이디"/>
                <p>5~10자의 영문 대/소문자,숫자만 사용가능합니다.</p>
                <form:errors color="red" path='user_Id' class="user_Id_errors"/><br/>
                <div id="id_check"></div>
               
                <form:input path='user_Pw' id ='pw1' type='password' name='user_Pw' placeholder="비밀번호"/><br/>
                <p>6자 이상 숫자, 영 대/소문자, 특수문자(필수)를 사용하세요.</p>
                <form:input path='user_Pw2' id ='pw2' type='password' name='user_Pw' placeholder="비밀번호 확인"/><br/>
                <div id="pw_success">비밀번호가 일치합니다.</div> 
                <div id="pw_fail">비밀번호가 일치하지 않습니다.</div>
                <form:errors path='user_Pw' class='user_Pw_errors'/><br/>
                <form:input path='user_Nm' type='text' name='user_Nm' placeholder="이름"/><br/>
                <form:errors path='user_Nm' class='user_Nm_errors'/><br/>
                <form:input path='user_Nic'  type='text' name='user_Nic' placeholder="닉네임"/><br/>
                <form:errors path='user_Nic' class='user_Nic_errors'/>
                성별선택<br/>
                <label><input type="radio" name="user_Gender" value="women"/>여</label><br/>
                <label><input type="radio" name="user_Gender" value="men"/>남</label><br/>
                
                <form:input path='user_Phone' type='tel' name='user_Phone' placeholder="전화번호"/><br/>
                <form:errors path='user_Phone' class='user_Phone_errors'/>
               <div class="email_box">
               	<div class="email_input_box">               	
                	<form:input path='user_Email' class="email_input" type='email' name='user_Email' placeholder="이메일"/>
                	<button type="button" class="email_check_button">인증번호 전송</button>
                </div>
<!--            <div class="email_check_button">
                	<span>인증번호 전송</span>
                </div> -->
                <div class="email_check_input_box" id="email_check_input_fail">
                	<input class ="email_check_input" type="text" name ='emailcheck 'placeholder='인증번호를 입력해주세요' disabled="disabled"/>
                </div>
                <div class="clearfix"></div>
                    <span id="mail_check_input_box_warn"></span>
                </div>
               </div>
                <button id ='submit' type="submit">회원가입하기 </button>
            </form:form>
        </div>
    </section>

<script>
	
	//아이디 중복체크
	$("#user_id").blur(function(){
		const user_id=$('#user_id').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?user_Id='+user_id,
			type : 'get',
			success: function(data) {
				console.log(data);
				//1 = 아이디 중복
				if(data==1){
					$("#id_check").text("사용중인 아이디입니다.");
					$("#id_check").css("color","red");
					$("#submit").attr("disabled","disabled");
			
				}else{
					$("#id_check").text("사용 가능한 아이디입니다.");
					$("#id_check").css("color","blue");
					$("#submit").removeAttr("disabled");
				}				
				},
			error:function(){
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
				if(pw1 == pw2){
					$("#pw_success").show();
					$("#pw_fail").hide();
					$("#pw_success").css("color","blue");
					$("#submit").removeAttr("disabled");
				}else{
					$("#pw_success").hide();
					$("#pw_fail").show();
					$("#pw_fail").css("color","red");
					$("#submit").attr("disabled","disabled");
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
		}else{ 				//불일치
			checkResult.html("인증번호를 다시 확인해주세요!");
			checkResult.attr("class","incorrect");
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
