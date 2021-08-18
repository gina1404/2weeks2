<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/footer.css">
	
		<footer class="footer">
			<div class="footer-col">
				<div class="footer-strong">2weeks</div>
				<div>코로나 시대, 새로운 비대면 웹사이트</div>
			</div>
			
			<p>Copyright © 2021 YooKids Corp. All rights reserved.</p>
			<p><b>이진영 김규희 이동욱 이시후 이효형 유인범</b></p>
    		<!-- <address>서울특별시 강남구 강남구 테헤란로14길 6</address> -->
    		
    		<div id="icon">
				<img src="${path }/resources/images/icons/face.png" alt="페이스북아이콘">
				<img src="${path }/resources/images/icons/insta.png" alt="인스타아이콘">
				<img src="${path }/resources/images/icons/twit.png" alt="트위터아이콘">
			</div>
		</footer>

		<%-- <footer>
			
			<div class="footer-col">
				<div class="footer-strong">2weeks</div>
				<div>코로나 시대, 새로운 비대면 웹사이트</div>
			</div>
			<div class="footer-col">
				<div>team</div>
				<div>이진영 김규희 이동욱 이시후 유인범</div>
			</div>
			<div class="footer-col">
				<div>SERVICE</div>
				<div>SUPPORT</div>
			</div>
			<div class="footer-col">
				<div>ABOUT US</div>
				<div>CONTACT US</div>
			</div>
			<div id="icon">
				<img src="${path }/resources/images/icons/face.png" alt="페이스북아이콘">
				<img src="${path }/resources/images/icons/insta.png" alt="인스타아이콘">
				<img src="${path }/resources/images/icons/twit.png" alt="트위터아이콘">
			</div>
		</footer> --%>

</body>
</html>