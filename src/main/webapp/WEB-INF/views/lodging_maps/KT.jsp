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
    <div class="sidebar" id="sidebar">
        <!-- 숙박 정보 띄우기  -->
        <form action="l_reviewList" method="get">
            <input type="hidden" id="lodging_id" name="lodging_id">
            <div class="card mt-5">
                <div id="lodging_image"></div>
                <div class="card-body">
                    <h1 class="card-title mt-3 mb-4" id="lodging_name"></h1>
                    <div class="">
                        <img src="images/icon/icon1.png" width="13" height="13">
                        <span id="lodging_addr"></span>
                        <p></p>
                        <img src="images/icon/icon4.png" width="13" height="13">
                        <span style="font-family: 'KBO-Dia-Gothic_light';">&nbsp;KT위즈파크에서 <span id="distance"></span>
                        </span>
                    </div>
                    <p></p>
                    <img src="images/icon/icon3.png" width="13" height="13">
                    <span>&nbsp;4.5</span>
                    <p class="card-text mt-3" id="lodging_content"></p>
                    <div id="lodging_url"></div>
                    <button type="submit" class="btn btn-primary mt-3 mb-3">리뷰
                        보러가기</button>
                    <button id="cancel" class="btn btn-primary mx-3">닫기</button>
                </div>
            </div>
        </form>
    </div>
    <div class="sidebar" id="allinfo_sidebar">
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
        $('.container').css("margin-left", 300);
    });

    var SidebarOpen = false;
    // '한눈에 보기' 버튼
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
                url: 'find_all_lod',
                method: 'GET',
                data: { lodging_addr: '경기 수원시' },
                success: function (data) {
                    // 성공적으로 데이터를 받아왔을 때의 처리

                    $.each(data, function (idx, ele) {

                        var cardId = 'card_' + idx;
                        var imagePath = 'images/lodging_images/' + ele.lodging_image + '.png';
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
                            '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + 4.5 + '</span>' +
                            '<p class="card-text mt-3" id="lodging_content"">' + ele.lodging_content + '</p>' +
                            '<div id="lodging_url"><a href="' + lodging_url + '" target="_blank">최저가 보러가기</a></div>' +
                            '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 mb-3 mx-3 find_lod_btn" data-lod-name="' + lodging_name + '">위치 보러가기</button>' +
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
                            if ($('#allinfo_sidebar').is(':visible')) {
                                // 전체 리스트 사이드바가 열려있다면 라벨 텍스트 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: locations[i].place
                                });

                                infoWindow.open(map, marker);
                            }
                            else if (locations[i].place === "수원 KT위즈파크") {
                                // 경기장인 경우에는 라벨 텍스트를 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: '수원 KT위즈파크'
                                });

                                infoWindow.open(map, marker);
                            } else {
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
                                        console.log(data);
                                        console.log(data.lodging_content);
                                        var imagePath = 'images/lodging_images/' + data.lodging_image + '.png';
                                        var imgTag = '<img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px">'
                                        $('#lodging_image').html(imgTag);
                                        
                                        var lodging_url = data.lodging_url;
 
   										
   								     	 var linkElement = $('<a>', {
   								        	href: lodging_url,
   								        	target: '_blank',
   								        	text: '최저가 보러가기'
   								      	});
   										
                                        $('#lodging_url').html(linkElement);
                                        console.log(lodging_url);
                                        
                                        $('#lodging_name').text(data.lodging_name);
                                        $('#lodging_addr').text(data.lodging_addr);
                                        $('#distance').text(data.distance);
                                        $('#lodging_content').text(data.lodging_content);
             
                                        $('#lodging_id').val(data.lodging_id);
                                        
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

            ];

            window.initMap = initMap;
	
        </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
</body>

</html>