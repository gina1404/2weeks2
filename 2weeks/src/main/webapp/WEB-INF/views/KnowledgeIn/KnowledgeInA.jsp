<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="지식인상세보기"/>
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
right:-300px;


}
/* 질문바 */


.knowmenu li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -489px;
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
#qanswer{
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

position: relative;
top: 10px;
background-color:white;
}
.noresize {
	width:1300px; 
	height:500px; 
    resize:none;/* 크기고정 */ 
	position: relative;
	right:-50px;
}

.knowmenu2 li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -35px;
right:-1000px;
list-style: none;
   
}
.bottom{
position: relative;
right:-50px;

}
.title2{
font-family: pretendard;
font-size:30px;
position: relative;
right:-60px;
}
#Qcheck{
width:100px;
height:40px;
border :0px;
background:#8181F7;
outline:none;
float:right;
color:#ffffff;
position: relative;
top:-90px;
right:180px;

}
</style>


<section class="container">	
<form name="KinFrm" action="${path }/KnowledgeIn/KnowledgeInAEnd.do"
         method="post" enctype="multipart/form-data" >
<div class="question">
			<div id="searchBar"><input class="naver" type="text" placeholder="검색어 입력">
					<button id="searchkn">검색</button>
			</div>
		<a href="KnowledgeInQ.do">	<button id="Qsearch" >질문하기</button><img src="" alt=""> </a><hr width = "100%" color = "#F2F2F2"/>

			<div id="container">
			
				<div>
		 
					<span class="QA">Q</span> 
					
					<span class="title">${KnowledgeIn.kin_Title}</span> 
					<span class="point">100</span>
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
			<span class="content1">${KnowledgeIn.kin_Content}<br><br></span>
				

		</div>
		
		<%-- 	</c:forEach> --%>
			
 					
				<button id="red1">신고</button><br>
			
						<div class="qbutton">	</div>

					
						
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
				

					

						
			</div><!--질문 div -->
			
			
			<!-- 답변  -->
			
 					
 			<hr style="border: solid 1px #F2F2F2;">
<div class="answer">

				<input type="hidden" name="kin_Sq" id="no" value="${KnowledgeIn.kin_Sq}">
			<%-- 	<input type="hidden" name="kinReply" id="no" value="${kinReply.reply_Sq}">  --%>
			
	<img src="" alt=""> <hr width = "100%" color = "#F2F2F2">
	
					<div>	<img src=""> <span class="title2">	<input type="text" name="reply_Writer" class="form-control" value="${kr.reply_Writer}" >님 답변해주세요</span>
			<hr width = "100%" color = "#F2F2F2">
							<!-- <ul class="knowmenu2"> 
					<li style="color: orange;">코로나19</li>
					<li>백신</li>
					<li>확진</li>
					<li>해외</li>
					<li>방역수칙</li>
					<li>건강</li>
					<li>기타</li>	
			</ul> -->
				
				
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
		
			<div class="content">
		   <textarea class="noresize" placeholder="답변 작성 시 서비스 운영정책을 지켜주세요.
광고주로부터 소정의 경제적 대가를 받고 특정 상품에 대한 추천 또는 후기글을 올리는 경우, 이러한 광고주와의
경제적 이해관계를 소비자들이 쉽게 알 수 있도록 글 제목 또는 답변의 첫 부분 또는 끝부분 등 적절한 위치에 공개하여야 합니다." name="reply_Content" ></textarea>
		
	</div>

			<br>
				<hr style="border: solid 1px #F2F2F2;">
		<div class="bottom">	
		<input type="file" name="file" value="첨부파일">
		
		</div>		
					<hr style="border: solid 1px #F2F2F2;">
		<div class="bottom">	
		<label>아이디 공개<input type="radio" name="open_Yn" value="Y"></label>
		<label>비공개<input type="radio" name="open_Yn" value="N"></label>
		</div>	
		
					<hr style="border: solid 1px #F2F2F2;">
		<button  type="submit"id="Qcheck" >답변등록</button>
		</div>
	</div>
		


	
	</form>		
<!-- </form> -->
			
			
</section>
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

