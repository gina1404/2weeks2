<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 만들기</title>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>

<div id="addGroup" class="row" style="padding: 20px 10px 0 10px; overflow: hidden;">

	<form class="col s12">
		<div class="row">
	        <div class="input-field col s12">
	          <input disabled value="${chatId }" id="disabled" type="text" class="validate">
	          <label for="disabled">생성자</label>
	        </div>
	      </div>
		
		<div class="row">
			<div class="input-field col s12">
				<textarea class="materialize-textarea" placeholder="최대 20자" data-length="20" id="title" ></textarea>
				<label for="title">방 제목</label>
				<input type="hidden" value="" id="maker">
			</div>
		</div>
		
		<div class="row">
			<div class="input-field col s6">
				<input class="validate" id="input_text2" type="text" data-length="2" placeholder="최대 30명">				
				<label for="input_text2">최대 인원</label>
			</div>
		</div>
		
		<div class="row">
			<div class="input-field col s12">
				<textarea id="textarea2" class="materialize-textarea" data-length="50" placeholder="최대 50자"></textarea>
				<label for="textarea2">대화 주제</label>
			</div>
		</div>	
		
		<a class="waves-effect waves-light btn" id="addBtn" style="float:right;">생성</a>
				
	</form>
</div>

<script>
	let rootPath="${pageContext.request.contextPath}";
</script>

<script src="<c:url value='/resources/js/chat/addChatRoom.js' />"></script>

</body>
</html>