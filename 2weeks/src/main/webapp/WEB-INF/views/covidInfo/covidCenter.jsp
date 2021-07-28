<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=694f7aeb604a8ae9a442e75311b8159d&libraries=services,clusterer,drawing"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<link href="${pageContext.request.contextPath }/resources/css/covidCenter.css" rel="stylesheet" />

<section class="container">	
	<h2>선별진료소 지도</h2>
	
	<%-- <table>
		<c:forEach var="l" items="${list }">
			<tr><td>${l.centerName } ${l.address }</td></tr>
		</c:forEach>
	</table> --%>	
	
	<div id="map" style="width:800px;height:550px;"></div>	
</section>

<script>
	var mapContainer = document.getElementById('map'), mapOption = {// 지도를 표시할 div 		
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 //회원가입 주소
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	/* $(function(){
		var positions=[];
		<c:forEach items="${list }" var="l">
			var addr= "${l.address}";			
			positions.push(addr);
		</c:forEach>		
		//console.log(positions);
	}); */
	
	$(function(){
		var positions=[];
		<c:forEach items="${list }" var="l">
			var name= "${l.centerName}";
			var addr= "${l.address}";
			var position ={title : "${l.centerName}", addr : "${l.address}"};
			positions.push(position);
		</c:forEach>		
		console.log(positions[title]);
	});
	
	//주소 title
	$(function(){
		var positions=[];
		<c:forEach items="${list }" var="l">
			var position ={title : "${l.centerName}", addr : "${l.address}"};		
			positions.push(position);				
		
			geocoder.addressSearch(positions[title], function(result, status) {
				
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
				
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
					    map: map,
					    position: coords
					});
					
					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
					    content: '<div style="width:150px;text-align:center;padding:6px 0;">positions[addr]</div>'
					});
					infowindow.open(map, marker);
					
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				} 
			});
		</c:forEach>
		
	});
	
	/* geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
		
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
			    map: map,
			    position: coords
			});
			
			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
			    content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			});
			infowindow.open(map, marker);
			
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		} 
	});     */

</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>