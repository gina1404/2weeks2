<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=694f7aeb604a8ae9a442e75311b8159d&libraries=services,clusterer,drawing"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<link href="${pageContext.request.contextPath }/resources/css/center.css" rel="stylesheet" />

<main>
	<section id="content">
		<h2>선별진료소 지도</h2>
	
		<div id="map" style="width:800px;height:550px;"></div>
	</section>
</main>

<script>
	// var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	// var options = { //지도를 생성할 때 필요한 기본 옵션
	// 	center: new kakao.maps.LatLng(33.450701, 126.570667), 
	// 		//지도의 중심좌표. //회원가입할 때 받은 주소정보 기입
	// 	level: 3 //지도의 레벨(확대, 축소 정도)
	// };

	// var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>