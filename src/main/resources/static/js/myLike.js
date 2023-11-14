$(document).ready(function() {

	$("#resContainer").show();
	$("#lodContainer").hide();

	$(".find_res").click(function() {
		$("#lodContainer").hide();
		$("#resContainer").show();
	});

	$(".find_lod").click(function() {
		$("#resContainer").hide();
		$("#lodContainer").show();
	});

	// 삭제 버튼
	$(".deleteBtn").on("click", function() {
		var id = $(this).attr("data-id");
		var type = $(this).attr("data-type");

		console.log(id);
		console.log(type);

		$.ajax({
			url: 'delete_like',
			method: 'GET',
			data: { id: id, type: type },
			success: function(data) {
				if (data === '로그인이 필요합니다.') {
					Swal.fire({
						text: data,
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'OK',
						cancelButtonText: 'CANCLE',
						button: {
							text: '확인',
							closeModal: true
						}

					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = '/app/loginForm';
						}
					});
				} else {
					Swal.fire({
						text: data,
						icon: 'success',
						confirmButtonColor: '#3085d6',
						confirmButtonText: '확인',
						closeOnClickOutside: false, // 바깥쪽을 클릭해도 창이 닫히지 않도록 설정
					}).then((result) => {
						if (result.isConfirmed) { // '확인' 버튼이 클릭되었을 때
							window.location.href = "/app/like";

						}
					});
				}
			},
			error: function(error) {
				console.error('Error:', error);
			}
		});
	});

	// 음식점 자세히보기 버튼
	$(".res_infoBtn").on("click", function() {
		var res_name = $(this).attr("data-name");

		$('#res_sidebar').show();
		$('#resContainer').css("margin-left", 400);

		$.ajax({
			url: 'find_res',
			method: 'GET',
			data: { res_name: res_name },
			success: function(data) {
				// 성공적으로 데이터를 받아왔을 때의 처리
				var imagePath = 'https://kr.object.ncloudstorage.com/team2-bucket/restaurant_images/' + data.res_image + '.png';
				var imgTag = '<img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px">'
				$('#res_image').html(imgTag);
				$('#res_name').text(data.res_name);
				$('#res_content').text(data.res_content);
				$('#res_id').val(data.res_id);

				switch (data.team_code) {
					case '1':
						$(".location").text("SSG 랜더스필드");
						break;
					case '2':
						$(".location").text("고척스카이돔");
						break;
					case '3':
						$(".location").text("잠실종합운동장");
						break;
					case '4':
						$(".location").text("KT위즈파크");
						break;
					case '5':
						$(".location").text("KIA 챔피언스필드");
						break;
					case '6':
						$(".location").text("창원NC파크");
						break;
					case '7':
						$(".location").text("삼성 라이온즈파크");
						break;
					case '8':
						$(".location").text("사직야구장");
						break;
					case '10':
						$(".location").text("한화생명 이글스파크");
						break;
					default:
						break;
				}

			},
			error: function(error) {
				// 오류 발생 시의 처리
				console.error('Error:', error);
			}

		});
	});

	// 숙소 자세히보기 버튼
	$(".lod_infoBtn").on("click", function() {
		var lodging_name = $(this).attr("data-name");

		$('#lod_sidebar').show();
		$('#lodContainer').css("margin-left", 400);

		$.ajax({
			url: 'find_lod',
			method: 'GET',
			data: { lodging_name: lodging_name },
			success: function(data) {

				var imagePath = 'https://kr.object.ncloudstorage.com/team2-bucket/lodging_images/' + data.lodging_image + '.png';
				var imgTag = '<img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px">'
				$('#lodging_image').html(imgTag);

				var lodging_url = data.lodging_url;


				var linkElement = $('<a>', {
					href: lodging_url,
					target: '_blank',
					text: '예약 하러가기'
				});

				$('#lodging_url').html(linkElement);
				$('#lodging_name').text(data.lodging_name);
				$('#lodging_content').text(data.lodging_content);
				$('#lodging_id').val(data.lodging_id);

				
			},
			error: function(error) {
				// 오류 발생 시의 처리
				console.error('Error:', error);
			}

		});
	});

	// 닫기 버튼
	$('.cancel').on('click', function() {
		event.preventDefault();
		$('.sidebar').hide();
		$('.container').css("margin-left", 300);
	});


	// 음식점 전체 삭제
	$("#resContainer").on("click", "#deleteAll", function() {
		var checkedValues = [];
		$("#resContainer input.check:checked").each(function() {
			checkedValues.push($(this).val());
		});

		$.ajax({
			url: 'deleteAll_res_like',
			method: 'GET',
			data: { check: checkedValues },
			success: function(data) {
				if (data === '로그인이 필요합니다.') {
					Swal.fire({
						text: data,
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'OK',
						cancelButtonText: 'CANCLE',
						button: {
							text: '확인',
							closeModal: true
						}

					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = '/app/loginForm';
						}
					});
				} else {
					Swal.fire({
						text: data,
						icon: 'success',
						confirmButtonColor: '#3085d6',
						confirmButtonText: '확인',
						closeOnClickOutside: false,
					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = "/app/like";

						}
					});
				}
			},
			error: function(error) {
				console.error('Error:', error);
			}
		});

	});

	// 숙소 전체 삭제
	$("#lodContainer").on("click", "#deleteAll", function() {
		var checkedValues = [];
		$("#lodContainer input.check:checked").each(function() {
			checkedValues.push($(this).val());
		});

		$.ajax({
			url: 'deleteAll_lod_like',
			method: 'GET',
			data: { check: checkedValues },
			success: function(data) {
				if (data === '로그인이 필요합니다.') {
					Swal.fire({
						text: data,
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'OK',
						cancelButtonText: 'CANCLE',
						button: {
							text: '확인',
							closeModal: true
						}

					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = '/app/loginForm';
						}
					});
				} else {
					Swal.fire({
						text: data,
						icon: 'success',
						confirmButtonColor: '#3085d6',
						confirmButtonText: '확인',
						closeOnClickOutside: false,
					}).then((result) => {
						if (result.isConfirmed) {
							$("#lodContainer").show();
							$("#resContainer").hide();
							window.location.href = "/app/like";

						}
					});
				}
			},
			error: function(error) {
				console.error('Error:', error);
			}
		});

	});

	var allChecked = false;

	// 음식점 전체 체크 
	$("#resContainer").on("click", "#allCheck", function() {
		var allChecked = !$(this).data("allChecked");
		$(this).data("allChecked", allChecked);

		$("#resContainer .check").prop("checked", allChecked);

		if (allChecked) {
			$("#resContainer .card").addClass("highlighted");
			$("#resContainer #checkText").text(" 전체 해제");
		} else {
			$("#resContainer .card").removeClass("highlighted");
			$("#resContainer #checkText").text(" 전체 선택");
		}
	});

	// 음식점 카드 클릭 
	$("#resContainer").on("click", ".card", function() {
		if (!$(event.target).hasClass("res_infoBtn")) {
			var checkbox = $(this).find(".check");

			checkbox.prop("checked", !checkbox.prop("checked"));

			if (checkbox.prop("checked")) {
				$(this).addClass("highlighted");
			} else {
				$(this).removeClass("highlighted");
			}
		}
	});

	// 숙소 전체 체크
	$("#lodContainer").on("click", "#allCheck", function() {
		var allChecked = !$(this).data("allChecked");
		$(this).data("allChecked", allChecked);

		$("#lodContainer .check").prop("checked", allChecked);

		if (allChecked) {
			$("#lodContainer .card").addClass("highlighted");
			$("#lodContainer #checkText").text(" 전체 해제");
		} else {
			$("#lodContainer .card").removeClass("highlighted");
			$("#lodContainer #checkText").text(" 전체 선택");
		}
	});

	// 숙소 카드 클릭
	$("#lodContainer").on("click", ".card", function() {
		if (!$(event.target).hasClass("lod_infoBtn")) {
			var checkbox = $(this).find(".check");

			checkbox.prop("checked", !checkbox.prop("checked"));

			if (checkbox.prop("checked")) {
				$(this).addClass("highlighted");
			} else {
				$(this).removeClass("highlighted");
			}
		}
	});


});