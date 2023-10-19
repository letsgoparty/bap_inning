<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/sidebar.css" rel="stylesheet" />
<title>광주 KIA 챔피언스 필드 주변 맛집 지도</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <body>
        <div class="sidebar" id="sidebar">
            <!-- 가게 정보 띄우기  -->
            <form action="r_reviewList" method="get">
                <input type="hidden" id="res_id" name="res_id">
                <div class="card mt-5">
                    <div id="res_image"></div>
                    <div class="card-body">
                        <h1 class="card-title mt-3 mb-4" id="res_name"></h1>
                        <div>
                            <img src="images/icon/icon1.png" width="13" height="13"> <span id="res_addr"></span>
                            <p></p>
                            <img src="images/icon/icon2.png" width="13" height="13"> <span
                                style="font-family: 'KBO-Dia-Gothic_light';"> <span class="location">KIA 챔피언스필드</span>에서 걸어서
                                <span id="distance"></span>분
                            </span>
                        </div>
                        <p></p>
                        <img src="images/icon/icon3.png" width="13" height="13"> <span>&nbsp;4.5
                            <!--  별점 부분 수정 필요 -->
                        </span>
                        <p class="card-text mt-3" id="res_content"></p>
                        <button type="submit" class="btn btn-primary mt-3 mb-3" id="review_btn">리뷰 보러가기</button>
                        <button id="cancel" class="btn btn-primary mx-3">닫기</button>
                    </div>
                </div>
            </form>
        </div>
       <!--  전체 리스트 사이드바  -->
            <div class="sidebar" id="allinfo_sidebar">
                <div id="all_info"></div>
            </div>
            <!--  한식 리스트 사이드바  -->
            <div class="sidebar" id="KORinfo_sidebar">
                <div id="KOR_info"></div>
            </div>
            <!--  양식 리스트 사이드바  -->
            <div class="sidebar" id="USAinfo_sidebar">
                <div id="USA_info"></div>
            </div>
            <!--  중식 리스트 사이드바  -->
            <div class="sidebar" id="CHNinfo_sidebar">
                <div id="CHN_info"></div>
            </div>
            <!--  일식 리스트 사이드바  -->
            <div class="sidebar" id="JPNinfo_sidebar">
                <div id="JPN_info"></div>
            </div>
            <!--  카페 리스트 사이드바  -->
            <div class="sidebar" id="CAFEinfo_sidebar">
                <div id="CAFE_info"></div>
            </div>
            <!--  패스트푸드 리스트 사이드바  -->
            <div class="sidebar" id="FFinfo_sidebar">
                <div id="FF_info"></div>
            </div>
            <div class="mt-3 mb-2" id="containerDiv">
                <button class="btn btn-primary mb-2" id="find_all">맛집 전체보기</button>
                <button class="btn btn-primary mb-2" id="find_KOR">🥘 한식</button>
                <button class="btn btn-primary mb-2" id="find_USA">🍖 양식</button>
                <button class="btn btn-primary mb-2" id="find_CHN">🥟 중식</button>
                <button class="btn btn-primary mb-2" id="find_JPN">🍣 일식</button>
                <button class="btn btn-primary mb-2" id="find_CAFE">☕️ 카페</button>
                <button class="btn btn-primary mb-2" id="find_FF">🍔 패스트푸드</button>
                <div id="googleMap" style="width: 100%; height: 700px;"></div>
            </div>
	<script>
	  // '닫기' 버튼
    $('#cancel').on('click', function () {
        event.preventDefault();
        $('#sidebar').hide();
        // 본문의 내용들 사라진 사이드바의 영역만큼 여백 제거
        $('.container').css("margin-left", 300);
    });

    var SidebarOpen = false;
    // '전체 맛집보기' 버튼
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
        	$('#all_info').empty();
            $.ajax({
                // 사이드바가 닫혀있다면 열기
                url: 'find_all_res',
                method: 'GET',
                data: { team_code: 5 },
                success: function (data) {
                    // 성공적으로 데이터를 받아왔을 때의 처리

                    $.each(data, function (idx, ele) {

                        var cardId = 'card_' + idx;
                        var imagePath = 'images/restaurant_images/' + ele.res_image + '.png';
                        var res_name = ele.res_name;

                        var cardHtml = '<form id="' + cardId + '" action="r_reviewList" method="get">' +
                            '<input type="hidden" id="res_id" name="res_id" value="' + ele.res_id + '">' +
                            '<div class="card">' +
                            '<div"><img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px"></div>' +
                            '<div class="card-body">' +
                            '<h1 class="card-title mt-3 mb-4" id="res_name">' + ele.res_name + '</h1>' +
                            '<div class="">' +
                            '<img src="images/icon/icon1.png" width="13" height="13"> <span id="res_addr">' + ele.res_addr + '</span>' +
                            '<p></p>' +
                            '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span class="location">KIA 챔피언스필드</span>에서 걸어서 <span id="distance" style="font-family: \'KBO-Dia-Gothic_bold\'; color: rgb(194, 48, 48);">' + ele.distance + '</span> 분</span>' +
                            '</div>' +
                            '<p></p>' +
                            '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + 4.5 + '</span>' +
                            '<p class="card-text mt-3" id="res_content" style="font-family: \'KBO-Dia-Gothic_light\';">' + ele.res_content + '</p>' +
                            '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 mb-3 mx-3 find_res_btn" data-res-name="' + res_name + '">위치 보러가기</button>' +
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
    
    // '한식' 버튼
    $('#find_KOR').on('click', function () {
        findResByCategory('한식', 'KORinfo_sidebar', 'KOR_info');
    });
    // '양식' 버튼
    $('#find_USA').on('click', function () {
        findResByCategory('양식', 'USAinfo_sidebar', 'USA_info');
    });
    // '중식' 버튼
    $('#find_CHN').on('click', function () {
        findResByCategory('중식', 'CHNinfo_sidebar', 'CHN_info');
    });
    // '일식' 버튼
    $('#find_JPN').on('click', function () {
        findResByCategory('일식', 'JPNinfo_sidebar', 'JPN_info');
    });
    // '카페' 버튼
    $('#find_CAFE').on('click', function () {
        findResByCategory('카페', 'CAFEinfo_sidebar', 'CAFE_info');
    });
    // '패스트푸드' 버튼
    $('#find_FF').on('click', function () {
        findResByCategory('패스트푸드', 'FFinfo_sidebar', 'FF_info');
    });

    // 카테고리별 사이드바 open/close 함수
    function findResByCategory(category, sidebarId, infoId) {
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
                url: 'find_res_by_category',
                method: 'GET',
                data: { category: category, team_code: 5 },
                success: function (data) {
                    // 성공적으로 데이터를 받아왔을 때의 처리
                    $.each(data, function (idx, ele) {
                        var cardId = 'card_' + idx;
                        var imagePath = 'images/restaurant_images/' + ele.res_image + '.png';
                        var res_name = ele.res_name;

                        var cardHtml = '<form id="' + cardId + '" action="r_reviewList" method="get">' +
                            '<input type="hidden" id="res_id" name="res_id" value="' + ele.res_id + '">' +
                            '<div class="card">' +
                            '<div"><img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px"></div>' +
                            '<div class="card-body">' +
                            '<h1 class="card-title mt-3 mb-4" id="res_name">' + ele.res_name + '</h1>' +
                            '<div class="">' +
                            '<img src="images/icon/icon1.png" width="13" height="13"> <span id="res_addr">' + ele.res_addr + '</span>' +
                            '<p></p>' +
                            '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span class="location">SSG 랜더스필드</span>에서 걸어서 <span id="distance">' + ele.distance + '</span> 분</span>' +
                            '</div>' +
                            '<p></p>' +
                            '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + 4.5 + '</span>' +
                            '<p class="card-text mt-3" id="res_content"">' + ele.res_content + '</p>' +
                            '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 mb-3 mx-3 find_res_btn" data-res-name="' + res_name + '">위치 보러가기</button>' +
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
    $(document).on('click', '.find_res_btn', function (event) {
        event.preventDefault();
        var res_name = $(this).data('res-name');

        if (markerInfo[res_name]) {
            markerInfo[res_name].infowindow.open(map, markerInfo[res_name].marker);
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

                // 광주 KIA 챔피언스 필드
                var mapOptions = { 
                        center: new google.maps.LatLng(35.169773, 126.888199),
                    zoom: 16.4 /* 음식점 & 숙소 마커 포함 이후 zoom 확대 예정 */
                };

                var map = new google.maps.Map(
                    document.getElementById("googleMap")
                    , mapOptions);

                map.mapTypes.set("styled_map", styledMapType);
                map.setMapTypeId("styled_map")

                var myIcon = new google.maps.MarkerImage("images/icon/restaurant_icon.png", null, null, null, new google.maps.Size(50, 57));


                for (var i = 0; i < locations.length; i++) {
                    // 마커에 대한 클로저를 생성합니다.
                    (function (i) {
                        var markerIcon = myIcon; // 기본 아이콘을 사용

                        if (locations[i].place === "광주 KIA 챔피언스 필드") {
                            // 경기장은 다른 아이콘을 사용
                            markerIcon = new google.maps.MarkerImage("images/icon/playground_icon.png", null, null, null, new google.maps.Size(50, 57));
                        }
                        if(locations[i].place === "카페나니") {
                        	// 카페는 다른 아이콘을 사용
                        	markerIcon = new google.maps.MarkerImage("images/icon/cafe_icon.png", null, null, null, new google.maps.Size(50, 57));
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

                        // 마커를 클릭 시, 이벤트 처리 
                        marker.addListener('click', function () {
                        	if ($('.sidebar').is(':visible')) {
                                // 전체 리스트 사이드바가 열려있다면 라벨 텍스트 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: locations[i].place
                                });

                                infoWindow.open(map, marker);
                            }
                            else if (locations[i].place === "광주 KIA 챔피언스 필드") {
                                // 경기장인 경우에는 라벨 텍스트를 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: '광주 KIA 챔피언스 필드'
                                });

                                infoWindow.open(map, marker);
                            } else {
                                // 해당 맛집 정보 사이드바 표시 
                                $('#sidebar').show();
                                $('.container').css("margin-left", 400);

                                // 가게 이름 가져오기
                                var res_name = locations[i].place;

                                $.ajax({
                                    url: 'find_res',
                                    method: 'GET',
                                    data: { res_name: res_name },
                                    success: function (data) {
                                        // 성공적으로 데이터를 받아왔을 때의 처리
                                        console.log(data);
                                        console.log(data.res_content);
                                        var imagePath = 'images/restaurant_images/' + data.res_image + '.png';
                                        var imgTag = '<img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px">'
                                        $('#res_image').html(imgTag);
                                        $('#res_name').text(data.res_name);
                                        $('#res_addr').text(data.res_addr);
                                        $('#distance').text(data.distance);
                                        $('#res_content').text(data.res_content);
                                        $('#res_id').val(data.res_id);

                                    },
                                    error: function (error) {
                                        console.error('Error:', error);
                                    }
                                });
                            }
                        });
                    })(i); // 즉시 실행 함수로 현재의 i 값을 전달
                }
            }

            const locations = [
                { place: "광주 KIA 챔피언스 필드", lat: 35.168333, lng:  126.888889 },         
                { place: "동운정", lat: 35.1721509, lng: 126.8869906},
                { place: "무등골전집", lat: 35.1728055, lng: 126.8809928},
                { place: "이씨네푸줏간 운암점", lat:35.1727305, lng: 126.8782982 },
                { place: "챔피언스필드", lat: 35.168427, lng: 126.888405},
                { place: "두찜 운암점", lat: 35.169517, lng: 126.890067 },
                { place: "청와대", lat:  35.1661773,  lng: 126.891119},
                { place: "BHC치킨 임동챔피언스필드점", lat:35.166952, lng: 126.890873},
                { place: "춘천호반 닭갈비", lat:35.170946,  lng: 126.884986},
                { place: "금바다수산", lat: 35.167553,  lng: 126.891252},
                { place: "카페나니", lat: 35.170006, lng: 126.887008 },
                { place: "덕이네맛집", lat: 35.170637, lng: 126.890120 },
                { place: "만리장성", lat: 35.170130, lng: 126.889953 },
                { place: "만남흑염소", lat: 35.171827, lng: 126.886994 },
                { place: "부영식당", lat: 35.166962, lng: 126.897804 },
                { place: "미트맨 운암점", lat: 35.170361, lng: 126.885686 },
            ];

            window.initMap = initMap;
	
        </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
</body>

</html>