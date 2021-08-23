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

	<section id="vaccine_center" class="container" style="display:flex; padding-bottom:200px;"> 
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<!-- <<<<<<< HEAD
	<div class="content">
		<div class="vaccine_box ">
			<h3 class="vaccineCenter_title">백신 접종센터</h3> 

			<div class="vaccineMap center-block defaultBoxshadow" id="map" class= "map" style="width:800px;height:550px;"></div>

			
======= -->
	<div class="content" style="display:inline-block; padding-left:220px;">
	<div style="justify-content:center; text-align:center;font-weight:bold; font-size:30px;">
		<h2>백신 접종 주의 사항</h2>
	</div>
	<br>
		<div class="defaultBoxshadow" style="padding:30px;">
			<h3 style="font-weight:bold;">코로나 <span style="color:orange;">예방접종 전</span> 주의사항</h3>
			<br>
			<h4><span style="color:green;">건강상태가 좋을 때</span> 코로나19 백신을 접종받는 것이 중요합니다</h4>
			<h4>접종 전 반드시 <span style="color:green;">의사의 예진</span>을 받아야 합니다.</h4>
			<h4>다음과 같은 경우는 <span style="color:green;">코로나19 예방접종을 받아서는 안됩니다.</span></h4>
			<br><br>
			<div style="justify-content:center; text-align:left; border:0.5px solid lightgray; width:fit-content;">
				<ul style="font-size:20px;">
					<li>코로나19 백신 구성 성분에 대한 아나필락시스*와 같은 심각한 알레르기 반응이 나타난 경우</li>
					<li>1차 코로나19 예방접종 후 아나필락시스와 같은 심각한 알레르기 반응이 나타난 경우, 첫 번째 백신과 동일 플랫폼의 백신으로 접종 금기</li>
					<li style="font-weight:bold;">1차 바이러스 벡터 코로나19 백신 접종 후 혈소판감소성 혈전증이 발생한 경우, 바이러스 벡터 코로나19 백신 접종 금기</li>
					<li style="font-weight:bold;">모세혈관 누출 증후군의 병력이 있는 경우, 아스트라제네카, 얀센 코로나19 백신 접종 금기</li>
				</ul>
			</div>
			<br><br>
			<h4>아나필락시스: 호흡곤란, 얼굴의 부기, 눈 또는 입술/입안의 부종, 몸 전체의 발진, 빠른 심장 박동, 현기증, 쇼크 등의 증상을 동반한 심각한 알레르기 반응</h4>
			<h4>약(장 세척제 등), 화장품, 음식, 다른 종류의 백신 접종 등에 대한 알레르기 병력이 있는 경우 예진표에 자세히 기록해 주세요!</h4>
			<h4>임신부와 18세 미만 소아청소년의 경우 백신 접종 후 안전성 및 유효성에 대한 임상연구 결과가 나오기 전까지 접종이 권고되지 않습니다.</h4>
			<br><br>
			<h4 style="color:blue; font-weight:bold">다음과 같은 경우는 예방접종을 연기합니다.</h4>
			<br>
			<div style="justify-content:center; text-align:left; border:0.5px solid lightgray; width:fit-content;">
				<ul style="font-size:20px;">
					<li>코로나19 감염이 의심되는 경우 선별진료소 등을 통해 신속히 진단검사를 받으셔야 하며, 결과가 나올 때까지 예방접종을 연기합니다.</li>
					<li>1차 코로나19 예방접종 후 아나필락시스와 같은 심각한 알레르기 반응이 나타난 경우, 첫 번째 백신과 동일 플랫폼의 백신으로 접종 금기</li>
					<li>격리 중인 코로나19 환자 및 접촉자는 격리해제 될 때까지 예방접종을 연기합니다.</li>		
				</ul>
			</div>
			<br><br>
			<h3 style="font-weight:bold;">코로나 <span style="color:orange;">예방접종 후</span> 주의사항</h3>
			<br>
			<ul style="font-size:20px;">
					<li>예방접종 후 <span style="color:green;">15~30분간</span> 접종기관에 머물러 이상반응 발생 여부를 관찰합니다.</li>
					<li>예방접종 후 <span style="color:green;">3시간 이상</span> 주의 깊게 관찰합니다.</li>
					<li>예방접종 후 <span style="color:green;">4주간은</span> 특별한 관심을 가지고 관찰하며 평소와 다른 신체 증상이 나타나면 바로 의사의 진료를 받도록 합니다.</li>
					<li>예방접종 후 <span style="color:green;">2일 정도는</span> 고강도 운동 및 활동, 음주를 삼가주세요.</li>
					<li>접종부위는 청결히 유지합니다.</li>
					<li>어르신은, 예방접종 후 혼자 있지 말고 다른 사람과 함께 있어 증상 발생 시 도움을 받을 수 있도록 합니다.</li>	
				</ul>
			<br><br><br>
			<div class="vaccine_box ">
				<h3 class="vaccineCenter_title" style="font-weight:bold;">내 근처 백신 접종센터</h3> 
				<div class="vaccineMap center-block defaultBoxshadow" id="map" class= "map" style="width:800px;height:550px;"></div>
			</div>
			<br><br><br>
			<div style="justify-content:center; text-align:center;">
				<div style="background-color:darkblue; font-weight:bold; font-size:30px; color:white; width:60%; display:inline-block;" onclick="window.open('https://ncvr2.kdca.go.kr/')"><span style="color:yellow;">코로나 19</span> 백신 사전예약 바로가기</div>
			</div>
			
			<br><br><br>
			<div style="color:darkgray; cursor:pointer">자료 출처: nip.kdca.go.kr</div>
>>>>>>> 3cc3a2e5ec424b90e433c26eea1c488e861ad6df
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