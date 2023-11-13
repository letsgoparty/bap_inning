<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/sidebar.css" rel="stylesheet" />
<title>수원 KT위즈파크 주변 숙소 지도</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<jsp:include page="../common/nav.jsp" flush="true"/> 
	<div class="sidebar" id="sidebar">
		<!-- 숙박 정보 띄우기  -->
		<form action="l_reviewList" method="get">
			<input type="hidden" id="lodging_id" name="lodging_id">
			<div class="card mt-5">
				<div id="lodging_image"></div>
				<div class="card-body">
					<h1 class="card-title mt-3 mb-4" id="lodging_name"></h1>
					<div class="">
						<img src="images/icon/icon1.png" width="13" height="13"> <span
							id="lodging_addr"></span>
						<p></p>
						<img src="images/icon/icon4.png" width="13" height="13"> <span
							style="font-family: 'KBO-Dia-Gothic_light';">&nbsp;KT위즈파크에서
							<span id="distance"></span>
						</span>
					</div>
					<p></p>
					<img src="images/icon/icon3.png" width="13" height="13"> <span id="rating">&nbsp;</span>
					<p class="card-text mt-3" id="lodging_content"></p>
					<div class="mx-2" id="lodging_url"></div>
					<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰
						보러가기</button>
					<button id="cancel" class="btn btn-primary mx-3">닫기</button>
					<button id="like_btn" class="btn btn-primary mt-3 me-3"
						style="float: right;">
						<img src="images/icon/dislike_icon.png" width=20 height=20>
					</button>
				</div>
			</div>
		</form>
	</div>
	<!--  전체 리스트 사이드바  -->
	<div class="sidebar" id="allinfo_sidebar">
		<div id="all_info"></div>
	</div>
	<!--  호텔 리스트 사이드바  -->
	<div class="sidebar" id="Hotelinfo_sidebar">
		<div id="Hotel_info"></div>
	</div>
	<!--  모텔 리스트 사이드바  -->
	<div class="sidebar" id="Motelinfo_sidebar">
		<div id="Motel_info"></div>
	</div>
	<div class="mt-3 mb-2" id="containerDiv">
		<button class="btn btn-primary mb-2 category" id="find_all">숙소
			전체보기</button>
		<button class="btn btn-primary mb-2 category" id="find_Hotel">💒
			호텔</button>
		<button class="btn btn-primary mb-2 category" id="find_Motel">🏬
			모텔</button>
		<div id="googleMap" style="width: 100%; height: 700px;"></div>
	</div>
	<script>
	 // '찜하기' 버튼
    $(document).on('click', '#like_btn', function () {
        event.preventDefault();
        var lodging_id = $(this).data('lod-id');

        $.ajax({
            url: 'like_lod',
            method: 'GET',
            data: { lodging_id: lodging_id },
            success: function (data) {
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
                        button: {
                            text: '확인',
                            closeModal: true
                        }
                    })
                }
            },
            error: function (error) {
                Swal.fire({
                    text: "이미 찜한 숙소입니다.",
                    icon: 'warning',
                    confirmButtonColor: '#3085d6',
                    button: {
                        text: '확인',
                        closeModal: true
                    }
                })
            }
        });
    });
    // '닫기' 버튼
    $('#cancel').on('click', function () {
        event.preventDefault();
        $('#sidebar').hide();
        $('.container').css("margin-left", 300);
    });

    var SidebarOpen = false;
    // '한눈에 보기' 버튼
    $('#find_all').on('click', function () {

    	$('.sidebar:not(#allinfo_sidebar)').hide();

        // 사이드바의 현재 상태 확인
        var SidebarOpen = $('#allinfo_sidebar').is(':visible');

        if (SidebarOpen) {
            // 사이드바가 열려있다면 닫기
            $('#allinfo_sidebar').hide();
            $('.container').css("margin-left", 300);
            SidebarOpen = false;
        } else {

            $.ajax({
                // 사이드바가 닫혀있다면 열기
                url: 'find_all_lod',
                method: 'GET',
                data: { team_code: 4 },
                success: function (data) {
                    // 성공적으로 데이터를 받아왔을 때의 처리

                    $.each(data, function (idx, ele) {

                        var cardId = 'card_' + idx;
                        var imagePath = 'https://kr.object.ncloudstorage.com/team2-bucket/lodging_images/' + ele.lodging_image + '.png';
                        var lodging_name = ele.lodging_name;
                        var lodging_url = ele.lodging_url;

                        var cardHtml = '<form id="' + cardId + '" action="l_reviewList" method="get">' +
                            '<input type="hidden" id="lodging_id" name="lodging_id" value="' + ele.lodging_id + '">' +
                            '<div class="card">' +
                            '<div"><img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px"></div>' +
                            '<div class="card-body">' +
                            '<h1 class="card-title mt-3 mb-4" id="lodging_name">' + ele.lodging_name + '</h1>' +
                            '<div class="">' +
                            '<img src="images/icon/icon1.png" width="13" height="13"> <span id="lodging_addr">' + ele.lodging_addr + '</span>' +
                            '<p></p>' +
                            '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span class="location">KT위즈파크</span>에서 <span id="distance">' + ele.distance + '</span></span>' +
                            '</div>' +
                            '<p></p>' +
                            '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + ele.rating + '</span>' +
                            '<p class="card-text mt-3" id="lodging_content"">' + ele.lodging_content + '</p>' +
                            '<div class="mx-2" id="lodging_url" ><a href="' + lodging_url + '" target="_blank">예약 하러가기</a></div>' +
                            '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 mb-3 mx-3 find_lod_btn" data-lod-name="' + lodging_name + '">위치 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 me-3" id="like_btn" data-lod-id="' + ele.lodging_id + '" style="float:right;"><img src="images/icon/dislike_icon.png" width=20 height=20></button>' +
                            '</div>' +
                            '</div>' +
                            '</form>';

                        $('#all_info').append(cardHtml);
                    });

                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });

            $('#allinfo_sidebar').show();
            $('.container').css("margin-left", 400);
        }
    });

    // '호텔' 버튼
    $('#find_Hotel').on('click', function () {
        findLodByCategory('호텔', 'Hotelinfo_sidebar', 'Hotel_info');
    });
    // '모텔' 버튼
    $('#find_Motel').on('click', function () {
        findLodByCategory('모텔', 'Motelinfo_sidebar', 'Motel_info');
    });


    // 카테고리별 사이드바 open/close 함수
    function findLodByCategory(category, sidebarId, infoId) {
        $('.sidebar:not(#' + sidebarId + ')').hide();

        // 사이드바의 현재 상태 확인
        var SidebarOpen = $('#' + sidebarId).is(':visible');

        if (SidebarOpen) {
            // 사이드바가 열려있다면 닫기
            $('#' + sidebarId).hide();
            $('.container').css("margin-left", 300);
        } else {
            // 사이드바가 닫혀있다면 열기
            $('#' + infoId).empty();
            $.ajax({
                url: 'find_lod_by_category',
                method: 'GET',
                data: { category: category, team_code: 4 },
                success: function (data) {
                    // 성공적으로 데이터를 받아왔을 때의 처리
                    $.each(data, function (idx, ele) {
                        var cardId = 'card_' + idx;
                        var imagePath = 'https://kr.object.ncloudstorage.com/team2-bucket/lodging_images/' + ele.lodging_image + '.png';
                        var lodging_name = ele.lodging_name;

                        var cardHtml = '<form id="' + cardId + '" action="l_reviewList" method="get">' +
                            '<input type="hidden" id="lodging_id" name="lodging_id" value="' + ele.lodging_id + '">' +
                            '<div class="card">' +
                            '<div"><img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px"></div>' +
                            '<div class="card-body">' +
                            '<h1 class="card-title mt-3 mb-4" id="lodging_name">' + ele.lodging_name + '</h1>' +
                            '<div class="">' +
                            '<img src="images/icon/icon1.png" width="13" height="13"> <span id="lodging_addr">' + ele.lodging_addr + '</span>' +
                            '<p></p>' +
                            '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span class="location">KT위즈파크</span>에서 <span id="distance">' + ele.distance + '</span></span>' +
                            '</div>' +
                            '<p></p>' +
                            '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + ele.rating + '</span>' +
                            '<p class="card-text mt-3" id="res_content"">' + ele.lodging_content + '</p>' +
                            '<div class="mx-2" id="lodging_url"><a href="' + lodging_url + '" target="_blank">예약 하러가기</a></div>' +
                            '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 mb-3 mx-3 find_lod_btn" data-lod-name="' + lodging_name + '">위치 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 me-3" id="like_btn" data-lod-id="' + ele.lodging_id + '" style="float:right;"><img src="images/icon/dislike_icon.png" width=20 height=20></button>' +
                            '</div>' +
                            '</div>' +
                            '</form>';

                        $('#' + infoId).append(cardHtml);

                    });
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });

            $('#' + sidebarId).show();
            $('.container').css("margin-left", 400);
        }
    }
    
    var markerInfo = {};
    var map;
    $(document).on('click', '.find_lod_btn', function (event) {
        event.preventDefault();
        var lodging_name = $(this).data('lod-name');

        if (markerInfo[lodging_name]) {
            markerInfo[lodging_name].infowindow.open(map, markerInfo[lodging_name].marker);
        }

    });
    
	 $('#containerDiv').addClass('container');
            function initMap() {
                const styledMapType = new google.maps.StyledMapType(
                    [
                        // 기존 마커 제거 
                        {
                            featureType: "poi",
                            elementType: "labels.icon",
                            stylers: [{ visibility: "off" }],
                        },
                    ],
                );

                // 수원 케이티위즈 파크
                var mapOptions = {
                    center: new google.maps.LatLng(37.294981, 127.016215),
                    zoom: 14.5 /* 음식점 & 숙소 마커 포함 이후 zoom 확대 예정 */
                };

                var map = new google.maps.Map(
                    document.getElementById("googleMap")
                    , mapOptions);

                map.mapTypes.set("styled_map", styledMapType);
                map.setMapTypeId("styled_map")

                var myIcon = new google.maps.MarkerImage("images/icon/lodging_icon.png", null, null, null, new google.maps.Size(50, 57));


                for (var i = 0; i < locations.length; i++) {
                    // 마커에 대한 클로저를 생성합니다.
                    (function (i) {
                        var markerIcon = myIcon; // 기본 아이콘을 사용

                        if (locations[i].place === "수원 KT위즈파크") {
                            // 경기장은 다른 아이콘을 사용
                            markerIcon = new google.maps.MarkerImage("images/icon/playground_icon.png", null, null, null, new google.maps.Size(50, 57));
                        }
                        var marker = new google.maps.Marker({
                            map: map,
                            position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                            icon: markerIcon
                        });

                        var infowindow = new google.maps.InfoWindow({
                            content: locations[i].place
                        });

                        // 마커와 InfoWindow를 객체에 저장
                        markerInfo[locations[i].place] = { marker: marker, infowindow: infowindow };

                        // 마커를 클릭했을 때 정보 창을 표시
                        marker.addListener('click', function () {
                             if (locations[i].place === "수원 KT위즈파크") {
                                // 경기장인 경우에는 라벨 텍스트를 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: '수원 KT위즈파크'
                                });

                                infoWindow.open(map, marker);
                            } else {
                            	$('.sidebar:not(#sidebar)').hide();
                                $('#sidebar').show();
                                // 본문의 내용들 나타난 사이드바의 영역만큼 여백 추가
                                $('.container').css("margin-left", 400);
                            
                                // 숙소 이름 가져오기
                                var lodging_name = locations[i].place;
                                
                                
                                $.ajax({
                                    url: 'find_lod', 
                                    method: 'GET',
                                    data: { lodging_name: lodging_name },
                                    success: function (data) {
                                        // 성공적으로 데이터를 받아왔을 때의 처리
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
                                        $('#lodging_addr').text(data.lodging_addr);
                                        $('#distance').text(data.distance);
                                        $('#lodging_content').text(data.lodging_content);
                                        $('#lodging_id').val(data.lodging_id);
                                        $('#like_btn').data('lod-id', data.lodging_id);
                                        
                                    },
                                    error: function (error) {
                                        // 오류 발생 시의 처리
                                        console.error('Error:', error);
                                    }
                                });
                                $.ajax({
                                    url: 'find_lod_rating',
                                    method: 'GET',
                                    data: { lodging_name: lodging_name },
                                    success: function (data) {
                                        $('#rating').text(data);

                                    },
                                    error: function (error) {
                                        // 오류 발생 시의 처리
                                        console.error('Error:', error);
                                    }
                                });
                            }
                        });
                    })(i); // 즉시 실행 함수로 현재의 i 값을 전달
                }
            }

                const locations = [
                    { place: "수원 KT위즈파크", lat: 37.299722, lng: 127.009722 },
                    { place: "라마다프라자수원호텔", lat: 37.2775048, lng: 127.032461 },
                    { place: "도노 1796 호텔 수원", lat: 37.2869966, lng: 127.0138273 },
                    { place: "데이오프호텔", lat: 37.3071398, lng: 126.9942273 },
                    { place: "탑클라우드호텔수원점", lat: 37.292358, lng: 127.010848 },
                    { place: "호텔달", lat: 37.286863, lng: 127.016935 },
                    { place: "화이트호텔", lat: 37.289826, lng: 127.014112 },
                    { place: "피아노모텔", lat: 37.295261, lng: 127.008778 },
                    { place: "테마모텔", lat: 37.291556, lng: 127.012740 },
                    { place: "허브모텔", lat: 37.291173, lng: 127.014075 },
                    { place: "노블레스", lat: 37.298014, lng: 127.027399 },
                    { place: "넘버25 수원경기대점", lat: 37.298309, lng: 127.027491 },
                    { place: "모텔나무", lat: 37.298692, lng: 127.027797 },

            ];

            window.initMap = initMap;
	
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=${googleMapsApiKey}&callback=initMap"></script>
</body>

</html>