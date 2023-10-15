<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>밥이닝(inning)</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<style>
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'KBO-Dia-Gothic_light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_light.woff')
		format('woff');
	font-weight: 300;
	font-style: normal;
}

body {
	background-color: rgba(248, 249, 250, 0.5);
}
</style>
</head>

<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container px-5">
			<a class="navbar-brand" href="main"><img
				src="images/mainlogo.PNG" width="170" height="70"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<!-- 맛집 찾기 드롭다운 -->
					<div class="dropdown mb-2 mb-lg-0 mx-2 mt-2">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.4rem">
							🍽️ 맛집 찾기 </a>
						<ul class="dropdown-menu"
							style="font-family: 'KBO-Dia-Gothic_bold';">
							<li><a class="dropdown-item" href="r_SSG">인천 SSG 랜더스 필드</a></li>
							<li><a class="dropdown-item" href="r_kiwoom">고척 스카이돔</a></li>
							<li><a class="dropdown-item" href="r_jamsil">잠실 종합 운동장</a></li>
							<li><a class="dropdown-item" href="r_KT">수원 KT 위즈 파크</a></li>
							<li><a class="dropdown-item" href="r_KIA">광주 KIA 챔피언스 필드</a></li>
							<li><a class="dropdown-item" href="r_NC">창원 NC 파크</a></li>
							<li><a class="dropdown-item" href="r_samsung">대구 삼성 라이온즈
									파크</a></li>
							<li><a class="dropdown-item" href="r_lotte">부산 사직 야구장</a></li>
							<li><a class="dropdown-item" href="r_hanwha">대전 한화생명
									이글스파크</a></li>
						</ul>
					</div>

					<!-- 숙소 찾기 드롭다운 -->
					<div class="dropdown mb-2 mb-lg-0 mx-2 mt-2">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.4rem">
							💒 숙소 찾기 </a>
						<ul class="dropdown-menu"
							style="font-family: 'KBO-Dia-Gothic_bold';">
							<li><a class="dropdown-item" href="l_SSG">인천 SSG 랜더스 필드</a></li>
							<li><a class="dropdown-item" href="l_kiwoom">고척 스카이돔</a></li>
							<li><a class="dropdown-item" href="l_jamsil">잠실 종합 운동장</a></li>
							<li><a class="dropdown-item" href="l_KT">수원 KT 위즈 파크</a></li>
							<li><a class="dropdown-item" href="l_KIA">광주 KIA 챔피언스 필드</a></li>
							<li><a class="dropdown-item" href="l_NC">창원 NC 파크</a></li>
							<li><a class="dropdown-item" href="l_samsung">대구 삼성 라이온즈
									파크</a></li>
							<li><a class="dropdown-item" href="l_lotte">부산 사직 야구장</a></li>
							<li><a class="dropdown-item" href="l_hanwha">대전 한화생명
									이글스파크</a></li>
						</ul>
					</div>

					<!-- 자유게시판 드롭다운 -->
					<div class="dropdown me-auto mb-2 mb-lg-0 mx-2 mt-2">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.4rem">
							⚾️ 자유게시판 </a>
						<ul class="dropdown-menu"
							style="font-family: 'KBO-Dia-Gothic_bold';">
							<li style="display: flex; align-items: center;"><img
								src="images/logo/SSG.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">SSG 랜더스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/키움.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">키움 히어로즈</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/LG.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">LG 트윈스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/KT.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">KT wiz</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/KIA.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">KIA 타이거즈</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/NC.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">NC 다이노스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/삼성.png" alt="Logo" width="30" height="35"><a
								class="dropdown-item" href="#">삼성 라이온즈</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/롯데.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">롯데 자이언츠</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/두산.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">두산 베어스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/한화.png" alt="Logo" width="30" height="30"><a
								class="dropdown-item" href="#">한화 이글스</a></li>
						</ul>
					</div>
					&nbsp&nbsp&nbsp&nbsp&nbsp
					<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
						href="loginForm" role="button">로그인</a></li>
					<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
						href="memberForm" role="button">회원가입</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- Header-->
	<header class="masthead text-center text-white">
		<div class="masthead-content">
			<div class="container px-5">
				<h1 class="masthead-heading mb-0"
					style="font-family: 'KBO-Dia-Gothic_bold';">야구 보러가자!</h1>
				<p class="masthead-subheading mb-0"
					style="font-size: 1.3rem; font-family: 'KBO-Dia-Gothic_light';">맛집과
					숙소를 한눈에👀 볼 수 있는 밥이닝</p>
				<a class="btn btn-primary btn-xl rounded-pill mt-5" href="#scroll"
					style="font-size: 1.3rem; font-family: 'KBO-Dia-Gothic_light';">경기일정
					및 순위 보러가기</a>
			</div>
		</div>
	</header>


	<!-- 경기순위 및 일정-->
	<section id="scroll">
		<div class="row">
			<!--  KBO 경기 일정  -->
			<div class="col-md-5 offset-md-1 pt-5">
				<h4 style="font-family: 'KBO-Dia-Gothic_bold';">KBO 리그 경기 일정</h4>

				<table class="table table-striped">
					<thead style="text-align: center;">
						<tr>
							<th scope="col">날짜</th>
							<th scope="col">시간</th>
							<th scope="col">경기</th>
							<th scope="col">구장</th>

						</tr>
					</thead>
					<tbody style="text-align: center;">
						<c:forEach var="schedule" items="${ScheduleList}">
							<tr>
								<td>${schedule.day}</td>
								<td>${schedule.time}</td>
								<td><c:set var="vsArray"
										value="${fn:split(schedule.vs, 'vs')}" /> <c:set
										var="number1" value="${vsArray[0]}" /> <c:set var="number2"
										value="${vsArray[1]}" />
									${schedule.team1}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <c:choose>
										<c:when test="${number1 > number2}">
											<span style="color: black;">${number1}</span> vs <span
												style="color: gray;">${number2}</span>
										</c:when>
										<c:when test="${number1 < number2}">
											<span style="color: gray;">${number1}</span> vs <span
												style="color: black;">${number2}</span>
										</c:when>
										<c:otherwise>
											<span>${number1} vs ${number2}</span>
										</c:otherwise>
									</c:choose> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${schedule.team2}</td>
								<td><c:choose>
										<c:when test="${schedule.location eq '문학'}"> 인천
                                </c:when>
										<c:otherwise>
                                    ${schedule.location}
                                </c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--  KBO 경기 일정 끝 -->

			<!--  KBO 리그 순위 -->
			<div class="col-md-4 offset-md-1 pt-5">
				<h4 style="font-family: 'KBO-Dia-Gothic_bold';">KBO 리그 순위</h4>
				<table class="table table-striped"
					style="font-family: 'KBO-Dia-Gothic_light';">
					<thead>
						<tr style="font-family: 'KBO-Dia-Gothic_bold';">
							<th scope="col">순위</th>
							<th scope="col">팀명</th>
							<th scope="col">경기</th>
							<th scope="col">승</th>
							<th scope="col">패</th>
							<th scope="col">무</th>
							<th scope="col">승률</th>
							<th scope="col">연속</th>
							<th scope="col">최근 10경기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="team" items="${teamDataList}">
							<tr>
								<th scope="row" style="font-family: 'KBO-Dia-Gothic_bold';">${team.rank}</th>
								<td style="font-family: 'KBO-Dia-Gothic_bold';"><img
									src="images/logo/${team.image}.png" width="25" height="25">
									${team.title}</td>
								<td>${team.match}</td>
								<td>${team.victory}</td>
								<td>${team.defeat}</td>
								<td>${team.draw}</td>
								<td>${team.rate}</td>
								<td>${team.winning}</td>
								<td>${team.recent}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--  KBO 리그 순위 끝 -->

		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>

</html>