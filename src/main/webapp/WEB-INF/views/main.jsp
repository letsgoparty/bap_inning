<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈페이지</title>
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
<body>

	<jsp:include page="common/nav.jsp" flush="true" />


	<div class="row">
		<!--  KBO 경기 일정  -->
		<div class="col-md-5 offset-md-1">
			<table class="table table-striped"
				style="font-family: 'KBO-Dia-Gothic_light';">
				<thead>
					<tr style="font-family: 'KBO-Dia-Gothic_bold';">
						<th scope="col">날짜</th>
						<th scope="col">시간</th>
						<th scope="col">경기</th>
						<th scope="col">구장</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="schedule" items="${ScheduleList}">
						<tr>
							<td>${schedule.day}</td>
							<td>${schedule.time}</td>
							<td>${schedule.team1}${schedule.vs} ${schedule.team2}</td>
							<td>${schedule.location}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--  KBO 경기 일정 끝 -->

		<!--  KBO 리그 순위 -->
		<div class="col-md-4 offset-md-1">
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
</body>
</html>