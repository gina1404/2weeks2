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
		<!-- 댓글  -->
		<div class="row" id="reply_card${list.post_Sq }">
			<div class="card card-body">
				<!-- 댓글 목록 -->
				<div class="reply-list reply-list${list.post_Sq }">
					<!-- 댓글이 목록이 들어가는 곳 -->
				</div>
				<!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
				<div class="row reply_write">
					<div class="col-1">
						<a href="other_profile.do?other_nick=${list.user_Id }"> 
							<img id="write_reply_profileImage" 	src="./upload/profile/" />
						</a>
					</div>
					<div class="col-8" class="input_reply_div">
						<input class="w-100 form-control" id="input_reply${list.post_Sq}"
							type="text" placeholder="댓글입력...">
					</div>
					<div class="col-3 ">
						<button type="button" idx="${tmp.no }"
							class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="modifyModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">댓글 수정창</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="reply_Sq">댓글 번호</label> <input class="form-control"
								id="reply_Sq" name="reply_Sq" readonly>
						</div>
						<div class="form-group">
							<label for="reply_Content">댓글 내용</label> <input class="form-control"
								id="reply_Content" name="reply_Content" placeholder="댓글 내용을 입력해주세요">
						</div>
						<div class="form-group">
							<label for="user_Id">댓글 작성자</label> <input
								class="form-control" id="user_Id" name="user_Id"  readonly>
								
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-success modalModBtn">수정</button>
						<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
					
					</div>
				</div>
			</div>
		</div>
	</div>





</section>

<script>

