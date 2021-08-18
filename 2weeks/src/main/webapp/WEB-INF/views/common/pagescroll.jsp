<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/sidebar.css"> 

	<aside id="aside">
		<div id="pagescroll-button"  onclick="fn_top()">
			<img class="" src="${path }/resources/images/icons/uparrow.png"/>
		</div>
	</aside>
	
	<style>		
        #pagescroll-button{
        	display:none;
            width:30px;
            height:30px;
            bottom:120px;
			position:fixed;
			cursor: pointer;			
        }        
        #pagescroll-button:hover{
        	background-color: #555;
        }
        #pagescroll-button img{
        	position: fixed;        	       	    
        	height: 25px;
        	width: 25px;
        	z-index: 999;
        	margin-left:5px;
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
	
	 <!-- 챗봇 연결 플러그인 -->
	  /* (function() {
	    var w = window;
	    if (w.ChannelIO) {
	      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	    }
	    var ch = function() {
	      ch.c(arguments);
	    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
	    w.ChannelIO = ch;
	    function l() {
	      if (w.ChannelIOInitialized) {
	        return;
	      }
	      w.ChannelIOInitialized = true;
	      var s = document.createElement('script');
	      s.type = 'text/javascript';
	      s.async = true;
	      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	      s.charset = 'UTF-8';
	      var x = document.getElementsByTagName('script')[0];
	      x.parentNode.insertBefore(s, x);
	    }
	    if (document.readyState === 'complete') {
	      l();
	    } else if (window.attachEvent) {
	      window.attachEvent('onload', l);
	    } else {
	      window.addEventListener('DOMContentLoaded', l, false);
	      window.addEventListener('load', l, false);
	    }
	  })();
	  ChannelIO('boot', {
	    "pluginKey": "cf7f84b9-913f-48bd-b7c6-898b55aeb3ef"
	  }); */
	<!-- 챗봇 연결 끝 -->
	
	</script>