//let rootPath="${pageContext.request.contextPath}";
	
let sock=new SockJS("http://localhost:9090${path}/chattingEntry");
sock.onopen=e=>{
	console.log(e);
}
sock.onmessage=e=>{
	console.log(e);
}
sock.onclose=e=>{
	
}

let btn=document.getElementById("sendChat");
btn.addEventListener("click", e=>{
	const msg=document.getElementById("chat").value;
	console.log(msg);
	sock.send(msg);
});


	