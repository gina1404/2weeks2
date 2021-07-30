$("#addGroupBtn").click(e=>{		
	$(e.target).next().show();	
});
	
//let path="${pageContext.request.contextPath}";
//let loginMember=("#maker").val();
let title=$("#title").val();
let content=$("#content").val();
let limit=$("#limit").val();

let json={"title":title, "content": content,
			"cnt": limit};

$("#addBtn").click(e=>{	
	console.log(title);
	
	if(title.trim()==""){
		//alert("제목을 입력해주세요");
	}else if(title.trim()>20){
		alert("제목을 20자 이내로 작성해주세요");
	}else if(content.trim()>50){
		alert("내용을 50자 이내로 작성해주세요");
	}	
	$.ajax({
		url: rootPath+"/chat/sendChat",
		type:"POST",
		dataType: "json",		
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(json),				
		success:data=>{
			console.log(data);
			$("#chatContainer").html(data);
		}
	});	
});	
	

	