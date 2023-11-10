<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팀 순위</title>
<link href="css/baseball.css" rel="stylesheet" />
<style>
.input-form {
	max-width: 800px;
}

#rank {
	color: rgb(130, 203, 196) !important;
	font-size: 2.5rem;
}
</style>
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
					<li class="list-group-item"><a href="highlight">하이라이트</a></li>
					<li class="list-group-item active"><a href="rank">팀 순위</a></li>
					<li class="list-group-item"><a href="players">선수 정보</a></li>
					<li class="list-group-item"><a href="myPlayer">찜한 선수</a></li>
				</ul>
			</aside>
			<div class="input-form-background col-md-9"
				style="margin: 0px !important;">
				<div class="input-form">
					<h3 class="mb-2" style="font-family: 'KBO-Dia-Gothic_bold'">
						<i class="fa-solid fa-ranking-star" style="color: #c2c2c2;"></i>&nbsp;
						현재
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
						의 순위는 <span id="rank"
							style="<c:if test="${filterTeamData.rank eq '1'}">color: rgb(255,205,74) !important;</c:if>">${filterTeamData.rank}</span>
						등 입니다.

					</h3>
					<div id="my_rank" class="mt-4 rounded"
						style="text-align: center; border: 1px solid #ccc;">
						<c:choose>
							<c:when test="${filterTeamData.rank != null}">
								<div class="mx-3"
									style="display: inline-block; vertical-align: top;">
									<img src="images/ranking/rank${filterTeamData.rank}.PNG"
										alt="img" width="150" height="200" />
								</div>

								<div class="me-4"
									style="display: inline-block; font-family: 'KBO-Dia-Gothic_bold';">
									<h2 class="mt-3">
										<img src="images/logo/${filterTeamData.title}.png" width=auto
											height=50>&nbsp;
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
									<p style="font-size: 1.8rem;">${filterTeamData.victory}승
										${filterTeamData.defeat}패 ${filterTeamData.draw}무</p>
									<p style="font-size: 1.3rem">
										연속 <span style="font-weight: bold">${filterTeamData.winning}</span>
										&nbsp; 승률 <span style="font-weight: bold">${Math.floor(filterTeamData.rate * 100)}
											%</span>
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
				</div>
			</div>

		</div>
	</div>


</body>
</html>