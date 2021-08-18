<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
</body>
</html>