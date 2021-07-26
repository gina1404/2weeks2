<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="지식인나의질의응답"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<style>
#rankingChart{
	position: relative;
	top: -10px;
}
.ranking_section .ranking_list {
    box-sizing: border-box;
    float: left;
    width: 50%;
    height: 308px;
    padding-right: 20px;
     text-decoration:none;
        list-style: none;
    
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
.ranking_section .ranking_item .text:before {
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
left: -320px;

}
#knowM{
font-weight: bold;


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
    word-wrap: break-word;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;

    position: relative;
 
	
  	   
}
 img {
    max-width: 100%;
    visibility: visible;
    position:relative;
    bottom: -100px;
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
float: left;
position: relative;
right:-1400px;
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
.naver{
font-size :16px;
width:250px;
padding:10px;
border:0px;
outline:none;
float:left;
} 

#Qsearch{
width:100px;
height:40px;
border :0px;
background:#19ce60;
outline:none;
float:right;
color:#ffffff;
}
</style>


<section id="content">




		
				<a class="best_link" href="" target="_blank">	
				<!-- 	<div class="best_background"> -->
		
						<img src="${pageContext.request.contextPath}/resources/image/home_panel_expert2.png" alt=""
						width="130px" height="130px">
							<p class="description">전문의 상담이<br>필요할 땐,<br>지식iN 엑스퍼트</p></a>
						
				<!-- 	</div> -->
			
			

		
		



	<div id="searchBar"><input class="naver" type="text" placeholder="검색어 입력">
		<button id="searchkn">검색</button>
	</div>
<button id="Qsearch" >질문하기</button>



<div id="knowQ">답변을 기다리는 질문 </div>  <!-- 많이 본 Q&amp;A -->

	

	
<div class="container-fluid-content__left" id="left_content">
	
	<div class="stats_ranking_area" id="statsRankingArea">

			<ul class="knowmenu"> 
					<li>코로나19</li>
					<li>백신</li>
					<li>확진</li>
					<li>해외</li>
					<li>방역수칙</li>
					<li>건강</li>
					<li>기타</li>
					
					
			</ul>
	<div class="section_headings section_headings__step1">
	
	


	
	</div>
	<div class="ranking_section">	
		<h4 class="title"></h4>
		<div class="ranking_list_area" id="rankingChart">
				
				<ul class="ranking_list">
					
                    
					<li class="ranking_item _item_1" >
						<span class="no">1</span>
					<!-- 제목 -->	<a href="" class="ranking_title" target="_blank" onclick="">코로나 백신 접종 예약</a>
					<!-- 타이틀 -->	<a href="" class="text" target="_blank" onclick="">지금 50대부터 코로나 백신 접종 예약 진행중인것으로 아는데요 다음주에도 접종예정인지 궁금합니다. 부모...</a>
						<span class="recommend_num">조회수 4953</span><span class="reply_num">답변수 3</span>
					</li>
                    
                    
                    
					<li class="ranking_item _item_2" >
						<span class="no">2</span>
						<a href="" class="ranking_title" target="_blank" onclick="">코로나로 죽을 확률</a>
						<a href="" class="text" target="_blank" onclick="">어제부터 인후통 오한 눈통증,  두통 팔이 저림 마른기침 이런증상이 있네요 보건소..</a>
						<span class="recommend_num">조회수 3061</span><span class="reply_num">답변수 2</span>
					</li>
                    
                    
                    
					<li class="ranking_item _item_3" >
						<span class="no">3</span>
						<a href="" class="ranking_title" target="_blank" onclick="">코로나 증상</a>
						<a href="" class="text" target="_blank" onclick="">고3 백신접종을 해서 맞는다고 하는데 화이자 부작용중에 알레르기 반응이 있던데 사과 알러지 있는데 이런...</a>
						<span class="recommend_num">조회수 1575</span><span class="reply_num">답변수 10</span>
					</li>

                </ul>
				
				<ul class="ranking_list">

					<li class="ranking_item _item_4" >
						<span class="no">4</span>
						<a href="" class="ranking_title" target="_blank" onclick="">코로나 검사 가까운</a>
						<a href="" class="text" target="_blank" onclick="">코로나 검사받으려고 하는데 가까운 진료소를 알아보려면 어디서 알아볼 수 있을까요?..</a>
						<span class="recommend_num">조회수 1413</span><span class="reply_num">답변수 28</span>
					</li>
                    
                    
				    
					<li class="ranking_item _item_5" >
						<span class="no">5</span>
						<a href="" class="ranking_title" target="_blank" onclick="">잔여백신 관련 질문입니다</a>
						<a href="" class="text" target="_blank" onclick="">잔여백신 맞으려고 하는데요....이번달에 20대는 잔여백신을 접종할 수 있나요?</a>
						<span class="recommend_num">조회수 1348</span><span class="reply_num">답변수 1</span>
					</li>
                    
                    
				    
					<li class="ranking_item _item_6" >
						<span class="no">6</span>
						<a href="" class="ranking_title" target="_blank" onclick="">도쿄올림픽 선수들 코로나</a>
						<a href="" class="text" target="_blank" onclick="">도쿄올림픽 선수촌에서 코로나 발생관련..</a>
						<span class="recommend_num">조회수 1012</span><span class="reply_num">답변수 1</span>
					</li>

                    
                </ul>
        </div>
		<div class="paginate" id="rankingPaging" >
				
			<a href="#" class="on" title="선택됨" onclick="">1</a>
			
				<a href="#" onclick="">2</a>
			
		</div>
	</div>
	
