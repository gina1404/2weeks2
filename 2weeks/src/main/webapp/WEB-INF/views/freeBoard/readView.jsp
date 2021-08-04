<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<style>
.container {
  padding-right: 30px;
  padding-left: 30px;
  margin-right: auto;
  margin-left: 20%;
  margin-top:5%;
}
h4 > span{
    display: block;
    margin-bottom: 4px;
    color: #ff5722;
    font-weight: bold;
    font-size: 12px;
}
a{
text-decoration:none;
color: #000;
}
.wrapper > .row{
margin-top:5%;
}
.divi{
font-size : 12px;
}

</style>
<section class="content">
	<div class="container">
		<div class="wrapper">
			<div class="row ">
				<h4>
				<span title="category">${list.category }</span>
				<a class="" href="${path }/freeboard/readView?no=${list.post_Sq }">${list.post_Title}</a>
				</h4>
			</div>
			<div class="btm_area clear">
				<div class="row">
					<img src="">
					<div class="divider "></div>
					<span class="divi">조회 수 <b>${list.post_Cnt }</b></span>
					<div class="divider "></div>
					<span class="divi">추천 수 <b>${list.post_Like_Cnt }</b></span>
					<div class="divider "></div>
					<span class="divi">댓글 <b></b></span>
					<div class="divider"></div>
					<span class="fa fa-clock-o "></span> <span class="divi">${post_Dt }</span>
				</div>
			</div>
		</div>
	</div>
</section>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>