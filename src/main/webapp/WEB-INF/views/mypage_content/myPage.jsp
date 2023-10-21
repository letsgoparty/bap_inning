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
<title>마이페이지</title>
<style>
.input-form {
	max-width: 800px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.swiper {
	max-width: 800px;
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
} /*사이에 간격주기위함*/
.loc {
	margin-right: 10px;
} /*사이에 간격주기위함*/
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

.no-schedule {
	font-size: 30px;
	font-weight: bold;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- swiper 에 필요한것 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<!-- swiper 에 필요한것 -->

<script>
	$(document).ready(function() {
		// swiper초기화 
		var swiper = new Swiper(".swiper-container", {
			slidesPerView : 1,
			speed : 1000,
			loop : false,
			initialSlide : 0, // 첫번째로 보여줄 슬라이드
			navigation : {
				prevEl : '.swiper-button-prev',
				nextEl : '.swiper-button-next',
			}
		});

	});
</script>

</head>
<body>
	<!-- 경기 type정하기 위해 오늘날짜 가져옴 -->
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="MM.dd" var="today" />
	<!-- 경기 type정하기 위해 오늘날짜 가져옴 -->

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<!-- 여기 col-md-12 이거 사이즈 더 작게 해도 될것같음.  -->
				<h3 class="mb-3">마이페이지</h3>
				<div
					style="display: flex; justify-content: space-between; align-items: flex-end;">
					<div>
						<img src="images/logo/SSG.png" width="50" height="50" class="img-thumbnail" id="myTeamLogo">
						<span>환영합니다 "${user.nickname}" 님</span>
					</div>
					<span id="myTeamCode" hidden>${user.team_code}</span>
					<div>
						<a class="btn btn-primary" href=".." role="button" id="myTeamPage">내
							팀 홈페이지</a> <a class="btn btn-primary" href=".." role="button"
							id="myTeamWeather">내 구장 날씨 확인</a>
					</div>
				</div>
				<!-- 나의팀 경기일정 등 출력 -->
				<div class="swiper my-4">
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
															<c:set var="trimmedDate" value="${fn:substring(schedule.day, 0, 5)}" />
															<fmt:parseDate value="${trimmedDate}" pattern="MM.dd" var="scheduleDate" />
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

														<div class="vs mx-3">${number1}&nbsp;vs&nbsp;${number2}</div>

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
				<!-- 나의팀 경기일정 등 출력 -->

				<div class="list-group">
					<a href="myinfo" class="list-group-item list-group-item-action">내
						정보 보기</a> <a href="mytext"
						class="list-group-item list-group-item-action">내가 쓴 글</a>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		window.onload = function() {
			updateTeamElement();
		}
		function updateTeamElement() {
			//내팀 찾는 변수 지정
			var selectedTeam = document.getElementById("myTeamCode").textContent;
			//내팀 찾는 변수 지정
			var logoElement = document.getElementById("myTeamLogo");
			var pageElement = document.getElementById("myTeamPage");
			var weatherElement = document.getElementById("myTeamWeather");

			switch (selectedTeam) {
			case "1":
				logoElement.src = "images/logo/SSG.png";
				pageElement.href = "https://www.ssglanders.com/main";
				weatherElement.href = "https://weather.naver.com/today/11177107";
				break;
			case "2":
				logoElement.src = "images/logo/키움.png";
				pageElement.href = "https://www.heroesbaseball.co.kr/index.do";
				weatherElement.href = "https://weather.naver.com/today/09530106";
				break;
			case "3":
				logoElement.src = "images/logo/LG.png";
				pageElement.href = "https://www.lgtwins.com/service/html.ncd?view=/pc_twins/twins_main/twins_main";
				weatherElement.href = "https://weather.naver.com/today/09710101";
				break;
			case "4":
				logoElement.src = "images/logo/KT.png";
				pageElement.href = "https://www.ktwiz.co.kr/sports/site/baseball/main.do";
				weatherElement.href = "https://weather.naver.com/today/02111136";
				break;
			case "5":
				logoElement.src = "images/logo/KIA.png";
				pageElement.href = "https://tigers.co.kr/";
				weatherElement.href = "https://weather.naver.com/today/05170105";
				break;
			case "6":
				logoElement.src = "images/logo/NC.png";
				pageElement.href = "https://www.ncdinos.com/";
				weatherElement.href = "https://weather.naver.com/today/03127105";
				break;
			case "7":
				logoElement.src = "images/logo/삼성.png";
				pageElement.href = "https://www.samsunglions.com/index.asp";
				weatherElement.href = "https://weather.naver.com/today/06260123";
				break;
			case "8":
				logoElement.src = "images/logo/롯데.png";
				pageElement.href = "https://www.giantsclub.com/html/";
				weatherElement.href = "https://weather.naver.com/today/08260109";
				break;
			case "9":
				logoElement.src = "images/logo/두산.png";
				pageElement.href = "https://www.doosanbears.com/";
				weatherElement.href = "https://weather.naver.com/today/09710101";
				break;
			case "10":
				logoElement.src = "images/logo/한화.png";
				pageElement.href = "https://www.hanwhaeagles.co.kr/index.do";
				weatherElement.href = "https://weather.naver.com/today/07140111";
				break;
			default:
				//팀 선택 안한경우
				logoElement.src = "...";
				pageElement.href = "...";
				weatherElement.href = "...";
			}
		}
	</script>
</body>
</html>