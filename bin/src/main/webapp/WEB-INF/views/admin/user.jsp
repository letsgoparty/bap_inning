<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>회원 정보 테이블</title>

            <link
                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet">
            <link href="../css/admin/all_admin.css" rel="stylesheet" type="text/css">
            <link href="../css/admin/admin.css" rel="stylesheet">
            <link href="../css/admin/table.css" rel="stylesheet">
            <script src="https://kit.fontawesome.com/75a1d79131.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
            <style>
                th:nth-child(3) {
                    max-width: 150px;
                }

                th:nth-child(5),
                th:nth-child(6),
                th:nth-child(7),
                th:nth-child(8),
                th:nth-child(9) {
                    max-width: 80px;
                }

                .modal {}
            </style>

        </head>

        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">
                <!-- Sidebar  -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar"
                    style="font-family: 'SUITE-Regular';">
                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../admin/main">
                        <div class="sidebar-brand-icon">
                            <i class="fa-solid fa-screwdriver-wrench"></i>
                        </div>
                        <div class="sidebar-brand-text mx-3" style="font-size: 1.3rem">관리자
                            페이지</div>
                    </a>
                    <!-- User  -->
                    <hr class="sidebar-divider">
                    <li class="nav-item active"><a class="nav-link collapsed" href="#" data-toggle="collapse"
                            data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i
                                class="fa-solid fa-user"></i> <span>Account</span>
                        </a>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                            data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">계정 관리</h6>
                                <a class="collapse-item active" href="../admin/user">USER</a> <a class="collapse-item"
                                    href="../admin/admin">ADMIN</a>
                            </div>
                        </div>
                    </li>

                    <!-- Activity  -->
                    <li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse"
                            data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i
                                class="fa-solid fa-database"></i></i> <span>Activity</span>
                        </a>
                        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                            data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">게시글/댓글/리뷰 관리</h6>
                                <a class="collapse-item" href="../admin/board">Board</a> <a class="collapse-item"
                                    href="../admin/comment">Comment</a> <a class="collapse-item"
                                    href="../admin/res_review">Restaurant
                                    Review</a> <a class="collapse-item" href="../admin/lod_review">Lodging
                                    Review</a>
                            </div>
                        </div>
                    </li>

                    <!--  Place -->
                    <li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse"
                            data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> <i
                                class="fas fa-fw fa-folder"></i> <span>Place</span>
                        </a>
                        <div id="collapsePages" class="collapse" aria-labelledby="headingPages"
                            data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">음식점/숙소 관리</h6>
                                <a class="collapse-item" href="../admin/res">Restaurant</a> <a class="collapse-item"
                                    href="../admin/lod">Lodging</a>
                            </div>
                        </div>
                    </li>

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
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#"
                                        id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false"> <span
                                            class="mr-2 d-none d-lg-inline text-gray-600 mx-3">ADMIN
                                        </span> <img class="img-profile rounded-circle"
                                            src="../images/admin/admin_profile.png">
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                        aria-labelledby="userDropdown">
                                        <a class="dropdown-item" href="#" data-toggle="modal"
                                            data-target="#logoutModal"> <i
                                                class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Logout
                                        </a>
                                    </div>
                                </li>
                            </ul>

                        </nav>
                        <!-- End of Topbar -->

                        <!-- 테이블 -->
                        <div class="container-fluid" style="font-family: 'SUITE-Regular';">
                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800 mb-4 mx-2">회원정보</h1>
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">MEMBER TABLE</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>EMAIL</th>
                                                    <th>닉네임</th>
                                                    <th>TEAM</th>
                                                    <th>게시글</th>
                                                    <th>댓글</th>
                                                    <th>음식점 리뷰</th>
                                                    <th>숙소 리뷰</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>EMAIL</th>
                                                    <th>닉네임</th>
                                                    <th>TEAM</th>
                                                    <th>게시글</th>
                                                    <th>댓글</th>
                                                    <th>음식점 리뷰</th>
                                                    <th>숙소 리뷰</th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <c:forEach var="dto" items="${list}">
                                                    <tr>
                                                        <td><a href="#" class="user_modal"
                                                                data-userid="${dto.userid}">${dto.userid}</td>
                                                        <td>${dto.email}</td>
                                                        <td>${dto.nickname}</td>
                                                        <td>
                                                            <c:choose>
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
                                                                <c:when test="${dto.team_code eq '0'}">응원팀 없음</c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td><a href="#" class="board_modal"
                                                                data-userid="${dto.userid}">${dto.board_count}</a></td>
                                                        <td><a href="#" class="comment_modal"
                                                                data-userid="${dto.userid}">${dto.comment_count}</td>
                                                        <td><a href="#" class="res_review_modal"
                                                                data-userid="${dto.userid}">${dto.res_review_count}</a>
                                                        </td>
                                                        <td><a href="#" class="lod_review_modal"
                                                                data-userid="${dto.userid}">${dto.lod_review_count}</a>
                                                        </td>
                                                        <td><button class="btn btn-primary deleteBtn"
                                                                data-userid="${dto.userid}"
                                                                style="background-color: rgb(181, 181, 181); border-color: rgb(181, 181, 181)">삭제</button>
                                                        </td>
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

            <a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h6>로그아웃 하시겠습니까?</h6>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="../logout">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 음식점 리뷰 Modal -->
            <div class="modal" id="res_review_modal" role="dialog" aria-labelledby="remoteModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" style="max-width: 1300px !important;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">

                            <div role="content">
                                <div class="widget-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>리뷰 번호</th>
                                                    <th>음식점명</th>
                                                    <th>리뷰 내용</th>
                                                    <th>작성자 ID</th>
                                                    <th>별점</th>
                                                    <th>좋아요 수</th>
                                                    <th>작성일</th>
                                                    <th>수정일</th>
                                                </tr>
                                            </thead>
                                            <tbody id="res_review_tbody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--  숙소 리뷰 모달 -->
            <div class="modal" id="lod_review_modal" role="dialog" aria-labelledby="remoteModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" style="max-width: 1300px !important;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">
                            <div role="content">
                                <div class="widget-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>리뷰 번호</th>
                                                    <th>숙소명</th>
                                                    <th>리뷰 내용</th>
                                                    <th>작성자 ID</th>
                                                    <th>별점</th>
                                                    <th>좋아요 수</th>
                                                    <th>작성일</th>
                                                    <th>수정일</th>
                                                </tr>
                                            </thead>
                                            <tbody id="lod_review_tbody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 게시판 Modal -->
            <div class="modal" id="board_modal" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="max-width: 1000px !important;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">

                            <div role="content">
                                <div class="widget-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>CATEGORY</th>
                                                    <th>글 번호</th>
                                                    <th>글 제목</th>
                                                    <th>아이디</th>
                                                    <th>작성일</th>
                                                    <th>조회수</th>
                                                </tr>
                                            </thead>
                                            <tbody id="board_tbody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 댓글 Modal -->
            <div class="modal" id="comment_modal" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="max-width: 1000px !important;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">

                            <div role="content">
                                <div class="widget-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>댓글 번호</th>
                                                    <th>게시글 번호</th>
                                                    <th>댓글 내용</th>
                                                    <th>작성자 ID</th>
                                                    <th>작성일</th>
                                                    <th>수정일</th>
                                                </tr>
                                            </thead>
                                            <tbody id="comment_tbody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 회원정보 Modal -->
            <div class="modal" id="user_modal" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width: 850px;">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h2 id="userid_big"></h2>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">
                            <div role="content">
                                <div class="widget-body">
                                    <p id="res_imageTag"></p>
                                    아이디 <input class="form-control mb-2" id="userid" readonly>
                                    비밀번호 <input class="form-control" type="password" id="password" readonly>
                                    이메일 <input class="form-control mb-2" id="email"> 닉네임<input class="form-control mb-2"
                                        id="nickname"> 응원팀 <select class="form-control mb-2" id="team">
                                        <option value="1">SSG 랜더스</option>
                                        <option value="2">키움 히어로즈</option>
                                        <option value="3">LG 트윈스</option>
                                        <option value="4">KT wiz</option>
                                        <option value="5">KIA 타이거즈</option>
                                        <option value="6">NC 다이노스</option>
                                        <option value="7">삼성 라이온즈</option>
                                        <option value="8">롯데 자이언츠</option>
                                        <option value="9">두산 베어스</option>
                                        <option value="10">한화 이글스</option>
                                        <option value="0">해당없음</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="updateUser">수정</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"
                                style="background-color: rgb(181, 181, 181); border-color: rgb(181, 181, 181);">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                $(document).ready(function () {
                    // 회원정보 Modal
                    $(document).on("click", ".user_modal", function (e) {
                        e.preventDefault();
                        var userid = $(this).data("userid");

                        $.ajax({
                            url: "../admin/find_user",
                            type: "POST",
                            data: {
                                userid: userid
                            },
                            success: function (data) {
                                $("#user_modal").modal("show");
                                $("#userid_big").text(data.userid);
                                $("#userid").val(data.userid);
                                $("#email").val(data.email);
                                $("#nickname").val(data.nickname);
                                $("#team").val(data.team_code);
                                $("#password").val(data.password);

                            }
                        });
                    });
                    // 음식점 리뷰 모달
                    $(document).on("click", ".res_review_modal", function (e) {
                        e.preventDefault();
                        var userid = $(this).data("userid");

                        $("#res_review_tbody").empty();

                        $.ajax({
                            url: "../admin/find_user_res_review_info",
                            type: "POST",
                            data: {
                                userid: userid
                            },
                            success: function (data) {
                                $("#res_review_modal").modal("show");

                                $.each(data, function (index, item) {
                                    var newRow = "<tr>" +
                                        "<td>" + item.review_id + "</td>" +
                                        "<td>" + item.res_name + "</td>" +
                                        "<td>" + item.review_content + "</td>" +
                                        "<td>" + item.user_id + "</td>" +
                                        "<td>" + item.rating + "</td>" +
                                        "<td>" + item.like_cnt + "</td>" +
                                        "<td>" + item.created_date + "</td>" +
                                        "<td>" + item.modified_date + "</td>" +
                                        "</tr>";
                                    $("#res_review_tbody").append(newRow);
                                });
                            }
                        });
                    });

                    // 숙소 리뷰 모달
                    $(document).on("click", ".lod_review_modal", function (e) {
                        e.preventDefault();
                        var userid = $(this).data("userid");

                        $("#lod_review_tbody").empty();

                        $.ajax({
                            url: "../admin/find_user_lod_review_info",
                            type: "POST",
                            data: {
                                userid: userid
                            },
                            success: function (data) {
                                $("#lod_review_modal").modal("show");

                                $.each(data, function (index, item) {
                                    var newRow = "<tr>" +
                                        "<td>" + item.review_id + "</td>" +
                                        "<td>" + item.lodging_name + "</td>" +
                                        "<td>" + item.review_content + "</td>" +
                                        "<td>" + item.user_id + "</td>" +
                                        "<td>" + item.rating + "</td>" +
                                        "<td>" + item.like_cnt + "</td>" +
                                        "<td>" + item.created_date + "</td>" +
                                        "<td>" + item.modified_date + "</td>" +
                                        "</tr>";
                                    $("#lod_review_tbody").append(newRow);
                                });
                            }
                        });
                    });
                    // 게시판 모달
                    $(document).on("click", ".board_modal", function (e) {
                        e.preventDefault();
                        var userid = $(this).data("userid");

                        $("#board_tbody").empty();

                        $.ajax({
                            url: "../admin/find_user_board_info",
                            type: "POST",
                            data: {
                                userid: userid
                            },
                            success: function (data) {
                                $("#board_modal").modal("show");
                                $.each(data, function (index, item) {
                                    var newRow = "<tr>" +
                                        "<td>" + item.team_code + "</td>" +
                                        "<td>" + item.board_num + "</td>" +
                                        "<td>" + item.title + "</td>" +
                                        "<td>" + item.userid + "</td>" +
                                        "<td>" + item.board_date + "</td>" +
                                        "<td>" + item.count + "</td>" +
                                        "</tr>";
                                    $("#board_tbody").append(newRow);
                                });
                            }
                        });
                    });

                    // 댓글 모달
                    $(document).on("click", ".comment_modal", function (e) {
                        e.preventDefault();
                        var userid = $(this).data("userid");
                        $("#comment_tbody").empty();

                        $.ajax({
                            url: "../admin/find_user_comment_info", // 나중에 Controller에 추가 
                            type: "POST",
                            data: {
                                userid: userid
                            },
                            success: function (data) {
                                $("#comment_modal").modal("show");
                                $.each(data, function (index, item) {
                                    var newRow = "<tr>" +
                                        "<td>" + item.reviews_num + "</td>" +
                                        "<td>" + item.board_num + "</td>" +
                                        "<td>" + item.text + "</td>" +
                                        "<td>" + item.userid + "</td>" +
                                        "<td>" + item.replyDate + "</td>" +
                                        "<td>" + item.updateDate + "</td>" +
                                        "</tr>";
                                    $("#comment_tbody").append(newRow);
                                });
                            }
                        });
                    });


                    $("#close-modal").on("click", function () {
                        $(".modal").hide();
                        $(".modal-content").empty();
                    });
                    
        			$(document).on("click", "#updateUser", function(e) {
        				var userid = $("#userid").val();
        			    var email = $("#email").val();
        			    var nickname = $("#nickname").val();
        			    var password = $("#password").val();
        			    var team_code = $("#team").val();
 
        			    $.ajax({
        			        url: "../admin/updateUser",
        			        type: "POST",
        			        data: {
        			        	userid: userid,
        			        	email: email,
        			        	nickname: nickname,
        			        	team_code: team_code,
        			        	password:password
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
        			    			 window.location.href = '../admin/user'; 
        			    		 });
        			        },
        			        error: function(error) {
        			            console.error("에러 발생");
        			        }
        			    });
        			});

                    $(document).on("click", ".deleteBtn", function (e) {
                        var userid = $(this).data("userid");
                        var text = userid + " 계정을 영구 삭제하시겠습니까?"
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
                                    url: "../admin/deleteUser",
                                    type: "POST",
                                    data: {
                                        userid: userid
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
                                            window.location.href = '../admin/user';
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