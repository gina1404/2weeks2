<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/css/chat/chatting.css?after" rel="stylesheet" />
<c:set var="curCnt" value="${curCnt} " />

<section class="container">
	<h3>오픈채팅</h3>
	
	<div id="chatContainer">
		<div id="addGroupBtn">
			<a id="addRoomBtn" onclick="open('${path}/addChatRoom ', '_blank', 'width=400, height=550, resizable=no')">채팅방 만들기</a>
		</div>		
		<div id="groupList" class="ui relaxed divided list">			
			<c:forEach var="l" items="${list }" varStatus="status">
				<div class="item">
					<i class="large github middle aligned icon"></i>
					<div id="entry" class="content">
						<a class="header" id="entry_a" onclick="open('${path}/chatting?no=${l.groupNo} ', '_blank', 'width=400, height=600, resizable=no')">
							<%-- <div id="chatTitle">${l.title }</div> --%>
							${l.title }
						</a>	
						<div id="group" class="description">
							<div id="cntLimit">${curCnt } / ${l.cnt }명</div>
							<div id="chatContent">${l.content }</div>
						</div>
					</div>
				</div>				
			</c:forEach>			
		</div>
	</div>
</section>

<script>
	let rootPath="${pageContext.request.contextPath}";
		
	const check="${check}";	
	if(check){
		alert(check);
		console.log(check);
	}		
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>