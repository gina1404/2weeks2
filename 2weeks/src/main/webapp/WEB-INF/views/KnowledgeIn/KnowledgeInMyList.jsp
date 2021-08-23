<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="지식인나의질의응답"/>
</jsp:include>


<style>
#rankingChart{
	position: relative;
	top: -15px;.
	
}

.ranking_section .ranking_list1{
    box-sizing: border-box;
    float: left;
    width: 50%;
    height: 308px;
    padding-right: 20px;
    text-decoration:none;
    list-style: none;
    position:relative;
   	top:-5px;
    text-overflow: ellipsis;
    background-color: white;
}


.ranking_section .ranking_list {
    box-sizing: border-box;
    float: left;
    width: 50%;
    height: 308px;
    padding-right: 20px;
    text-decoration:none;
    list-style: none;
    text-overflow: ellipsis;
    background-color: white;
}

.ranking_section .ranking_item {
    position: relative;
    margin-top: 14px;
    padding: 4px 4px 16px 18px;
    border-bottom: 1px solid #f2f2f2;
    background: 0;
    font-size: 12px;
    line-height: 1.6;
    letter-spacing: -0.5px;
    text-overflow: ellipsis;
     background-color: white;
}

.section_headings {
    position: relative;
    padding-bottom: 11px;
    border-bottom: 1px solid #e5e5e5;
}



.knowmenu {
    list-style: none;
} 

.ranking_section .ranking_list+.ranking_list {
    border-left: 1px solid #e8e8e8;
    padding: 0 0 0 20px;
}
.ranking_section .ranking_list1+.ranking_list1 {
    border-left: 1px solid #e8e8e8;
    padding: 0 0 0 20px;
}
 /* 조회수 */
.ranking_section .ranking_item .recommend_num {
    color: #5885ce;
    position:relative;
    bottom : -10px;
}

.ranking_section .ranking_item {
    position: relative;
    margin-top: 14px;
    padding: 4px 4px 16px 18px;
    text-overflow: ellipsis;
    border-bottom: 1px solid #f2f2f2;
    background: 0;
    font-size: 12px;
    line-height: 1.6;
    letter-spacing: -0.5px;
} 

/*질문 목록에서의 번호 */
 .ranking_section .ranking_item .no {
    position: absolute;
    top: -8px;
    left: 1px;
    width: 7px;
    text-align: center;
    font-size: 15px;
    font-family: Helvetica;
    font-weight: bold;
    color: #26b049;
  
} 

.section_headings__step1 {
    margin-top: 19px;
} 
/* 질문 목록에서의 질문제목들  */
.ranking_section .ranking_item .ranking_title {
    display: block;
    overflow: hidden;
    margin-bottom: 4px;
    font-weight: bold;
    font-size: 14px;
    color: #000;
    text-overflow: ellipsis;
    white-space: nowrap;
    position : relative;
    top:-12px;
    
    
} 


 a {
    color: #000;
    text-decoration: none;
} 
 
/*질문 목록에서 답변*/
 .ranking_section .ranking_item .text {
     width:300px;
    display: block;
    overflow: hidden;
    position: relative;
    margin: 0 0 4px -15px;
    color: #555;
 	 text-overflow: ellipsis;
    white-space: nowrap;
    bottom: -5px;
    right: -14px;

} 


.ranking_section .ranking_item .recommend_num+.reply_num:before {
    /* content: ''; */
    display: inline-block;
    width: 1px;
    height: 12px;
    margin: 0 9px 0 9px;
    background-color: #e5e5e5;
    vertical-align: middle;
    
}   

 /* 답변수 색깔 */
.ranking_section .ranking_item .reply_num {
    color: #8c8c8c;
     position: relative;
    right: -180px;
      bottom : -10px;
}             
.ranking_section .ranking_item .text:before { */
 /*    content: ''; */
   display: inline-block;
    width: 6px;
    height: 6px;
    border: 1px solid #ccc;
    border-width: 0 0 1px 1px;
    margin: 0 9px 0 2px;
    vertical-align: 2px;
}
.knowmenu li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -10px;

}  



.knowmenu li:hover {
		
		color: orange;
		cursor:pointer;
	}
	
#knowQ{

font-weight: bold;
position: relative;
top:-60px;


}

#knowM{

font-weight: bold;
font-size : 18px;
} 

