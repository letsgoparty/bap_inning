<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<!-- 관리자 페이지 입니다. -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 페이지</title>
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="../css/admin/all_admin.css" rel="stylesheet" type="text/css">
<link href="../css/admin/admin.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/75a1d79131.js"
	crossorigin="anonymous"></script>
</head>

<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar  -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar" style="font-family: 'SUITE-Regular';">
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="../admin/main">
				<div class="sidebar-brand-icon">
					<i class="fa-solid fa-screwdriver-wrench"></i>
				</div>
				<div class="sidebar-brand-text mx-3" style="font-size: 1.3rem">관리자
					페이지</div>
			</a>
			<!-- User  -->
			<hr class="sidebar-divider">
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fa-solid fa-user"></i> <span>Account</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">계정 관리</h6>
						<a class="collapse-item" href="../admin/user">USER</a>
					</div>
				</div></li>

			<!-- Activity  -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fa-solid fa-database"></i></i> <span>Activity</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">게시글/댓글/리뷰 관리</h6>
						<a class="collapse-item" href="../admin/board">Board</a> <a
							class="collapse-item" href="../admin/comment">Comment</a> <a
							class="collapse-item" href="../admin/res_review">Restaurant Review</a> <a
							class="collapse-item" href="../admin/lod_review">Lodging Review</a>
					</div>
				</div></li>

			<!--  Place -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Place</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">음식점/숙소 관리</h6>
						<a class="collapse-item" href="../admin/res">Restaurant</a> 
						<a class="collapse-item" href="../admin/lod">Lodging</a> 
					</div>
				</div></li>

			<div class="text-center d-none d-md-inline mt-3">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 mx-3">ADMIN
							</span> <img class="img-profile rounded-circle"
								src="../images/admin/admin_profile.png">
						</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>
					</ul>

				</nav>
				<!-- End of Topbar -->

				<!--  Content -->
				<div class="container-fluid">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
					</div>
					<div class="row">
						<!-- 방문자 수 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												방문자 수 (${visit.visit_date})</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${visit.visit_num}</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 회원 수 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												회원 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${memberCount}</div>
										</div>
										<div class="col-auto">
											<i class="fa-solid fa-users" style="color: #c2c2c2; font-size:2rem"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 게시글 수 -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">게시글 수
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${boardCount}</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												리뷰 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${reviewCount}</div>
										</div>
										<div class="col-auto">
											<i class="fa-solid fa-star" style="color: #dedede; font-size:2rem"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<h6>로그아웃 하시겠습니까?</h6>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="../logout">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../js/admin/admin.js"></script>
	<script src="../js/admin/admin2.js"></script>
	<script src="../js/admin/admin3.js"></script>
	<script src="../js/admin/admin4.js"></script>
	<script src="../js/admin/admin5.js"></script>
	<script src="../js/admin/admin6.js"></script>
	<script src="../js/admin/admin7.js"></script>



</body>

</html>