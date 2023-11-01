<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>댓글 테이블</title>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="../css/admin/all_admin.css" rel="stylesheet" type="text/css">
<link href="../css/admin/admin.css" rel="stylesheet">
<link href="../css/admin/table.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/75a1d79131.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
@font-face {
	font-family: 'SUITE-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
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
						<a class="collapse-item" href="../admin/user">USER</a> <a
							class="collapse-item" href="../admin/admin">ADMIN</a>
					</div>
				</div></li>

			<!-- Activity  -->
			<li class="nav-item active"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fa-solid fa-database"></i></i> <span>Activity</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">게시글/댓글/리뷰 관리</h6>
						<a class="collapse-item" href="../admin/board">Board</a> <a
							class="collapse-item active" href="../admin/comment">Comment</a> <a
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

				<!-- 테이블 -->
				<div class="container-fluid" style="font-family: 'SUITE-Regular';">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800 mb-4 mx-2">댓글</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">COMMENT TABLE</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>댓글 번호</th>
											<th>게시글 번호</th>
											<th>댓글 내용</th>
											<th>작성자 ID</th>
											<th>작성일</th>
											<th>수정일</th>
											<th></th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>댓글 번호</th>
											<th>게시글 번호</th>
											<th>댓글 내용</th>
											<th>작성자 ID</th>
											<th>작성일</th>
											<th>수정일</th>
											<th></th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="dto" items="${list}">
											<tr>
												<td><c:choose>
														<c:when test="${dto.team_code eq '1'}">SSG 랜더스</c:when>
														<c:when test="${dto.team_code eq '2'}">키움 히어로즈</c:when>
														<c:when test="${dto.team_code eq '3'}">LG 트윈스</c:when>
														<c:when test="${dto.team_code eq '4'}">KT wiz</c:when>
														<c:when test="${dto.team_code eq '5'}">KIA 타이거즈</c:when>
														<c:when test="${dto.team_code eq '6'}">NC 다이노스</c:when>
														<c:when test="${dto.team_code eq '7'}">삼성 라이온즈</c:when>
														<c:when test="${dto.team_code eq '8'}">롯데 자이언츠</c:when>
														<c:when test="${dto.team_code eq '9'}">두산 베어스</c:when>
														<c:when test="${dto.team_code eq '10'}">한화 이글스</c:when>
														<c:when test="${dto.team_code eq '0'}">기타</c:when>
													</c:choose></td>
												<td>${dto.board_num}</td>
												<td><a href="#" class="open_modal"
													data-board-num="${dto.board_num}">${dto.title}</a></td>
												<td>${dto.userid}</td>
												<td>${dto.board_date}</td>
												<td>${dto.count}</td>
											<td><a href="../delete?no=${board.board_num}" class="btn btn-primary" style="background-color:rgb(181,181,181); border-color:rgb(181,181,181); "><i class="fa-solid fa-trash" style="color: #ffffff;"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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

	<!-- 게시글 Modal -->
	<div class="modal" id="modal" role="dialog"
		aria-labelledby="remoteModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 850px;">
			<div class="modal-content">
				<div class="modal-header">
				<h1 class="modal-title" id="title"></h1>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">

					<div role="content">
						<div class="widget-body">
							<span id="userid"></span>&nbsp;&nbsp;<span id="board_date"></span>&nbsp;&nbsp;조회수&nbsp;<span
								id="count"> </span>
							<p></p>
							<p id="text">내용입력</p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$(document).on("click", ".open_modal", function(e) {
				e.preventDefault();
				var board_num = $(this).data("board-num");
				console.log(board_num);

				$.ajax({
					url : "../admin/find_board",
					type : "POST",
					data : {
						board_num : board_num
					},
					success : function(data) {
						$("#modal").modal("show");
						$("#userid").text(data.userid);
						$("#text").text(data.text);
						$("#count").text(data.count);
						$("#title").text(data.title);
						$("#board_date").text(data.board_date);
						$("#userid").text(data.userid);
					}
				});
			});

			// 모달을 닫는 이벤트를 처리합니다.
			$("#close-modal").on("click", function() {
				$("#modal").hide();
				$("#modal-content").empty();
			});
		});
	</script>
	<script src="../js/admin/admin.js"></script>
	<script src="../js/admin/admin2.js"></script>
	<script src="../js/admin/admin3.js"></script>
	<script src="../js/admin/admin4.js"></script>
	<script src="../js/admin/table.js"></script>
	<script src="../js/admin/table2.js"></script>
	<script src="../js/admin/table3.js"></script>


</body>
</html>