	var msSocket=null;

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

	   }






















	