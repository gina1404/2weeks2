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
.col-sm-12{
  float: left;
}
.outer {
  text-align: center;
}

.inner {
  display: inline-block;
  margin-top: 200px;
  margin-left: -700px;
}

</style>
<section class="content">
	<div class="container">
		<div class="wrapper">
			<div class="row ">
				<h4>
					<span title="category">${list.category }</span> <a class=""
						href="${path }/freeboard/readView?no=${list.post_Sq }">${list.post_Title}</a>
				</h4>
			</div>
				<div class="row" style="border: solid blue 10px; margin-top:5px;">
					<img src="">
					<div class="divider "></div>
					<span class="divi">조회 수 <b>${list.post_Cnt }</b></span>
					<div class="divider "></div>
					<span class="divi">추천 수 <b>${list.post_Like_Cnt }</b></span>
					<div class="divider "></div>
					<span class="divi">댓글 <b></b></span>
					<div class="divider"></div>
					<span class="divi">${list.post_Dt }</span>
				</div>
			</div>
				<div class="col-md-12 " style="border:solid black 1px; margin-top: 50px; margin-right: 500px;">
					<p><span style="font-size:16px; ">${list.post_Content }</span></p>
				</div>
		<div class="row text-center" style="width: 100% ">
			<div style="width: 100%; float: none; margin: 0 auto;">
				<button class="btn btn btn-danger btn-round" style="width: 100px; margin-top: 300px;">추천 수</button>
				<div></div>
			</div>
		</div>
		<div class="outer">
  
    <div class="inner">
      <span class="absolute">
      <button type="submit" class="update_btn">수정</button>
	<button type="submit" class="delete_btn">삭제</button>
	<button type="submit" class="list_btn">목록</button>	
      </span>
    </div>
  </div>
	</div>





</section>

<script>
	function backList(){
	window.history.back();	
		
	}
	$(".update_btn").on("click",function(){
		location.href="${path}/freeboard/updateBoard.do?no=${list.post_Sq }";
	})
	
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>