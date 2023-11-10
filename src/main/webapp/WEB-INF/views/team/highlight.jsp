<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 일정</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
<link rel="stylesheet" href="css/baseball.css">
<style>
.input-form {
	max-width: 800px;
}

.boardMovie {
	overflow: hidden;
	margin-bottom: 37px;
	float: left;
}

.video {
	position: relative;
}

.video img {
	top: 0;
	left: 0;
	z-index: 1;
}

.boardMovie .tvTit strong {
	color: #4c4f55;
}

.boardMovie .video img {
	display: block;
}

.boardMovie .btnPlay {
	display: block;
	position: absolute;
	left: 5px;
	top: 5px;
}

.boardMovie li {
	float: left;
	width: 252px;
	margin-right: 17px;
	height: 210px;
	margin-bottom: 15px;
}

.boardMovie .tvTit .date {
	display: block;
	font-size: 11px;
}

.boardMovie .tvTit {
	padding: 10px 10px 0 10px;
	line-height: 16px;
	margin: 0;
	margin-bottom: 23px;
	color: #4c4f55;
}

.boardMovie .video {
	position: relative;
	width: 237px;
	height: 137px;
	padding: 5px;
	border: 1px solid #e6e6e6;
}

.date {
	font-size: 0.8rem !important;
}

.video {
	display: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		var original = $(".btnPlay").attr("href");
		// "https://www.koreabaseball.com/"를 추가하여 새로운 href를 생성
		var newHref = "https://www.koreabaseball.com/" + original;

		$(".btnPlay").attr("href", newHref);
		$(".btnPlay").attr("target", "_blank");

		var teamCode = $("#myTeam").val();

		var pText = $(".tvTit").text();

		if (pText.includes(teamCode)) {
			// 하이라이트 영상 title에 응원팀의 단어가 포함되어 있을 경우
			$(".video").show();
		} else {
			$(".video").hide();
		}
	});
</script>
</head>
<body>
	<input type="hidden" id="myTeam" value="${myTeam}">
	<jsp:include page="../common/nav.jsp" flush="true" />
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="MM.dd" var="today" />

	<div class="container mt-5">
		<div class="row">
			<aside class="col-md-3 me-5" style="width: 20%;">
				<hr style="border: 2px solid #000;">
				<ul class="list-group">
					<li class="list-group-item"><a href="schedule">경기일정</a></li>
					<li class="list-group-item"><a href="record">경기기록</a></li>
					<li class="list-group-item active"><a href="highlight">하이라이트</a></li>
					<li class="list-group-item"><a href="rank">팀 순위</a></li>
					<li class="list-group-item"><a href="players">선수 정보</a></li>
				</ul>
			</aside>
			<div class="input-form-background col-md-9"
				style="margin: 0px !important;">
				<div class="input-form">
					<h3 class="mb-2" style="font-family: 'KBO-Dia-Gothic_bold'">
					<i class="fa-solid fa-video" style="color: #c7c7c7;"></i>&nbsp;
						<c:choose>
							<c:when test="${myTeam eq 'SSG'}">
        							${myTeam} 랜더스
    							</c:when>
							<c:when test="${myTeam eq '키움'}">
        							${myTeam} 히어로즈
    							</c:when>
							<c:when test="${myTeam eq 'LG'}">
        							${myTeam} 트윈스
    							</c:when>
							<c:when test="${myTeam eq 'KT'}">
        							${myTeam} wiz
    							</c:when>
							<c:when test="${myTeam eq 'KIA'}">
        							${myTeam} 타이거즈
    							</c:when>
							<c:when test="${myTeam eq 'NC'}">
        							${myTeam} 다이노스
    							</c:when>
							<c:when test="${myTeam eq '롯데'}">
        							${myTeam} 자이언츠
    							</c:when>
							<c:when test="${myTeam eq '삼성'}">
        							${myTeam} 라이온즈
    							</c:when>
							<c:when test="${myTeam eq '두산'}">
        							${myTeam} 베어스
    							</c:when>
							<c:when test="${myTeam eq '한화'}">
        							${myTeam} 이글스
    							</c:when>
						</c:choose>
						의 하이라이트
					</h3>
					<div class="video"><ul id="ulHighlight" class="boardMovie">${highlight}</ul></div>
				</div>
			</div>
		</div>


	</div>


</body>
</html>