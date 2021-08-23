<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->

<link href="${pageContext.request.contextPath }/resources/css/member/login.css" rel="stylesheet" />
<jsp:include page="/WEB-INF/views/common/header2.jsp"/>

<style>

</style>

<section class="container">

<div class="content">
	<div class="content2">
	<div class="row">
		<div class="col-md-3">
		</div>
		<!--로그인 컨테이너  -->
		<div class="col-md-6 login_box">
			
			<h3 class="text-center">
				USER LOGIN
			</h3>
			
			<form:form role='form' modelAttribute='login' action='${path}/member/login' method='post' >
			<div class="row">
				<div class="col-md-12">
					
					<form:input path='user_Id' type='text' name='user_Id' placeholder=" 🔑 Enter User_Id"  class="input_login center-block"/>
					<form:errors path='user_Id' class="center-block"/>
					
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form:input path='user_Pw' type='password' name='user_Pw' placeholder=" 🔐 Enter Password" class="input_login center-block"/>
					<form:errors path='user_Pw' class="center-block"/>
				</div>
			</div>
			<div class="row">
			<div class= "col-md-12 remember_find">
				<div class="remember_box form-check form-switch">		
						<form:checkbox id="flexSwitchCheckDefault"  class="form-check-input" path="rememberId" name="rememberId"/> 
						<label for="flexSwitchCheckDefault" class="form-check-label">Remember me</label>
				</div>
				<div class="find_box">
					<div class="find_click" onclick ="location.href='${path }/member/findid'">forgot Password?</div>
					<%-- <a href="${path }/member/findid">아이디/패스워드 찾기</a> --%>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-md-12 login_btn"> <!-- 로그인버튼/카카오로그인 -->
					<div class="tweeks_login">
					<button class="tweeks_loginBtn" type="sumbit">LOGIN</button>
					</div>
						
					<div class="kakao_login">
						<a href="https://kauth.kakao.com/oauth/authorize
						?response_type=code
						&client_id=7b4b21f6e600d0bd834e6900c63c7084
						&redirect_uri=http://localhost:9090/spring/member/kakaoLogin">
						<img src="${path}/resources/images/member/kakao_login_medium.png" />
						</a>
					</div>
				</div>
			</div>		<!-- 로그인버튼/카카오로그인 끝 -->
			</form:form>
 			<p class="Text-center">Not a member?</p>
			<button class= "center-block signup_btn" type="button" onclick="location.assign('${path}/signup');">create account</button>
			</div>
			<!--로그인 컨테이너 끝  -->
		
		<div class="col-md-3">
		</div>
	</div>
	</div>
	</div>

</section> <!--전체 컨테이너 끝  -->






<jsp:include page="/WEB-INF/views/common/footer.jsp"/>