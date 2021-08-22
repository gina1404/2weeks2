<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/news/covidNews.css">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	

<!-- Team -->
<section id="team" class="pb-5">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
    <div class="container">
        <h1 class="section-title">NEWS</h1>
        <div class="row">
            <!-- Team member -->
            <c:forEach var="n" items="${list }">
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="${path }/resources/images/icons/hazmat.svg" alt="card image"></p>
                                    <h4 class="card-title" id="news-title"><c:out value="${n.title }"/></h4>
                                    <p class="card-text" id="news-content"><c:out value="${n.content }"/></p>
                                    <p class="card-text" id="news-date"><c:out value="${n.newsDate }"/></p>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h2 class="card-title">YTN 뉴스</h2>
                                    <p class="card-text"><a class="go-to-ytn" target="_blank" href="${n.url }"><c:out value="${n.content }"/></a></p>
                                 <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-github"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <!-- ./Team member -->
			
			
        </div>
        <span>${pageBar }</span>
    </div>
</section>

