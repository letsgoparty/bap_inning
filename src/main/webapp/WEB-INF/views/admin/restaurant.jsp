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

<title>음식점 테이블</title>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="../css/admin/all_admin.css" rel="stylesheet" type="text/css">
<link href="../css/admin/admin.css" rel="stylesheet">
<link href="../css/admin/table.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/75a1d79131.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
th:first-child, th:nth-child(4), th:nth-child(5) {
	max-width: 70px;
}

th:nth-child(2), th:nth-child(3) {
	max-width: 250px;
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
							class="collapse-item" href="../admin/res_review">Restaurant
							Review</a> <a class="collapse-item" href="../admin/lod_review">Lodging
							Review</a>
					</div>
				</div></li>

			<!--  Place -->
			<li class="nav-item active"><a class="nav-link collapsed"
				href="#" data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Place</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">음식점/숙소 관리</h6>
						<a class="collapse-item active" href="../admin/res">Restaurant</a>
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
					<div style="display: flex; justify-content: space-between; align-items: center;">
						<h1 class="h3 mb-2 text-gray-800 mb-4 mx-2">음식점</h1>
						<button class="btn btn-primary mb-2">등록</button>
					</div>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">RESTAURANT
								TABLE</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>음식점 번호</th>
											<th>음식점명</th>
											<th>음식점 주소</th>
											<th>카테고리</th>
											<th>TEAM CODE</th>
											<th>별점</th>
											<th></th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>음식점 번호</th>
											<th>음식점명</th>
											<th>음식점 주소</th>
											<th>카테고리</th>
											<th>TEAM CODE</th>
											<th>별점</th>
											<th></th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="dto" items="${list}">
											<tr>
												<td>${dto.res_id}</td>
												<td><a href="#" class="open_modal"
													data-res-name="${dto.res_name}">${dto.res_name}</a></td>
												<td>${dto.res_addr}</td>
												<td>${dto.category}</td>
												<td>${dto.team_code}</td>
												<td>${dto.rating}</td>
												<td><button class="btn btn-primary deleteBtn"
														data-res-name="${dto.res_name}"
														style="background-color: rgb(181, 181, 181); border-color: rgb(181, 181, 181);">
														<i class="fa-solid fa-trash" style="color: #ffffff;"></i>
													</button></td>
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

	<!-- 음식점 Modal -->
	<div class="modal" id="modal" role="dialog"
		aria-labelledby="remoteModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 850px;">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title" id="res_name_big"></h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div role="content">
						<div class="widget-body">

							<p id="res_imageTag"></p>
							가게명 <input class="form-control mb-2" id="res_name"> 주 소 <input
								class="form-control mb-2" id="res_addr"> 거 리 (분)<input
								class="form-control mb-2" id="distance"> 카테고리 <select
								class="form-control mb-2" id="category">
								<option value="한식">한식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
								<option value="양식">양식</option>
								<option value="카페">카페</option>
								<option value="패스트푸드">패스트푸드</option>
							</select> 주변 구장 <select class="form-control mb-2" id="team">
								<option value="1">SSG 랜더스필드</option>
								<option value="2">고척 스카이돔</option>
								<option value="3">잠실종합운동장</option>
								<option value="4">KT위즈파크</option>
								<option value="5">KIA챔피언스필드</option>
								<option value="6">NC파크</option>
								<option value="7">삼성라이온즈파크</option>
								<option value="8">사직야구장</option>
								<option value="10">한화생명 이글스파크</option>

							</select> 별점 <input class="form-control mb-2" id="rating" disabled>
							상세 설명
							<textarea class="form-control mb-2" rows="3" id="res_content"></textarea>

							<input type="hidden" id="res_id"> <input type="hidden"
								id="res_image">
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="updateRes">수정</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						style="background-color: rgb(181, 181, 181); border-color: rgb(181, 181, 181);">닫기</button>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$(document).on("click", ".open_modal", function(e) {
				e.preventDefault();
				var res_name = $(this).data("res-name");
				console.log(res_name);
				$.ajax({
					url : "../admin/find_res",
					type : "POST",
					data : {
						res_name : res_name
					},
					success : function(data) {
                        var imagePath = '../images/restaurant_images/' + data.res_image + '.png';
                        var imgTag = '<img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px">';
                        
						$("#modal").modal("show");
						$("#res_name_big").text(data.res_name);
						$("#res_name").val(data.res_name);
						$("#res_addr").val(data.res_addr);
						$("#res_content").val(data.res_content);
						$("#rating").val(data.rating);
						$("#category").val(data.category);
						$("#distance").val(data.distance);
						$("#team").val(data.team_code);
						$("#res_id").val(data.res_id);
						$("#res_image").val(data.res_image);
						$("#res_imageTag").html(imgTag);
					}
				});
			});

			// 모달 닫기 버튼
			$("#close-modal").on("click", function() {
				$("#modal").hide();
				$("#modal-content").empty();
			});
			
			// 모달 수정 버튼
			$(document).on("click", "#updateRes", function(e) {
				var res_id = $("#res_id").val();
			    var res_name = $("#res_name").val();
			    var res_addr = $("#res_addr").val();
			    var res_image = $("#res_image").val();
			    var res_content = $("#res_content").val();
			    var category = $("#category").val();
			    var distance = $("#distance").val();
			    var team_code = $("#team").val();

			    $.ajax({
			        url: "../admin/updateRes",
			        type: "POST",
			        data: {
			        	res_id: res_id,
			            res_name: res_name,
			            res_addr: res_addr,
			            res_image: res_image,
			            res_content: res_content,
			            category: category,
			            distance: distance,
			            team_code: team_code
			        },
			        success: function(response) {
			        	Swal.fire({
			     	        text: response,
			     	        icon: 'success',
			     	        confirmButtonColor: '#3085d6',
			     	        button: {
			     	            text: '확인',
			     	            closeModal: true 
			     	        }
			    		 }).then(() => {
			    			 window.location.href = '../admin/res'; 
			    		 });
			        },
			        error: function(error) {
			            console.error("에러 발생");
			        }
			    });
			});
			
			// 삭제 버튼
			  $(document).on("click", ".deleteBtn", function (e) {
		            var res_name = $(this).data("res-name");
		            var text = res_name + "를(을) 삭제하시겠습니까?";
		            Swal.fire({
		                text: text,
		                icon: 'warning',
		                showCancelButton: true,
		                confirmButtonColor: '#3085d6',
		                confirmButtonText: '삭제',
		                cancelButtonText: '취소',
		            }).then(result => {
		                if (result.isConfirmed) {
		                    $.ajax({
		                        url: "../admin/deleteRes",
		                        type: "POST",
		                        data: {
		                            res_name: res_name
		                        },
		                        success: function (response) {
		                            Swal.fire({
		                                text: response,
		                                icon: 'success',
		                                confirmButtonColor: '#3085d6',
		                                button: {
		                                    text: '확인',
		                                    closeModal: true
		                                }
		                            }).then(() => {
		                                window.location.href = '../admin/res';
		                            });
		                        },
		                        error: function (error) {
		                            console.error("에러 발생");
		                        }
		                    });
		                }
					});
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