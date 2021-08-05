<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=694f7aeb604a8ae9a442e75311b8159d&libraries=services,clusterer,drawing"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<link href="${pageContext.request.contextPath }/resources/css/covid/covidCenter.css" rel="stylesheet" />

<section class="container">	
	<h2>선별진료소 지도</h2>	
	<div id="map" style="width:800px;height:550px;"></div>	
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