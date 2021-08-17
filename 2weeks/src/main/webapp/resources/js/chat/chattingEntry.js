function ChatGroupMessage(sender, senderNick, chatGroupNo, chatContent, chatTime, type){
    this.sender=sender;
    this.senderNick=senderNick;
    this.chatGroupNo=chatGroupNo;
    this.chatContent=chatContent;
    this.chatTime=chatTime;
    this.type=type;
}

//날짜 및 시간
function getFormatDate(date){
    let year=date.getFullYear();
    let month=(1+date.getMonth());
    month=month>10 ? month:'0'+month;
    let day=date.getDate();
    day=day>=10?day:'0'+day;
    return year+'-'+month+'-'+day;
}
function getFormatTime(date){
    let hour=date.getHours();
    let minute=date.getMinutes();
    let second=date.getSeconds();
    return hour+":"+minute+":"+second;
}
let today=getFormatDate(new Date());
let time=getFormatTime(new Date());    
const chatDate=today+" "+time;	

$("#chat").keypress(function(e){
	if(e.keyCode==13){ sendMessage(); }
});	
let btn=document.getElementById("sendChat");
btn.addEventListener("click", e=>{ 
	sendMessage(); 
});


//console.log(rootPath);
let sock=new SockJS(rootPath+"/chatting");

sock.onopen=e=>{ sendEnter(); }
sock.onclose=e=>{ sendClose(); }

function sendEnter(){
	let chatMsg=new ChatGroupMessage($('#sendBox #sender').val(), 
									$('#sendBox #senderNick').val(),
					        		$('#chatGroupNo').val(), 
					        		$('#sendBox #chat').val(), 
					        		chatDate, 'ENTER');
    sock.send(JSON.stringify(chatMsg));	
}

function sendClose(){
	// let chatMsg=new ChatGroupMessage($('#sendBox #sender').val(), 
	// 								$('#sendBox #senderNick').val(),
	// 				        		$('#chatGroupNo').val(), 
	// 				        		$('#sendBox #chat').val(), 
	// 				        		chatDate, 'CLOSE');               
	// sock.send(JSON.stringify(chatMsg));		
}

sock.onmessage=(e)=>{	
	let chatMsg;		
	let msg=JSON.parse(e.data);
			
	let no=msg['chatGroupNo'];
	let sender=msg['sender'];
	let nickname=msg['senderNick'];
	let content=msg['chatContent'];
	let time=msg['chatTime'];
	let type=msg['type'];
			
	if($('#chatGroupNo').val()==no){ //해당 채팅방에만 메세지 출력
		if(type=='MSG'){				
			if($('#sendBox #sender').val()==sender){ 	/////자신
				chatMsg="<div id='myBox'>";
				//msg+="<div id='sender'>"+sender+"</div>";
				chatMsg+="<div id='chatContent'>"+content+"</div>";
				chatMsg+="<div id='chatTime'>"+time+"</div></div>";				
			}else{ 							///////////////////상대방
				chatMsg="<div id='yourBox'>";
				chatMsg+="<div id='sender'>"+nickname+"</div>";
				chatMsg+="<div id='chatContent'>"+content+"</div>";
				chatMsg+="<div id='chatTime'>"+time+"</div></div>";				
			}
			$("#chatContainer").append(chatMsg);
			$('#chatContainer').animate({
				scrollTop: $('#chatContainer')[0].scrollHeight
			}, 500);
			
		}else if(type=='ENTER'){			
			chatMsg="<p>"+nickname+"님이 입장했습니다</p>";
			$("#chatContainer #entryAlert").append(chatMsg);
			$('#entryAlert').fadeIn();
			setTimeout(()=>{
				$('#entryAlert').fadeOut(1000);
			}, 3000); //입장했다고 5초간 띄우기
						
		}else if(type=='CLOSE'){
			chatMsg="<p>"+nickname+"님이 나갔습니다</p>";
			$("#chatContainer #entryAlert").append(chatMsg);	
		}
	}	
};

function sendMessage(){
    if($.trim($('#chat').val())===''){
        $('#tempAlert').slideDown();
        setTimeout(()=>{
            $('#tempAlert').slideUp();
        }, 1000);
    }else {		  
        let chatMsg=new ChatGroupMessage($('#sendBox #sender').val(), $('#sendBox #senderNick').val(),
        		$('#chatGroupNo').val(), $('#sendBox #chat').val(), chatDate, "MSG");
               
        sock.send(JSON.stringify(chatMsg));
                
        $("#chat").val('').focus();    
    }
}

