<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="자유게시판"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<section id="content">
	<div align="center">
<br>
<div align="center">
이미지 게시판
</div>
<br>
<table width="600">
<tr>
<td colspan="2">Total ${totalcount } article pages / Now page is ${nowcount } </td>
<td align="right"><input type="button" value="게시물 등록" onclick="javascript:location.href='<%=cp %>/image/write.do';"></td>
</tr>
<tr>
<%-- <%int i=0; %> --%>
<c:set var="a" value="0"></c:set>
<c:forEach var="dto" items="${lists}">
 
<td align="center"><img alt="" src="${Path }${dto.saveFileName}" width="180" height="180"> <br>
<a href="delete.do?num=${dto.num }" ><font size="2">${dto.subject } 삭제</font> </td>
<%-- <%i++;
if(i==3){%> --%>
 
<c:set var="a" value="${a+1 }"></c:set>
 
<c:if test="${a==3 }">
</tr><tr>
 
<c:set var="a" value="0"></c:set>
</c:if>
<%-- <%i=0;} %> --%>
 
</c:forEach>
</tr>
</table>
<div align="center">
            <p>
             <%--    <c:if test="${dataCount!=0 }">
                    ${pageIndexList }
                    </c:if>                
                <c:if test="${dataCount==0 }">
                    등록된 게시물이 없습니다.
                    </c:if> --%>
            </p>
        </div>
<div style="background-color: gray; height: 3px;width: 600px">
</div>
	
</section>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