</div>
</div>


<div id="knowM"> 많이 본 Q&amp;A</div>  <!-- 많이 본 Q&amp;A -->




	<div class="ranking_section">	
		<h4 class="title"></h4>
		<div class="ranking_list_area" id="rankingChart">
				
				<ul class="ranking_list">
					
                    
					<li class="ranking_item _item_1" >
						<span class="no">1</span>
					<!-- 제목 -->	<a href="" class="ranking_title" target="_blank" onclick="">코로나 백신 접종 예약</a>
					<!-- 타이틀 -->	<a href="" class="text" target="_blank" onclick="">지금 50대부터 코로나 백신 접종 예약 진행중인것으로 아는데요 다음주에도 접종예정인지 궁금합니다. 부모...</a>
						<span class="recommend_num">조회수 4953</span><span class="reply_num">답변수 3</span>
					</li>
                    
                    
                    
					<li class="ranking_item _item_2" >
						<span class="no">2</span>
						<a href="" class="ranking_title" target="_blank" onclick="">코로나로 죽을 확률</a>
						<a href="" class="text" target="_blank" onclick="">어제부터 인후통 오한 눈통증,  두통 팔이 저림 마른기침 이런증상이 있네요 보건소..</a>
						<span class="recommend_num">조회수 3061</span><span class="reply_num">답변수 2</span>
					</li>
                    
                    
                    
					<li class="ranking_item _item_3" >
						<span class="no">3</span>
						<a href="" class="ranking_title" target="_blank" onclick="">코로나 증상</a>
						<a href="" class="text" target="_blank" onclick="">고3 백신접종을 해서 맞는다고 하는데 화이자 부작용중에 알레르기 반응이 있던데 사과 알러지 있는데 이런...</a>
						<span class="recommend_num">조회수 1575</span><span class="reply_num">답변수 10</span>
					</li>

                </ul>
				
				<ul class="ranking_list">

					<li class="ranking_item _item_4" >
						<span class="no">4</span>
						<a href="" class="ranking_title" target="_blank" onclick="">코로나 검사 가까운</a>
						<a href="" class="text" target="_blank" onclick="">코로나 검사받으려고 하는데 가까운 진료소를 알아보려면 어디서 알아볼 수 있을까요?..</a>
						<span class="recommend_num">조회수 1413</span><span class="reply_num">답변수 28</span>
					</li>
                    
                    
				    
					<li class="ranking_item _item_5" >
						<span class="no">5</span>
						<a href="" class="ranking_title" target="_blank" onclick="">잔여백신 관련 질문입니다</a>
						<a href="" class="text" target="_blank" onclick="">잔여백신 맞으려고 하는데요....이번달에 20대는 잔여백신을 접종할 수 있나요?</a>
						<span class="recommend_num">조회수 1348</span><span class="reply_num">답변수 1</span>
					</li>
                    
                    
				    
					<li class="ranking_item _item_6" >
						<span class="no">6</span>
						<a href="" class="ranking_title" target="_blank" onclick="">도쿄올림픽 선수들 코로나</a>
						<a href="" class="text" target="_blank" onclick="">도쿄올림픽 선수촌에서 코로나 발생관련..</a>
						<span class="recommend_num">조회수 1012</span><span class="reply_num">답변수 1</span>
					</li>

                    
                </ul>
        </div>
		<div class="paginate" id="rankingPaging" >
				
			<a href="#" class="on" title="선택됨" onclick="">1</a>
			
				<a href="#" onclick="">2</a>
			
		</div>
	</div>
	


















</section>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
