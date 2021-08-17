<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내역</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>

	<div>
		<table class="table table-striped">
			 <thead>
			   <tr>
			      <th>아이디</th>
			      <th>게시판명</th>
			      <th>게시글 번호</th>
			      <th>신고사유</th>
			      <th>상세사유</th>
			      <th>신고처리 유무</th>
			   </tr>
			 </thead>
			 <tbody>
			 <c:forEach items="${list }" var="c">
			   <tr>
					<td>${c.user_Id }</td>
                   <c:if test="${c.post_Sq ne 0}">
                       <td>일반게시물</td>
                       <td>${c.post_Sq }</td>
                   </c:if>
                   <c:if test="${c.kin_Sq ne 0}">
                       <td>지식인게시물</td>
                       <td>${c.kin_Sq }</td>
                   </c:if>
                   <c:if test="${c.post_Reply_Sq ne 0 }">
                       <td>일반게시물 댓글</td>
                       <td>${c.post_Reply_Sq }</td>
                   </c:if>
                   <c:if test="${c.kin_Reply_Sq ne 0}">
                       <td>지식인게시물 댓글</td>
                       <td>${c.kin_Reply_Sq }</td>
                   </c:if>
                      <td>${c.report_Reason }</td>
                      <td>${c.report_Detail_Reason }</td>
                      <td>${c.report_Yn }</td>
			   </tr>
			 </c:forEach>

			 </tbody> 
			
		</table>
	</div>
</body>
</html>