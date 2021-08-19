<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="지식인나의질의응답"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


<style>
/* 질문바 */
#searchBar{
height:38px;
width:322px;
border : 1px solid #19ce60;
background :#ffffff;
float: right;
position: relative;

right: 150px;
} 
.naver{
font-size :16px;
width:250px;
padding:10px;
border:0px;
outline:none;
float:left;
position: absolute;
} 
#searchkn{

width:50px;
height:100%;
border :0px;
background:#19ce60;
outline:none;
float:right;
color:#ffffff;

}
#Qsearch{

width:100px;
height:40px;
border :0px;
background:#19ce60;
outline:none;
float:right;
color:#ffffff;
position: relative;
right: 18px;


}
/* 질문바 */


.knowmenu li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -510px;
right:-1000px;
list-style: none;
   
}
/* 질문 제목 */
.QA{

font-family: pretendard;
font-size: 50px;
color:#19ce60;

}
.title{
font-family: pretendard;
font-size:30px;
}

.point{
font-family: pretendard;
font-size:20px;
background-color: #BDBDBD;
color :white;

}

.userInfo{

position: relative;
top : -35px;
right:-1150px;
font-size: 13px;
color: #8c8c8c;

width:250px;
}

.content1{
display:inline-block;

/* border: 1px solid red;  */
height:40%;
width:80%;

}
#red1{

  color: red;
    background-color: transparent !important;
    outline :0;
    border : 0;
    position: relative;
    right: -1400px;
    top:-30px;
    font-family: pretendard;
    font-weight: bold;
    font-size: 15px;
}
.update{
   background-color: transparent !important;
    outline :0;
    border : 0;

}
.delete {
   background-color: transparent !important;
    outline :0;
    border : 0;
}
.qanswer{
   background-color: transparent !important;
    outline :0;
    border : 0;

}
.qbutton{
position: relative;
   right: -1300px;
	width:180px;
} 
.Adoption_completed{
 color: red;
     position: relative;
    right: -80px;
      bottom : -10px;
      font-family: pretendard;
}
.question{
position: relative;
top:0px;
background-color:white;

}

.answer{
/* border: 1px solid blue;  */
position: relative;
top: 10px;
background-color:white;
}

/* 채택하기버튼 */
.Qcheck{
width:100px;
height:40px;
border :0px;
background:#8181F7;
outline:none;
float:right;
color:#ffffff;
position: relative;
top:0px;
left:-20px;

}

.knowmenu2 li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -80px;
right:-1000px;
list-style: none;
   
}


.userInfo2{

position: relative;
top : -70px;
right:-1150px;
font-size: 13px;
color: #8c8c8c;

width:200px;
}

.content2{
position: relative;
/* border: 1px solid red;  */
height:50%;
width:90%;


}
.warning{
font-family: pretendard;
font-size:12px;
position:relative;
right: -100px;
width:500px;
}
.warning span{
color:red;
}

.warning p{
color: #A4A4A4;

}
/* 좋아요 그림 */
#heart1{
width:23px;
height:23px;
position: relative;
top:5px;
}
#heart2{
width:13px;
height:13px;
}
</style>










