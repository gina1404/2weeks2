<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=694f7aeb604a8ae9a442e75311b8159d&libraries=services,clusterer,drawing"></script>

<style>
	header .content{
		padding-left:220px !important;
		margin-top:0;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>

<link href="${pageContext.request.contextPath }/resources/css/covid/covidCenter.css" rel="stylesheet" />

<section class="container" style="display:flex; padding-bottom:200px;">	
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content " style="display:inline-block; padding-left:220px;">
		<h2>코로나 검사 받는 방법</h2>
		<div class="defaultBoxshadow" style="padding:30px;">
			<br>
			<div style="justify-content:center; text-align:center;">
				<img style="width:60%;" src="https://www.korea.kr/newsWeb/resources/attaches/2021.05/07/41e63f04646a0662d91b5ec088cfc626.jpg"/>
			</div>
			<br><br>
			<h3>1) 검사 진료소 찾기</h3>
			<div>검사를 병원에서 받을 수 있는지 확인하기. COVID-19 노출 혹은 감염이 의심되는 경우, 병원에 연락해서 방문 검사를 받을 수 있을지 문의해보자.
			병원 방문이 적절하지 않을 경우, 병원에서 검사소를 추천해 줄 수 있다.</div>
			<br>
			<h3>2) 가능한 검사 유형 물어보기</h3>
			<div>현재로서 COVID-19의 활성 감염을 진단할 수 있는 두 가지의 검사가 있다: RT-PCR 검사 및 항원 검사. RT-PCR 검사는 더 정확하고 신뢰할 수 있는 결과를 도출하지만, 항원 검사의 결과를 훨씬 더 빠르게 얻을 수 있다</div>
			<br>
			<h3>3) 거주 도시 혹은 주위 선별 검사소 확인하기</h3>
			<div>대부분의 검사소에서 드라이브스루 검사를 진행하고 있다. 거주 지역의 웹사이트에서 COVID-19 검사와 관련된 장소 및 시간 등의 정보를 찾아보자.</div>
			<br><br>
			<div id="map" style="width:800px;height:550px;" class="defaultBoxshadow"></div>
			<br><br>
			<div style="justify-content:center; text-align:center;">
				<div style="color:red;">코로나19 증상 의심시에는 먼저 관할 보건소 또는 1339 콜센터 등의 상담을 받으신 후 선별진료소를 방문하시기 바랍니다.</div>	
				<div style="color:red; text-decoration:underline;">※ 평일 18시 이후, 토요일, 일요일/공휴일에 선별진료소 방문시 해당기관의 운영시간 유선 확인 필요</div>
			</div>
			<h3>4) 약국에서 검사를 진행하는지 살펴보기</h3>
			<div>대형 약국에서 코로나바이러스 검사가 이루어질 수도 있다. 거주 지역의 약국에 전화를 해서 검사가 가능한지 알아보자</div>
			<br><br>
			<div style="justify-content:center; text-align:center;">
				<img style="width:60%;" src="https://www.korea.kr/newsWeb/resources/attaches/2021.05/07/802a47a2fefd1879b890b4bea824518b.jpg"/>
			</div>
			<br><br>
			<h3>5) 예약 및 방문</h3>
			<div>예약 없이 방문할 수도 있지만, 예약이 꼭 필요한 곳도 있다. 검사소의 웹사이트에서 정보를 찾아보거나, 질문이 있다면 전화를 해서 담당자에게 문의를 해보자.</div>
			<br>
			<div>검사를 받기 위해 신원을 확인해야 하기 때문에 운전면허증 등의 신분증을 지참하자.</div>	
			<br><br>
			<div style="justify-content:center; text-align:center;">
				<img style="width:60%;" src="https://www.fda.gov/files/styles/landscape_16_9_800_x_450/public/COVID-19-Test-Sample-Target-Locations-CU-03-1600x900_KOREAN.png?itok=GRMYD466"/>
			</div>
			<br><br>
			<h3>6) 코로나 검사</h3>
			<div>코로나바이러스의 1차 검사는 비인두(코)와 구강인두(목) 분비물 채취로 이루어진다. 이 검사를 받을 때 요원이 이 두 곳의 분비물을 채집할 수 있도록 가만히 있는 자세를 유지하는 것이 좋다. 살짝 불편함이 느껴질 수 있지만, 큰 통증이 느껴지지는 않는다.</div>
			<h3>7) 검사 결과 확인</h3>
			<div>적절한 샘플이 채집되었다면, 검사소에서 샘플을 포장한 후 연구소로 전달한다. 샘플 검사 진행이 완료된 후 검사 결과가 전송된다.[15]</div>
			<br><br><br>
			<div style="color:darkgray;">자료 출처: wikihow.com, fda.gov, korea.kr</div>
		</div>
	</div>
</section>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = { 
        	center: new kakao.maps.LatLng(37.49974204102743, 127.03305920369151), // 지도의 중심좌표 //학원
        	level: 7 // 지도의 확대 레벨      		
	};  	
	    
	var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성	
	var geocoder = new kakao.maps.services.Geocoder(); //주소-좌표 변환 객체 생성	
	var ps = new kakao.maps.services.Places(); //장소 검색 객체를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1}); //검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; //마커 이미지 주소		

	var positions=[]; //센터 이름, 주소들은 객체배열
	$(function(){		
		<c:forEach items="${list }" var="l">
			var position ={title : "${l.centerName}", addr : "${l.address}"};		
			positions.push(position);
		</c:forEach>
		
	    var clusterer = new kakao.maps.MarkerClusterer({ // 마커 클러스터러를 생성합니다 
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    });		   
	    
	    if (navigator.geolocation) { //크롬 https://에서만 가능
	        navigator.geolocation.getCurrentPosition(function(position) { // GeoLocation을 이용해서 접속 위치를 얻어옴	            
	            var lat = position.coords.latitude, // 위도
	                lon = position.coords.longitude; // 경도	            
	            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
	                message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용   
	            displayMarker(locPosition, message); // 마커와 인포윈도우를 표시
	          });
	    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정
	        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	            message = 'geolocation을 사용할수 없습니다'
	        displayMarker(locPosition, message);
	    }
	    	
	    function displayMarker(locPosition, message) { //지도에 마커와 인포윈도우를 표시하는 함수입니다	        
	        var marker = new kakao.maps.Marker({ //마커를 생성
	        	map: map, 
	            position: locPosition
	        }); 
	        
	        var iwContent = message, // 인포윈도우에 표시할 내용
	            iwRemoveable = true;
	        
	        var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우를 생성
	            content : iwContent,
	            removable : iwRemoveable
	        });	        
	        
	        infowindow.open(map, marker); // 인포윈도우를 마커위에 표시
	        map.setCenter(locPosition); // 지도 중심좌표를 접속위치로 변경 
	    }   	    
	    
		for(let i=0; i<positions.length; i++){			
			geocoder.addressSearch(positions[i].addr, function(result, status) {				
				var imageSize = new kakao.maps.Size(20, 30); // 마커 이미지 크기 			    
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); // 마커 이미지를 생성		
				
				var markers=[];
				if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면 //자료형까지 비교			
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);				
					if(coords!=null){ // 결과값으로 받은 위치를 마커로 표시합니다						
						marker = new kakao.maps.Marker({
						    map: map,
						    position: coords,						    
						    title : positions[i].title,						    
						    image : markerImage
						});
						markers.push(marker);
					}				
				} 			
		        clusterer.addMarkers(markers); // 클러스터러에 마커들을 추가합니다
			});			
		}				
	});	
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>