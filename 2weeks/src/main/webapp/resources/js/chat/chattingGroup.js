$(document).ready(function(){
	$("#sendChat").click(function(){
		if($.trim($('#chat').val())===''){
        $('#tempAlert').slideDown();
        setTimeout(()=>{
            $('#tempAlert').slideUp();
        }, 1000);
    }else {
    	console.log($("#chat").val());
		sendMessage();
		//sendMessage(chat);
	}
	});
});

let sock=new SockJS("http://localhost:9090${path}/chatting");
sock.onmessage=onMessage;

//sock.onclose=onClose;

function ChatGroupMessage(sender, chatGroupNo, chatContent, chatTime){
    this.sender=sender;
    this.chatGroupNo=chatGroupNo;
    this.chatContent=chatContent;
    this.chatTime=chatTime;
}

function sendMessage(){
	//sock.send($("#chat").val()+"<br />");
	let chatMsg=new ChatGroupMessage($('#sender').val(), $('#chatGroupNo').val(), $('#sendBox #chat').val(), date);
	console.log(chatMsg);
	sock.send(JSON.stringify(sendMsg));
}

function onMessage(evt){
	let data=evt.data;
	console.log(data);
	$("#chatContainer").append(data);
}

//function onClose(evt){
//	$("#chatContainer").append("Connection Closed!");
//}