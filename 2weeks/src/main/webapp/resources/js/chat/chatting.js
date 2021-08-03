$("#addGroupBtn").click(e=>{	
	if($(e.target).next().css('display')=='none'){
		$(e.target).next().show();
	}else{
		$(e.target).next().hide();
	}	
});

$("#addBtn").click(e=>{	
	//let loginMember=("#maker").val();
	let title=$("#title").val();
	let content=$("#content").val();
	let limit=$("#limit").val();

	let json={"title":title, "content": content,
			"cnt": limit};	
	
	if($.trim(title).length==0){
		alert("제목을 입력해주세요"); return;
	}else if($.trim(title).length>20){
		alert("제목을 20자 이내로 작성해주세요"); return;
	}else if($.trim(content).length>50){
		alert("내용을 50자 이내로 작성해주세요"); return;
	}	
	$.ajax({
		url: rootPath+"/chat/sendChat",
		type:"POST",
		dataType: "json",		
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(json),				
		success:data=>{
			console.log(data);
			$("#container").html(data);
		}
	});	
});	
	

	