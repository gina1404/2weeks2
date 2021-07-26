<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<main id="home">		
	<section id="home-covid-domestic">test</section>
	<section id="home-covid-global"></section>
	<section id="home-covid-chart"></section>
	<section id="home-report&news"></section>
	<section id="home-community"></section>
</main>
	
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
		
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>

