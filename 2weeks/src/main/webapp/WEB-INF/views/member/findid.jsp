<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="container">
		<div class="find">		
				<div class="findid_title">
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>이름</label>
						<input class="inputName" type="text" name="user_Nm" required>
					</p>
					<p>
						<label>Email</label>
						<input class="inputEmail" type="text" name="user_Email" required>
					</p>
					<p>
						<button type="button" class="findidBtn">ID 찾기</button>
						<button type="button" onclick="history.go(-1);">Cancel</button>
					</p>
					<div class="findidResult"></div>
				</div>
				<div class="findpw_title">
					<h3>비밀번호 찾기</h3>
				</div>
				<div>
					<p>
						<label>Id</label>
						<input class="input_userId" type="text" name="user_Id" required>
					</p>
					<p>
						<label>Email</label>
						<input class="input_userEmail" type="text" name="user_Email" required>
					</p>
					<p>
						<button type="button" class="findpwBtn">비밀번호 찾기</button>
						<button type="button" onclick="history.go(-1);">Cancel</button>
					</p>
					<div class="findpwResult"></div>
				</div>
			
	</div>
	
<script>
	//아이디찾기
	$(".findidBtn").click(function(){
		const user_Nm = $(".inputName").val();
		const user_Email=$(".inputEmail").val();
		console.log(user_Nm);
		console.log(user_Email);
		$.ajax({
			url : '${pageContext.request.contextPath}/member/findid?user_Nm='+user_Nm+'&user_Email='+user_Email,
			type:'post',
			success:function(data){
				if(data==''){
				$(".findidResult").text("가입된 아이디가 없습니다. 이름,이메일을 다시 입력해주세요");
				$(".findidResult").css("color","red");
				}else{
				$(".findidResult").text("아이디 : "+data);
				$(".findidResult").css("color","blue");
				}
			}
		});
		
	});
	
	//비밀번호찾기
	$(".findpwBtn").click(function(){
		const user_Id = $(".input_userId").val();
		const user_Email2=$(".input_userEmail").val();
		console.log(user_Id);
		console.log(user_Email2);
		$.ajax({
			url:'${pageContext.request.contextPath}/member/findpw',
			contentType: 'application/json; charset=utf-8',
			type:'post',
			dataType:'text',
			data:JSON.stringify({
				user_Id : user_Id,
				user_Email : user_Email2
			}),
			success:function(data){
				console.log(data);
				$(".findpwResult").text(data);
			}
		})
		
	})
	
	
	
</script>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>