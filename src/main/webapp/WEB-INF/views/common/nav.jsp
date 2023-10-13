<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
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
</style>

</head>

<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="height: 12rem">
		<div class="container-fluid">
			<a class="navbar-brand m-lg-2" href="main"> <img
				src="images/mainlogo.PNG" alt="Logo" width="280" height="120"
				class="d-inline-block align-text-top">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="dropdown mb-2 mb-lg-0">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.7rem; background-color: rgb(248, 249, 250); color: black; border-color: rgb(248, 249, 250);">
							🍽️ 맛집 찾기 </a>

						<ul class="dropdown-menu" style="font-family: 'KBO-Dia-Gothic_bold';">
							<li><a class="dropdown-item" href="r_SSG">인천 SSG 랜더스 필드</a></li>
							<li><a class="dropdown-item" href="r_kiwoom">고척 스카이돔</a></li>
							<li><a class="dropdown-item" href="r_jamsil">잠실 종합 운동장</a></li>
							<li><a class="dropdown-item" href="r_KT">수원 KT 위즈 파크</a></li>
							<li><a class="dropdown-item" href="r_KIA">광주 KIA 챔피언스 필드</a></li>
							<li><a class="dropdown-item" href="r_NC">창원 NC 파크</a></li>
							<li><a class="dropdown-item" href="r_samsung">대구 삼성 라이온즈 파크</a></li>
							<li><a class="dropdown-item" href="r_lotte">부산 사직 야구장</a></li>
							<li><a class="dropdown-item" href="r_hanwha">대전 한화생명 이글스파크</a></li>
						</ul>
					</div>
					<div class="dropdown mb-2 mb-lg-0 mx-2 ">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.7rem; background-color: rgb(248, 249, 250); color: black; border-color: rgb(248, 249, 250);">
							💒 숙소 찾기 </a>

						<ul class="dropdown-menu" style="font-family: 'KBO-Dia-Gothic_bold';">
							<li><a class="dropdown-item" href="l_SSG">인천 SSG 랜더스 필드</a></li>
							<li><a class="dropdown-item" href="l_kiwoom">고척 스카이돔</a></li>
							<li><a class="dropdown-item" href="l_jamsil">잠실 종합 운동장</a></li>
							<li><a class="dropdown-item" href="l_KT">수원 KT 위즈 파크</a></li>
							<li><a class="dropdown-item" href="l_KIA">광주 KIA 챔피언스 필드</a></li>
							<li><a class="dropdown-item" href="l_NC">창원 NC 파크</a></li>
							<li><a class="dropdown-item" href="l_samsung">대구 삼성 라이온즈 파크</a></li>
							<li><a class="dropdown-item" href="l_lotte">부산 사직 야구장</a></li>
							<li><a class="dropdown-item" href="l_hanwha">대전 한화생명 이글스파크</a></li>
						</ul>
					</div>
					<div class="dropdown me-auto mb-2 mb-lg-0 mx-2 ">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.7rem; background-color: rgb(248, 249, 250); color: black; border-color: rgb(248, 249, 250);">
							⚾️ 자유게시판 </a>

						<ul class="dropdown-menu" style="font-family: 'KBO-Dia-Gothic_bold';">
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

					<form class="d-flex" role="search">
						<c:if test="${empty login}">
							<ul class="navbar-nav me-auto mb-2 me-lg-5">
								<li class="nav-item"><a class="nav-link mx-3"
									aria-current="page" href="<c:url value='loginForm' />"><span
										style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.6rem; color: black;">로그인</span></a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="<c:url value='memberForm'/>"><span
										style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.6rem; color: black;">회원가입</span></a></li>
							</ul>
						</c:if>
						<c:if test="${!empty login}">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link mx-3"
									href="<c:url value=''/>"><span
										style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.6rem; color: black;">로그아웃</span></a></li>
								<li class="nav-item"><a class="nav-link mx-3"
									href="<c:url value=''/>"><span
										style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.6rem; color: black;">마이페이지</span></a></li>
								<li class="nav-item"><a class="nav-link mx-3"
									href="<c:url value=''/>"><span
										style="font-family: 'KBO-Dia-Gothic_bold'; font-size: 1.6rem; color: black;">찜💙
											보러가기</span></a></li>
							</ul>
						</c:if>
					</form>
				</div>
		</div>
	</nav>
</body>
</html>