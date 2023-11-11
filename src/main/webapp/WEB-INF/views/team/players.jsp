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
<link href="css/player.css" rel="stylesheet" />
<link href="css/baseball.css" rel="stylesheet" />
<style>
.category a {
	text-decoration: none !important;
	font-family: 'KBO-Dia-Gothic_bold';
	color: rgb(0, 0, 0, 0.6);
	font-size: 1.2rem;
	margin-left: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('.brick-link').hover(function() {

			$(this).css('cursor', 'pointer');
		});

		$('.brick-link').click(function() {
			var player = $(this).data('player');
			var team = $(this).data('team');
			console.log(player);

			var form = $('<form>', {
				action : 'playerInfo',
				method : 'GET'
			});

			$('<input>').attr({
				type : 'hidden',
				name : 'player',
				value : player
			}).appendTo(form);

			$('<input>').attr({
				type : 'hidden',
				name : 'team',
				value : team
			}).appendTo(form);

			form.appendTo('body').submit();
		});

		$("a:contains('전체')").click(function() {
			requestFilter('전체');
		});

		// '투수'를 클릭했을 때
		$("a:contains('투수')").click(function() {
			requestFilter('투수');
		});

		// '포수'를 클릭했을 때
		$("a:contains('포수')").click(function() {
			requestFilter('포수');
		});

		// '외야수'를 클릭했을 때
		$("a:contains('외야수')").click(function() {
			requestFilter('외야수');
		});

		// '내야수'를 클릭했을 때
		$("a:contains('내야수')").click(function() {
			requestFilter('내야수');
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
					<li class="list-group-item"><a href="record">경기기록</a></li>
					<li class="list-group-item"><a href="highlight">하이라이트</a></li>
					<li class="list-group-item"><a href="rank">팀 순위</a></li>
					<li class="list-group-item active"><a href="players">선수 정보</a></li>
					<li class="list-group-item"><a href="myPlayer">찜한 선수</a></li>
				</ul>
			</aside>
			<div class="input-form-background col-md-9"
				style="margin: 0px !important;">
				<div class="input-form">
					<h3 class="mb-2 mx-5" style="font-family: 'KBO-Dia-Gothic_bold'">
						<i class="fa-solid fa-user" style="color: #adadae;"></i>&nbsp; 선수
						엔트리
					</h3>
		
					<div class="category" style="float: right; clear: right;">
						<a href="players">전체</a> <a href="players?position=투수">투수</a> <a
							href="players?position=포수">포수</a> <a href="players?position=외야수">외야수</a>
						<a href="players?position=내야수">내야수</a>
					</div>
					<br>

					<div class="player_card freewall">
						<ul class="all">
							<c:forEach var="dto" items="${list}" varStatus="loop">
								<c:set var="id" value="${loop.index + 1}" />
								<c:set var="delay" value="${loop.index + 1}" />
								<c:if test="${loop.index % 3 == 0}">
									<div class="row">
								</c:if>
								<div class="col-md-4">
									<li class="brick pitcher" id="${id}" data-delay="${delay}"
										data-height="260" data-width="300" data-state="start"
										style="width: 350.33px; height: 268.44px; display: block;"><a
										id="teamMemberDetail" class="brick-link" href="#"
										data-player="${dto.player}" data-team="${dto.team}">
											<div class="bg"></div>
											<div class="txt_wrap">
												<p class="number">${dto.player_no}</p>
												<h3 class="player">${dto.player}</h3>
												<p style="font-size: 0.8rem; margin-bottom: 0px !important;">${dto.name}</p>
												<i class="fa-solid fa-heart" style="color: #e86464;"></i> <span
													class="mb-2"
													style="font-size: 0.9rem !important; font-family: 'SUITE-Regular'">${dto.like_cnt}</span>
												<p class="position">${dto.position}</p>
											</div>
											<div class="img_wrap">
												<img src="${dto.image}" alt="">
											</div>
									</a></li>
								</div>
								<c:if test="${loop.index % 3 == 2 or loop.last}">
					</div>
					</c:if>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>

</html>