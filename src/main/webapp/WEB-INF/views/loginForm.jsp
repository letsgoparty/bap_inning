<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<style>
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
	font-weight: 700;
	font-style: normal;
}
</style>
<body style="background-color:rgba(248, 249, 250) !important;">

	<jsp:include page="common/nav.jsp" flush="true" />

	<jsp:include page="login/loginForm.jsp" flush="true"/>
</body>
</html>