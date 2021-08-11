<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Static Navigation - SB Admin</title>
        <link href="<%=request.getContextPath() %>/resources/AdminTem/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
       <style>
	    div#board-container{width:400px; margin:0 auto; text-align:center;}
	    div#board-container input{margin-bottom:15px;}
    </style>
    	<style>
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	#subject{
		width:100%;
	}
	.title_input{
		overflow: hidden;
		padding: 15px 3px 11px;
		border-bottom: 1px solid #e9eaeb;
		clear: both;
		margin: 0;
	}
	.title_input textarea{
		padding: 0;
		width: 80%;
		border: 0;
		font-size: 21px;
		line-height: 24px;
		resize: none;
		outline: none;
	}
	.btn{
		border-top: 1px solid #f5f5f5;
		margin: 0;
		padding: 0;
	}
	.btnbtn{
		display: inline-block;
		border: 0;
		padding: 0;
		text-align: right;
		line-height: 48px;
		background: transparent;
		font-size: 16px;
		color: #333;
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
		margin: 0px;
		left: 750px;
		position: relative;
	}
	.btnbtn2{
		display: inline-block;
		border: 0;
		padding: 0;
		text-align: right;
		line-height: 48px;
		background: transparent;
		font-size: 16px;
		color: #333;
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
		margin: 0px;
		left: 800px;
		position: relative;
	}
	.btbt{
		display: inline-block;
		border: 0;
		padding: 0;
		text-align: right;
		line-height: 48px;
		background: transparent;
		font-size: 16px;
		color: #333;
		cursor: pointer;
		outline: 0;
		vertical-align: middle;
		margin: 0px;
	}
	#content{
		resize: none;
	}	
	.iscontainer{
	width: 70%;
	position: relative;
	padding: 100px 100px 100px 100px;
	left: 200px;
	}	
</style>
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
                                    <a class="nav-link" href="layout-sidenav-light.html">신고 관리</a>
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
            <section id="content">
            	<br><br><br><br>
				<div class="iscontainer">
			        <form name="boardFrm" action="<%=request.getContextPath() %>/admin/NoticeForm.do"
			         method="post" enctype="multipart/form-data" >
			            <input type="text" class="form-control" placeholder="제목" name="noticeTitle" id="noticeTitle" required>
			            <input type="text" style="margin-top: 10px; margin-bottom: 10px;" class="form-control" placeholder="아이디 (4글자이상)" name="noticeWriter" value="Admin" readonly required>
			            <div class="input-group mb-3" style="padding:0px;">
			                <div class="input-group-prepend" style="padding:0px;">
			                    <span class="input-group-text">첨부파일1</span>
			                </div>
			                <div class="custom-file">
			                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
			                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
			                </div>
			            </div>
			            <div class="input-group mb-3" style="padding:0px;">
			                <div class="input-group-prepend" style="padding:0px;">
			                    <span class="input-group-text">첨부파일2</span>
			                </div>
			                <div class="custom-file">
			                    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
			                    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
			                </div>
			            </div>
			            <textarea class="form-control" name="noticeContent" placeholder="내용" required style="resize: none;" cols="120" rows="15"></textarea>
			            <br />
			            <input type="submit" class="btnbtn" value="저장" style="margin-right: 20px;">
			            <input type="button" onclick="fn_cancel();" class="btnbtn2" value="취소" style="margin-left: 20px; ">
			        </form>
			    </div>


</section>
                <!-- <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Static Navigation</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Static Navigation</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    This page is an example of using static navigation. By removing the
                                    <code>.sb-nav-fixed</code>
                                    class from the
                                    <code>body</code>
                                    , the top navigation and side navigation will become static on scroll. Scroll down this page to see an example.
                                </p>
                            </div>
                        </div>
                        <div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                    </div>
                </main> -->
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
        <script>
		$(function(){
			$("[type=file]").on("change",e=>{
				const fileName=$(e.target).prop("files")[0].name;
				$(e.target).next('.custom-file-label').html(fileName);
			});
		});
		const fn_cancel=()=>{

	  		const result=confirm("정말로 취소하시겠습니까?");
			if(result){
				location.assign('<%=request.getContextPath()%>/admin/adminPageList');			
			}	

		};
	</script>	
    </body>
</html>