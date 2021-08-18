<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d4b4124527.js" crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="javascript:history.back()" class='back_btn'>👈검색 결과로 </a>
	<div class='type_msg'>
		${recv_nic} 님에게 메세지 보내기.
		<div class='input_msg_write row'>
			<div>
				<input type="hidden" class="other_nick" name="other_nick" value="${recv_nic}"/>
				<input type="hidden" class="room" name="room" value="${room}"/>
				<input type='text' class='write_msg form-control' placeholder='메세지를 입력하세요' />
			</div>
			<div>
				<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>
			 </div>
		</div>
	</div>
	<%-- <div  onclick="location.href='${path}/message/messagelist'">메세지함으로 이동 </div> --%>
	
	
	<script type="text/javascript">
	$('.msg_send_btn').on('click',function(){
		let other_nick = $('.other_nick').val();
		let room =$('.room').val();
	
		//메세지 전송 함수 호출
		SendMessage(room,other_nick);				
	});
	
	
	const SendMessage = function(room, other_nick){
		
		let content = $('.write_msg').val();
		content = content.trim();
		let param ={room:room,other_nick:other_nick,content:content};
		if(content=""){
			alert("메세지를 입력하세요!");
		}else{
			$.ajax({
				url:"${path}/message/message_send_inlist",
				method:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
	
				success:function(data){
					console.log("메세지전송성공");
						//룸번호때문에 새로고침 한번 
					 location.reload();
					alert("메세지를 전송했습니다!");
					 
					 $('.write_msg').val('');
					 
					
					
					 //toastr.info('알림', '메세지를 전송하였습니다.', {timeOut: 5000});
	/* 				
					//메세지 입력칸 비우기
					$('.write_msg').val("");
					//메세지내용 리로드
					MessageContentList(room);
					//메세지 리스트 리로드
					MessageList();
					//console.log(JSON.stringify(param));
					msSocket.send(other_nick); */
					
				},
				error:function(){
					alert('Server Error');
				}
			
			});
		}
	};
	

	
	
	
	</script>


</body>
</html>