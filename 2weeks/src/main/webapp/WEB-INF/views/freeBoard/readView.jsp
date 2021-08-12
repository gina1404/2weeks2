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
				<span class="divi">${list.post_Dt }</span>
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
			<div class="col-md-12">
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

		<div class="row">
			<div id="reply"><span>dsdadsadsa</span></div>
		</div>






</section>

<script>
$(document).ready(function(){
	getReplies();
	
var post_Sq = 4;

function getReplies(){
	console.log(${list.post_Sq})
	$.getJSON("${path}/replies/all/"+ ${list.post_Sq}, function(data){
		console.log(data);
	var str="";
	var dur="";
	$(data).each(function(){
	console.log(this.reply_Sq);
	console.log(this.reply_Content);
	dur+="아이디 : "+this.user_Id +"작성일 : "+this.updateDate;
	str+="<div class='col-md-8'>";
	str+="<span>"+this.reply_Content + "</span>";
	str+="<a href  style='margin-left:15px'  onclick='fn_replyDelete('"+this.reply_Sq+");'>삭제</a>";
	str+="<a href style='margin-left:15px'  onclick='fn_replyUpdate('"+this.reply_Sq+");'>수정</a>";
	str+="<a href style='margin-left:15px' onclick='fn_replyReply('"+this.reply_Sq+");'>댓글</a>";
	str+="</div>"
	});
	$("#reply_Content").html(str);
	$("#dur").html(dur);
});
}




//댓글 등록
$(".replyAddBtn").on("click", function(){
		//화면으로부터 입력 받은 변수값 처리
		
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
				user_Id : reply_writerVal
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






/* <a href="#" onclick="fn_replyDelete('${bc.reply_Sq}')">삭제</a>
<a href="#" onclick="fn_replyUpdate('${bc.reply_Sq}')">수정</a>
<a href="#" onclick="fn_replyReply('${bc.reply_Sq}')">댓글</a> */



$("#replies").on("click", ".replyLi button", function(){
	var reply =$(this).parent();
	
	var reply_Sq = reply.attr("data-reply_Sq");
	var reply_Content = reply.find(".reply_Content").text();
	var user_Id = reply.find(".user_Id").text();
	
	$("#reply_Sq").val(reply_Sq);
	$("#reply_Content").val(reply_Content);
	$("#user_Id").val(user_Id);
});


$(".modalDelBtn").on("click", function(){
	//댓글번호
	
	var reply_Sq = $(this).parent().parent().find("#reply_Sq").val();
	
	//ajax
	$.ajax({
		type : "delete",
		url : "${path}/reply/delete/"+ reply_Sq,
		header: {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : "text",
		success : function(result) {
			console.log("result : " + result);
			if(result == "delSuccess"){
				alert("댓글 삭제 완료!");
				$("#modifyModal").modal("hide"); //modal 닫기
				getReplies(); //댓글 목록 갱신
			}
		}
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
	$(".update_btn").on("click",function(){
		location.href="${path}/freeboard/updateBoard.do?no=${list.post_Sq }";
	})
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

$(".btn-reply").click(e=>{
	const tr =$("<tr id='cancel'>");
	const form = $(".comment-editor>form").clone();
	console.log(form);
	form.find("[name=comment]").removeAttr("id").addClass("btnRereply");
	form.find("[name=comment]").attr("type","text");
	form.find("[name=level]").addClass("level2");
	form.find("[name=level]").val("2");
	console.log(form.find("[name=level]").val("2"));
	form.find("[name=commentRef]").addClass("commentRef2");
	form.find("[name=commentRef]").val($(e.target).val());
	form.find("button").removeAttr("class").addClass("btn btn-insert2  btn-primary");
	form.find("button").css("width","61.88px").removeAttr("id");
	form.find("button").css("height","31px");
	form.find("button").css("font-size","14px");
	form.find("[name=deleteBtn]").append('<button type="button" class="btn btn-danger btn-md btn-block" id="btn-delete" style="width:61.88px; font-size:14px; padding: 4px 8px; margin:5px -5px 5px 0px;">취소</button>');

	
	const td =$("<td>").attr("colspan","4");
	tr.append(td.append(form));
	tr.find("td").css("display","none");
	
	tr.insertAfter($(e.target).parents("tr")).children("td").slideDown(800);
	$(".btnRereply").val(""); //답글창 초기화
	$(e.target).off("click");
	$('.btn-reply').on("click");
$("#btn-delete").on("click", function(){
	$('#cancel').remove();
});


$(".btn-insert2").on("click", function(){
	let reply_Comment = $(".btnRereply").val();
	let post_Sq = ${list.post_Sq};
	let level = $('.level2').val();
	let reply_Sq = $(".commentRef2").val();
	console.log(post_Sq);	
	console.log(level);
	console.log(reply_Comment);
	console.log(reply_Sq);
	
	$.ajax({
		type : "POST",
		url:"${path}/reply/rereplyInsert.do/",
		headers:{
			"Content-type" : "application/json", 
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : "text",
		data: JSON.stringify({
			reply_Content : reply_Comment,
			post_Sq : post_Sq,
			reply_Level : level,
			reply_Ref : reply_Sq
		}),
		success : function(result) {
			console.log(result);
			if(result == "regSuccess"){
				alert("댓글 등록 완료");
			}else{
				alert("댓글 등록에 실패했습니다. 잠시 후 다시 시도해주세요.");
			}
				//getReplies();
				$('#cancel').remove();
		},error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		}
		
	});
});


});	





</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>