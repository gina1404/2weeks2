<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/covid/regionalKor.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/search/searchResult.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/d3.js"></script>

<c:set var="path" value="${pageContext.request.contextPath }"/> 
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="${path}/resources/css/common/main.css" rel="stylesheet" type="text/css" >

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>

<section class="container" style="display: flex; padding-bottom: 30px;">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>			
	<div class="content gridContainer" style="margin-left: 220px;">
		<div class="kCovid item a">
			<div class="today">
				<p>금일 확진자</p>
			</div>
					<div class="todayCnt">
						<fmt:formatNumber type="number" value="${todayDecide }" />명
					</div>
			</div>
		
		<div class="kCovid item a">
			<div class="today">
				<p>금일 확진자</p>
			</div>
					<div class="todayCnt">
						<fmt:formatNumber type="number" value="${decideCnt }" />명
					</div>
			</div>
				<div class="kCovid item a">
			<div class="today">
				<p>총 사망자</p>
			</div>
					<div class="todayCnt">
						<fmt:formatNumber type="number" value="${deathCnt }" />명
					</div>
			</div>
					<div class="kCovid item a">
			<div class="today">
				<p>격리해제 수</p>
			</div>
					<div class="todayCnt">
						<fmt:formatNumber type="number" value="${clearCnt }" />명
					</div>
			</div>
		
		
		<div class="item 1st a">
			<div class="state">
				<div class="flag">
					<img alt="미국국기" src="<%=request.getContextPath()%>/resources/images/icons/arar.svg">
				</div>
				<div class="flagLogo">
					 <h4>${pielist[5].nationNm }</h4>
				</div>
			</div>
			<div class="num">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${pielist[5].defCount }" var="com1"/>${com1 }명
			</div>
		</div>
		<div class="item 1st a">
			<div class="state">
				<div class="flag">
					<img alt="일본국기" src="<%=request.getContextPath()%>/resources/images/icons/Japan.png">
				</div>
				<div class="flagLogo">
					 <h4>${pielist[6].nationNm }</h4>
				</div>
			</div>
			<div class="num">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${pielist[6].defCount }" var="com2"/>${com2 }명
			</div>
		</div>
		<div class="item 1st a">
			<div class="state">
				<div class="flag">
					<img alt="영국국기" src="<%=request.getContextPath()%>/resources/images/icons/Kingdom.jpg">
				</div>
				<div class="flagLogo">
					 <h4>${pielist[0].nationNm }</h4>
				</div>
			</div>
			<div class="num">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${pielist[0].defCount }" var="com3"/>${com3 }명
			</div>
		</div>
		<div class="item 1st a">
			<div class="state" style="margin-right: 28px;">
				<div class="flag">
					<img alt="프랑스국기" src="<%=request.getContextPath()%>/resources/images/icons/frfr.png">
				</div>
				<div class="flagLogo">
					 <h4>${pielist[1].nationNm }</h4>
				</div>
			</div>
			<div class="num">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${pielist[1].defCount }" var="com4"/>${com4 }명
			</div>
		</div>

		<div id="home-map-area" class="item 2nd a">
			<div id="mapMove">
				<a class="move z" href="${path }/covid/domestic.do">
					지역별 확산 현황 지도
				</a>
			</div>
			<div id="regionalKor-map-small"></div>
		</div>
		<div class="item 2nd a">
			<div class="report" >
				<div id="reportreport">
					<a class="move z" href="${path }/covidUpdate/report.do">
						보도자료
					</a>
				</div>
				<div id="reportTab">
					<c:forEach var="r" items="${reportList }">
						<div id="reportTitle" style="text-overflow: ellipsis;"> ${r.title } </div>
						<input type="hidden" value="${r.url }">
						<hr id="reportHr">
					</c:forEach>
				</div>
		</div>
			<div class="news">
				<div id="newsMove">
					<a class="move z" href="${pageContext.request.contextPath }/covid/news.do"  target=_blank>
						뉴스
					</a>					 
				</div>
				<c:forEach var ="news" items="${CovidNews }">
				<div class="frontside ">
                     <div class="card">
                         <div class="card-body text-center">
                             <p><img class=" img-fluid" src="${path }/resources/images/icons/hazmat.svg" alt="card image" style="width:60px;"></p>
                             <h4 class="card-title" id="news-title"><a class="y" href="<c:out value="${news.url }"/>"  target=_blank ><c:out value="${news.title }"/></a></h4>
                             <p class="card-text" id="news-content"><a class="y" href="<c:out value="${news.url }"/>"  target=_blank ><c:out value="${news.content }"/></a></p>
                             <p class="card-text" id="news-date"><c:out value="${news.newsDate }"/></p>
                         </div>
                     </div>
                 </div>
                 <hr>
                 </c:forEach>
			</div>		
		</div>				
		
		<div class="item 3rd a">
			<div id="home-community-list">
				 <div class="searchResult-name">2weeks 검색 결과</div>
				<c:forEach var="list" varStatus="i" items="${searchResultCommunity}" end="8">
					<div class="searchResult-list" >					
						<div class="searchResult-profile"><img class="" src="${path }/resources/images/icons/two.svg"/></div>
						<div class="searchResult-blogName" onclick="">${list.category }</div>
				       	<div class="searchResult-vertical-divider"></div>
				       	<div class="searchResult-date">${list.post_Dt }</div>
						<div class="searchResult-title" onclick="location.href='${path}/freeboard/readView?no=${list.post_Sq}'">${list.post_Title }</div>
						<div class="searchResult-content">
							<!-- 미리보기 글자수 제한 -->
							<c:choose>
								<c:when test="${fn:length(list.post_Content) gt 200 }">
									<c:out value="${fn:substring(list.post_Content,0,200)}"/>...
								</c:when>
								<c:otherwise>
									<c:out value="${list.post_Content}"/>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<c:if test ="${not i.last}"><hr></c:if>									
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<!-- 보도자료 -->
<script>
	let move;
	$("#reportTitle").click(e=>{
		let aTag=$(e.target).next().val();
		let url=aTag.split("','");
		for(let i=0; i<url.length; i++){
			if(url[2]!=""){				
				move="http://ncov.mohw.go.kr/tcmBoardView.do?brdId="+url[1]+
						"&brdGubun="+url[2]+
						"&dataGubun=&ncvContSeq="+url[3]+
						"&contSeq="+url[3]+
						"&board_id="+url[4].substring(0, 3)+"&gubun=BDJ";						
			}else {				
				move="http://ncov.mohw.go.kr/tcmBoardView.do?brdId=&brdGubun=&dataGubun=&ncvContSeq="+
						url[3]+"&contSeq="+url[3]+"&board_id=140&gubun=BDJ";
			}			
		}
		window.open(move);	
	});		
