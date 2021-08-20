<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="updates/domestic"/>
</jsp:include>
<
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6944e39f85fb8e5ca0d10ff408274b51"></script> -->

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/domestic/domestic.css">

<section class="container" style="display:flex;">
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<div class="content" style="display:inline-block; padding-left:220px;">	
		<h2>국내 확산 현황</h2>


		<div class="Domestic" style="display:block;">
			<div class="topwrap">
				<div class="middlewrap">
					<div class="bottomwrap">
						<div class="bottomwrap-child">확진자</div>
						<div class="bottomwrap-child2"> 232,859</div>
						<div class="bottomwrap-child3"> 
							<div class=""></div>
							<div size="12" class="">
							</div>
						</div>
					</div>
					<div class="bottomwrap">
						<div class="bottomwrap-child">총 사망자</div>
						<div class="bottomwrap-child-died">2,197</div>
						<div color="grey" class="">
							<div class=""></div>
							<div size="12" class="">
							</div>
						</div>
					</div>
					
					<div class="bottomwrap">
						<div class="bottomwrap-child">완치자</div>
						<div class="bottomwrap-child-recovery">1234</div>
						<div color="green" class="">
								<div class=""></div>
								<div size="12" class="">
							</div>
						</div>
					</div>
					
					<div class="bottomwrap">
						<div class="bottomwrap-child">검사자</div>
						<div class="bottomwrap-child-test">12,567,009</div>
						<div color="blue" class="">
							
							<div class=""></div>
							<div size="12" class="">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>






		<div style="text-align: center;">
			<section id="domestic-covid-chart" style="width:45%; display:inline-block;">
			
			
			
			
				<jsp:include page="/WEB-INF/views/covidUpdate/regionalKor.jsp"></jsp:include>
			</section>
		</div>
	</div>
</section>
		
		
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	


