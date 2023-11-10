<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<link href="css/myLike.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/myLike.js"></script>
</head>

<body>
	<div class="container mt-2" id="resContainer">
		<div class="sidebar" id="res_sidebar">
			<!-- 가게 정보 띄우기  -->
			<form action="r_reviewList" method="get">
				<input type="hidden" id="res_id" name="res_id">
				<div class="card mt-5">
					<div id="res_image"></div>
					<div class="card-body">
						<h1 class="card-title mt-3 mb-4" id="res_name"></h1>
						<p class="card-text mt-3" id="res_content"></p>
						<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰
							보러가기</button>
						<button class="btn btn-primary mx-2 cancel">닫기</button>
					</div>
				</div>
			</form>
		</div>
		<div class="buttons mt-4">
			<button class="btn btn-primary mb-4 mx-2 category find_res"
				id="find_res">
				<img src="images/icon/restaurant2.png" width="30" height="30">
				음식점
			</button>
			<button class="btn btn-primary mb-4 category find_lod" id="find_lod">
				<img src="images/icon/hotel2.png" width="30" height="30"> 숙소
			</button>
			<button class="btn btn-primary mb-4 category"
				style="display: flex; float: right;" id="deleteAll">
				<img src="images/icon/delete_icon.png" width="26" height="26">&nbsp;
				선택 항목 삭제하기
			</button>
			<button class="btn btn-primary category mx-3"
				style="display: flex; float: right;" id="allCheck">
				<img src="images/icon/check_icon.png" width="27" height="27">&nbsp;<span
					id="checkText"> 전체 선택</span>
			</button>
		</div>

		<c:if test="${!empty Rdto}">
			<div class="row">
				<c:forEach items="${Rdto}" var="dto" varStatus="loop">
					<div class="col-md-6">
						<div class="card mb-3" style="max-width: 650px; cursor: pointer;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="images/restaurant_images/${dto.res_image}.png"
										class="rounded-start" width="200px" height="200px">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<div class="mb-3">
											<span class="card-title"
												style="font-size: 1.5rem; font-weight: bold;">${dto.res_name}</span>
											<input type="checkbox" name="check" class="check"
												value="${dto.res_id}" style="display: none;"> <br>
										</div>
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
										<span id="rating">&nbsp;${dto.rating}</span>
										<button class="btn btn-primary mb-3 deleteBtn"
											style="float: right;" data-id="${dto.res_id}"
											data-type="restaurant">삭제</button>
										<button class="btn btn-primary mb-3 mx-3 res_infoBtn"
											style="float: right;" data-name="${dto.res_name}">자세히보기</button>
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
	<!--  lodContainer  -->
	<div class="container mt-2" id="lodContainer">
		<div class="sidebar" id="lod_sidebar">
			<!-- 숙박 정보 띄우기  -->
			<form action="l_reviewList" method="get">
				<input type="hidden" id="lodging_id" name="lodging_id">
				<div class="card mt-5">
					<div id="lodging_image"></div>
					<div class="card-body">
						<h1 class="card-title mt-3 mb-4" id="lodging_name"></h1>

						<p class="card-text mt-3" id="lodging_content"></p>
						<div id="lodging_url"></div>
						<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰
							보러가기</button>
						<button class="btn btn-primary mx-3 cancel">닫기</button>
					</div>
				</div>
			</form>
		</div>
		<div class="buttons mt-4">
			<button class="btn btn-primary mb-4 mx-2 category find_res"
				id="find_res">
				<img src="images/icon/restaurant2.png" width="30" height="30">
				음식점
			</button>
			<button class="btn btn-primary mb-4 category find_lod" id="find_lod">
				<img src="images/icon/hotel2.png" width="30" height="30"> 숙소
			</button>
			<button class="btn btn-primary mb-4 category"
				style="display: flex; float: right;" id="deleteAll">
				<img src="images/icon/delete_icon.png" width="26" height="26">&nbsp;
				선택 항목 삭제하기
			</button>
			<button class="btn btn-primary category mx-3"
				style="display: flex; float: right;" id="allCheck">
				<img src="images/icon/check_icon.png" width="27" height="27">&nbsp;<span
					id="checkText"> 전체 선택</span>
			</button>
		</div>
		<c:if test="${!empty Ldto}">
			<div class="row">
				<c:forEach items="${Ldto}" var="dto" varStatus="loop">
					<div class="col-md-6">
						<div class="card mb-3" style="max-width: 650px; cursor: pointer;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="images/lodging_images/${dto.lodging_image}.png"
										class="rounded-start" width="200px" height="200px">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<div class="mb-3">
											<span class="card-title"
												style="font-size: 1.5rem; font-weight: bold;">${dto.lodging_name}</span>
											<input type="checkbox" name="check" class="check"
												value="${dto.lodging_id}" style="display: none;"> <br>
										</div>
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
										에서 걸어서 <span style="font-weight: bold"> ${dto.distance}
										</span>
										<p></p>
										<img src="images/icon/icon3.png" width="13" height="13">
										<span id="rating">&nbsp;${dto.rating}</span>
										<button class="btn btn-primary mb-3 deleteBtn"
											style="float: right;" data-id="${dto.lodging_id}"
											data-type="lodging">삭제</button>
										<button class="btn btn-primary mb-3 mx-3 lod_infoBtn"
											style="float: right;" data-name="${dto.lodging_name}">자세히보기</button>
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
	<c:if test="${empty Ldto}">
		<div class="rounded no_like">
			<p>찜한 숙소가 없습니다.</p>
		</div>
	</c:if>
	</div>



</body>

</html>