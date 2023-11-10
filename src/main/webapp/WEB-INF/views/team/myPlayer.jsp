<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찜한 플레이어</title>
<link rel="stylesheet" href="css/baseball.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		$('.playerInfo').hover(function() {
			$(this).css('cursor', 'pointer');
		}, function() {
			$(this).css('cursor', 'auto');
		});

		$('.playerInfo').click(function() {
			var player = $(this).data('player');
			var team = $(this).data('team');

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

			// form을 body에 추가하고 submit
			form.appendTo('body').submit();
		});

		$('.deletePlayer').click(function() {
			event.preventDefault();
			event.stopPropagation();

			var player = $(this).data('player');
			var team = $(this).data('team');

			$.ajax({
				url : 'deletePlayer',
				method : 'GET',
				data : {
					player : player,
					team : team
				},
				success : function(data) {
					Swal.fire({
						text : data,
						icon : 'success',
						confirmButtonColor : '#3085d6',
						confirmButtonText : 'OK',
						button : {
							text : '확인',
							closeModal : true
						}

					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = "/app/myPlayer";

						}
					});
				},

				error : function(error) {
					Swal.fire({
						text : "에러",
						icon : 'warning',
						confirmButtonColor : '#3085d6',
						button : {
							text : '확인',
							closeModal : true
						}
					})
				}
			});
		});
	});
</script>
<body>
	<jsp:include page="../common/nav.jsp" flush="true" />
	<div class="container mt-5">
		<div class="row">
			<aside class="col-md-3 me-5" style="width: 20%;">
				<hr style="border: 2px solid #000;">
				<ul class="list-group">
					<li class="list-group-item"><a href="schedule">경기일정</a></li>
					<li class="list-group-item"><a href="record">경기기록</a></li>
					<li class="list-group-item"><a href="highlight">하이라이트</a></li>
					<li class="list-group-item"><a href="rank">팀 순위</a></li>
					<li class="list-group-item"><a href="players">선수 정보</a></li>
					<li class="list-group-item active"><a href="myPlayer">찜한
							선수</a></li>
				</ul>
			</aside>
			<div class="input-form-background col-md-9"
				style="margin: 0px !important;">
				<div class="input-form">
					<div class="row">
						<c:forEach var="dto" items="${list}">
							<c:set var="position" value="${dto.position}" />
							<c:set var="positionArray" value="${fn:split(position, '·')}" />
							<div class="col-md-4 mb-4 playerInfo" data-player="${dto.player}"
								data-team="${dto.team}">
								<div class="card" style="width: 18rem;">
									<img src="${dto.image}" class="card-img-top mt-3" width=auto
										height=230>
									<div class="card-body">
										<h5 class="card-title">
											${dto.player_no} ${dto.player} <span
												style="font-size: 1rem; color: #858893;">${dto.team}</span>
										</h5>
										<p class="card-text"
											style="font-size: 0.8rem; color: #858893;">${dto.name}</p>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">${dto.position}</li>
									</ul>
									<div class="card-body">
										<button class="btn btn-primary deletePlayer"
											data-team="${dto.team}" data-player="${dto.player}">해제</button>
									</div>
								</div>

							</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
</body>

</html>