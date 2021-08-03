<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/covid/regionalKor.css">
<script type="text/javascript" src="${path}/resources/js/d3.js"></script>

<section id="regionalKor" style="width:80%; min-height:300px; margin:10%; border:1px solid blue; background-color:white;">
		<!-- 지도/표 선택 버튼 -->
		<div style="display:flex;justify-content:space-around">
			<button class="regionalKor-button" onclick="fn_selectButton1()">지도</button>
			<button class="regionalKor-button" onclick="fn_selectButton2()">지역별 표</button>
		</div>
		<!-- 지역별 현황 지도 영역 -->
		<div id="regionalKor-map" style="border:1.5px solid yellow;"></div>		
		<!-- 지역별 현황 표 영역 -->
		<div id="regionalKor-table" style="border:1.5px solid purple; display:none;"></div>
		
		
</section>

<!-- 지역별 현황 출력 -->
<script>
/* 버튼 선택에 따라 보이는 영역 달라지게 */
function fn_selectButton1(){
	$("#regionalKor-map").show();
	$("#regionalKor-table").hide();
}
function fn_selectButton2(){
	$("#regionalKor-map").hide();
	$("#regionalKor-table").show();
}

/* 지역별 현황 출력*/
$("#regionalKor").each(function(){	
    $.ajax({ //0. 지역별 현황 DB 값 가져오기
        url:"${path}/covidUpdate/regional/kor.do",
        type:"post",
        dataType:"json",
        success:function(data){
             //1. 지역별 현황 표 출력 
             //항목
            var str="<div class='regionalKor-table-title' style='display:flex;'>";
            str+="<div class='regionalKor-table-title-txt' style='display:inline-block; border:1px solid red;'>지역</div><div class='regionalKor-table-title-txt' style='display:inline-block; border:1px solid red;'>오늘 확진자</div><div class='regionalKor-table-title-txt' style='display:inline-block; border:1px solid red;'>총 확진자</div></div>";
             //값
            for(var i=2; i<20;i++){ //검역 빼고 마지막 줄 합계까지 출력
                str += "<div class='regionalKor-table-content' style='display:flex;'>";
                str += 		"<div class='regionalKor-table-txt' style='display:inline-block; border:1px solid green;'>"+data[i].gubun+"</div>"; //지역
                str += 		"<div class='regionalKor-table-txt' style='display:inline-block; border:1px solid green;'>"+data[i].incDec+"</div>"; //오늘 확진
                str += 		"<div class='regionalKor-table-txt' style='display:inline-block; border:1px solid green;'>"+data[i].defCnt+"</div>"; //총 확진
                str += "</div>"
            }//값 출력 끝
            str+="</div>";
            $("#regionalKor-table").append(str);
            
            
            //2. 지역별 현황 지도 출력
            var width = 100; //지도의 넓이 %
            var height = 500; //지도의 높이 px
            var scale = 4800; //확대시킬 값
            var labels; //라벨
            //geo 세팅 : 축척 - 서울 중심 좌표를 기준으로 조금씩 움직이며 맞췃음
            var projection = d3.geo.mercator().scale(scale).center([127-1.3, 37.6-1.15]).translate([width/2,height/2]);
            var path = d3.geo.path().projection(projection);
        
            //지도 츨력
            var svg = d3.select('#regionalKor-map').append('svg').attr('width', width + '%').attr('height', height + 'px').attr('id', 'regionalKor-map').attr('class', 'regionalKor-map');			
            var states = svg.append('g').attr('id', 'states');        
        
            //geoJson데이터를 파싱하여 지도그리기
            d3.json('${path}/resources/json/korea.json', function(json) {				
            	//지도 표시
                states.selectAll('path').data(json.features).enter()
                .append('path').attr('d', path).attr('id', function(d) { return 'path-' + d.properties.name_eng;})
                .attr('fill', function(d){ //확진자 수에 따라 배경 색 변경
                	var mapColor;
                	for(var k=2;k<20;k++){
                		if(d.properties.name==data[k].gubun){
                			console.log(d.properties.name+":"+data[k].gubun);
                			if(data[k].incDec<50) mapColor='blue';                			
                			else if(data[k].incDec>=50 && data[k].incDec<100) mapColor='green';
                			else mapColor='red';
                		}
                	}
                	return mapColor;
                });
                
                
            
                //라벨 표시
                labels = states.selectAll('text').data(json.features).enter()
                	.append('text')
					.text(function(d) { //출력할 값 추가
	                	 var incDec;
	                	 var defCnt;
	                	 for(var j=2;j<20;j++){
	                		 if(d.properties.name==data[j].gubun){ //구분값(지역명)이 일치할 경우
	                    		 incDec=data[j].incDec; //오늘 확진자 수
	                    		 defCnt=data[j].defCnt; //총 확진자 수
	                    	 }                		 
	                	 }                	 
	                	 return d.properties.name+':'+incDec+':'+defCnt;                	 
	                 })
					.attr('transform', render) //render 값으로 위치를 조절함
					.attr('id', function(d) { return 'label-' + d.properties.name_eng;}) //id 추가
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
</script>