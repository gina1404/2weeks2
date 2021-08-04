<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/sidebar.css"> 

	<aside id="aside">
		<div id="pagescroll-button"  onclick="fn_top()"><img class="" src="${path }/resources/images/icons/darkmode.svg"/></div>
	</aside>
	
	<style>		
        #pagescroll-button{
        	display:none;
            width:30px;
            height:30px;
            bottom:60px;
			position:fixed;
			cursor: pointer;
        }
        #pagescroll-button:hover{
        	background-color: #555;
        }
	</style>
	
	<script>
	pagescrollButton = document.getElementById("pagescroll-button");

	// 문서 높이로부터 20px 아래로 스크롤하면 버튼이 보임
	window.onscroll = function() {fn_scroll()};

	function fn_scroll() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		  pagescrollButton.style.display = "block";
	  } else {
		  pagescrollButton.style.display = "none";
	  }
	}

	//버튼을 클릭하면 상단으로 올라감
	function fn_top() {
	  document.body.scrollTop = 0; //Safari
	  document.documentElement.scrollTop = 0; //Chrome, Firefox, IE and Opera
	}
	</script>