<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="height: 9rem">
        <div class="container-fluid">
            <a class="navbar-brand" href=" ??? ">
                <img src="images/mainlogo.PNG" alt="Logo" width="250" height="140" class="d-inline-block align-text-top"> <!-- img 경로 수정해야함 -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="dropdown mb-2 mb-lg-0">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false"
                        style="font-size: 1.2rem; background-color: rgb(248, 249, 250); color: black; border-color: rgb(248,249,250);">
                        🍽️ 맛집 찾기
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">인천 SSG 랜더스 필드</a></li>
                        <li><a class="dropdown-item" href="#">고척 스카이돔</a></li>
                        <li><a class="dropdown-item" href="#">잠실 종합 운동장</a></li>
                        <li><a class="dropdown-item" href="#">수원 KT 위즈 파크</a></li>
                        <li><a class="dropdown-item" href="#">광주 KIA 챔피언스 필드</a></li>
                        <li><a class="dropdown-item" href="#">창원 NC 파크</a></li>
                        <li><a class="dropdown-item" href="#">대구 삼성 라이온즈 파크</a></li>
                        <li><a class="dropdown-item" href="#">부산 사직 야구장</a></li>
                        <li><a class="dropdown-item" href="#">대전 한화생명 이글스파크</a></li>
                    </ul>
                </div>
                <div class="dropdown mb-2 mb-lg-0 mx-2 ">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false"
                        style="font-size: 1.2rem; background-color: rgb(248, 249, 250); color: black; border-color: rgb(248,249,250);">
                        💒 숙소 찾기
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">인천 SSG 랜더스 필드</a></li>
                        <li><a class="dropdown-item" href="#">고척 스카이돔</a></li>
                        <li><a class="dropdown-item" href="#">잠실 종합 운동장</a></li>
                        <li><a class="dropdown-item" href="#">수원 KT 위즈 파크</a></li>
                        <li><a class="dropdown-item" href="#">광주 KIA 챔피언스 필드</a></li>
                        <li><a class="dropdown-item" href="#">창원 NC 파크</a></li>
                        <li><a class="dropdown-item" href="#">대구 삼성 라이온즈 파크</a></li>
                        <li><a class="dropdown-item" href="#">부산 사직 야구장</a></li>
                        <li><a class="dropdown-item" href="#">대전 한화생명 이글스파크</a></li>
                    </ul>
                </div>
            <div class="dropdown me-auto mb-2 mb-lg-0 mx-2 ">
                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"
                    style="font-size: 1.2rem; background-color: rgb(248, 249, 250); color: black; border-color: rgb(248,249,250);">
                    ⚾️ 자유게시판
                </a>

                <ul class="dropdown-menu">
                    <li style="display: flex; align-items: center;"><img src="ssg_logo.svg" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">SSG 랜더스</a></li>
                    <li style="display: flex; align-items: center;"><img src="kiwoom_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">키움 히어로즈</a></li>
                    <li style="display: flex; align-items: center;"><img src="lg_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">LG 트윈스</a></li>
                    <li style="display: flex; align-items: center;"><img src="ktwiz_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">KT wiz</a></li>
                    <li style="display: flex; align-items: center;"><img src="kia_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">KIA 타이거즈</a></li>
                    <li style="display: flex; align-items: center;"><img src="nc_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">NC 다이노스</a></li>
                    <li style="display: flex; align-items: center;"><img src="samsung_logo.png" alt="Logo" width="30" height="35"><a class="dropdown-item" href="#">삼성 라이온즈</a></li>
                    <li style="display: flex; align-items: center;"><img src="lotte_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">롯데 자이언츠</a></li>
                    <li style="display: flex; align-items: center;"><img src="doosan_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">두산 베어스</a></li>
                    <li style="display: flex; align-items: center;"><img src="hanwah_logo.png" alt="Logo" width="30" height="30"><a class="dropdown-item" href="#">한화 이글스</a></li>
                </ul>
            </div>

            <form class="d-flex" role="search">
                <c:if test="${empty login}">
                    <ul class="navbar-nav me-auto mb-2 me-lg-5">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="<c:url value='loginUI' />"><span
                                    style="font-size: 1.2rem">로그인</span></a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='memberUI'/>"><span
                                    style="font-size: 1.2rem">회원가입</span></a></li>
                    </ul>
                </c:if>
                <c:if test="${!empty login}">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="<c:url value='logout'/>"><span
                                    style="font-size: 1.2rem">로그아웃</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='myPage'/>"><span
                                    style="font-size: 1.2rem">마이페이지</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value='CartList'/>"><span
                                    style="font-size: 1.2rem">장바구니</span></a></li>
                    </ul>
                </c:if> 
            </form>
        </div>
        </div>
    </nav>
</body>
</html>