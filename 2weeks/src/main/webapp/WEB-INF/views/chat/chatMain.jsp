<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/css/chat/chatting.css?after=" rel="stylesheet" />

<section class="container">
	<h3>오픈채팅</h3>
	<div id="addGroupBtn">
		<a id="addRoomBtn" onclick="open('${path}/addChatRoom ', '_blank', 'width=400, height=550, resizable=no')">채팅방 만들기</a>
	</div>
	<div id="chatContainer">
		<c:forEach var="l" items="${list }" varStatus="status">
			<div id="chatRoomOne">
				<div id="chatIcon">
					<img src="${path }/resources/images/icons/chat.png" alt="chatIcon"/>
				</div>
				<div id="entry" >
					<!-- <a id="entry_a" onclick="openChat()">
						${l.title }
					</a> -->
					<div id="entry_a" class="chatName">
						${l.title }
					</div>					
					<input type="hidden" value="${l.groupNo}">
										
					<div id="cntLimit">${l.curCnt } / ${l.cnt }명</div>
					<div id="chatContent">${l.content }</div>
				</div>
			</div>
			<hr>	
		</c:forEach>
	</div>
</section>

<script>
	let rootPath="${pageContext.request.contextPath}";
	console.log(rootPath);
	
	const check="${check}";	
	if(check){
		alert(check);
		console.log(check);
	}
	
	$(".chatName").click(function(e){
		let no=$(this).next().val();
		console.log(no);
		
		let popup=window.open('${path }/chatting?no='+no, '_blank', 'width=400, height=600, resizable=no, menubar=no, toolbar=no');

		popup.addEventListener('beforeunload', function(){
			console.log("beforeunload함수 시작");
			$.ajax({
				url: rootPath+"/deleteChatLog",
				type: "post",
				dataType: "html",
				contentType: "application/json; charset=UTF-8",
				data: {
					"no" : no
				},
				//data: JSON.stringify({ "no": no }),
				success: function(data){
					console.log(data);
				}
			});
			console.log("beforeunload함수 완료");
		});
	});
	
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>