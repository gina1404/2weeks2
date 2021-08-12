<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<style>
	img{
		width:20px;
 		height:20px;
 		border-radius:100px;
	}
</style>

<c:forEach var="tmp" items="${clist }">
	<c:choose>
		<c:when test="${sessionScope.member.user_Nic ne tmp.send_nic }">
			
			<!-- 받은메세지 -->
			<div class="incoming_msg">
				<div class="incoming_msg_img">
						<a href="other_profile.do?other_nick=${tmp.send_nic }">
							<img src="${pageContext.request.contextPath}/resources/upload/member/profile${tmp.user_Pfrename}" alt="프사"/>
						</a>				
				</div>
				<div class="received_msg">
					<div class="received_withd_msg">
						<p>받은메세지 : ${tmp.content }</p>
						<span class="time_date"><fmt:formatDate value="${tmp.send_time }" pattern="yyyy.MM.dd HH:mm" /></span>
						
					</div>
				</div>
			
			</div>
		</c:when>
		
		<c:otherwise>
			<!-- 보낸메세지 -->
			<div class="outgoing_msg">
				<div class="sent_msg">
					<p>보낸메세지 : ${tmp.content }</p>
					<span class="time_date"> <fmt:formatDate value="${tmp.send_time }" pattern="yyyy.MM.dd HH:mm" /></span>
				</div>
			</div>	
		</c:otherwise>

	</c:choose>

</c:forEach>