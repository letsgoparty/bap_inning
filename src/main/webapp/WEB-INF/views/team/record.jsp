<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PlayerInfo</title>
<link rel="stylesheet" href="css/record.css">
<link rel="stylesheet" href="css/matchBox.css">
<link rel="stylesheet" href="css/baseball.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$(document).on('click', '.recordButton', function() {

			var day = $(this).data("day");
			var team1 = $(this).data("team1");
			var team2 = $(this).data("team2");

			var mmdd = day.slice(0, 2) + day.slice(3, 5);
			
			/* 현재는 포스트시즌 이므로 다음 코드 동작 */
			if (mmdd >= '1019' && mmdd <= '1020') {
				var requestData = '4444' + mmdd + team1 + team2 + '02023'; // 와일드카드
			} else if(mmdd >= '1022' && mmdd <= '1028') {
				var requestData = '3333' + mmdd + team1 + team2 + '02023'; // 준플레이오프
			} else if (mmdd >= '1030' && mmdd <= '1105') {
				var requestData = '5555' + mmdd + team1 + team2 + '02023'; // 플레이오프
			} else {
				var requestData = '7777' + mmdd + team1 + team2 + '02023'; //  한국시리즈
			}

			/* 정규시즌 동작 코드 */
			/*
			var requestData = '2023' + mmdd + team1 + team2 + '02023'; // 정규시즌
			*/
			var recordId = day.slice(0, 5);
			var divIdValue = document.getElementById('record_' + recordId);
			var isContentVisible = (divIdValue.style.display !== 'none');

			$("#record_" + recordId).toggle();

			$.ajax({
				url : 'recordInfo',
				method : 'POST',
				data : {
					requestData : requestData
				},
				success : function(response) {
					divIdValue.innerHTML = response;
					console.log(response);

					// 토글 적용
					if (isContentVisible) {
						// 현재 보이는 상태면 숨김
						divIdValue.style.display = 'none';
					} else {
						// 현재 숨겨진 상태면 보이게 함
						divIdValue.style.display = 'block';
					}
				},
				error : function(error) {
					console.log("error");
				}
			});

		});
	});
</script>
<body>
	<jsp:include page="../common/nav.jsp" flush="true" />
	<div class="container mt-5">
		<div class="row">
			<aside class="col-md-3 me-1" style="width: 20%;">
				<hr style="border: 2px solid #000;">
				<ul class="list-group">
					<li class="list-group-item"><a href="schedule">경기일정</a></li>
					<li class="list-group-item active"><a href="record">경기기록</a></li>
					<li class="list-group-item"><a href="highlight">하이라이트</a></li>
					<li class="list-group-item"><a href="rank">팀 순위</a></li>
					<li class="list-group-item"><a href="players">선수 정보</a></li>
				</ul>
			</aside>
			<div class="input-form-background col-md-9"
				style="margin: 0px !important;">
				<div class="input-form ms-4">
					<h3 class="mb-3">
						<i class="fa-solid fa-baseball-bat-ball" style="color: #b1b2b4;"></i>&nbsp;
						경기 기록
					</h3>

					<ul class="ScheduleAllType_match_list__3n5L_">
						<c:forEach var="dto" items="${filterScheduleList}">
							<c:set var="vsArray" value="${fn:split(dto.vs, 'vs')}" />
							<c:choose>
								<c:when test="${not empty vsArray[0] && not empty vsArray[1]}">
									<c:set var="number1" value="${Integer.parseInt(vsArray[0])}" />
									<c:set var="number2" value="${Integer.parseInt(vsArray[1])}" />
								</c:when>
								<c:otherwise>
									<c:set var="number1" value="" />
									<c:set var="number2" value="" />
								</c:otherwise>
							</c:choose>
							<li
								class="MatchBox_match_item__31PMw MatchBox_type_baseball__1nACu type_end mb-2"
								style="background-color: rgba(248, 249, 250, 0.5) !important;">
								<div class="MatchBox_item_content__1KkXZ" style="">
									<div class="MatchBox_match_sub_info__2a1Zx">
										<div class="mx-2" style="font-size: 1rem;">
											<span class="blind">경기 시간</span>${dto.day}
										</div>
										<div class="MatchBox_time__1bZbx">
											<span class="blind">경기 시간</span>${dto.time}
										</div>
										<div class="MatchBox_stadium__2JwBI">
											<span class="blind">경기장</span>${dto.location}
										</div>
									</div>
									<div class="MatchBox_match_area__28gik">
										<em class="MatchBox_status__-zxwr">종료</em>
										<div
											class="MatchBox_team_item__1pT_I MatchBox_type_winner__7UYUD">
											<div class="MatchBox_team_wrap__3OW9H">
												<div class="MatchBox_emblem__1W_L9">
													<img src="images/logo/${dto.team1}.png" alt="" width="32"
														height="32" aria-hidden="true">
												</div>
												<div class="MatchBox_team_name__2thEf">

													<div class="MatchBox_name_info__3UVqa">

														<strong class="MatchBox_team__2Cf-Y">${dto.team1}</strong>
														<c:choose>
															<c:when test="${number1 > number2}">
																<span class="MatchBox_home_mark__jmlSe"
																	style="background-color: rgb(154, 225, 253) !important;">승</span>
															</c:when>
															<c:when test="${number1 < number2}">
																<span class="MatchBox_home_mark__jmlSe"
																	style="background-color: rgb(253, 161, 148) !important;">패</span>
															</c:when>
															<c:otherwise>
																<span class="MatchBox_home_mark__jmlSe">무</span>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
											<div class="MatchBox_score_wrap__2uoBR">
												<span class="blind">스코어</span><strong
													class="MatchBox_score__3nLsJ">${number1}</strong>
											</div>
										</div>
										<div
											class="MatchBox_team_item__1pT_I MatchBox_type_loser__27GFH">
											<div class="MatchBox_team_wrap__3OW9H">
												<div class="MatchBox_emblem__1W_L9">
													<img src="images/logo/${dto.team2}.png" alt="" width="32"
														height="32" aria-hidden="true">
												</div>
												<div class="MatchBox_team_name__2thEf">
													<div class="MatchBox_name_info__3UVqa">
														<strong class="MatchBox_team__2Cf-Y">${dto.team2}</strong>

														<c:choose>
															<c:when test="${number1 > number2}">
																<span class="MatchBox_home_mark__jmlSe"
																	style="background-color: rgb(253, 161, 148) !important;">패</span>
															</c:when>
															<c:when test="${number1 < number2}">
																<span class="MatchBox_home_mark__jmlSe"
																	style="background-color: rgb(154, 225, 253) !important;">승</span>
															</c:when>
															<c:otherwise>
																<span class="MatchBox_home_mark__jmlSe">무</span>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
											<div class="MatchBox_score_wrap__2uoBR" style="color: black;">
												<strong class="MatchBox_score__3nLsJ">${number2}</strong>
											</div>
										</div>
									</div>
									<div class="MatchBox_link_area__3gfeT">
										<div class="MatchBox_link_match_wrap__1XRs_">
											<a class="btn btn-primary recordButton"
												data-team1=${dto.team1
												}
												data-team2=${dto.team2 } data-day=${dto.day}>기록</a>
										</div>
									</div>
								</div>
							</li>

							<c:set var="recordId" value="${fn:substring(dto.day, 0, 5)}" />
							<div id="record_${recordId}" style="display: none;"></div>
						</c:forEach>
					</ul>

				</div>
			</div>
		</div>
	</div>
</body>

</html>