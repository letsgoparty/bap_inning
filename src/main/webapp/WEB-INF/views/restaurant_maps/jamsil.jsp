<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/sidebar.css" rel="stylesheet" />
<title>잠실 종합 운동장 주변 맛집 지도</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <body>
        <div id="sidebar">
            <!-- 가게 정보 띄우기  -->
            <form action="" method="get">
                <input type="hidden" id="res_id" name="res_id">
                <div class="card mt-5">
                    <div id="res_image"></div>
                    <div class="card-body">
                        <h1 class="card-title mt-3 mb-4" id="res_name"></h1>
                        <div>
                            <img src="images/icon/icon1.png" width="13" height="13"> <span id="res_addr"></span>
                            <p></p>
                            <img src="images/icon/icon2.png" width="13" height="13"> <span
                                style="font-family: 'KBO-Dia-Gothic_light';"> <span class="location">잠실종합운동장</span>에서 걸어서
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
        <div id="allinfo_sidebar">
            <div id="all_info"></div>
        </div>
        <div id="containerDiv">
            <button class="btn btn-primary mb-2" id="find_all">한눈에 보기👀</button>
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

        $('#sidebar').hide();

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
                url: 'find_all_res',
                method: 'GET',
                data: { res_addr: '서울 송파구' },
                success: function (data) {
                    // 성공적으로 데이터를 받아왔을 때의 처리

                    $.each(data, function (idx, ele) {

                        var cardId = 'card_' + idx;
                        var imagePath = 'images/restaurant_images/' + ele.res_image + '.png';
                        var res_name = ele.res_name;

                        var cardHtml = '<form id="' + cardId + '" action="" method="get">' +
                            '<input type="hidden" id="res_id" name="res_id" value="' + ele.res_id + '">' +
                            '<div class="card">' +
                            '<div"><img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px"></div>' +
                            '<div class="card-body">' +
                            '<h1 class="card-title mt-3 mb-4" id="res_name">' + ele.res_name + '</h1>' +
                            '<div class="">' +
                            '<img src="images/icon/icon1.png" width="13" height="13"> <span id="res_addr">' + ele.res_addr + '</span>' +
                            '<p></p>' +
                            '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span class="location">잠실종합운동장</span>에서 걸어서 <span id="distance" style="font-family: \'KBO-Dia-Gothic_bold\'; color: rgb(194, 48, 48);">' + ele.distance + '</span> 분</span>' +
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

                // 잠실 종합 운동장
                var mapOptions = { 
                        center: new google.maps.LatLng(37.511778, 127.077696),
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

                        if (locations[i].place === "잠실 종합운동장") {
                            // 경기장은 다른 아이콘을 사용
                            markerIcon = new google.maps.MarkerImage("images/icon/playground_icon.png", null, null, null, new google.maps.Size(50, 57));
                        }
                        if(locations[i].place === "카페바른생활" || locations[i].place === "달콤 잠실야구장 3루점") {
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
                            if ($('#allinfo_sidebar').is(':visible')) {
                                // 전체 리스트 사이드바가 열려있다면 라벨 텍스트 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: locations[i].place
                                });

                                infoWindow.open(map, marker);
                            }
                            else if (locations[i].place === "잠실 종합운동장") {
                                // 경기장인 경우에는 라벨 텍스트를 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: '잠실 종합운동장'
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
            	{ place: "잠실 종합운동장", lat: 37.512401, lng: 127.071954 },
                { place: "생생아구", lat: 37.5087722, lng: 127.0802639 },
                { place: "한국계", lat: 37.5107107, lng: 127.0799608 },
                { place: "대홍집", lat: 37.5099459, lng:  127.0808892 },
                { place: "요리하는 남자", lat: 37.510818, lng: 127.081911},
                { place: "잠실 장어와 한우", lat: 37.510478, lng: 127.0838773},
                { place: "도삭면공방", lat: 37.5098491, lng: 127.079739},
                { place: "쨍앤 신짜오 쌀국수", lat: 37.509237, lng: 127.0831369 },
                { place: "백석", lat: 37.511423, lng: 127.081216},
                { place: "잠실백암순대", lat: 37.5095354, lng: 127.079582},
                { place: "아궁이왕돌구이", lat: 37.5107835, lng: 127.0804403},
                { place: "맘스터치 잠실야구장점", lat: 37.512110, lng: 127.072934 },
                { place: "도미노피자 잠실야구장점", lat: 37.512632, lng: 127.071117 },
                { place: "카페바른생활", lat: 37.515260, lng: 127.073786 },
                { place: "잭슨피자 잠실본점", lat: 37.511346, lng: 127.078800},
                { place: "달콤 잠실야구장 3루점", lat: 37.511728, lng: 127.072571},

            ];

            window.initMap = initMap;
	
        </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
</body>

</html>