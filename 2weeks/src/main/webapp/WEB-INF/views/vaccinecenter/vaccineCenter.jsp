<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/css/vaccineCenter/vaccineCenter.css" rel="stylesheet" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08a0d4e04dcc955ad3c18d47ca36d741"></script>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<section id="vaccine_center" class="container"> 
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

	<div class="content">
		<div class="vaccine_box">
			<h3 class="vaccineCenter_title">백신 접종센터</h3> 
			<div class="vaccineMap center-block" id="map" class= "map" style="width:800px;height:550px;"></div>
		</div>
	</div>
	</section>

<script>
/* var content = '<div class="wrap">' + 
'    <div class="info">' + 
'        <div class="title">' + 
'            카카오 스페이스닷원' + 
'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
'        </div>' + 
'        <div class="body">' + 
'            <div class="img">' +
'                <img src="#" width="73" height="70">' +
'           </div>' + 
'            <div class="desc">' + 
'                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
'                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
'            </div>' + 
'        </div>' + 
'    </div>' +    
'</div>'; */

	
	var mapContainer =document.getElementById('map') 
	var mapOptions = { //지도 생성 시 필요 옵션
		center:new kakao.maps.LatLng(37.49974204102743, 127.03305920369151), //지도 중심(위도,경도)
		level:7  //지도 레벨(확대,축소)
	};
	var map = new kakao.maps.Map(mapContainer,mapOptions); //지도 생성 및 객체 리턴
	
	//마커를 표시할 위치, title객체 배열
	var positions = [
		<c:forEach var="center" items="${data}">		
		 {content:'<div class="info_div">'+
					 '<div class="info_First">'+
					 	'<div class="info_centerName"><strong>${center.centerName}</strong></div>'+		 
					 '</div>'+
					 	'<div class="info_second">'+
							'<div class="info_address"> 주소 :${center.address}</div>'+
						 	'<div class="info_phoneNumber">전화번호: ${center.phoneNumber} </div>'+
						'</div>'+
			 	'</div>',
			
			 
			 title:'${center.centerName}',latlng:new kakao.maps.LatLng(${center.lat},${center.lng}) },
		</c:forEach>
		];
		//console.log(positions);
		
	//마커 이미지 주소
	var imageSrc = "${pageContext.request.contextPath}/resources/images/vaccineCenter/002.png";
	
	for(var i=0; i<positions.length; i++){
		//마커 이미지의 이미지크기
		var imageSize = new kakao.maps.Size(26,33);
		//마커 이미지 생성
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		//마커를 생성
		var marker = new kakao.maps.Marker({
			map:map, //마커를 표시할 지도
			position: positions[i].latlng, //마커를 표시할 위치
			title: positions[i].title, //마커의 타이틀, 마우스를 올리면 타이틀 표시
			image: markerImage//마커이미지	
			//clickable: true			
		});		
		
	    // 마커에 표시할 info 생성
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 이벤트 등록
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		

	}
	// info표시 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// info닫기 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	


	
	
	
/* 	//컨트롤러 추가
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤
	var mapTypeControl = new kakao.maps.MapTypeControl();
	//오른쪽상단
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); */
	

					
	


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>