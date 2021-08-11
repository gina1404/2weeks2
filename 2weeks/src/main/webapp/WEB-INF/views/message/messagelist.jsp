<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/d4b4124527.js" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> -->


<style>
.col-md-6{
 height:700px;
}
.incoming_msg{


text-align: left;
background-color:#63CC63;
border-radius :10px;
}
.outgoing_msg{
text-align: right ;

background-color:#dcdcdc;
border-radius:10px;
}


</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div id ="msg-container" class="container" style="border:1px solid black;">

			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-4" style="border:1px solid black;">
					
						<h4>메세지</h4> <input type="text" class="search-bar" placeholder="닉네임">
						<button onclick="openSearch()">🔍</button>
						
					<div class="row">
						<div class="col-md-12 inbox_chat">
							<!-- //메세지리스트 -->					
						</div>	
					</div>
			
				</div>
				<div class="col-md-6" style="border:1px solid black;">
					<div class="msg_history row" name="contentList">
						메세지내용
						<!-- <div class="col-md-6">
						</div>
						<div class="col-md-6">
						</div> -->
					</div>
					<div class="row">
						<div class="col-md-12 send_message">
											
						</div>
					</div>								
				</div>
				<div class="col-md-1"></div>
			 </div>
</div>
<script>



//메세지 리스트 
	const FirstMessageList = function(){
		$.ajax({
			url:"${path}/message/message_ajax_list",
			method:"get",
			data:{},
			success:function(data){
				console.log("메세지리스트 성공");
				$('.inbox_chat').html(data);
				
				//메세지 리스트중 하나의 메세지를 클릭
				$('.chat_list').on('click',function(){
					//alert('other-nick: '+$(this).attr('other-nick'));
					
					let room=$(this).attr('room');
					let other_nick = $(this).attr("other-nick");
					console.log(room);
					console.log(other_nick);
					
				//선택한 메세지 빼고 나머지 active효과 해제
				$('chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
				//선택한 메세지만 active효과
				$('chat_list_box'+room).addClass('active_chat');
				
				let send_msg="";
				send_msg += "<div class='type_msg'>";
				send_msg += " <div class='input_msg_write row'>";
				send_msg += "  <div class='col-md-10'>";
				send_msg += "    <input type='text' class='write_msg form-control' placeholder='메세지를 입력하세요' />";
				send_msg += "  </div>";
				send_msg += "  <div class='col-md-2' >"; 
				send_msg += "     <button class='msg_send_btn' type='button'><i class='far fa-paper-plane' aria-hidden='true'></i></button>";
				send_msg += "   </div>";
				send_msg += " </div>";
				send_msg += "</div>";
				
				//메세지 입력, 전송 칸을 보인다.
				$('.send_message').html(send_msg);
				
				//메세지 전송버튼을 눌렀을 때
				$('.msg_send_btn').on('click',function(){
					//메세지 전송 함수 호출
					SendMessage(room,other_nick);
					
				});
					//메세지 내용 불러오는 함수호출
					MessageContentList(room);
				//setInterval(MessageContentList(room), 1000);
				//getInfiniteChat(room);
					
				});
				
			}
		})
	};
	
	//메세지를 다시 가져옴
	const MessageList =function(){
		$.ajax({
			url:"${path}/message/message_ajax_list",
			method:"get",
			data:{},
			success:function(data){
				console.log("메세지 리스트 리로드");
				
				$('.inbox_chat').html(data);
				
				//메세지 리스트중 하나를 클릭
				$('.chat_list').on('click',function(){
					let room=$(this).attr('room');
					let other_nick =$(this).attr('other-nick');
					
					//선택한 메세지 빼고 나머지 active효과 해제
					$('chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
					//선택한 메세지만 active효과
					$('chat_list_box'+room).addClass('active_chat');
					
					let send_msg="";
					send_msg += "<div class='type_msg'>";
					send_msg += " <div class='input_msg_write row'>";
					send_msg += "  <div>";
					send_msg += "    <input type='text' class='write_msg form-control' placeholder='메세지를 입력하세요' />";
					send_msg += "  </div>";
					send_msg += "  <div>";
					send_msg += "     <button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					send_msg += "   </div>";
					send_msg += " </div>";
					send_msg += "</div>";
					
					//메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					//메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						//메세지 전송 함수 호출

						SendMessage(room,other_nick);
						
					});
					
					//메세지 내용을 호출
					MessageContentList(room);
					//setInterval(MessageContentList(room), 1000);
					//getInfiniteChat(room);
				});
				
				$('.chat_list_box:first').addClass('active_chat');
			}
		
		})	
	};
	
	//메세지 내용
	//읽지않은 메세지들은 읽음으로 바꿈
	const MessageContentList = function(room){
		
		$.ajax({
			url:"${path}/message/message_content_list",
			method:"GET",
			data:{
				room:room,
				},
			success:function(data){
				console.log("메세지 내용가져오기");
				
				//메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				
				//메세지 내용을 가져올때마다 스크롤을 맨아래로
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
				
			},
			error:function(){
				alert('Server Error');
			}
				
		})
		$('.unread'+room).empty();
		
	};
	
	//메세지 전송
	const SendMessage = function(room, other_nick){
		console.log("메세지전송함수 호출");
		let content = $('.write_msg').val();
		console.log(content);
		content = content.trim();
		console.log(content);
		let param ={room:room,other_nick:other_nick,content:content};
		//console.log(JSON.stringify(param));
		if(content=""){
			alert("메세지를 입력하세요!");
		}else{
			$.ajax({
				url:"${path}/message/message_send_inlist",
				method:"post",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify(param),
				//data:JSON.stringify(param),
					//room : room,
					//other_nick: other_nick,
					//content: content
					
				
				success:function(data){
					console.log("메세지전송성공");
					//메세지 입력칸 비우기
					$('.write_msg').val("");
					//메세지내용 리로드
					MessageContentList(room);
					//메세지 리스트 리로드
					MessageList();
					//console.log(JSON.stringify(param));
					msSocket.send(other_nick);
					
				},
				error:function(){
					alert('Server Error');
				}
			
			});
		}
	};
	
	$(document).ready(function(){
		//메세지 리스트 리로드
		FirstMessageList();
		
	});
	
	//
	function openSearch() {
		let user_Nic = $('.search-bar').val();
		console.log(user_Nic);
        var url = "${path}/message/searchNic?user_Nic="+user_Nic;
        var name = "닉네임 검색";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
        window.open(url, name, option);
		
	}	
/* 	function getInfiniteChat(room){
		setInterval(function(){
			MessageContentList(room);
		},3000);		
	} */
	
	////////////////////////////
/* var msSocket=null;

	  $(document).ready(function (){
		   connectWs();
	   });
	   
	   function connectWs(){
	   	msSock =new SockJS("http://localhost:9090${pageContext.request.contextPath}/messageServer");
	   	msSocket= msSock;
	   	console.log("connectWs");
	   	
	   	msSock.onopen = function(){
	   	console.log("opopen " );
	   };
	   
	   msSock.onmessage = function(evt){
			var data = evt.data;
			console.log("recvMsg" +data);
			messageToast();
			
			
			//$.toast('새로운 메세지가 도착했습니다');
	   };
	   msSock.onclose = function(){
	   	console.log("onclose");
	   };
	   
	   msSock.onerror = function(err){console.log("error",err);};
		
		}
	   
	   function messageToast(){
		   toastr.info('알림', '새로운 메세지가 도착했습니다.', {timeOut: 5000});

	   } */
  
	   

	</script>


<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>