/* 아이콘 관련 css */

.wrap_home .best {
    width: 25%;
}

.wrap_home .best {
    float: left;
    position: relative;
    width: 33.3%;
    height: 220px;
    overflow: visible;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
}
 
.description {
  
   

 	font-family: Pretendard;
    font-size: 18px;
    line-height: 24px;
    color: #fff;
    text-shadow: 0 1px 0 rgb(0 0 0 / 20%);
    font-weight: 300;
    position: relative;
    right:-10px;
 	width:130px;
 	height:100px;
	top:-100px;
	
  	   
}

#expert {
    max-width: 100%;
    visibility: visible;
    position:relative;
	top: 10px;
    background-color:#6B66FF;
    border-radius: 24px;
}

.naver::-webkit-input-placeholder {color:#a8a8a8;}
.naver::-ms-input-placeholder {color:#a8a8a8}
.naver::-moz-placeholder {color:#a8a8a8;}

#searchBar{
height:38px;
width:322px;
border : 1px solid #19ce60;
background :#ffffff;
float: right;
position: relative;
top: 5px;
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


.Qsearch{

width:100px;
height:40px;
border :0px;
background:#19ce60;
outline:none;
float:right;
color:#ffffff;
position: relative;
top :10px;

}

#Myqlist{

position:relative;
color: black;
font-family: Pretendard;
top:-100px;
right:-1000px;
}

.background2{
background:#FFFFFF;
/*  border:3px solid red;  */
 border-radius: 24px;
 position: relative;
 top:-100px;
}


.background3{
background:#FFFFFF;
/* border:3px solid red; */
 border-radius: 24px; 
  position: relative;
 top:-40px;
}

 .paginate{
position: relative;
top :-10px;
} 
.ranking_list_area{
background:#FFFFFF;
/* border: 1px solid red; */

}
.ranking_item _item_1{
background:#FFFFFF;
}
#pagebar-container{
text-align: center;

}
.selected{
color:red;
font-family: pretendard;
position: relative;
right:-100px;
top:-10px;
}
</style>
<section class="container" style="display:flex; padding-bottom: 200px;"> 	
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<div class="content" style="display:inline-block;padding-left: 220px;">	

		<a href="${pageContext.request.contextPath}/chatting.do">	<img id="expert" src="${pageContext.request.contextPath}/resources/images/knowledgeIn/home_panel_expert2.png" alt=""
						width="130px" height="130px">
			<div class="description">전문의 상담이<br>필요할 땐,<br>지식iN 엑스퍼트</div></a>

			<input type="hidden" name="user_Id" class="form-control" value="${member.user_Id}" readonly="readonly">
						
			<div class="description"></div>
				<!-- 	</div> -->
			


<div class="background2">


				<span id="Myqlist">내 질문 답변</span>

			<!-- <div id="searchBar"><input class="naver" type="text" placeholder="검색어 입력">
					<button id="searchkn">검색</button>
			</div> -->
		<button class="Qsearch" >질문하기</button>
<!-- <div id="knowQ">답변을 기다리는 질문 </div> -->  <!-- 많이 본 Q&amp;A -->

	

	
<div class="container-fluid-content__left" id="left_content">
	
	<div class="stats_ranking_area" id="statsRankingArea">
<!-- 
			<ul class="knowmenu"> 
					<li>전체</li>
					<li>등록순</li>
					<li>채택순</li>
				
					
					
			</ul> -->
	<div class="section_headings section_headings__step1">
	
	


	
	</div>
	

	<div class="ranking_section">	
	<h4 id="knowQ">나의 질문</h4> 
		<div class="ranking_list_area" id="rankingChart">
		
	
			
			
				<ul class="ranking_list1">
				
					<c:forEach var="k" items="${MyQ }" varStatus="status">
					 <c:if test="${status.count<=3 }"> 
				<%-- 	<input type="hidden" name="user_Id" class="form-control" value="${member.user_Id}" readonly="readonly"> --%>
					<li class="ranking_item _item_1" >
			
					<span class="no"><c:out value="${status.count}"></c:out></span>
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="ranking_title" target="_blank" onclick="">${k.kin_Title}</a>	
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="text" target="_blank" onclick="">${k.kin_Content}</a>
					<span class="recommend_num">조회수 ${k.kin_Cnt}</span>
		<!-- 			<span class="reply_num">답변수 8</span> -->
			    	<c:choose>
					<c:when test ="${k.selected==1}">
					<div class="selected">채택완료</div>
					</c:when>
					
					<c:when test ="${k.selected==0}">
					<div class="selected"></div>
					</c:when>
					</c:choose>
				
				
					</li>
						</c:if>
     				</c:forEach>		
          		</ul> 
          		
          		    <ul class="ranking_list1">
          		   
				<c:forEach var="k" items="${MyQ}" varStatus="status">
				 <c:if test="${status.count>=4  }">
					<li class="ranking_item _item_2" >
						<%-- 	<c:out value="${status.count}"></c:out> --%>
					<span class="no"><c:out value="${status.count}"></c:out></span>
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="ranking_title" target="_blank" onclick="">${k.kin_Title}</a>	
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="text" target="_blank" onclick="">${k.kin_Content}</a>
					<span class="recommend_num">조회수 ${k.kin_Cnt}</span>
		<!-- 			<span class="reply_num">답변수 8</span> -->
			    	<c:choose>
					<c:when test ="${k.selected==1}">
					<div class="selected">채택완료</div>
					</c:when>
					
					<c:when test ="${k.selected==0}">
					<div class="selected"></div>
					</c:when>
					</c:choose>
				
				
					</li>
				</c:if>
     				</c:forEach>	
     				
          		</ul> 
    
          	
              <div id="pagebar-container">
        	${pageBar }
        </div>
           	
        </div>
        
        
        
		<div class="paginate" id="rankingPaging" >
				
			
			
		</div> 
	</div>
	
</div>
</div>
	</div>


<div class="background3">

 



	<div class="ranking_section">	
		<div id="knowM"> 나의 답변</div> 
		<hr>
		<h4 class=""></h4>
		<div class="ranking_list_area" id="rankingChart">
				
				<ul class="ranking_list">
					<c:forEach var="k" items="${MyA}" varStatus="status">
					 <c:if test="${status.count<=3 }"> 
					
					<li class="ranking_item _item_1" >
			
					<span class="no"><c:out value="${status.count}"></c:out></span>
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="ranking_title" target="_blank" onclick="">${k.kin_Title}</a>	
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="text" target="_blank" onclick="">${k.kin_Content}</a>
					<span class="recommend_num">조회수 ${k.kin_Cnt}</span>
		<!-- 			<span class="reply_num">답변수 8</span> -->
			    	<c:choose>
					<c:when test ="${k.selected==1}">
					<div class="selected">채택완료</div>
					</c:when>
					
					<c:when test ="${k.selected==0}">
					<div class="selected"></div>
					</c:when>
					</c:choose>
				
				
					</li>
						</c:if>
     						
     						
     				</c:forEach>					 
                    
	

                </ul>
				
				<ul class="ranking_list">
			 	<c:forEach var="k" items="${MyA}" varStatus="status">
				 <c:if test="${status.count>=4  }">
					<li class="ranking_item _item_2" >
							<%-- <c:out value="${status.count}"></c:out> --%>
					<span class="no"><c:out value="${status.count}"></c:out></span>
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="ranking_title" target="_blank" onclick="">${k.kin_Title}</a>	
					<a href="${path}/KnowledgeIn/KnowledgeInList.do?sq=${k.kin_Sq}" class="text" target="_blank" onclick="">${k.kin_Content}</a>
					<span class="recommend_num">조회수 ${k.kin_Cnt}</span>
		<!-- 			<span class="reply_num">답변수 8</span> -->
			    	<c:choose>
					<c:when test ="${k.selected==1}">
					<div class="selected">채택완료</div>
					</c:when>
					
					<c:when test ="${k.selected==0}">
					<div class="selected"></div>
					</c:when>
					</c:choose>
				
				
					</li>
				</c:if>
     				</c:forEach>	 
     				
			
                    
                </ul>
        </div>
	 
	</div>
	


           <div id="pagebar-container">
        	${pageBar }
        </div>
        </div>
      </div>     
</section>
	<script>
	$(".Qsearch").on("click",function(){
		
		if(	${empty member.user_Id }){
			alert("로그인 후 이용가능합니다.")
				return false;
			} 
		

			
		location.href="${pageContext.request.contextPath}/KnowledgeIn/KnowledgeInQ.do";
	
		
	});  
</script>
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
