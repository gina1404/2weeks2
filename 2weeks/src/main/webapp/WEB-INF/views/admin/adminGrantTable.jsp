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
        <title>2WeekS admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="<%=request.getContextPath() %>/resources/AdminTem/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
       <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<%=request.getContextPath() %>/">2Weeks</a>
             <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
			<a href="<%=request.getContextPath() %>/"><button class="btn btn-outline-primary" style="position: relative; left: 1500px;">메인으로가기</button></a>
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
                        <h1 class="mt-4">권한관리</h1> <br>

                        <div class="card mb-4">

                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               권한요청테이블
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>회원아이디</th>
                                            <th>신청 카테고리</th>
                                            <th>증명 이미지(클릭시 확인가능)</th>
                                            <th>권한 승인</th>                                            
                                            <th>승인 취소</th>                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>회원아이디</th>
                                            <th>신청 카테고리</th>
                                            <th>증명 이미지</th>
                                            <th>권한 승인</th> 
                                             <th>승인 취소</th>          
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${list }" var="c">
                                        <tr>
                                            <td>${c.user_Id }</td>
                                            <td>${c.grantTo_Kategorie }</td>
                                            <td id="${c.grantTo_Filename }" onclick="fn_openImg(this.id);" style="cursor:pointer;">${c.grantTo_Filename }</td>
                                            <td><button id="${c.user_Id }" name="${c.grantTo_Kategorie }" onclick="fn_updateGrYn(this.id,this.name);" class="btn btn-outline-primary" >권한주기</button></td>
                                        	<td><button class="btn btn-outline-primary" onclick="fn_grantcansel(this.id);" id="${c.user_Id }">취소</button></td>
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/resources/AdminTem/js/datatables-simple-demo.js"></script>
    </body>
        <script>
        function fn_openImg(a){
        	const img=a;
			const status="width=600px,height=600px,left=500px,top=500px";
			const title="이미지";
			const url="<%=request.getContextPath()%>/admin/openGrantImg.do?img="+img;
			open(url,title,status);
        };
        function fn_updateGrYn(c,d){
			const userId=c;
			const kate=d;
			console.log(userId);
			console.log(kate);
			
      		
        	  location.assign('<%=request.getContextPath() %>/admin/updateGrantEnd?userId='+userId+'&kate='+kate); 		 
      			
      		
        };
        function fn_grantcansel(id){
        	const userId=id;
        	 location.assign('<%=request.getContextPath() %>/admin/deleteGrant?userId='+userId); 	
        }
        </script>
</html>