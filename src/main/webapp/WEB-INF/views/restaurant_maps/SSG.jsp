<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SSG 주변 맛집 지도</title>
    </head>

    <body>
        <div id="googleMap" style="width: 100%; height: 700px;"></div>

        <script>

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

                // 인천 SSG 랜더스 필드
                var mapOptions = {
                    center: new google.maps.LatLng(37.4371388889, 126.693055556),
                    zoom: 15.5 /* 음식점 & 숙소 마커 포함 이후 zoom 확대 예정 */
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

                        if (locations[i].place === "인천 SSG 랜더스 필드") {
                            // 특정 조건을 만족하는 경우 다른 아이콘을 사용
                            markerIcon = new google.maps.MarkerImage("images/icon/playground_icon.png", null, null, null, new google.maps.Size(50, 57));
                        }
                        var marker = new google.maps.Marker({
                            map: map,
                            position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                            icon: markerIcon
                        });

                        var infowindow = new google.maps.InfoWindow({
                            content: locations[i].place
                            // 마커 클릭시 상세 보기 
                        });

                        // 마커를 클릭했을 때 정보 창을 표시
                        marker.addListener('click', function () {
                            if (infowindow.getMap()) {
                                infowindow.close();
                            } else {
                                infowindow.open(map, marker);
                            }
                        });
                    })(i); // 즉시 실행 함수로 현재의 i 값을 전달
                }
            }

            const locations = [
                { place: "인천 SSG 랜더스 필드", lat: 37.436588889, lng: 126.693309996 },
                { place: "삼부자 오리천국", lat: 37.436397, lng: 126.696952 },
                { place: "문가네 황제짬뽕", lat: 37.4367438, lng: 126.6832518 },
                { place: "리미니 뉴코아아울렛 인천점", lat: 37.4439342, lng: 126.7006496 },
                { place: "화로 품은 갈비", lat: 37.443572, lng: 126.6938256 },
                { place: "버거트레일러", lat: 37.436075, lng: 126.689138 },
                { place: "문학아구찜", lat: 37.437412, lng: 126.679422 },
                { place: "솔밭가든", lat: 37.4310861, lng: 126.69665531 },
                { place: "고구려짬뽕", lat: 37.4356137, lng: 126.6987431 },
                { place: "한우소머리곰탕", lat: 37.4374829, lng: 126.6887871 },
                { place: "쿠우쿠우 구월점", lat: 37.439035, lng: 126.709954 },
            ];

            window.initMap = initMap;

        </script>
        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
    </body>

    </html>