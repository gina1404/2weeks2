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
                <input type='password' name='password'placeholder="비밀번호"/><br/>
                <input type='password' name='password2' placeholder="비밀번호 확인"/><br/>
                <input type='text' name='userName' placeholder="이름"/><br/>
                <input type='text' name='nickName' placeholder="닉네임"/><br/>
                성별선택<br/>
                <label><input type="radio" name="gender" value="women">여</label><br/>
                <label><input type="radio" name="gender" value="men">남</label><br/>
                <input type='tel' name='phone' placeholder="전화번호"/><br/>
                <input type='email' name='email' placeholder="이메일"/><button>인증</button><br/>
                <input type="text" name ='emailauth'placeholder='이메일인증번호'/><button>확인</button><br/>
                <button type="submit">회원가입하기 </button>
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
			
				}else{
					$("#id_check").text("사용 가능한 아이디입니다.");
					$("#id_check").css("color","blue");
				}				
				},
			error:function(){
				console.log("중복확인실패");
			}
			});
		
		});
</script>
</body>
</html>