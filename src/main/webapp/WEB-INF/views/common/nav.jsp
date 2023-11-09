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
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://kit.fontawesome.com/75a1d79131.js"
	crossorigin="anonymous"></script>
</head>

<body id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
		<div class="container px-5">
			<a class="navbar-brand me-5" href="main"> <img
				src="images/mainlogo.PNG" width="170" height="70"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			&nbsp;
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<!-- 맛집 찾기 드롭다운 -->
					<div class="dropdown mb-2 mb-lg-0 mx-2 mt-2">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.2rem">
							<img src="images/icon/restaurant.png" width=auto height="35">
							음식점 찾기
						</a>
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
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.2rem">
							<img src="images/icon/hotel.png" width=auto height="35"> 숙소
							찾기
						</a>
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
						<a class="btn btn-secondary dropdown-toggle" href="list"
							role="button"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.2rem">
							<img src="images/icon/baseball.png" width=auto height="35">
							자유게시판
						</a>
					</div>
					
					<div class="dropdown me-auto mb-2 mb-lg-0 mx-2 mt-2">
						<a class="btn btn-secondary dropdown-toggle" href="schedule"
							role="button"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.2rem">
														<c:choose>
										<c:when test="${login.team_code eq 1}">
											<img src="images/logo/SSG.png" width=auto height="35"> SSG랜더스
										</c:when>
										<c:when test="${login.team_code == 2}">
											<img src="images/logo/키움.png" width=auto height="35"> 키움 히어로즈
										</c:when>
										<c:when test="${login.team_code == 3}">
											<img class="rounded-border" src="images/logo/LG.png"
												width=auto height="35"> LG 트윈스
										</c:when>
										<c:when test="${login.team_code == 4}">
											<img src="images/logo/KT.png" width=auto height="35"> KTwiz
										</c:when>
										<c:when test="${login.team_code == 5}">
											<img src="images/logo/KIA.png" width=auto height="35"> KIA타이거즈
										</c:when>
										<c:when test="${login.team_code == 6}">
											<img src="images/logo/NC.png" width=auto height="35"> NC다이노스
										</c:when>
										<c:when test="${login.team_code == 7}">
											<img src="images/logo/삼성.png" width=auto height="35"> 삼성 라이온즈
										</c:when>
										<c:when test="${login.team_code == 8}">
											<img src="images/logo/롯데.png" width=auto height="35"> 롯데 자이언츠
										</c:when>
										<c:when test="${login.team_code == 9}">
											<img src="images/logo/두산.png" width=auto height="35"> 두산 베어스
										</c:when>
										<c:when test="${login.team_code == 10}">
											<img src="images/logo/한화.png" width=auto " height="35"> 한화 이글스
										</c:when>
									</c:choose>
						</a>
					</div>
					
					
					<c:if test="${empty login}">
						<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
							href="loginForm" role="button">로그인</a></li>
						<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
							href="memberForm" role="button">회원가입</a></li>
					</c:if>
					<c:if test="${!empty login}">
						<c:if test="${login.userid ne 'admin'}">
							<div class="dropdown mb-2 mb-lg-0 mx-5 mt-2">
								<a class="btn btn-secondary dropdown-toggle" href="#"
									role="button" data-bs-toggle="dropdown" aria-expanded="false"
									style="color: rgb(0, 0, 0, 0.8)"> &nbsp;${login.userid} <i class="fas fa-caret-down mx-2"></i>
								</a>
								<ul class="dropdown-menu" style="text-align: center;">
									<table class="mx-auto">
										<tr>
											<li>
											<td><i class="fa-solid fa-face-smile text-gray-400"></i></td>
											<td><a class="dropdown-item" href="mypage">마이페이지</a></td>
											</li>
										</tr>
										<tr>
											<li>
											<td><i
												class="fas fa-sign-out-alt fa-sm fa-fw text-gray-400"></i></td>
											<td><a class="dropdown-item" href="logout">로그아웃</a></td>
											</li>
										</tr>
									</table>
								</ul>
							</div>
						</c:if>
						<c:if test="${login.userid eq 'admin'}">
							<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
								href="logout" role="button">로그아웃</a></li>
							<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
								href="admin/main" role="button">관리자 페이지</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>