const ReplyList = function(no) {
	$.ajax({
		url : '${path}/reply/replyList.do',
		type: 'get',
		data: {
			no : no
		},
		success: function(data){
			console.log("댓글 리스트 가져오기 성공");
			
			let listHtml="";
			
			for(const i in data){
				 let no = data[i].no;
	             let bno = data[i].bno;
	             let grp = data[i].grp;
	             let grps = data[i].grps;
	             let grpl = data[i].grpl;
	             let writer = data[i].user_Id;
	             let content = data[i].content;
	             let wdate = data[i].wdate;
	             let wgap = data[i].wgap;
	             let profile = data[i].profile;

	             console.log(grpl);	// 모댓글일땐 0, 답글일땐 1
	             
	             listHtml += "<div class='row replyrow reply"+ post_Sq + "'>";
	             
	             if(content == ""){ //삭제된 댓글일 때
	            	 listHtml += "<div>";
	            	 listHtml +="(삭제된 댓글입니다.)";
	            	 listHtml +="</div>";
	             }else{
	            	 if(grpl == 0){ //모댓글일때
	            		 listHtml +="<div class='col-1'>";
	            		 listHtml +="<a href='other_profile.do?other_nick="=+writer"';
	            		 listHtml +="<img class'reply_list_profileImage' src='${path}/upload/profile"+profile+"'>";
	            		 listHtml +="</a>";
	            		 listHtml +="</div>";
	            		 listHtml +="<div class='rereply-content col-8'>";
	            		 listHtml +="<div>";
	            		 listHtml +="<span>";
	            		 listHtml +="<b>"+ writer +"</b>";
	            		 listHtml +="</span>";
	            		 listHtml +="<span>";
	            		 listHtml +=content;
	            		 listHtml +="</span>";
	            		 listHtml +="</div>";
	            		 // 현재 로그인 상태일때 답글작성 버튼이 나온다.
	                       // if("${nick}" != ""){
	                     listHtml += "<div>";
	                            // 함수에 게시글번호(bno), 모댓글번호(no), 모댓글 작성자(writer)를 인자로 담아서 넘긴다.
	                            // 이때 모댓글 작성자 writer는 string인데 string을 인자에 넣기 위해선''나""로 감싸줘야한다.
	                            // 여기선 ''와 ""가 이미 둘다 쓰이고 있는데  href를 감싸고 있는 ''와 겹치지 않는 ""를 \" 처리해서 넣어줬다.
	                      listHtml += "<a href='#' class='write_reply_start' data-bs-toggle='collapse' data-bs-target='#re_reply"+ no +"' aria-expanded='false' aria-controls='collapseExample'>답글&nbsp;달기</a>";
	                      listHtml += "/div>";
	                       // }
	                      listHtml += "</div>";
	            		 
	            		 
	            		 listHtml +="";
	            		 listHtml +="";
	            		 listHtml +="";
	            		 listHtml +="";
	            		 listHtml +="";
	            		 listHtml +="";
	            		 listHtml +="";
	            		 listHtml +="";
	            	 }else{
	            		 listHtml += "	<div class='col-1'>"
	                         listHtml += "</div>"
	                         listHtml += "<div class='col-1'>";
	                         listHtml += "<img class='reply_list_profileImage' src='./upload/profile/"+ profile +"'/>";
	                         listHtml += "</div>";
	                         listHtml += "<div class='rereply-content"+ no +" col-7'>";
	                         listHtml += "<div>";
	                         listHtml += "<span>";
	                         listHtml += "<b>"+ writer +"</b>";
	                         listHtml += "</span>";
	                         listHtml += "<span>";
	                         listHtml += content;
	                         listHtml += "</span>";
	                         listHtml += "</div>";

	                         listHtml += "	</div>";
	            	 }
	            	 listHtml += "	<div class='col-3 reply-right'>";
	                    listHtml += "<div>";
	                    listHtml += wdate;
	                    listHtml += "</div>";
	                    
	                   // if("${nick}" != ""){

	                        //현재 사용자가 이 댓글의 작성자일때 삭제 버튼이 나온다.
	                       // if("${nick}" == writer){
	                            listHtml += "		<div>";
	                            // 수정할 댓글의 no를 grpl과 함께 넘긴다. 
	                            // 모댓글 수정칸과 답글 수정칸을 화면에 다르게 나타내야하기 때문에 모댓글과 답글을 구분하는 grpl을 함께 넘겨주어야한다.
	                            //listHtml += "			<a href='javascript:' no='"+ no +"' grpl='"+ grpl +"' class='reply_modify'>수정</a>";
	                            //listHtml += "			&nbsp;|&nbsp;";
	                            // 삭제는 no만 넘겨주면 된다.
	                            listHtml += "			<a href='javascript:' no='"+ no +"' grpl='"+ grpl + "' post_Sq='"+ post_Sq +"' grp='"+ grp +"' class='reply_delete'>삭제</a>";
	                            listHtml += "		</div>";
	                        //}
	                    //}               
	                            listHtml += "	</div>";
	                            // 댓글에 답글달기를 누르면 답글입력란이 나온다.
	                            // ---- 답글입력란
	                            listHtml += "	<div class='collapse row rereply_write' id='re_reply"+ no +"'>";
	                            listHtml += "		<div class='col-1'>"
	                            listHtml += "		</div>"
	                            listHtml += "		<div class='col-1'>"
	                            listHtml += "			<a href='other_profile.do?other_nick="+writer+"'> ";
	                            listHtml += "				<img id='write_reply_profileImage' src='./upload/profile/${profile}'/>"
	                            listHtml += "			</a> ";
	                            listHtml += "		</div>"
	                            listHtml += "		<div class='col-7'>"
	                            listHtml +=  "  		<input class='w-100 input_rereply_div form-control' id='input_rereply"+ no +"' type='text' placeholder='댓글입력...'>"
	                            listHtml += "		</div>"
	                            listHtml += "		<div class='col-3'>"
	                            // 답글달기 버튼이 눌리면 모댓글 번호(no)와 게시물번호(bno)를 함수에 전달한다.

	                            // 동적으로 넣은 html태그에서 발생하는 이벤트는 동적으로 처리해줘야한다 !!!!!
	                            // 예를들어, 동적으로 넣은 html태그에서 발생하는 click 이벤트는 html태그 안에서 onclick으로 처리하면 안되고, jquery에서 클래스명이나 id값으로 받아서 처리하도록 해야한다.
	                            // 아래코드를 보자~~~~
	                            // listHtml += "			<button onclick='javascript:WriteReReply("+ no +","+ bno +")' type='button' class='btn btn-success mb-1 write_rereply' >답글&nbsp;달기</button>"
	                            // 위 코드는 클릭되어도 값이 넘겨지지 않는다. 값이 undefined가 된다.
	                            // 아래코드처럼 짜야한다. click이벤트를 처리하지 않고 데이터(no, bno)만 속성으로 넘겨주도록 작성한다.
	                            listHtml += "			<button type='button' class='btn btn-success mb-1 write_rereply' no='" + no + "' post_Sq='" + post_Sq + "'>답글&nbsp;달기</button>"
	                            listHtml += "		</div>";
	                            listHtml += "	</div>";
	                            // ---- 답글입력란 끝   
	             }
	             listHtml += "</div>";
			};
			 $(".reply-list"+no).html(listHtml);		
			 $('button.btn.btn-success.mb-1.write_rereply').on( 'click', function() {
	                console.log( 'no', $(this).attr('no') );
	                console.log( 'post_Sq', $(this).attr('post_Sq') );
	                
	             // 답글을 DB에 저장하는 함수를 호출한다. bno와 no를 같이 넘겨주어야한다.
	                WriteReReply($(this).attr('post_Sq'), $(this).attr('no') );
			 });
			 $('.reply_delete').on('click', function(){
	                // 모댓글 삭제일때
	                if($(this).attr('grpl') == 0){	
	                    DeleteReply($(this).attr('no'), $(this).attr('post_Sq'));

	                // 답글 삭제일때
	                }else{
	                    DeleteReReply($(this).attr('no'), $(this).attr('post_Sq'), $(this).attr('grp'));
	                }

	            }) 
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};
//답글 달기 버튼 클릭시  실행 - 답글 저장, 댓글 갯수 가져오기
const WriteReReply = function(post_Sq, no){
	console.log(post_Sq);
	console.log(no);
	  // 댓글 입력란의 내용을 가져온다. 
    // ||"" 를 붙인 이유  => 앞뒤 공백을 제거한다.(띄어쓰기만 입력했을때 댓글작성안되게 처리하기위함)
	console.log($("#input_rereply" + no).val());
	content = content.trim();
	
	if(content == ""){	// 입력된게 없을때
        alert("글을 입력하세요!");
    }else{	
        // 입력란 비우기
        $("#input_rereply" + no).val("");

        // reply+1 하고 그 값을 가져옴
        $.ajax({
            url : '${path}/reply/rereply.do',
            type : 'get',
            data : {
                no : no,
                post_Sq : post_Sq,
                content: content
            },
            success : function(pto) {

                let reply = pto.reply;
                // 페이지, 모달창에 댓글수 갱신
                $('#m_reply'+post_Sq).text(reply);//
                $('#reply'+post_Sq).text(reply);

                console.log("답글 작성 성공");

                // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
                ReplyList(post_Sq);
            },
            error:function(request,status,error){
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
        });

    };
};


//모댓글 삭제일때
const DeleteReply = function(no, post_Sq){
    // grp이 no인 댓글이 있는 경우 content에 null을 넣고 없으면 삭제한다.
    $.ajax({
        url : '${path}/reply/replyDelete.do',
        type : 'get',
        data : {
            no : no,
            post_Sq : post_Sq
        },
        success : function(pto) {

            let reply = pto.reply;

            // 페이지, 모달창에 댓글수 갱신
            $('#m_reply'+post_Sq).text(reply);
            $('#reply'+post_Sq).text(reply);

            console.log("모댓글 삭제 성공");

            // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
            ReplyList(post_Sq);
        },
        error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
    });
};

// 답글 삭제일때
const DeleteReReply = function(no, post_Sq, grp){

    //console.log("grp : " + grp);

    // 답글을 삭제한다.
    $.ajax({
        url : '${path}/reply/rereplyDelete',
        type : 'get',
        data : {
            no : no,
            post_Sq : post_Sq,
            grp : grp
        },
        success : function(pto) {

            let reply = pto.reply;

            // 페이지, 모달창에 댓글수 갱신
            $('#m_reply'+post_Sq).text(reply);
            $('#reply'+post_Sq).text(reply);

            console.log("답글 삭제 성공");

            // 게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
            ReplyList(post_Sq);
        },
        error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
    });

};
	
	
	
	
}

$(document).ready(function(){

var post_Sq = 4;

getReplies();

//댓글 등록
$(".replyAddBtn").on("click", function(){
		//화면으로부터 입력 받은 변수값 처리
		
		let reply_text = $("#newReplyText");  //댓글 내용
		let reply_writer=$("#newReplyWriter"); //댓글 작성자
		
		let reply_textVal = reply_text.val();
		let reply_writerVal = reply_writer.val();
		
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




function getReplies(){
	console.log(${list.post_Sq})
	$.getJSON("${path}/replies/all/"+ ${list.post_Sq}, function(data){
		console.log(data);
	var str="";
	$(data).each(function(){
	console.log(this.reply_Sq);
		str +="<li data-reply_Sq='"+ this.reply_Sq + "' class='replyLi'>"
	+ "<p class='reply_Content'>"+this.reply_Content + "</p>"
	+ "<p class='user_Id'>" + 'user05' +"</p>"
	+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
	+"</li>"
	+"<hr/>";
	});
	
	$("#replies").html(str);
	});
}

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




</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>