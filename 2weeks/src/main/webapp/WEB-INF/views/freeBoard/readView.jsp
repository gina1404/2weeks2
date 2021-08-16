<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<style>
.container {
  padding-right: 30px;
  padding-left: 30px;
  margin-right: auto;
  margin-left: 20%;
  margin-top:5%;
}
h4 > span{
    display: block;
    margin-bottom: 4px;
    color: #ff5722;
    font-weight: bold;
    font-size: 12px;
}
a{
text-decoration:none;
color: #000;
}
.wrapper > .row{
margin-top:5%;
}
.divi{
font-size : 12px;
}
.col-sm-12{
  float: left;
}
.outer {
  text-align: center;
}

.inner {
  display: inline-block;
  margin-top: 200px;
  margin-left: -700px;
}

</style>
<section class="content">
	<div class="container">
		<div class="wrapper">
			<div class="row ">
				<h4>
					<span title="category">${list.category }</span> <a class=""
						href="${path }/freeboard/readView?no=${list.post_Sq }">${list.post_Title}</a>
				</h4>
			</div>
			<div class="row" style="border: solid blue 10px; margin-top: 5px;">
				<img src="">
				<div class="divider "></div>
				<span class="divi">조회 수 <b>${list.post_Cnt }</b></span>
				<div class="divider "></div>
				<span class="divi">추천 수 <b>${list.post_Like_Cnt }</b></span>
				<div class="divider "></div>
				<span class="divi">댓글 <b></b></span>
				<div class="divider"></div>
				<span class="divi"><fmt:formatDate value="${list.post_Dt }" pattern="yyyy-MM-dd hh:mm:ss"/></span>
			</div>
		</div>
		<div class="col-md-12 "
			style="border: solid black 1px; margin-top: 50px; margin-right: 500px;">
			<p>
				<span style="font-size: 16px;">${list.post_Content }</span>
			</p>
		</div>
		<div class="row text-center" style="width: 100%">
			<div style="width: 100%; float: none; margin: 0 auto;">
				<button class="btn btn btn-danger btn-round"
					style="width: 100px; margin-top: 300px;">추천 수</button>
				<div>
					${list.attachments }
					<c:if test="${!empty list.attachments }">
						<button type="button">버튼</button>
						<c:forEach var="a" items="${list.attachments }" varStatus="vs">
							<button type="button" class="btn btn-outline-success"
								onclick="location.replace('${path}/freeboard/fileDownload.do?=${a.atch_Ori }&rename=${a.atch_New }')">
								첨부파일 ${vs.count } - ${a.atch_Ori }</button>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<div class="outer" style="margin-left:670px; margin-bottom:100px;">
			<div class="inner">
				<span class="absolute">
					<button type="submit" class="update_btn btn btn btn-danger btn-round">수정</button> 
					<input type="button"  class=" btn btn-danger btn-round" value="삭제" onclick="del(${list.post_Sq})" style="width: 60px;">
					<button type="submit" class="list_btn btn btn-danger btn-round">목록</button>
				</span>
			</div>
		</div>
		<div class="card-body comment-editor">
			<form class="form-horizontal">
				<div class="row">
					<div class="form-group col-md-10">
						<textarea class="form-control input-md" id="newReplyText"  name="comment" cols="40" rows="3" autofocus maxlength="50" required></textarea>
					</div>
					<div class="form-group">
						<input type="hidden" name="level" value="1">
						<input type="hidden" name="boardRef" value="${list.post_Sq }">
						<input type="hidden" name="commentRef" value="0">
					</div>
					<div class="form-group col-md-2" name="deleteBtn">
						<button type="button" class="btn  btn-secondary btn-md btn-block replyAddBtn" id="btn-insert" style="height:70px; width:120px; font-size:20px;">
							등록 
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
				 <%-- <input type="hidden" name="commentWriter" value="${loginMember!=null?loginMember.userId:''}"> --%>


	<div class="row">
		<div class="col-md-8">
		<span>${bc.user_Id }</span>
		<span>${bc.reply_Dt }</span>
			<div class="col-md-12" style='margin-left:500px;'>
			<span id="reply_Content"> </span>
			
			<div class="row" id="dur" >
			<div class="col-md-8"  style="margin-left:100px;">
				
				<br>
			</div>
			</div>
			</div>
		</div>	
		<br />
		<br />
	</div>
						
		<div class="row" >
			<div id="reply" ><span></span></div>
		</div>

	