</script>

<!-- 지역별 현황 지도  -->
<script>
$("#home-map-area").each(function(){	
    $.ajax({ //0. 지역별 현황 DB 값 가져오기
        url:"${path}/covidUpdate/regional/kor.do",
        type:"post",
        dataType:"json",
        success:function(data){
             //지역별 현황 지도 출력
            var width = 80; //지도의 너비
            var height = 400; //지도의 높이 px
            var scale = 4300; //확대시킬 값
            var labels; //라벨
            //geo 세팅 : 축척 - 서울 중심 좌표를 기준으로 조금씩 움직이며 맞췃음
            var projection = d3.geo.mercator().scale(scale).center([127-1.6, 37.6-1.15]).translate([width/2,height/2]);
            var path = d3.geo.path().projection(projection);
        
            //지도 츨력
            var svg = d3.select('#regionalKor-map-small').append('svg').attr('width', width + '%').attr('height', height + 'px').attr('id', 'regionalKor-map-small').attr('class', 'regionalKor-map-small');			
            var states = svg.append('g').attr('id', 'states');        
        
            //geoJson데이터를 파싱하여 지도그리기
            d3.json('${path}/resources/json/korea.json', function(json) {				
            	//지도 표시
                states.selectAll('path').data(json.features).enter()
                .append('path').attr('d', path).attr('id', function(d) { return 'path-' + d.properties.name_eng;})
                .attr('fill', function(d){ //확진자 수에 따라 배경 색 변경
                	var mapColor;
                	for(var k=0;k<18;k++){
                		if(d.properties.name==data[k].gubun){
                			console.log(d.properties.name+":"+data[k].gubun);
                			if(data[k].incDec<50) mapColor='#f2f2fa';                			
                			else if(data[k].incDec>=50 && data[k].incDec<100) mapColor='#D3D8F4';
                			else mapColor='#c4c4f5';
                		}
                	}
                	return mapColor;
                });
            	
                //라벨 표시
                labels = states.selectAll('text').data(json.features).enter()
            	.append('text')
				.text(function(d) { //출력할 값 추가             	 
                	 return d.properties.name 	 
                 })                 
				.attr('transform', render) //render 값으로 위치를 조절함
				.attr('id', function(d) { return 'label-' + d.properties.name_eng;}) //id 추가
				
				
				.append('svg:tspan') //
				.attr('x', 0)
  				.attr('dy', 13)
                .text(function(d) { //출력할 값 추가
               	 var incDec;
               	 var defCnt;
               	 for(var j=0;j<18;j++){
               		 if(d.properties.name==data[j].gubun){ //구분값(지역명)이 일치할 경우
                   		 incDec=data[j].incDec; //오늘 확진자 수
                   		 defCnt=data[j].defCnt; //총 확진자 수
                   	 }                		 
               	 } 
               	 return "+"+incDec;
                })
            }); //기본 지도 그리기 끝             
           
          //텍스트 위치 조절
		    function render(d) {
		        var arr = path.centroid(d);
		        if (d.properties.code == 31) {
		            //서울 경기도 이름 겹쳐서 경기도 내리기
		            arr[1] +=
		                d3.event && d3.event.scale
		                    ? d3.event.scale / height + 20
		                    : scale / height + 20;
		        } else if (d.properties.code == 34) {
		            //충남은 조금 더 내리기
		            arr[1] +=
		                d3.event && d3.event.scale
		                    ? d3.event.scale / height + 10
		                    : scale / height + 10;
		        } //if-else문 끝
	        return 'translate(' + arr + ')';
		    } //function render(d) 끝 		    
        }, //지역별 현황function(data))출력 끝
        error:(r,m,s)=>{
            console.log(r);
            console.log(m);
            console.log(s);
        }
    }); //ajax 끝
}); //함수 끝

	/* 다크모드 */
	document.getElementById("darkBtn").addEventListener("click", () => {	
		const a = document.querySelectorAll(".a");
		for ( var i = 0; i < a.length; i++ ) {
        	a[i].classList.toggle("item");
			a[i].classList.toggle("dark1");
      	}
		const z=document.querySelectorAll(".z");
		for( var i=0; i<z.length; i++){
			z[i].classList.toggle("darkLogo");
			z[i].classList.toggle("move");
		}
		const y=document.querySelectorAll(".y");
		for( var i=0; i<y.length; i++){
			y[i].classList.toggle("darkNews");
		}
	});

</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


