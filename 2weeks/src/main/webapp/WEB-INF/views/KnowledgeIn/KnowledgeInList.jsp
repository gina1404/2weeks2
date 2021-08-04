<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="지식인상세보기"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


<style>

.question{
/* border: 1px solid blue; */
position: relative;
top:0px;
background-color:white;
}

.answer{
/* border: 1px solid blue; */
position: relative;
top: 10px;
background-color:white;
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
top:-15px;
left:-20px;

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
top:0px;
left:-20px;

}
#searchBar{
height:38px;
width:322px;
border : 1px solid #19ce60;
background :#ffffff;
float: left;
position: relative;
right:-1050px;
top: -15px;
}
.naver{
font-size :16px;
width:250px;
padding:10px;
border:0px;
outline:none;
float:left;
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

#no{
position: relative;
top:50px;


}
.QA{

font-family: pretendard;
font-size: 50px;
color:#19ce60;
}

.title{
font-family: pretendard;
font-size:30px;
position: relative;
right:-20px;
}

.point{
font-family: pretendard;
font-size:20px;
background-color: #BDBDBD;
color :white;
position: relative;
right:-20px;

}
.knowmenu {
    list-style: none;
    position: relative;
    right :-1000px;
    top :-70px;
} 
.knowmenu li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -10px;

}

.rolldate{
    color: #8c8c8c;
     position: relative;
right:-15px;
}

.view{
    color: #8c8c8c;
     position: relative;
right:-15px;

}
.qcount{

    color: #8c8c8c;
     position: relative;
right:-15px;
}
.user{
font-family: pretendard;


}



.userInfo{

position: relative;
top : -50px;
right:-800px;
font-size: 13px;
}

.content1{
position: relative;
right: -100px;
/* border: 1px solid red; */
height:300px;

}
.content2{
position: relative;
right: -100px;
/* border: 1px solid red; */
height:500px;

}
#red{

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
#update{
   background-color: transparent !important;
    outline :0;
    border : 0;

}
#delete {
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

}
.Adoption_completed{
 color: red;
     position: relative;
    right: -80px;
      bottom : -10px;
      font-family: pretendard;
}
.warning{
font-family: pretendard;
font-size:12px;
position:relative;
right: -100px;
}
.warning span{
color:red;
}

.warning p{
color: #A4A4A4;

}
</style>


<section class="container">	
	<div class="question"><p id="no">NO.129	</p> 
			<div id="searchBar"><input class="naver" type="text" placeholder="검색어 입력">
					<button id="searchkn">검색</button>
			</div>
			<button id="Qsearch" >질문하기</button><img src="" alt=""> <hr width = "100%" color = "#F2F2F2">
			
					<div>	<span class="QA">Q</span> <span class="title">코로나 백신 접종 예약</span> <span class="point">100</span>
			
							<ul class="knowmenu"> 
					<li style="color: orange;">코로나19</li>
					<li>백신</li>
					<li>확진</li>
					<li>해외</li>
					<li>방역수칙</li>
					<li>건강</li>
					<li>기타</li>	
			</ul>
					<div class="userInfo"><span class="user">비공개</span> <span class="rolldate">2021.07.27</span> 
					<span class="view">조회수3,879</span> <span class="qcount">답변 3개</span></div>


			
					</div>
			
			<div class="content1">지금 50대부터 코로나 백신 접종 예약 진행중인것으로 아는데요 다음주에도 접종예정인지 궁금합니다.<br><br>

 				부모님 코로나 백신 접종 예약 해드리고싶은데 절차같은게 따로 나와있지 않기때문에...<br><br>

 					코로나 백신 접종 예약 끝난건 아니겠죠?</div>
 					
 					
				<button id="red1">신고</button><br>
						<div class="qbutton">
									<button id="update">수정</button>|<button id="delete">삭제</button> 
									<a href="KnowledgeInA.do"><button id="qanswer">답변하기</button></a>
						</div>
			</div><!--질문 div -->
			
			
			<!-- 답변  -->
			
			
			
		<div class="answer">

		
	<img src="" alt=""> <hr width = "100%" color = "#F2F2F2">
			<button id="Qcheck" >채택하기</button>
					<div>	<span class="QA">A</span> <span class="title">코로나 백신 접종 예약</span> <span class="Adoption_completed">채택완료</span>
			
							<ul class="knowmenu"> 
				<li style="color: orange;">코로나19</li>
					<li>백신</li>
					<li>확진</li>
					<li>해외</li>
					<li>방역수칙</li>
					<li>건강</li>
					<li>기타</li>	
			</ul>
					<div class="userInfo"><span class="user">sihu***</span> <span class="rolldate">2021.07.27</span> 
					<span class="view">추천 179</span> </div>


			
					</div>
			
			<div class="content2">

		지금 현재 접종 진행중입니다. 예약시스템을 살펴보면 간단한 인증을통해서 주변 근처 병원을 확인하고 백신조회를 하게됩니

		다. <br><br>그 후에 코로나 백신 접종 예약 진행할 수 있습니다. 의원이나 가정학의원에서도 무난히 접종이 가능합니다.</div>
 					
 			<hr style="border: solid 1px #F2F2F2;">
			
			<div class="warning">
			<span>알아두세요!</span><br> 
			
			<p> 위 답변은 답변작성자가 경험과 지식을 바탕으로 작성한 내용입니다. 포인트로 감사할 때 참고해주세요.</p>
				

			</div>
			<button id="red">신고</button><br>
		</div>
	
		
			
			
			
</section>
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

