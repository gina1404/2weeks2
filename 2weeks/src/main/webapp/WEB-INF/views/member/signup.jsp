<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="signup">   
        <div class="signup">
            회원가입 테스트
            <form action="" class="signup__form">
                프로필 사진 <button>등록</button><br/>
                <input type='text' id='user_id' name='userId' placeholder="아이디"/><br/>
                <div id="id_check"></div>
                <input id ='pw1' type='password' name='password'placeholder="비밀번호"/><br/>
                <input id ='pw2' type='password' name='password2' placeholder="비밀번호 확인"/><br/>
                <div id="pw_success">비밀번호가 일치합니다.</div> 
                <div id="pw_fail">비밀번호가 일치하지 않습니다.</div>
                <input type='text' name='userName' placeholder="이름"/><br/>
                <input type='text' name='nickName' placeholder="닉네임"/><br/>
                성별선택<br/>
                <label><input type="radio" name="gender" value="women">여</label><br/>
                <label><input type="radio" name="gender" value="men">남</label><br/>
                <input type='tel' name='phone' placeholder="전화번호"/><br/>
               <div class="email_box">
               	<div class="email_input_box">               	
                	<input class="email_input" type='email' name='email' placeholder="이메일"/>
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
            </form>
        </div>
    </section>

<script>
	
	//아이디 중복체크
	$("#user_id").blur(function(){
		const user_id=$('#user_id').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?userId='+user_id,
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
	
</script>
</body>
</html>