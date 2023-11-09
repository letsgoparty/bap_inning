<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>선수 상세정보</title>
<link href="css/playerInfo.css" rel="stylesheet" />
<style>
ul {
	list-style: none;
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

a {
	text-decoration: none !important;
}
</style>
<body>
	<jsp:include page="../common/nav.jsp" flush="true" />
	<div class="sub_container player_detail">
		<div class="player_dic">
			<div class="txt_wrap">
				<a href="players">
					<h5 style="margin-bottom: 50px !important; color: #a7a8aa;">
						<i class="fa-solid fa-angles-left" style="color: #a7a8aa;"></i>선수단
						목록
					</h5>
				</a>
				<p class="role" id="POSITION">
					<!-- 선수 포지션 -->
					<span>${dto.player_no} </span>
					<c:set var="position" value="${dto.position}" />
					<c:set var="positionArray" value="${fn:split(position, '·')}" />
					${positionArray[0]} <input type="hidden" id="TTM_SEQ"> <input
						type="hidden" id="POSITION_CODE" value="PTC">
				</p>
				<p class="tota">${positionArray[1]}</p>
				<h3 class="name" id="MEMBER">
					${dto.player} <input type="hidden" id="playerName"
						value="${dto.player}">
				</h3>
				<p>${dto.name}</p>

			</div>
			<div class="song_wrap"></div>
			<div class="img_wrap" id="MEMBER_IMG">
				<!-- 선수이미지 -->
				<img src="${dto.image}" alt="">
			</div>
			<input type="hidden" id="downloadUrl"
				value="/service/download.ncd?actID=BR_RetrieveFile&amp;baRq=IN_DS&amp;baRs=DOWNLOAD&amp;IN_DS.FILE_ID=">
			<input type="hidden" id="downloadUrl02"
				value="/service/download.ncd?actID=BR_RetrieveFile&amp;baRq=IN_DS&amp;baRs=DOWNLOAD&amp;IN_DS.LF_SEQ=">
			<input type="hidden" id="downloadUrl_profile"
				value="/service/download.ncd?actID=BR_RetrieveProfileFile&amp;baRq=IN_DS&amp;baRs=DOWNLOAD&amp;IN_DS.FILE_ID=">
			<input type="hidden" id="ID" name="ID" value=""> <input
				type="hidden" id="authCode" name="authCode" value=""> <input
				type="hidden" id="GYEAR" name="GYEAR" value="2023">

			<div class="season_score">
				<div class="header" id="latestSeason">
					<p>2023시즌 기록</p>
				</div>
				<ul id="recentAvgScore">
					<c:if test="${positionArray[0] eq '투수 '}">
						<li>
							<p class="title">평균자책점</p>
							<p class="number">${dto.era}</p>
							<p></p>
						</li>
						<li>
							<p class="title">WHIP</p>
							<p class="number">${dto.whip}</p>
						</li>
						<li>
							<p class="title">${dto.c_category}</p>
							<p class="number">${dto.c_count}</p>
						</li>
						<li>
							<p class="title">이닝</p>
							<p class="number" style="font-size: 1.5rem">${dto.inning}</p>
						</li>
						<li>
							<p class="title">탈삼진</p>
							<p class="number">${dto.strikeout}</p>
						</li>
					</c:if>
					<c:if test="${positionArray[0] ne '투수 '}">
						<li>
							<p class="title">타율</p>
							<p class="number">${dto.batting}</p>
							<p></p>
						</li>
						<li>
							<p class="title">안타</p>
							<p class="number">${dto.hit}</p>
						</li>
						<li>
							<p class="title">홈런</p>
							<p class="number">${dto.homerun}</p>
						</li>
						<li>
							<p class="title">타점</p>
							<p class="number" style="font-size: 1.5rem">${dto.rbi}</p>
						</li>
						<li>
							<p class="title">도루</p>
							<p class="number">${dto.steal}</p>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="skew_bg" style="border-right: 1569px solid transparent;"></div>
	</div>
</body>

</html>
