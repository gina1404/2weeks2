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

<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.room} chat_list_box">
		<div type="button" class="chat_list" room="${tmp.room }" other-nick="${tmp.other_nick }">
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_img">
					<a href="other_profile.do?other_nick=${tmp.other_nick}">
					<c:choose>
					<c:when test="${tmp.user_Pfrename ne null}">
						<img src="${pageContext.request.contextPath}/resources/upload/member/profile${tmp.user_Pfrename}" alt="프사"/>
					</c:when>
					<c:when test="${tmp.user_Pfrename eq null }">
						<img src="${pageContext.request.contextPath}/resources/images/member/profile.jpg" alt="프사"/>
					</c:when>
					</c:choose>	
					</a>
				</div>
				
				<!-- 닉네임/최신 보낸시간/최신 내용 -->
				<div class="chat_ib">
						<!-- 닉네임/보낸시간 -->
					<h5>${tmp.other_nick }
						<span class="chat_data">
							<fmt:formatDate value="${tmp.send_time }" pattern="yyyy.MM.dd HH:mm" />							
						</span>
					</h5>
						<!-- 내용 / 읽음처리 -->
					<div class="row">
						<div class="col-md-10">
							<p>${tmp.content }</p>
						</div>
						<!-- 사용자가 안읽은 메세지 갯수가 0보다 클때만 -->
						<c:if test="${tmp.unread>0 }">				
							<div class="col-md-2 unread${tmp.room }">
								<span class="badge bg-danger">${tmp.unread}</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>