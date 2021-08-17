<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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

</body>
</html>