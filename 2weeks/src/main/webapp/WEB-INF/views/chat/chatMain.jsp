<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<style>
	header .content{
		padding-left:250px !important;
		margin-top:0;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/css/chat/chatting.css" rel="stylesheet" />

<section class="container" style="display:flex; padding-bottom: 20px;">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content" style="display: inline-block; padding-left: 220px;">
		<h3 id="chatLogo">오픈채팅</h3>
		<div id="addGroupBtn">
			<!-- <a id="addRoomBtn" onclick="open('${path}/addChatRoom ', '_blank', 'width=400, height=550, resizable=no')">채팅방 만들기</a> -->
			<div id="addRoomBtn">채팅방 만들기</div>
		</div>
		<div class="chatContainer c">
			<c:forEach var="l" items="${list }" varStatus="status">
				<div id="chatRoomOne">
					<div id="chatIcon">
						<img src="${path }/resources/images/icons/chat.png" alt="chatIcon"/>
					</div>
					<div id="entry" >
						<div class="entry_a chatName half">
							${l.title }
						</div>					
						<input type="hidden" value="${l.groupNo}">
											
						<div id="cntLimit">${l.curCnt } / ${l.cnt }명</div>
						<div id="chatContent" class="chatCon">${l.content }</div>
					</div>
				</div>
				<hr>	
			</c:forEach>
		</div>
	</div>
</section>

<script>

	document.getElementById("darkBtn").addEventListener("click", () => {	
		const c = document.querySelectorAll(".c");
		for ( var i = 0; i < c.length; i++ ) {
    		c[i].classList.toggle("chatContainer");
			c[i].classList.toggle("cc");
  		}
		const entry=document.querySelectorAll(".chatName");
		for( var i=0; i<entry.length; i++){
			entry[i].classList.toggle("entry_a");
			entry[i].classList.toggle("ct");
		}
		const chat=document.querySelectorAll(".chatCon");
		for(var i=0; i<chat.length; i++){
			chat[i].classList.toggle("chatCon");
			chat[i].classList.toggle("cCon");
		}
		
	});

	let rootPath="${pageContext.request.contextPath}";
	
	$("#addRoomBtn").click(function(e){
		let popup=window.open('${path}/addChatRoom ', '_blank', 'width=400, height=550, resizable=no');
		
		popup.addEventListener('beforeunload', function(){
			$(".container #chatContainer").load(rootPath+"/chatting.do .container #chatRoomOne");
		});
	});
	
	$(".chatName").click(function(e){
		let no=$(this).next().val();
		console.log(no);
		
		let popup=window.open('${path }/chatting?no='+no, '_blank', 'width=400, height=600, resizable=no, menubar=no, toolbar=no');

		popup.addEventListener('beforeunload', function(){
			$.ajax({
				url: rootPath+"/deleteChatLog",
				type: "post",
				dataType: "html",
				contentType: "application/json; charset=UTF-8",
				data: {
					"no" : no
				},
				success: function(data){
					//console.log(data);
				}
			});			
		});
	});
	
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>