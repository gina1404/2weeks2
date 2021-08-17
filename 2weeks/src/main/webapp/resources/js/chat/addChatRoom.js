$(document).ready(function() {
    $(' textarea#title, input#input_text2, textarea#textarea2').characterCounter();
});

$("#input_text2").keyup(function(e){
	if($(e.target).val()>30){
		alert('최대 인원은 30명입니다.');
	}
});

$("#addBtn").click(e=>{	
	let maker=$("#disabled").val();
	let title=$("#title").val();
	let content=$("#textarea2").val();
	let limit=$("#input_text2").val();

	let json={"maker":maker, "title":title, "content": content,
			"cnt": limit};	
	
	$.ajax({
		url: rootPath+"/chat/sendChat",
		type:"POST",
		dataType: "json",		
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(json),				
		success:function(data){
			$(".container #chatContainer #groupList").load(rootPath+"/chatting.do #groupList");
		}
	});	
	window.close();
	
});	