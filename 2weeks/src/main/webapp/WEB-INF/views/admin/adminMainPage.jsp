<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>2WeekS</title>
        
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="<%=request.getContextPath() %>/resources/AdminTem/css/styles.css" rel="stylesheet" />
         	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>	
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<%=request.getContextPath() %>/">2Weeks</a>
             <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="<%=request.getContextPath()%>/admin/adminPageList">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                관리자페이지
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원관리테이블
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/admin/admintable.do">권한 요청</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/admin/adminReporttable.do">신고 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                               공지사항
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath() %>/admon/NoticeWriter.do" >
                                        공지사항 작성
                                        
                                    </a>
            <!--                         <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div> -->
                                    
                                </nav>
                            </div>
                            <%-- <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="<%=request.getContextPath()%>/admin/admintable.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a> --%>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Admin
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">2WeekS</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">메인 페이지</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">총회원 수<br>${memberct }명</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">총 지식인 게시물 수<br>0개</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">지식인 바로가기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">미처리 권환요청 <br>0개</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="<%=request.getContextPath()%>/admin/admintable.do">권한요청 바로가기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">미처리 게시글신고 <br>0개</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">신고관리 바로가기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
               
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" >
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>성별</th>
                                            <th>번호</th>
                                            <th>획득 권한</th>
                                             <th>이메일</th>
                                            <th>포인트</th>
                                            <th>가입날짜</th>
                                             <th>신고내역</th>
                                            <th>포인트 변경</th>
                                            <th>회원 삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
          									  <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>성별</th>
                                            <th>번호</th>
                                            <th>획득 권한</th>
                                             <th>이메일</th>
                                            <th>포인트</th>
                                            <th>가입날짜</th>
                                             <th>신고내역</th>
                                            <th>포인트 변경</th>
                                            <th>회원삭제</th>
                                        </tr>
                                    </tfoot>
                                    <tbody style="font-size: 18px;">
                                    <c:forEach items="${list }" var="c">
                                        <tr>
                                            <td>${c.user_Id }
                                            <input type="hidden" name="userId" class="idCk" value="${c.user_Id }"/></td>
                                            <td>${c.user_Nm }</td>
                                            <td>${c.user_Nic }</td>
                                            <td>${c.user_Gender }</td>
                                            <td>${c.user_Phone }</td>
                                            <td>
                                            	<c:if test="${c.access_Gb eq NULL}">
                                            		N
                                            	</c:if>
                                            	<c:if test="${c.access_Gb ne NULL}">
                                            		${c.access_Gb }
                                            	</c:if>                             
                                            </td>
                                            <td>${c.user_Email }</td>
                                            <td>${c.userPoint_Cnt }</td>
                                            <td>${c.enroll_Dt }</td>
                                            
                                            <td><button id="${c.user_Id }" onclick="reportlist(this.id);" type="button"  class="btn btn-outline-primary" >내역확인</button></td>
                                            <td><button id="${c.user_Id }" type="button" onclick="fn_pointch(this.id);" class="btn btn-outline-primary">변경</button></td>
                                            <td> <button  id="${c.user_Id }" onclick="fn_deleteMember(this.id);" class="btn btn-outline-primary" >삭제</button></td>
                                        </tr>
                               	  </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/resources/AdminTem/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/resources/AdminTem/assets/demo/chart-area-demo.js"></script>
        <script src="<%=request.getContextPath() %>/resources/AdminTem/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/resources/AdminTem/js/datatables-simple-demo.js"></script>
    	<script >

    	
    	function fn_pointch(clicked_id){
    		console.log(clicked_id);
    		const userId=clicked_id;
    			const status="width=700px,height=600px,left=500px,top=500px";
    			const title="포인트변경";
    			const url="<%=request.getContextPath()%>/admin/updataPoint.do?userId="+userId;
    			open(url,title,status);

    		};
        		function reportlist(clicked_id){
        		
        		console.log(clicked_id);
        		const userId=clicked_id;
    			
    			const status="width=800px,height=320px,left=500px,top=500px";
    			const title="신고내역";
    			const url="<%=request.getContextPath()%>/admin/reportList.do?userId="+userId;
    			open(url,title,status);
    		}; 
    		function fn_deleteMember(clicked_id){
    			console.log(clicked_id);
    			const userId=clicked_id;
    			
    			const result=confirm("해당 아이디의 모든 정보가 삭제됩니다,정말로 삭제하시겠습니까?");
    			if(result){
    				location.assign('<%=request.getContextPath() %>/admin/deleteMember?userId='+userId);			
    				}	
    		}
    	</script>
    	
    	
    	
    </body>
</html>