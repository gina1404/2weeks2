<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<style>

	.st-mainbar{
		background-color: white;
		border: 1px solid rgb(207,207,207,0,25);
		box-shadow: rgba(0,0,0,0,024) -1px 1px 1px;
		z-index: -1;
		padding: 12px;
		border-radius: 16px;
		margin-bottom: 18px;
	}
	.st-bar1{
		margin: 0px 10px;
		padding: 6px 8px;
		border-radius: 12px;
		justify-content: space-around;
		display: flex;
		flex-direction: row;
	}
	.st-bar-decide{
		-webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	}
	.st-bar-decide-title{
		text-align: center;
		font-size: 12px;
		opacity: 0.7;
		margin-bottom: 0px;
		display: flex;
		flex-direction: row;
	}
	.st-bar-decide-count{
		text-align: center;
		font-size: 18px;
		font-weight: bold;
		opacity: 1;
		margin-bottom: 4px;
		color: rgb(235,83,116);
		display: flex;
		flex-direction: row;
	}
	.st-bar-death{
		-webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
        display: flex;
    flex-direction: column;
}
	.st-bar-death-title{
		text-align: center;
		font-size: 12px;
		opacity: 0.7;
		margin-bottom: 0;
		    display: flex;
    flex-direction: row;
	}
	.st-bat-death-count{
		text-align: center;
		font-size: 18px;
    font-weight: bold;
    opacity: 1;
    margin-bottom: 4px;
    display: flex;
    flex-direction: row;
	}
</style>

<section class="container">
	<h2 style="text-align: center;">전세계 해외 정보</h2>
	<div class="st-mainbar">
		<div class="st-bar1">
			<div class="st-bar-decide">
				<div class="st-bar-decide-title">확진자</div>
				<div class="st-bar-decide-count">${totalDef }명</div>
			</div>
			<div class="st-bar-death">
				<div class="st-bar-death-title">사망자</div>
				<div class="st-bat-death-count">${totalDet }명</div>
			</div>
		</div>
	</div>
	<h2 style="text-align: center;">오늘의 확진자 수</h2>
	<div>
		<div>
			<div>오늘의 확진자수</div>
			<div>${realtodayDef }명</div>
		</div>
	</div>
	
	
	

</section>



<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
		