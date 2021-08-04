let sock=new SockJS("http://localhost:9090${path}/chattingEntry");

function ChatGroupMessage(sender, chatGroupNo, chatContent){
    this.sender=sender;
    this.chatGroupNo=chatGroupNo;
    this.chatContent=chatContent;
}

sock.onopen=e=>{
	console.log(e);
}
sock.onmessage=e=>{
	console.log(e);
	
    console.log(e.data);
    let data=JSON.parse(e.data);
    console.log('메세지 : ', data['msg']);
    //console.log('샌더 : ', data['sender']);
    
    const time = data['date'].substring(data['date'].indexOf(' ')+1, 
            data['date'].lastIndexOf(':'));
    
    //let msg;
    msg += "<div id='msgBox'>";
    msg += "<span>" + time + "</span><div id='msgText'>" + data['msg'] + "</div>";
    //msg += "</div></div></div>";    
    $("#chatContainer").append($("<h3>")).html(e.data);
}
sock.onclose=e=>{
	
}

let btn=document.getElementById("sendChat");
btn.addEventListener("click", e=>{
	const msg=document.getElementById("chat").value;
	console.log(msg);
	sock.send(msg);
	
    if($.trim($('#chat').val())===''){
        //alert('내용을 입력하세요');
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
    //console.log(today, time);
    
    let date=today+" "+time;

    //let msg=document.getElementById("chat").value;
    if($.trim($('#chat').val())===''){
        $('#tempAlert').slideDown();
        setTimeout(()=>{
            $('#tempAlert').slideUp();
        }, 1000);
    }else {
        console.log(date);
        let chatMsg=new ChatGroupMessage($('#sender').val(), $('#chatGroupNo').val(), $('#sendBox #chat').val(), date);
        console.log(chatMsg);
        console.log($('#chatGroupNo').val());
        sock.send(JSON.stringify(chatMsg));
        //sock.send(msg);    
    }    
});


	