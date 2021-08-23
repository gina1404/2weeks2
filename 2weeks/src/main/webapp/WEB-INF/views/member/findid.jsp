<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/member/findid.css" rel="stylesheet" />

<jsp:include page="/WEB-INF/views/common/header2.jsp"/>

<section class="container">

<div class="content">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6 find_box">
			<h3 class="text-center">
				아이디 찾기
			</h3>
			<div class="row">
			<div class="col-md-12">
				<div class="nm_input_box">
					<label for="user_Nm">이름</label>
					<input id="user_Nm" class="inputName" type="text" name="user_Nm" required>
				</div>
				<div class="email_input_box">
					<label for="user_Eamil">Email</label>
					<input id="user_Email" class="inputEmail" type="text" name="user_Email" required>
				</div>
				<div class="button_box">
					<button type="button" class="findidBtn find_button">ID 찾기</button>
					<div style="width:20px;"></div>
					<button type="button" onclick="history.go(-1);" class="find_button">Cancel</button>	
				</div>
				<div class="findidResult"></div>			
			</div>
			</div>
			
			<h3 class="text-center">
				비밀번호 찾기
			</h3>
			<div class="row">
			<div class="col-md-12">
				<div class="id_input_box">
					<label for="user_Id">Id</label>
					<input id="user_Id" class="input_userId" type="text" name="user_Id" required>
				</div>
				<div class="email_input_box">
					<label>Email</label>
					<input class="input_userEmail" type="text" name="user_Email" required>
				</div>
				<div class="button_box">
					<button type="button" class="findpwBtn find_button">비밀번호 찾기</button>
					<div style="width:20px;"></div>
					<button type="button" onclick="history.go(-1);" class="find_button">Cancel</button>
				</div>
				<div class="findpwResult"></div>
			</div>			
			</div>
		</div>
		<div class="col-md-3">
		</div>	
			
	</div>
	</div>
</section>

			

	
<script>
	//아이디찾기
	$(".findidBtn").click(function(){
		const user_Nm = $(".inputName").val();
		const user_Email=$(".inputEmail").val();
		$(".findidResult").html("<p class='text-center'>아이디를 찾고 있습니다...👀</p>");
		console.log(user_Nm);
		console.log(user_Email);
		$.ajax({
			url : '${pageContext.request.contextPath}/member/findid?user_Nm='+user_Nm+'&user_Email='+user_Email,
			type:'post',
			success:function(data){
				console.log(data);
				if(data==''){
				$(".findidResult").text("가입된 아이디가 없습니다. 이름,이메일을 다시 입력해주세요");
				$(".findidResult").css("color","red");
				}else{
				$(".findidResult").html("<p class='text-center'>회원님의 아이디는 : <strong><u>"+data +"</u></strong>입니다</p>");
				$(".findidResult").css("color","black");
				}
			}
		});
		
	});
	
	//비밀번호찾기
	$(".findpwBtn").click(function(){
		const user_Id = $(".input_userId").val();
		const user_Email2=$(".input_userEmail").val();
		$(".findpwResult").html("<p class='text-center'>회원님의 정보를 찾고 있습니다...👀</p>");
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
				$(".findpwResult").html("<p class='text-center' style='color:#03c75a'> "+data + "<br/>메일을 확인해주세요!</p>");
			}
		})
		
	})
	
	
	
</script>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>