<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>찜 목록</title>
</head>
<style>
.category {
	border-radius: 30px;
}

.buttons {
	margin-left: 300px;
}

#location {
	font-weight: bold;
}

.no_like {
	font-size: 30px;
	font-weight: bold;
	border: 1px solid #ccc;
	text-align: center;
	
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
            //jQuery를 사용하여 버튼 클릭 이벤트를 처리
            $(document).ready(function () {

                $("#resContainer").show();
                $("#lodContainer").hide();

                $("#find_res").click(function () {
                    $("#lodContainer").hide();
                    $("#resContainer").show();
                });

                $("#find_lod").click(function () {
                    $("#resContainer").hide();
                    $("#lodContainer").show();
                });

                $(".deleteBtn").on("click", function () {
                    var id = $(this).attr("data-id");
                    var type = $(this).attr("data-type");

                    console.log(id);
                    console.log(type);

                    $.ajax({
                        url: 'delete_like',
                        method: 'GET',
                        data: { id: id, type: type },
                        success: function (data) {
                            if (data === '로그인이 필요합니다.') {
                                Swal.fire({
                                    text: data,
                                    icon: 'warning',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: 'OK',
                                    cancelButtonText: 'CANCLE',
                                    button: {
                                        text: '확인',
                                        closeModal: true
                                    }

                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location.href = '/app/loginForm';
                                    }
                                });
                            } else {
                                Swal.fire({
                                    text: data,
                                    icon: 'success',
                                    confirmButtonColor: '#3085d6',
                                    confirmButtonText: '확인',
                                    closeOnClickOutside: false, // 바깥쪽을 클릭해도 창이 닫히지 않도록 설정
                                }).then((result) => {
                                    if (result.isConfirmed) { // '확인' 버튼이 클릭되었을 때
                                        window.location.href = "/app/like";
                                    }
                                });
                            }
                        },
                        error: function (error) {
                            console.error('Error:', error);
                        }
                    });
                });
            });

        </script>

<body>
	<div class="buttons mt-4">
		<button class="btn btn-primary mb-4 mx-2 category" id="find_res">
			<img src="images/icon/restaurant2.png" width="30" height="30">
			음식점
		</button>
		<button class="btn btn-primary mb-4 category" id="find_lod">
			<img src="images/icon/hotel2.png" width="30" height="30"> 숙소
		</button>
	</div>

	<div class="container mt-2" id="resContainer">
		<c:if test="${!empty Rdto}">
			<div class="row">
				<c:forEach items="${Rdto}" var="dto" varStatus="loop">
					<div class="col-md-6">
						<div class="card mb-3" style="max-width: 650px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="images/restaurant_images/${dto.res_image}.png"
										class="rounded-start" width="200px" height="200px">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title mb-3 mt-2">${dto.res_name}</h5>
										<img src="images/icon/icon1.png" width="13" height="13"><span
											class="card-text"> ${dto.res_addr}</span>
										<p></p>
										<img src="images/icon/icon2.png" width="13" height="13">
										<c:choose>
											<c:when test="${dto.team_code eq '1'}">
												<span id="location">SSG 랜더스필드</span>
											</c:when>
											<c:when test="${dto.team_code eq '2'}">
												<span id="location">고척스카이돔</span>
											</c:when>
											<c:when test="${dto.team_code eq '3'}">
												<span id="location">잠실종합운동장</span>
											</c:when>
											<c:when test="${dto.team_code eq '4'}">
												<span id="location">KT위즈파크</span>
											</c:when>
											<c:when test="${dto.team_code eq '5'}">
												<span id="location">KIA 챔피언스필드</span>
											</c:when>
											<c:when test="${dto.team_code eq '6'}">
												<span id="location">창원NC파크</span>
											</c:when>
											<c:when test="${dto.team_code eq '7'}">
												<span id="location">삼성 라이온즈파크</span>
											</c:when>
											<c:when test="${dto.team_code eq '8'}">
												<span id="location">사직야구장</span>
											</c:when>
											<c:when test="${dto.team_code eq '10'}">
												<span id="location">한화생명 이글스파크</span>
											</c:when>
										</c:choose>
										에서 걸어서 <span style="font-weight: bold"> ${dto.distance}
										</span>분
										<p></p>
										<img src="images/icon/icon3.png" width="13" height="13">
										<span id="rating">&nbsp;</span>
										<button class="btn btn-primary mb-3 deleteBtn"
											style="float: right;" data-id="${dto.res_id}"
											data-type="restaurant">삭제</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${loop.index % 2 == 1}">
			</div>
			<div class="row">
		</c:if>
		</c:forEach>
	</div>
	</c:if>
	<c:if test="${empty Rdto}">
		<div class="rounded no_like">
			<p>찜한 음식점이 없습니다.</p>
		</div>
	</c:if>
	</div>
	<div class="container mt-2" id="lodContainer">
		<c:if test="${!empty Lto}">
			<div class="row">
				<c:forEach items="${Ldto}" var="dto" varStatus="loop">
					<div class="col-md-6">
						<div class="card mb-3" style="max-width: 650px; max-hieght: 220px">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="images/lodging_images/${dto.lodging_image}.png"
										class="rounded-start" width="205px" height="230px">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title mb-3 mt-2">${dto.lodging_name}</h5>
										<img src="images/icon/icon1.png" width="13" height="13"><span
											class="card-text"> ${dto.lodging_addr}</span>
										<p></p>
										<img src="images/icon/icon4.png" width="13" height="13">
										<c:choose>
											<c:when test="${dto.team_code eq '1'}">
												<span id="location">SSG 랜더스필드</span>
											</c:when>
											<c:when test="${dto.team_code eq '2'}">
												<span id="location">고척스카이돔</span>
											</c:when>
											<c:when test="${dto.team_code eq '3'}">
												<span id="location">잠실종합운동장</span>
											</c:when>
											<c:when test="${dto.team_code eq '4'}">
												<span id="location">KT위즈파크</span>
											</c:when>
											<c:when test="${dto.team_code eq '5'}">
												<span id="location">KIA 챔피언스필드</span>
											</c:when>
											<c:when test="${dto.team_code eq '6'}">
												<span id="location">창원NC파크</span>
											</c:when>
											<c:when test="${dto.team_code eq '7'}">
												<span id="location">삼성 라이온즈파크</span>
											</c:when>
											<c:when test="${dto.team_code eq '8'}">
												<span id="location">사직야구장</span>
											</c:when>
											<c:when test="${dto.team_code eq '10'}">
												<span id="location">한화생명 이글스파크</span>
											</c:when>
										</c:choose>
										에서 <span style="font-weight: bold"> ${dto.distance} </span>
										<p></p>
										<img src="images/icon/icon3.png" width="13" height="13">
										<p id="rating"></p>
										<a href="${dto.lodging_url}">예약 바로가기</a>
										<button class="btn btn-primary mb-3 deleteBtn"
											style="float: right;" data-id="${dto.lodging_id}"
											data-type="lodging">삭제</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${loop.index % 2 == 1}">
			</div>
			<div class="row">
		</c:if>
		</c:forEach>
	</div>
	</c:if>
		<div class="rounded no_like">
			<p>찜한 숙소가 없습니다.</p>
		</div>
	</div>
</body>

</html>