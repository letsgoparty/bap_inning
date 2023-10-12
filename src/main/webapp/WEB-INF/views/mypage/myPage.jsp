<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<h1>마이페이지</h1>
	<img src="images/logo/doosan_logo.png" width="100" height="100" class="img-thumbnail">

	<a class="btn btn-primary" href="https://www.doosanbears.com/" role="button">내 팀 홈페이지</a>
	<a class="btn btn-primary" href="https://weather.naver.com/today/09710101" role="button">내 구장 날씨 확인</a>
	<!-- 나의팀 경기일정 등 출력 -->
	<div class="list-group">
	 <a href="myinfo" class="list-group-item list-group-item-action">내 정보 보기</a>
	 <a href="mytext" class="list-group-item list-group-item-action">내가 쓴 글</a> 
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>