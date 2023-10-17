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
<link href="css/styles.css" rel="stylesheet" />
</head>

<body id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
		<div class="container px-5">
			<a class="navbar-brand" href="main"> <img
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
								src="images/logo/SSG.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">SSG 랜더스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/키움.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">키움 히어로즈</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/LG.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">LG 트윈스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/KT.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">KT wiz</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/KIA.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">KIA 타이거즈</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/NC.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">NC 다이노스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/삼성.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">삼성 라이온즈</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/롯데.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">롯데 자이언츠</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/두산.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">두산 베어스</a></li>
							<li style="display: flex; align-items: center;"><img
								src="images/logo/한화.png" alt="Logo" width="40" height="35"><a
								class="dropdown-item" href="#">한화 이글스</a></li>
						</ul>
					</div>
					&nbsp&nbsp&nbsp&nbsp&nbsp
						<c:if test="${empty login}">
							<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
								href="loginForm" role="button">로그인</a></li>
							<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
								href="memberForm" role="button">회원가입</a></li>
						</c:if>
						<c:if test="${!empty login}">
							<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
								href="" role="button">로그아웃</a></li>
							<li class="nav-item mx-2 mt-3"><a class="btn btn-primary"
								href="mypage" role="button">마이페이지</a></li>
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