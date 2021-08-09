$('#entryAlert').fadeIn();
setTimeout(()=>{
	$('#entryAlert').fadeOut(2000);
}, 5000); //입장했다고 5초간 띄우기

let sock=new SockJS("http://localhost:9090/spring/chatting");

sock.onopen=e=>{
	console.log(e);
}

sock.onmessage=(e)=>{	
	let msg=JSON.parse(e.data);	
	
	let no=msg['chatGroupNo'];
	let sender=msg['sender'];
	let senderNick=msg['senderNick'];
	let content=msg['chatContent'];
	let time=msg['chatTime'];
	
	if($('#chatGroupNo').val()==no){
				
		if($('#sendBox #sender').val()==sender){ /////자신
			msg="<div id='myBox'>";
			//msg+="<div id='sender'>"+sender+"</div>";
			msg+="<div id='chatContent'>"+content+"</div>";
			msg+="<div id='chatTime'>"+time+"</div></div>";
		}else{ ////////////////////////////////////상대방
			msg="<div id='yourBox'>";
			msg+="<div id='sender'>"+senderNick+"</div>";
			msg+="<div id='chatContent'>"+content+"</div>";
			msg+="<div id='chatTime'>"+time+"</div></div>";		
		}
		$("#chatContainer").append(msg);
	}	
};

sock.onclose=e=>{
	let loginNick=$("#senderNick").val();
	$("#chatContainer").append("-----  "+loginNick+"님이 나갔습니다."+"  -----");		
}

let btn=document.getElementById("sendChat");
btn.addEventListener("click", e=>{
	$("#chat").keypress(function(e){
		if(e.keyCode==13){ //엔터키로 전송하기
			sendMessage();
		}
	});	
	sendMessage();
});

function sendMessage(){
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
    
    let date=today+" "+time;
    
    if($.trim($('#chat').val())===''){
        $('#tempAlert').slideDown();
        setTimeout(()=>{
            $('#tempAlert').slideUp();
        }, 1000);
    }else {
    	function ChatGroupMessage(sender, senderNick, chatGroupNo, chatContent, chatTime){
		    this.sender=sender;
		    this.senderNick=senderNick;
		    this.chatGroupNo=chatGroupNo;
		    this.chatContent=chatContent;
		    this.chatTime=chatTime;
		}	
		  
        let chatMsg=new ChatGroupMessage($('#sendBox #sender').val(), $('#sendBox #senderNick').val(),
        		$('#chatGroupNo').val(), $('#sendBox #chat').val(), date);
               
        sock.send(JSON.stringify(chatMsg));
                
        $("#chat").val('').focus();    
    }
}