</section>

<script>
$(document).ready(function(){
	getReplies();
function getReplies(){
	$.getJSON("${path}/replies/all/"+ ${list.post_Sq}, function(data){
	var str="";
	$(data).each(function(i){
		if(this.reply_Level >= 2)	{
		str+="<div class='col-md-8 respace' style='margin-left:"+(10*(this.reply_Level+1.5))+"px;' data-value='"+(i+1)+"' >";
		}else{
		str+="<div class='col-md-8 respace' data-value='"+(i+1)+"' >";
		}
	str+="<span> "+this.user_Id+"         "+this.updateDate + "</span>";
	str+="<br>"
	str+="<span class='replyupdate'><img class='replyIcon' style='width:15px; margin:5px; 10px;' src='${path}/resources/images/icons/reply.png'/>"+this.reply_Content + "</span>";
	str+="<input type='hidden' name='replyLevel' value='"+this.reply_Level+"'>"
	str+="<a href ='javascript:void(0);' id='re-reply'style='margin-left:15px'  onclick='replyReplyInsert(event,"+ this.reply_Sq+','+this.reply_Level+");'>댓글</a>";
	str+="<button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown' style='margin-left:20px; width:35px; height:25px;'>";
	str+="<div class='dropdown-menu'>";
	str+="<a href class='dropdown-item'  style='margin-left:15px' onclick='fn_replyDelete("+this.reply_Sq+");'>삭제 </a>";
	str+="<a href class='dropdown-item'  style='margin-left:15px' onclick='fn_replyUpdate(event,"+this.reply_Content+','+this.reply_Sq+");'>수정</a>";
	str+="<a href class='dropdown-item'  style='margin-left:15px' onclick='fn_replyReply("+this.reply_Sq+");'>좋아요</a>";
	str+="<a href  class='dropdown-item' style='margin-left:15px' onclick='fn_replyReply("+this.reply_Sq+");'>신고</a>";
	str+="</div>";
	str+="</div>";
	str+="<hr>";
	console.log(this.reply_Content);
	});
	
	$("#reply_Content").html(str);
	
	
	
	});
	
	
}




//댓글 등록
$(".replyAddBtn").on("click", function(){
		//화면으로부터 입력 받은 변수값 처리
		var replyLevel = $('[name=level]').val();
		console.log(replyLevel);
		let reply_text = $("#newReplyText");  //댓글 내용
		let reply_writer=$("#newReplyWriter"); //댓글 작성자
		let reply_textVal = reply_text.val();
		let reply_writerVal = reply_writer.val();
		
		if (reply_textVal.replace(/\s|　/gi, "").length == 0) {
		    alert("내용을 입력해주세요.");
		    $("#newReplyText").focus();
		    return;
		  }
		
		console.log(reply_textVal);
		console.log(reply_writerVal);
		$.ajax({
			type: "POST",
			url:"${path}/reply/insert/",
			headers:{
				"Content-type" : "application/json", 
				"X-HTTP-Method-Override" : "POST"
				
			},
			dataType : "text",
			data: JSON.stringify({
				post_Sq : ${list.post_Sq},
				reply_Content : reply_textVal, 
				user_Id : reply_writerVal,
				reply_Level : replyLevel
			}),
			
			success : function(result) {
				if(result == "regSuccess"){
					alert("댓글 등록 완료데쓰네!");
				}else{
					alert('없는 아이디입니다. 로그인 후 시도해주세요.');
				}
				getReplies(); // 댓글 목록 출력 함수 호출
				reply_text.val("") // 댓글 내용 초기화
				reply_writer.val("") //댓글 작성자 초기화
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});

});	







$(".modalModBtn").on("click", function(){
	//댓글 선택자
	var reply = $(this).parent().parent();  //여기에 번호 / 작성자 / 내용을 가져올 수 있당
	//댓글 번호
	var reply_Sq = $("#reply_Sq").val();
	var reply_Content = $("#reply_Content").val();
	
	$.ajax({
		type:"put",
		url : "${path}/reply/" + reply_Sq,
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "PUT" 
		},
		data : JSON.stringify(
			{reply_Content : reply_Content}	
		),
		 dataType : "text",
		 success : function(result){
			 console.log("result : "+result);
			 if(result == 'modSuccess'){
				 alert("댓글 수정 완료!");
				 $("#modifyModal").modal('hide'); //모달 닫기
				 getReplies(); //댓글 목록 갱신
			 }
		 }
	});
});



	function backList(){
	window.history.back();	
		
	}
	//수정하기 클릭 시 조회수 오르는 걸 방지 하기 위함.
	$(".update_btn").on("click",function(){
		location.href="${path}/freeboard/updateBoard.do?no=${list.post_Sq }";
	});


function del(no) {
	console.log('ddddd');
	console.log(no);
	console.log(no);
	let chk = confirm("정말 삭제하시겠습니까?");
	if(chk){
		location.href="${path}/freeboard/delete.do?no="+no;
	}
}


	var cnt = 0;
	
	function replyReplyInsert(event,reply_Sq,reply_Level){
		console.log(event.target);
		let elem = event.target;
		console.log(reply_Level); 
		console.log(reply_Sq);
		var str="";
		if(!elem.classList.contains('respace') && cnt < 1){
		str+="<div class='row rerere'>";
		str+="<form>";
		str+="<textarea cols='80' rows='3' autofocus maxlength='300' name='reply_content' required>"+ "</textarea>";
		str+="<div class='row'>";
		str+="<button type='button' id='rereplyContent' class='btn btn-secondary' style='height:40px; width:100px; font-size:14px; margin-left:20px;'>등록</button>";
		str+="<button type='button' id='cancleBtn' class='btn btn-secondary' style='height:40px; width:100px; font-size:14px; margin-left:10px;'>취소</button>";
		str+="</div>";
		str+="</form>";
		str+="</div>";
		$(elem.parentNode).append(str);
		cnt++;
		}
		$("#cancleBtn").on("click",function(){
			$(".rerere").remove();
			cnt=0;
		});
		$("#rereplyContent").on("click",function(){
			var replySq = reply_Sq;
			var replyContent = $('[name=reply_content]').val();
			
			if (replyContent.replace(/\s|　/gi, "").length == 0) {
			    alert("내용을 입력해주세요.");
			    $("[name=reply_content]").focus();
			    return;
			  }
			
			console.log(replySq);
			console.log(replyContent);
			$.ajax({
				type:"post",
				url:"${path}/reply/rereplyInsert.do",
				headers:{
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					reply_Content : replyContent,
					post_Sq : ${list.post_Sq},
					reply_Level : reply_Level,
					reply_Ref : replySq
				}),
				success : function(result){
					if(result == 'regSuccess'){
						$(".rerere").remove();
						alert('댓글등록성공');
						replyList();
						cnt = 0;
					}else{
						alert('댓글등록실패');
					}
				}
			
			});
			
		});
		
	};

	
	function replyList(){
	$.getJSON("${path}/replies/all/"+ ${list.post_Sq}, function(data){
		var str="";
		$(data).each(function(i){
			if(this.reply_Level >= 2)	{
				str+="<div class='col-md-8 respace' style='margin-left:"+(10*(this.reply_Level+1.5))+"px;' data-value='"+(i+1)+"' >";
				}else{
				str+="<div class='col-md-8 respace' data-value='"+(i+1)+"' >";
				}
		str+="<span>"+this.user_Id+"         "+this.updateDate + "</span>";
		str+="<br>"
		str+="<span class='replyupdate'><img class='replyIcon' style='width:15px; margin:5px; 10px;' src='${path}/resources/images/icons/reply.png'/>"+this.reply_Content + "</span>";
		str+="<input type='hidden' name='replyLevel' value='"+this.reply_Level+"'>"
		str+="<a href ='javascript:void(0);' id='re-reply' style='margin-left:15px' onclick='replyReplyInsert(event,"+ this.reply_Sq+','+this.reply_Level+");'>댓글</a>";
		str+="<button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown' style='margin-left:100px; width:35px; height:25px;'>";
		str+="<div class='dropdown-menu'>";
		str+="<a href class='dropdown-item'  style='margin-left:15px' onclick='fn_replyDelete("+this.reply_Sq+");'>삭제 </a>";
		str+="<a href class='dropdown-item'  style='margin-left:15px' onclick='fn_replyUpdate(event,"+this.reply_Content+','+this.reply_Sq+");'>수정</a>";
		str+="<a href class='dropdown-item'  style='margin-left:15px' onclick='fn_replyReply("+this.reply_Sq+");'>좋아요</a>";
		str+="<a href  class='dropdown-item' style='margin-left:15px' onclick='fn_replyReply("+this.reply_Sq+");'>신고</a>";
		str+="</div>";
		str+="</div>"
		str+="<hr>"
		});
		
		$("#reply_Content").html(str);
		
		
		
	});
};


function fn_replyDelete(reply_Sq){
	console.log(reply_Sq);
	
	var msg = confirm("진짜루 나 삭제할꼬야??");
	if(msg == true){
		$.ajax({
			type:"delete",
			url:"${path}/reply/delete/"+reply_Sq,
			header:{
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType:"text",
			success:function(result){
				console.log(result)
				if(result == "delSuccess"){
					alert('댓글 삭제 완료')	;
					replyList();
				}
			}
			
		});
	}else{
		return false;
	}
	
};


function fn_replyUpdate(event,reply_Content,reply_Sq){
	console.log('댓글 수정 : ' +reply_Sq);
	var e = event.target;
	var e1 = event.target;
	var e2 = event.target;

	e = e.parentNode.parentNode.parentNode.firstChild.nextSibling.nextSibling; //content
	e1= e1.parentNode.parentNode; //버튼
	e2 = e2.parentNode.parentNode.parentNode.firstChild.nextSibling.nextSibling.nextSibling.nextSibling; // 댓글
	e1.remove(); // 버튼 삭제
	e2.remove(); //댓글 삭제
	console.log(e);
	console.log(e1);
	console.log(e2);
	console.log("댓글 내용 : " + reply_Content);
	var str="<div class='row'>";
	 str="<form>";
	 str+="<textarea class='col-md-7' cols='80' rows='3' autofocus maxlength='300' name='rereply_content' required>"+reply_Content+"</textarea>";
	 str+="<"
	 str+="<button type='button' class='btn btn-primary' id='replyModify' style='margin-bottom:90px; margin-left:35px; width:100px; height:35px;'>수정하기</button>";
	 str+="<button type='button' id='cancleBtn2' class='btn btn-secondary' style='height:35px; width:100px;  margin-left:-100px;'>취소</button>";
	 str+="</form>";
	 str+="</div>";
	$(e).html(str); //content에 덮어버림
	
	
	$("#cancleBtn2").on("click",function(){
		console.log('취소');
		replyList();
	});
	
	$("#replyModify").on("click",function(){
		console.log('수정하기');
		
		
	});
}



</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>