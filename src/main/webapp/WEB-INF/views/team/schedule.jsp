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
<style>
.input-form {
	max-width: 800px;
}

.swiper {
	/* max-width: 800px; */
	height: 200px !important;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid #DDDDDD;
}

.swiper-slide {
	text-align: center;
}

.team-vs {
	display: flex;
	align-items: center;
	justify-content: center;
}

.team {
	display: flex;
	align-items: center;
}

.vs {
	font-weight: bold;
	font-size: 54px;
}

.date {
	margin-right: 10px;
}

.loc {
	margin-right: 10px;
}

.game-option {
	display: flex;
	justify-content: center;
	align-items: center;
}

.team-vs .team .club-logo img {
	max-height: 100px; /* 원하는 최대 높이로 조정하세요 */
	width: auto; /* 가로 크기를 자동으로 조정하여 비율 유지 */
}

.team-box {
	padding: 32px;
}

.swiper-button-prev {
	background: none;
	border: none;
}

.swiper-button-next {
	background: none;
	border: none;
}

.type {
	border: 1px solid #DDDDDD;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	padding: 3px;
}

.no-schedule, .no-team {
	font-size: 30px;
	font-weight: bold;
}

th:nth-child(2) {
	text-align: center !important;
}

caption {
	display: none;
}

caption {
	display: none;
}

.table-container {
	border-radius: 15px;
	overflow: hidden;
	width: 90%;
}

table.tScore {
	border-collapse: collapse;
}

table.tScore th, table.tScore td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

table.tScore thead th {
	background-color: #f2f2f2;
	font-weight: bold;
}

.point {
	font-weight: bold;
	color: red;
}

.hit {
	background-color: #ffe992;
}

h3, h4 {
	color: rgb(0, 0, 0, 0.8) !important;
	text-shadow: 2px 2px 4px rgba(188, 188, 188);
	font-family: 'KBO-Dia-Gothic_bold' !important;
}

aside a {
	text-decoration: none !important;
	color: black !important;
}

.list-group-item:hover {
	background-color: rgb(199, 199, 199, 0.5) !important;
	font-color: black !important;
	border-radius: 5px;
}

.list-group .list-group-item {
	border: none;
	background-color: rgba(248, 249, 250, 0.5);
}

.list-group-item.active {
	color: white;
	background-color: rgb(199, 199, 199, 0.7) !important;
	border-color: #c5c5c5 !important;
	border-radius: 5px;
}

