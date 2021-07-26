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
                <input type='email' name='email' placeholder="이메일"/><button>인증</button><br/>
                <input type="text" name ='emailauth'placeholder='이메일인증번호'/><button>확인</button><br/>
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
	
</script>
</body>
</html>