<section class="container">		
	<div class="question">
			<!-- <div id="searchBar"><input class="naver" type="text" placeholder="검색어 입력">
					<button id="searchkn">검색</button>
			</div> -->
					NO.${KnowledgeIn.kin_Sq}
		<a href="KnowledgeInQ.do">	
			<c:if test="${not empty member.user_Id }">
		<button id="Qsearch" >질문하기</button>
		</c:if>
		<img src="" alt=""> </a><hr width = "100%" color = "#F2F2F2"/>

			<div id="container">
	
				<div>
				<input type="hidden" name="kin_Sq" value="${KnowledgeIn.kin_Sq}">
	 		<%-- <input type="hidden" name="count" value="${count}"> --%>
	 		
		
					<span class="QA">Q</span> 
					<span class="title">${KnowledgeIn.kin_Title}</span> 
					<span class="point">${KnowledgeIn.point}</span>
				</div>
				
				<div class="userInfo">
				        <c:if test="${KnowledgeIn.open_Yn eq 'Y'}" >
            		<span class="user">${KnowledgeIn.kin_Writer}</span> 
        					</c:if>
        			       <c:if test="${KnowledgeIn.open_Yn eq 'N'}" >
            				<span class="user">비공개</span> 
        					</c:if>
        							
        	
				<span class="rolldate"><fmt:formatDate value="${KnowledgeIn.kin_Date}" pattern="yyyy.MM.dd"/></span>
			<%-- 	<span class="rolldate">${KnowledgeIn.kin_Date }</span>  --%>
				<span class="view">조회수 ${KnowledgeIn.kin_Cnt }</span> 
				<span class="qcount">답변 ${KnowledgeIn.reply_Cnt}개</span>
				</div>

			<span class="content1">${KnowledgeIn.kin_Content}<br><br>
			
			
						
			
					
			
			
			</span>
				
				


		</div>
		
		<%-- 	</c:forEach> --%>
			
 					
				<button id="red1">신고</button><br>
						<div class="qbutton">
						<c:if test="${member.user_Id == KnowledgeIn.kin_Writer}">
									<button class="update">수정</button><!-- </a> -->
									
									<a href='${path }/delete?sq=${KnowledgeIn.kin_Sq }'><button class="delete">삭제</button></a>

						</c:if>			 
						<%-- <span>${kr.reply_Sq}</span> --%>
						<c:if test="${member.user_Id != KnowledgeIn.kin_Writer}">
					<%-- 	<a href="${path}/KnowledgeIn/KnowledgeInA.do?sq=${KnowledgeIn.kin_Sq}"> --%><button class="qanswer">답변하기</button><!-- </a> -->
						</c:if>	
						</div>
						<c:if test="${empty member.user_Id} ">
										
										
						</c:if>
						<c:choose>
						<c:when test="${KnowledgeIn.category eq '코로나19'}">
						<ul class="knowmenu"> 
						<li style="color: orange;">코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
						</ul>
						    </c:when>
						
						<c:when test="${KnowledgeIn.category eq '백신'}">
						<ul class="knowmenu"> 
						<li>코로나19</li>
						<li style="color: orange;">백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						    
						    
						<c:when test="${KnowledgeIn.category eq '확진'}">
						<ul class="knowmenu"> 
						<li>코로나19</li>
						<li>백신</li>
						<li style="color: orange;">확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						
						<c:when test="${KnowledgeIn.category eq '해외'}">
						<ul class="knowmenu"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li style="color: orange;">해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						    
						 <c:when test="${KnowledgeIn.category eq '방역수칙'}">
						<ul class="knowmenu"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li style="color: orange;">방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						    
						 <c:when test="${KnowledgeIn.category eq '건강'}">
						<ul class="knowmenu"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li style="color: orange;">건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>   
						
						<c:when test="${KnowledgeIn.category eq '기타'}">
						<ul class="knowmenu"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li style="color: orange;">기타</li>
					
						
						</ul>
						    </c:when>   
						
						</c:choose>
				
<%-- 
					${kr.reply_Content} --%>

						
			</div><!--질문 div -->
			
			
			<!-- 답변  -->
			
			
  	<c:forEach var="kr" items="${kr}"> 
