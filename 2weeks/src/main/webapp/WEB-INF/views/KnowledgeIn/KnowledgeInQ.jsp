<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="지식인질문"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<style>

.question{
/* border: 1px solid blue; */
background-color: white;
}

.answer{
/* border: 1px solid blue; */
position: relative;
top: 10px;
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

left:-16px;

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
top:-130px;
left:-170px;

}
#searchBar{
height:38px;
width:322px;
border : 1px solid #19ce60;
background :#ffffff;
float: left;
position: relative;
right:-1050px;
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
right:-40px;
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
right:-40px;

}
.knowmenu {
    list-style: none;
    position: relative;
    right :-1100px;
    top :-70px;
} 

.knowmenu2 {
    list-style: none;
    position: relative;
    right :-1400px;
    top :-40px;
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
right:-1200px;
font-size: 13px;
}

.content{
position: relative;
right: -50px;
/* border: 1px solid red; */


}
#red{

  color: red;
    background-color: transparent !important;
    outline :0;
    border : 0;
    position: relative;
    right: -1800px;
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
   right: -1700px;

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

.noresize {
	width:1300px; 
	height:500px; 
    resize:none;/* 크기고정 */ 
	position: relative;

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
.a{
	font-size:30px;
	position: relative;
	left:-300px;
	font-family: pretendard;
	font-weight: bold;
}
.knowmenu li:hover {
		
		color: orange;
		cursor:pointer;
	}
	
	input:focus {outline:1px solid #19ce60;}
</style>


<section class="container">
	<div class="question">
			<span class="a">Q&A</span>
			<div id="searchBar"><input class="naver" type="text" placeholder="검색어 입력">
					<button id="searchkn">검색</button>
			</div>
			<button id="Qsearch" >질문하기</button><img src="" alt=""> <hr width = "100%" color = "#F2F2F2">
			
					<div>	<span class="QA">Q</span> 
					<input type="text"  maxlength='20' style="width:1000px;font-size:30px; border:1px solid #19ce60" placeholder="제목 작성란 입니다 20자 미만으로 입력해주세요.">
			
							<ul class="knowmenu"> 
					<li>코로나19</li>
					<li>백신</li>
					<li>확진</li>
					<li>해외</li>
					<li>방역수칙</li>
					<li>건강</li>
					<li>기타</li>	
			</ul>


			
					</div>
			
			<div class="content">
			
			  <textarea class="noresize" placeholder="답변이 등록되지 않은 경우에는 수정,삭제가 가능하지만 답변이 있을 시, 해당 내용은 수정,삭제가 불가능 합니다.

질문 내용에 개인정보(실명,전화번호,메신저아이디)가 포함되지 않게 해주세요."></textarea>
		
			
			</div>
 					
 					
			 					
<br>
			
		<div class="bottom">	
		<input type="file" name="FileName" >
		<br>
					 					
 			<hr style="border: solid 1px #F2F2F2;">
		<label>아이디 공개<input type="radio" name="chk_info" value="ID_ON"></label>
		<label>비공개<input type="radio" name="chk_info" value="ID_OFF"></label>
			<hr style="border: solid 1px #F2F2F2;">
		<button>포인트 설정</button>

		</div>	
					 					
 			<hr style="border: solid 1px #F2F2F2;">				
		<button id="Qcheck" >질문등록</button>
		</div>

		

			

			
			
			

			
			
</section>
	<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
