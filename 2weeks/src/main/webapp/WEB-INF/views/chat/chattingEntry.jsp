<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹채팅방 입장</title>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="${path }/resources/css/chat/groupChatting.css" rel="stylesheet" />

</head>
<body>
	
	<div id="chatContainer">
		<div id="entryAlert"></div>		
	</div>

	<div id="sendBox" class="input-group">
		<input type="hidden" id="sender" value="${loginId}">
		<input type="hidden" id="chatNick" value="${chatName}">         
		<input type="hidden" id="chatGroupNo" value="${no }">    
		<input type="text" id="chat" class="form-control" aria-describedby="basic-addon2" placeholder="채팅을 입력하세요">
		<span class="input-group-addon btn" id="sendChat">전송</span>
	</div>
	
    <div id="tempAlert">
        <p>내용을 입력하세요</p>    
    </div>

</body>

<script>
	const rootPath="${pageContext.request.contextPath }";
</script>

<script type="text/javascript" src="${path }/resources/js/chat/chattingEntry.js"></script>

</html>