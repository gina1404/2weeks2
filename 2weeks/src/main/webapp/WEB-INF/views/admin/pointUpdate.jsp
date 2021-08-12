<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>
<body> 

<!-- insert후 
if문 성공시
member테이블에 update -->

<div class="container"> 
	<div class="input-form-backgroud row"> 
		<div class="input-form col-md-12 mx-auto"> 
			<h4 class="mb-3">포인트 변경</h4> 
			
		<form class="validation-form" action="<%=request.getContextPath() %>/admin/updatePointEnd.do" novalidate > 
			<div class="row"> 
				<div class="col-md-6 mb-3"> 
					<label for="id">아이디</label> 
					<input type="text" class="form-control" name="userId" placeholder="${userId}" readonly="readonly" value="${userId}" required> 
				</div> 
				<div class="col-md-6 mb-3"> 
					<label for="pointChange">변경포인트</label> 
					<input type="number" name="pointAmt" class="form-control" step="10" required> 
					<div class="invalid-feedback"> 포인트를 입력해주세요. </div> 
				</div> 
			</div> 
			<div class="mb-3"> 
				<label for="email">카테고리</label> 
				<input type="text" name="pointGb" class="form-control"  required> 
				<div class="invalid-feedback"> 카테고리를 입력해주세요. </div> 
			</div> 
			<div class="mb-3"> 
				<label for="address">상세내역</label> 
				<input type="text" class="form-control" name="pointDiscription" placeholder="" required> 
				<div class="invalid-feedback"> 상세내역을 입력해주세요. </div> 
			</div> 
	
			<hr class="mb-4"> 
			<button class="btn btn-primary btn-lg btn-block" type="submit">변경하기</button> 
			<button class="btn btn-primary btn-lg btn-block" onclick="fn_close();" type="button">닫기</button> 
		</form> 
	</div> 
</div> 
<footer class="my-3 text-center text-small"> <p class="mb-1">&copy; 2021 2weekS</p> </footer> </div>

<script >
	function fn_close(){
		window.close();
	}
</script>

</body>
</html>