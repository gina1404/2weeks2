<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/chatting.css" rel="stylesheet" />
<c:set var="path" value="${pageContext.request.contextPath }"/>

<section class="container">
	<h3>오픈채팅</h3>
	
	<button id="addGroupBtn">채팅방 만들기</button>
	<div id="addGroup" style="display:none;">
		<table id="addBox">
			<tr>
				<th>방 제목</th>
				<td>
					<input type="text" id="title" placeholder="최대 20자">
					<input type="hidden" value="" id="maker">
				</td>				
			</tr>
			<tr>
				<th>최대 인원</th>				
				<td><input type="number" id="limit" value="2" min="2" max="30" placeholder="최대 30명">명</td>						
			</tr>
			<tr>
				<th>대화 주제</th>
				<td><textarea id="content" placeholder="최대 50자"></textarea></td>	
			</tr>
			<tr>
				<td colspan="2"><button id="addBtn">생성</button></td>
			</tr>
		</table>		
	</div>	
	
	<div id="groupList">
		<c:forEach var="l" items="${list }" varStatus="status">
			<div id="group">					
				<div id="chatTitle">${l.title }</div>
				<div id="cntLimit">0/${l.cnt }명</div>
				<div id="chatContent">${l.content }</div>
			</div>
			<div id="entry">
				<a href="${path }/chat/group${l.groupNo}">입장</a>
			</div>
			<hr>				
		</c:forEach>			
	</div>	
	
	<div id="sendBox" style="display:none;">
		<input type="text" id="chat">
		<button id="sendChat">전송</button>
	</div>	
	
	<div id="chatContainer"></div>
</section>

<script>
	let rootPath="${pageContext.request.contextPath}";
		
	const check="${check}";	
	if(check){
		alert(check);
		console.log(check);
	}	
	
	let sock=new SockJS("http://localhost:9090${pageContext.request.contextPath}/chatting");
	sock.onopen=e=>{
		console.log(e);
	}
	sock.onmessage=e=>{
		console.log(e);
	}
	sock.onclose=e=>{
		
	}
	
	let btn=document.getElementById("sendChat");
	btn.addEventListener("click", e=>{
		const msg=document.getElementById("chat").value;
		sock.send(msg);
	});
</script>

<script src="<c:url value='/resources/js/chatting.js' />"></script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>