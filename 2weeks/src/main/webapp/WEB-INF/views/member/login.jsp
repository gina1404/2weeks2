<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="container">
	<div class="member_login">
		로그인페이지
		<form action='${path}/member/login' method='post' >
			<input type='text' name='user_Id' placeholder="아이디"/>
			<input type='password' name='user_Pw' placeholder="비밀번호" />
			<button type="sumbit">로그인</button>
		</form>
	<br/>
	</div>
	<div class="kakao_login">
		카카오 로그인<br/>
		<a href="https://kauth.kakao.com/oauth/authorize
		?response_type=code
		&client_id=7b4b21f6e600d0bd834e6900c63c7084
		&redirect_uri=http://localhost:9090/spring/member/kakaoLogin">
		<img src="${path}/resources/images/member/kakao_login_medium.png" />
		</a>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>