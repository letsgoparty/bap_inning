<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body>
        <div id="googleMap" style="width: 100%;height: 700px;"></div>

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

                // 롯데 - 부산 사직 야구장
                var mapOptions = {
                    center: new google.maps.LatLng(35.1942,  129.0617),
                    zoom: 16.7 /* 음식점 & 숙소 마커 포함 이후 zoom 확대 예정 */
                };

                var map = new google.maps.Map(
                    document.getElementById("googleMap")
                    , mapOptions);

                map.mapTypes.set("styled_map", styledMapType);
                map.setMapTypeId("styled_map")

                for (var i = 0; i < locations.length; i++) {
                    var marker = new google.maps.Marker({
                        map: map,
                        label: locations[i].place,
                        position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                    });

                    marker.addListener('click', function () {
                        // 숙소 및 음식점 정보 출력 
                    });
                }
            }
            const locations = [
                { place: "사직 야구장", lat: 35.1942, lng:   129.0617 },
                // { place: "파파존스 삼성 라이온즈파크점", lat: 35.84163382448, lng: 128.68110981573 },
                // { place: "맛집2", lat: 35.84163382448, lng: 128.68065281573  },
            ];

            window.initMap = initMap;

        </script>
        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
    </body>

    </html>