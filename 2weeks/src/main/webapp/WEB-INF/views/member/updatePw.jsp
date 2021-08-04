<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 변경</title>
</head>
<body>
	 <form:form modelAttribute="member"  class="updatePw form" method="post" action="${path}/member/findPw">
	 	<input type="text" name="user_Email" value="${sessionScope.member.user_Email }" hidden />
	 	<input type="text" id="id" name="user_Id" readonly value="${sessionScope.member.user_Id}"><br/>
	 	<input type="password" name="oldPw" placeholder="기존 비밀번호"/><br/>
	 	
	 	<p>6자 이상 숫자, 영 대/소문자, 특수문자(필수)를 사용하세요.</p>
        <form:input path='user_Pw' id ='pw1' type='password' name='user_Pw' placeholder="변경 비밀번호"/><br/>
        <form:input path='user_Pw2' id ='pw2' type='password' name='user_Pw2' placeholder="변경 비밀번호 확인"/><br/>
        <div id="pw_success">비밀번호가 일치합니다.</div> 
        <div id="pw_fail">비밀번호가 일치하지 않습니다.</div>
        <form:errors path='user_Pw' class='user_Pw_errors'/><br/>
        <button id ='submit' type="submit">비밀번호 변경하기 </button> 
	</form:form>
	
	<script>
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