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
			<div class="regionalKor-button">지도</div>
			<div class="regionalKor-button">지역별 표</div>
		</div>
		<!-- 지역별 현황 지도 표시 -->
		<div id="regionalKor-map" style="border:1.5px solid yellow;"></div>
		
		<!-- 지역별 현황 표 표시 -->
		<div id="regionalKor-table" style="border:1.5px solid purple; min-height:200px;">
			<c:forEach var="t" items="${list }">
				<div>${t.gubun } : ${t.defCnt } : ${t.incDec }</div>
			
			</c:forEach>
		</div>
		
		
</section>


<!-- 지도 그리기 -->
<script>
window.onload = function(){
	
}
window.onload = function() {
    drawMap('#regionalKor-map');
};

//지도 그리기
function drawMap(target) {
    var width = 100; //지도의 넓이 %
    var height = 500; //지도의 높이 px
    var scale = 4800; //확대시킬 값
    var labels; //라벨

    //geo 세팅
    	//축척
    var projection = d3.geo
    	.mercator()
        .scale(scale)
        .center([127-1.3, 37.6-1.15]) //서울 중심 좌표를 기준으로 조금씩 움직이며 맞췃음
    	.translate([width/2,height/2]);
    
    	//패스
    var path = d3.geo.path().projection(projection);

    //츨력
    var svg = d3
        .select(target)
        .append('svg')
        .attr('width', width + '%')
        .attr('height', height + 'px') //svg 영역 생성
        .attr('id', 'regionalKor-map') //id
        .attr('class', 'regionalKor-map'); //class

    var states = svg
        .append('g')
        .attr('id', 'states');


    //geoJson데이터를 파싱하여 지도그리기
    d3.json('${path}/resources/json/korea.json', function(json) {
        //지도 표시
    	states
            .selectAll('path') //지역 설정
            .data(json.features)
            .enter()
            .append('path')
            .attr('d', path)
            .attr('id', function(d) {
                return 'path-' + d.properties.name_eng;
            });

        //지역명 라벨 표시
         labels = states
            .selectAll('text')
            .data(json.features) //라벨표시
            .enter()
            .append('text')
            .attr('transform', render)
            .attr('id', function(d) {
                return 'label-' + d.properties.name_eng;
            })
            .attr('text-anchor', 'middle')
            .attr('dy', '.35em')
            .text(function(d) {
                return d.properties.name;
            }); 
    });

    //텍스트 위치 조절 - 하드코딩으로 위치 조절을 했습니다.
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
        }
        return 'translate(' + arr + ')';
    }

}
</script>
<!-- 지역별 현황 리스트 로딩 -->
<script>
	$("#regionalKor").each(function(){
		$.ajax({
			url:"${path}/covidUpdate/regional/kor.do",
			type:"post",
			dataType:"json",
			 success:function(data){
				/* 항목 */
				var str="<div class='regionalKor-table-title' style='display:flex;'>";
				str+="<div class='regionalKor-table-title-txt' style='display:inline-block; border:1px solid red;'>지역</div><div class='regionalKor-table-title-txt' style='display:inline-block; border:1px solid red;'>오늘 확진자</div><div class='regionalKor-table-title-txt' style='display:inline-block; border:1px solid red;'>총 확진자</div></div>";
				/* 값 */
				var i;
				for(i=2; i< 20;i++){ /* 검역 빼고 마지막 줄 합계까지 */
					str += "<div class='regionalKor-table-content' style='display:flex;'>";
					str += 		"<div class='regionalKor-table-txt' style='display:inline-block; border:1px solid green;'>"+data[i].gubun+"</div>";
					str += 		"<div class='regionalKor-table-txt' style='display:inline-block; border:1px solid green;'>"+data[i].defCnt+"</div>";
					str += 		"<div class='regionalKor-table-txt' style='display:inline-block; border:1px solid green;'>"+data[i].incDec+"</div>";
					str += "</div>"
				}
				str+="</div>";
				$("#regionalKor-table").append(str);
			}, 
			error:(r,m,s)=>{
				console.log(r);
				console.log(m);
				console.log(s);
			}
		});
	})
	
	
		
</script>		