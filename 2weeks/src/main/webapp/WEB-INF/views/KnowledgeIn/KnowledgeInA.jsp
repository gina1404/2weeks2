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
top:-90px;
right:180px;

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
.title2{
font-family: pretendard;
font-size:30px;
position: relative;
right:-60px;
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
.knowmenu2{
    list-style: none;
    position: relative;
    right :-1000px;
    top :-30px;
} 
.knowmenu li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -10px;

}
.knowmenu2 li{

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
   right: -1385px;

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

.answer{

position: relative;
top: 10px;
}

.noresize {
	width:1300px; 
	height:500px; 
    resize:none;/* 크기고정 */ 
	position: relative;
	right:-50px;
}
.bottom{
position: relative;
right:-50px;

}
::placeholder {
  color: #BDBDBD;
  font-size: 12px;
  font-weight: 400;
  opacity: 1; /* Firefox */
}

:-ms-input-placeholder { /* Internet Explorer 10-11 */
  color: #BDBDBD;
  font-size: 12px;
  font-weight: 400;
  opacity: 1; /* Firefox */
}

::-ms-input-placeholder { /* Microsoft Edge */
  color: #BDBDBD;
  font-size: 12px;
  font-weight: 400;
  opacity: 1; /* Firefox */
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
									 <button id="qanswer">답변하기</button>
						</div>
			</div><!--질문 div -->
			
			
			<!-- 답변  -->
			
 					
 			<hr style="border: solid 1px #F2F2F2;">
<div class="answer">

		
	<img src="" alt=""> <hr width = "100%" color = "#F2F2F2">
	
					<div>	<img src=""> <span class="title2">sihu***님 답변해주세요</span>
			<hr width = "100%" color = "#F2F2F2">
							<ul class="knowmenu2"> 
					<li style="color: orange;">코로나19</li>
					<li>백신</li>
					<li>확진</li>
					<li>해외</li>
					<li>방역수칙</li>
					<li>건강</li>
					<li>기타</li>	
			</ul>
				
			<div class="content">
		
		   <textarea class="noresize" placeholder="답변 작성 시 서비스 운영정책을 지켜주세요.
광고주로부터 소정의 경제적 대가를 받고 특정 상품에 대한 추천 또는 후기글을 올리는 경우, 이러한 광고주와의
경제적 이해관계를 소비자들이 쉽게 알 수 있도록 글 제목 또는 답변의 첫 부분 또는 끝부분 등 적절한 위치에 공개하여야 합니다."></textarea>
		
	</div>

			<br>
				<hr style="border: solid 1px #F2F2F2;">
		<div class="bottom">	
		<input type="file" name="FileName" value="첨부파일">
		
		</div>		
					<hr style="border: solid 1px #F2F2F2;">
		<div class="bottom">	
		<label>아이디 공개<input type="radio" name="chk_info" value="ID_ON"></label>
		<label>비공개<input type="radio" name="chk_info" value="ID_OFF"></label>
		</div>	
		
					<hr style="border: solid 1px #F2F2F2;">
		<button id="Qcheck" >답변하기</button>
		</div>
	</div>
		


	
		
			
			
			
</section>
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