.tScore {
	display: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>


<script>
	$(document).ready(function() {
		//swiper 처음 보여줄 슬라이드 지정하기
		var totalSlide = $('.swiper-slide').length;
		var initialSlideIndex = totalSlide - 1;
		$('.swiper-slide').each(function(index) {
			var status = $(this).find('.type span').text();
			console.log(status);

			if (status === '오늘 경기') {
				initialSlideIndex = index;
				return false;
			} else if (status === '경기예정') {
				initialSlideIndex = index;
				return false;
			}
		});

		// swiper초기화 
		var swiper = new Swiper(".swiper-container", {
			slidesPerView : 1,
			speed : 1000,
			loop : false,
			initialSlide : initialSlideIndex, // 첫번째로 보여줄 슬라이드
			navigation : {
				prevEl : '.swiper-button-prev',
				nextEl : '.swiper-button-next',
			}
		});

		var rowValues = [];
		var teamCode = $("#myTeam").val();
		$('th[scope="row"]').each(function() {
			rowValues.push($(this).text());
		});

		console.log(rowValues); // KT, LG
		console.log(teamCode);

		if (rowValues.includes(teamCode)) {
			$(".tScore").show();
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
					<li class="list-group-item active"><a href="schedule">경기일정</a></li>
					<li class="list-group-item"><a href="record">경기결과</a></li>
					<li class="list-group-item"><a href="highlight">하이라이트</a></li>
					<li class="list-group-item"><a href="rank">팀 순위</a></li>
					<li class="list-group-item"><a href="players">선수 정보</a></li>
				</ul>
			</aside>
			<div class="input-form-background col-md-9"
				style="margin: 0px !important;">
				<div class="input-form">
					<h3><i class="fa-solid fa-calendar" style="color: #b8babc;"></i>&nbsp;
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
						의 경기 일정
					</h3>
					<!-- 나의팀 경기일정 등 출력 -->
					<div class="swiper mb-5">
						<div class="team-arg-box">
							<button class="swiper-button-prev"></button>
							<button class="swiper-button-next"></button>

							<div class="swiper-container">
								<div class="swiper-wrapper">

									<!--S : 반복구간 -->
									<c:choose>
										<c:when test="${empty filterScheduleList}">
											<div class="swiper-slide">
												<div class="team-box">
													<span class="no-schedule">예정된 경기가 없습니다.</span>
												</div>
											</div>
										</c:when>
										<c:otherwise>

											<c:forEach items="${filterScheduleList}" var="schedule">
												<div class="swiper-slide">
													<div class="team-box">
														<div class="game-option">
															<div class="date">${schedule.day}</div>
															<div class="loc">${schedule.location}</div>
															<div class="type">
																<!-- schedule.day가 10.19(목) 이런 모양의 string임 -->
																<c:set var="trimmedDate"
																	value="${fn:substring(schedule.day, 0, 5)}" />
																<fmt:parseDate value="${trimmedDate}" pattern="MM.dd"
																	var="scheduleDate" />
																<!-- 뒤에 요일 절삭하고 MM.dd 의 날짜형식으로 바꾼뒤 비교 -->
																<c:choose>
																	<c:when test="${trimmedDate eq today}">
																		<!--경기가 오늘인 경우-->
																		<span>오늘 경기</span>
																	</c:when>
																	<c:when test="${trimmedDate lt today}">
																		<!--경기가 과거인 경우-->
																		<span>경기종료</span>
																	</c:when>
																	<c:otherwise>
																		<!--경기가 미래인 경우-->
																		<span>경기예정</span>
																	</c:otherwise>

																</c:choose>
															</div>
														</div>

														<div class="team-vs">
															<div class="team" id="team1">
																<div class="club-logo mx-5">
																	<img alt="${schedule.team1}"
																		src="images/logo/${schedule.team1}.png">
																</div>
															</div>

															<c:set var="vsArray"
																value="${fn:split(schedule.vs, 'vs')}" />
															<c:set var="number1" value="${vsArray[0]}" />
															<c:set var="number2" value="${vsArray[1]}" />

															<div class="vs mx-3">
																<c:choose>
																	<c:when test="${number1 > number2}">
																		<span style="color: #c93c3c;">${number1}</span> vs
                                        <span style="color: gray;">${number2}</span>
																	</c:when>
																	<c:when test="${number1 < number2}">
																		<span style="color: gray;">${number1}</span> vs
                                        <span style="color: #c93c3c;">${number2}</span>
																	</c:when>
																	<c:otherwise>
																		<span>${number1} vs ${number2}</span>
																	</c:otherwise>
																</c:choose>
															</div>
															<div class="team" id="team2">
																<div class="club-logo mx-5">
																	<img alt="${schedule.team2}"
																		src="images/logo/${schedule.team2}.png">
																</div>
															</div>
														</div>
													</div>
												</div>

											</c:forEach>
										</c:otherwise>
									</c:choose>
									<!--E : 반복구간 -->
								</div>
							</div>
						</div>

					</div>
					<!-- 나의팀 경기일정 등 출력 끝 -->

					<h4 class="mb-2" style="font-family: 'KBO-Dia-Gothic_bold'">스코어보드</h4>
					<p>
						<i class="fa-solid fa-triangle-exclamation"
							style="color: #c2c2c2;"></i> 스코어보드는 경기 당일 실시간으로 표시됩니다.
					</p>
					<div class="table-container">${ScoreBoard}</div>
				</div>
			</div>
		</div>


	</div>


</body>
</html>