<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<<<<<<< HEAD
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/footer.css">
	
		<footer class="footer">
			<div id="icon">
				<img src="${path }/resources/images/icons/face.png" alt="페이스북아이콘">
				<img src="${path }/resources/images/icons/insta.png" alt="인스타아이콘">
				<img src="${path }/resources/images/icons/twit.png" alt="트위터아이콘">
			</div>
			<p>Copyright © 2021 YooKids Corp. All rights reserved.</p>
    		<address>서울특별시 강남구 강남구 테헤란로14길 6</address>
		</footer>
=======
<c:set var="path" value="${pageContext.request.contextPath }"/>     

		<footer>
			<div class="footer-col">
				<div class="footer-strong">2weeks</div>
				<div>코로나 시대, 새로운 비대면 웹사이트</div>
			</div>
			<div class="footer-col">
				<div>team</div>
				<div>팀원명</div>
			</div>
			<div class="footer-col">
				<div>SERVICE</div>
				<div>SUPPORT</div>
			</div>
			<div class="footer-col">
				<div>ABOUT US</div>
				<div>CONTACT US</div>
			</div>
		</footer>

		<style>
			footer{
				width:100%;
				background-color: #e8e8e8;
				padding:10px;
				margin:0;
				text-align:center;
				align-items:center;
				justify-content: center;
			}
			.footer-col{
				display:inline-block;
				margin-left:25px;
				margin-right:25px;
				font-family: 'Pretendard';
				font-size:13px;
			}
			.footer-strong{
				font-size:20px;
				font-weight:bold;
			}
		</style>

>>>>>>> 6c299bced394f2be5a5515c2c28747bdfd8f6f31
</body>
</html>