<%-- 	<input type="hidden" name="kr" id="no" value="${kr.reply_Sq}">  --%>
		<div class="answer">

		
	<img src="" alt=""> <hr width = "100%" color = "#F2F2F2">
			<c:if test="${member.user_Id == KnowledgeIn.kin_Writer}">
			<button class="Qcheck" value="${kr.reply_Sq }" >채택하기</button>
			</c:if>
					<div>	<span class="QA">A</span> 
					 <c:if test="${kr.open_Yn eq 'Y'}" >
					 	<span class="title">${kr.reply_Writer}님의 답변</span> 
        					</c:if>
        			       <c:if test="${kr.open_Yn eq 'N'}" >
            					<span class="title">비공개 답변</span> 
        					</c:if>
				
					
					<!-- <span class="Adoption_completed">채택완료</span> -->
			
				<c:choose>
						<c:when test="${KnowledgeIn.category eq '코로나19'}">
						<ul class="knowmenu2"> 
						<li style="color: orange;">코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
						</ul>
						    </c:when>
						
						<c:when test="${KnowledgeIn.category eq '백신'}">
						<ul class="knowmenu2"> 
						<li>코로나19</li>
						<li style="color: orange;">백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						    
						    
						<c:when test="${KnowledgeIn.category eq '확진'}">
						<ul class="knowmenu2"> 
						<li>코로나19</li>
						<li>백신</li>
	
						<li style="color: orange;">확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						
						<c:when test="${KnowledgeIn.category eq '해외'}">
						<ul class="knowmenu2"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li style="color: orange;">해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						    
						 <c:when test="${KnowledgeIn.category eq '방역수칙'}">
						<ul class="knowmenu2"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li style="color: orange;">방역수칙</li>
						<li>건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>
						    
						 <c:when test="${KnowledgeIn.category eq '건강'}">
						<ul class="knowmenu2"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li style="color: orange;">건강</li>
						<li>기타</li>
					
						</ul>
						    </c:when>   
						
						<c:when test="${KnowledgeIn.category eq '기타'}">
						<ul class="knowmenu2"> 
						<li>코로나19</li>
						<li>백신</li>
						<li>확진</li>
						<li>해외</li>
						<li>방역수칙</li>
						<li>건강</li>
						<li style="color: orange;">기타</li>
					
					
						</ul>
						    </c:when>   
						
						</c:choose>
				
					<div class="userInfo2">
					<!-- <span class="user">sihu***</span>  -->
					  <c:if test="${kr.open_Yn eq 'Y'}" >
        					${kr.reply_Writer}</c:if>
        			       <c:if test="${kr.open_Yn eq 'N'}" >
            				<span class="user">비공개</span> 
        					</c:if>
					
					
					
					<span class="rolldate"><fmt:formatDate value="${kr.reply_Date}" pattern="yyyy.MM.dd"/></span>
					<span class="view"><img id="heart1" src="${pageContext.request.contextPath}/resources/images/knowledgeIn/heart1.png"> ${kr.reply_Like_Cnt}</span> </div>
			
	
	
			
					</div>
			
			<div class="content2">
			${kr.reply_Content}
			
			
			
				</div>
		
		

 					
 			<hr style="border: solid 1px #F2F2F2;">
			
			<div class="warning">
			<span>알아두세요!</span><br> 
			
			<p> 위 답변은 답변작성자가 경험과 지식을 바탕으로 작성한 내용입니다. 포인트로 감사할 때 참고해주세요.</p>
				
		
			</div>
			<button id="red1">신고</button><br>
		</div>
	
	</c:forEach>	
	
			
<!-- 			</form>		 -->
			


		
			
</section>
 
<script>
		var count =${KnowledgeIn.reply_Cnt }
		var writer= ${knowledgeIn.kin_Writer}

		$(document).ready(function(){ 
		
		
		$('.delete').click(function() {
			if(count>0){
			alert("답변이 존재하여 삭제가 불가합니다.")
				return false;
			}
			
			var result = confirm('정말 삭제하시겠습니까?\n(포인트도 같이 삭제 됩니다)'); 
			if(result) { 
				location.replace('${path}/KnowledgeIn/KnowledgeInMain.do'); 
				} 
			else { 
				return false;
			}
		});
		
		
	 	$(".update").on("click",function(){
			
			if(count>0){
				alert("답변이 존재하여 수정이 불가합니다.")
					return false;
				}
				
			location.href="${path }/KnowledgeIn/update.do?sq=${KnowledgeIn.kin_Sq}";
		
		
		});  
		
 	$(".qanswer").on("click",function(){
			
 		if(	${empty member.user_Id }){
			alert("로그인 후 이용가능합니다.")
				return false;
			} 
				
			location.href="${path}/KnowledgeIn/KnowledgeInA.do?sq=${KnowledgeIn.kin_Sq}";
		
		
		});  
		/* $(".Qcheck").on("click",function(){
			var result = confirm("채택 하시겠습니까?");
			if(result){
				selected==1;
				location.href="${path }/KnowledgeIn/KnowledgeInList.do?sq=${KnowledgeIn.kin_Sq}";
			}
			else{
				return false;
			}
			
		}); */
		
		
 	
	$(".Qcheck").on("click",function(e){
			var result = confirm("채택 하시겠습니까?");
			var url= "${path}/KnowledgeIn/KnowledgeInList.do?sq=${KnowledgeIn.kin_Sq}";
			let reply_sq=$(e.target).val();
			$.ajax({
				
				url:url,
				data:{sq:reply_Sq},
				dataType:"text",
				success : function(result){
					console.log(result)
					}, error:function(request,status,error){ 
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				         }
				})

			});

	});






</script>

	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
