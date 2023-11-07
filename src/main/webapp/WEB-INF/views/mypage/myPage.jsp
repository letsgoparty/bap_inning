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
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
	 
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
	</style> 
	 
<!-- 	<style>

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

.no-schedule, .no-team {
	font-size: 30px;
	font-weight: bold;
}


</style>  -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	

<!-- swiper 에 필요한것 -->
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script> -->
<!-- swiper 에 필요한것 -->


<!-- 
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

	});
</script>

 -->
</head>
<body>
	<jsp:include page="../common/nav.jsp" flush="true"/> 
	
<%-- 	
	
	<!-- 경기 type정하기 위해 오늘날짜 가져옴 -->
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="MM.dd" var="today" />
	<!-- 경기 type정하기 위해 오늘날짜 가져옴 -->

 --%>

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-8 mx-auto">
				
				<h3 class="mb-3">마이페이지</h3>
				
<%-- 				
				<div
					style="display: flex; justify-content: space-between; align-items: flex-end;">
					<div>
						<img src="#" width="50" height="50" class="img-thumbnail"
							id="myTeamLogo"> <span>환영합니다 ${user.nickname} 님</span>
					</div>
					<span id="myTeamCode" hidden>${user.team_code}</span>
					<div>
						<a class="btn btn-primary" href=".." role="button" id="myTeamPage">내
							팀 홈페이지</a> <a class="btn btn-primary" href=".." role="button"
							id="myTeamWeather">내 구장 날씨 확인</a>
					</div>
				</div>
				
 --%>				
<%-- 				
				<div id="my_rank" class="mt-4 rounded"
					style="text-align: center; border: 1px solid #ccc; border-bottom: none;">
					<c:choose>
						<c:when test="${filterTeamData.rank != null}">
							<div class="mx-3"
								style="display: inline-block; vertical-align: top;">
								<img src="images/ranking/rank${filterTeamData.rank}.PNG"
									alt="img" width="150" height="200" />
							</div>

							<div class="me-4" style="display: inline-block;">
								<h2 class="mt-3" style="font-family: 'KBO-Dia-Gothic_bold';">
									<img src="images/logo/${filterTeamData.title}.png" width=auto
										height=40>&nbsp;
									<c:choose>
										<c:when test="${filterTeamData.title eq 'SSG'}">
        							${filterTeamData.title} 랜더스
    							</c:when>
										<c:when test="${filterTeamData.title eq '키움'}">
        							${filterTeamData.title} 히어로즈
    							</c:when>
										<c:when test="${filterTeamData.title eq 'LG'}">
        							${filterTeamData.title} 트윈스
    							</c:when>
										<c:when test="${filterTeamData.title eq 'KT'}">
        							${filterTeamData.title} wiz
    							</c:when>
										<c:when test="${filterTeamData.title eq 'KIA'}">
        							${filterTeamData.title} 타이거즈
    							</c:when>
										<c:when test="${filterTeamData.title eq 'NC'}">
        							${filterTeamData.title} 다이노스
    							</c:when>
										<c:when test="${filterTeamData.title eq '롯데'}">
        							${filterTeamData.title} 자이언츠
    							</c:when>
										<c:when test="${filterTeamData.title eq '삼성'}">
        							${filterTeamData.title} 라이온즈
    							</c:when>
										<c:when test="${filterTeamData.title eq '두산'}">
        							${filterTeamData.title} 베어스
    							</c:when>
										<c:when test="${filterTeamData.title eq '한화'}">
        							${filterTeamData.title} 이글스
    							</c:when>
									</c:choose>
								</h2>
								<p style="font-size: 1.8rem; font-weight: bold">${filterTeamData.victory}승
									${filterTeamData.defeat}패 ${filterTeamData.draw}무</p>
								<p style="font-size: 1.3rem">
									연속 <span style="font-weight: bold">${filterTeamData.winning}</span>
									&nbsp; 승률 <span style="font-weight: bold">${filterTeamData.rate}</span>
								</p>
								<p>
									최근 10경기 <span style="font-weight: bold">${filterTeamData.recent}</span>
								</p>
							</div>
						</c:when>
						<c:when test="${filterTeamData.rank == null}">
							<p class="no-team">응원팀이 없습니다.</p>
							<a href="myinfo">응원팀 설정하러 가기</a>
						</c:when>
					</c:choose>
				</div>
				<!-- 나의팀 경기일정 등 출력 -->
				<div class="swiper mb-3">
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
				<!-- 나의팀 경기일정 등 출력 -->

 --%>
 
 				<div class="list-group">
					<a href="myinfo" class="list-group-item list-group-item-action">내
						정보 보기</a> <a href="mytext"
						class="list-group-item list-group-item-action">내가 쓴 글</a>
				</div>
			</div>
		</div>
	</div>

<!-- 
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
			case "0":
				logoElement.src = "images/logo/noTeam.png";
				pageElement.href = "#";
				weatherElement.href = "#";
				break;
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

 -->		
</body>
</html>