<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2weeks</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://kit.fontawesome.com/d4b4124527.js" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/common/header.css">

</head>
<body style="margin:0; padding:0;">
	<header id="header">
		<!-- 로고 -->
		<%-- <div class="header-logo-area"><a class="header-logo" href="${path }/">2weeks</a></div>
		 --%>
		<div class="content"  style="align-items: center; padding-left:120px;">
		<div id="header-main-area" style="display: flex; width:1143px; height:60px; justify-content:flex-end;">
		<!-- 키워드 검색 -->
		<div class="header-search-area">			
			<input id="searchKeyword" type="text" name="searchKeyword" style="display:none;" onKeypress="javascript:if(event.keyCode==13) {fn_searchKeyword()}"> <!-- 입력창 -->
			<img id="searchKeywordSubmit" class="header-icon" src="${path }/resources/images/icons/search.svg"/> <!-- 돋보기 버튼 -->
		</div>
	            
		<!-- 기본 아이콘 -->
		<div class="header-icon-area">
			<div> <!-- 구분선 -->
				<img class="header-divider" src="${path }/resources/images/icons/divider-virtical.svg"/>
			</div>
			<div class="header-icon">
				<img class="" src="${path }/resources/images/icons/darkmode.svg" />
			</div>
			<div class="header-icon">
				<img class="" src="${path }/resources/images/icons/language.svg"/>  
				</div>
					<c:if test="${userId eq null and member.user_Id eq null}">
	                	<div class="header-profile-text" onclick="location.href='${path}/member/login'" style="cursor:pointer;">LOGIN HERE!</div>
	            	</c:if>
	            	<c:if test="${userId ne null}" >
	            		<div class="header-profile-text">${user_Nic} 님</div>
	            		<%-- <input type="hidden" value="${user_Nic}" id="hidden_session_kakao"/> --%>
					         <div class="dropdown-content">
			            		<a href="${path}/member/myinfo">회원 정보 변경</a>
			            		<a href="${path}/member/mypage?loginId=${chatId }">나의 활동 보기</a>
			            		<a href="#">나의 포인트 ${member.userPoint_Cnt} 원</a>
			            		<a href="${path}/member/kakaologout">로그아웃</a>			            		
			            	</div>
			            	<div class="header-message" id="messageIcon">
			                	<i class="far fa-envelope fa-lg" onclick="location.href='${path}/message/messagelist'" style="cursor:pointer;"></i>
			                </div>
	            		<input type="button" value="로그아웃" onclick="location.href='${path}/member/kakaologout'"/>
	            	</c:if>

	            	<%-- <c:if test="${member.user_Nic ne null }">
	            		<div class="header-profile-text">${member.user_Nic}</div>
	            		<input type="hidden" value="${member.user_Nic}" id="hidden_session_id"/>
	            		<input type="button" value="로그아웃" onclick="location.href='${path}/member/logout'"/>
	            	</c:if>	
	                <div class="header-profile-icon">
	                    <img class="" src="${path }/resources/images/icons/profile.svg" style="margin: 0;"/>
	                </div> --%>

	            	
					<div class="dropdown">
		            	<c:if test="${member.user_Nic ne null }">
			                <div class="header-profile-icon">
			                    <img class="" src="${path }/resources/images/icons/profile.svg" style="margin: 0;"/>
			                </div>
		            		<div class="header-profile-text" id="nick">${member.user_Nic}님 </div>  
			            	<div class="dropdown-content">
			            		<a href="${path}/member/myinfo">회원 정보 변경</a>
			            		<a href="${path}/member/mypage?loginId=${chatId }">나의 활동 보기</a>
			            		<a href="#">나의 포인트 ${member.userPoint_Cnt} 원</a>
			            		<a href="${path}/member/logout">로그아웃</a>			            		
			            	</div>
			            	<div class="header-message" id="messageIcon">
			                	<i class="far fa-envelope fa-lg" onclick="location.href='${path}/message/messagelist'" style="cursor:pointer;"></i>
			                	<span class="recMs"></span>
			                </div>
		            	</c:if>
	            	</div>
	            	
	            	
	            		

	                <!-- member profile 사진 받아올 경우 -->
	                <div class="header-profile-photo">
	                	<img class="" src="${path }/resources/images/icons/profile.svg" style="margin: 0;"/>
	                </div>

	                
	                
	            </div>
	       </div>   
	       </div> 
	      <script>
	      //메세지 알림 웹소켓
	  	var msSocket=null;

		  $(document).ready(function (){
			   connectWs();
		   });
		   
		   function connectWs(){
		   	msSock =new SockJS("http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/messageServer");
		   	msSocket= msSock;
		   	console.log("connectWs");
		   	
		   	msSock.onopen = function(){
		   	console.log("opopen " );
		   };
		   
		   msSock.onmessage = function(evt){
				var data = evt.data;
				console.log(data);
				if(data == "new message"){
					messageToast();
				}
				
				var splitdata = evt.data.split(":");
				console.log(+splitdata[1]);
				if(splitdata[0].indexOf("recMs") > -1){
					var num1= +splitdata[1];
					console.log("num1 = "+num1);
					if(num1 == 0){
						$("<span></span>").replaceAll(".recMs");
						
					}else{
						console.log(num1);
						$(".recMs").append(num1);
						$(".recMs").css({
								"position": "absolute",
							    "top": "-10px",
							    /* "right": "15px", */
							     "left":"10px", 
							    "z-index": "3",
							    "height": "18px",
							    "width": "18px",
							    "font-size":"15px",
							    /* "font-weight":"bold", */
							    "line-height": "20px",
							    "text-align": "center",
							    "background-color": "red",
							    "border-radius": "15px",
							    "display": "inline-block",
							    "color":"white",
						});

					}
				}
				
				console.log("recvMsg" +data);
				
				//messageToast();
				
				
				//$.toast('새로운 메세지가 도착했습니다');
		   };
		   msSock.onclose = function(){
		   	console.log("onclose");
		   };
		   
		   msSock.onerror = function(err){console.log("error",err);};
			
			}
		   
		   function messageToast(){
			   toastr.info('알림', '새로운 메세지가 도착했습니다.', {timeOut: 7000});

		   }



	      </script>
	</header>     
    

	<!-- 키워드 검색  -->
	<script>			
		/* 검색 함수 선언 */
		function fn_searchKeyword(){		
			// 검색어가 입력되지 않을 경우 경고 알림					
			if($("#searchKeyword").val()==""){ //검색어가 null
				alert('검색어를 입력해 주세요.');
				$("#searchKeyword").focus();
				return false;
			}else if($("#searchKeyword").val().length<2){ //검색어가 2글자 미만
				alert('두 글자 이상 입력해 주세요.');
				$("#searchKeyword").val("");
				$("#searchKeyword").focus();
				return false;
			}else{ //검색어를 컨트롤러에 전달
				var currentUrl=document.location.href; //현재 페이지 url을 받아옴 -> http://localhost:9090/ 이 부분을 잘라냄
				currentUrl=currentUrl.substring(currentUrl.indexOf("/")).substring(currentUrl.indexOf("/")).substring(currentUrl.indexOf("/")).substring(currentUrl.indexOf("/")+1); 
				
				//현재 페이지 url을 매핑 주소를 비교해 분기 처리
				if(currentUrl=='${path}/test/test.do'){ //->이건 테스트용으로 주소 설정한 것. 수정해야 됨
					console.log("다른 주소임");
				}else{ //기본 전체 검색(커뮤니티, 지식인, 외부)
					location.href='${path }/searchResult.do?searchKeyword='+$('input[name=searchKeyword]').val();
				}
			}
		}
		
		$(document).ready(function(){
			$("#searchKeywordSubmit").click(function(){ 
				$("#searchKeyword").show(); //돋보기 아이콘을 클릭하면 입력창이 보이게 보이게 됨
				$("#searchKeyword").focus();			
				$("#header-main-area").addClass("defaultBoxshadow2");
				//검색
				$("#searchKeywordSubmit").click(fn_searchKeyword);						
			});
		});
	</script>

