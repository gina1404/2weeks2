<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 변경</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/member/updatePw.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
			<div class="row"> <div class="col-md-12" style="height:20px"></div></div>
			<form:form modelAttribute="member"  class="updatePw form" method="post" action="${path}/member/findPw">
				
				<div class="update_continaer">
					<h3 class="text-center">비밀번호 변경</h3>
					<div class="update_input_box">
				 	<input type="text" name="user_Email" value="${sessionScope.member.user_Email }" hidden />
				 	<input type="text" id="id" name="user_Id" readonly value="${sessionScope.member.user_Id}">
				 	<input type="password" name="oldPw" placeholder="기존 비밀번호"/><br/>
				 	
				 	
			        <form:input path='user_Pw' id ='pw1' type='password' name='user_Pw' placeholder="변경 비밀번호"/>
			        <div class="signup_guide">6자 이상 숫자,영문,특수문자(필수)를 사용하세요.</div>
			        <form:input path='user_Pw2' id ='pw2' type='password' name='user_Pw2' placeholder="변경 비밀번호 확인"/>
			        <div id="pw_message" style="height:30px;"></div> 
			        
			        <form:errors path='user_Pw' class='user_Pw_errors'/><br/>
			        </div>				
				<button id ='submit' type="submit" class="updatePw_btn center-block">비밀번호 변경하기 </button> 
				</div>			
			</form:form>
		</div>
		<div class="col-md-1">
		</div>		
	</div>

	
<script>
	//비밀번호 확인
	$(function(){
		$("#pw2").keyup(function(){
			const pw1=$("#pw1").val();
			const pw2=$("#pw2").val();
			if(pw1 !="" || pw2 !=""){
				if(pw2 == ''){
					$("#pw_message").html("<div>패스워드 재입력</div>");
				}
				if(pw1 == pw2){
					$("#submit").removeAttr("disabled");
					$("#pw_message").html("<div style ='color:#03c75a;'>일치합니다 :)</div>");
				}else{

					$("#submit").attr("disabled","disabled");
					$("#pw_message").html("<div style ='color:red'>다시 입력해주세요 :( </div>");
				}
			}
		});
	});
	</script>
</body>
</html>