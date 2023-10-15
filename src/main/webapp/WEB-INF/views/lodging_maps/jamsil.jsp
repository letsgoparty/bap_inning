<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>잠실 종합 운동장 주변 숙소 지도</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
}

#googleMap {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	max-width: 1500px; /* 최대 너비 지정 (필요에 따라 조절) */
}

.container {
	margin-left: 300px;
}

#sidebar {
	position: fixed;
	top: 0;
	left: 0;
	width: 400px;
	height: 100vh;
	display: none; /* 초기에 숨김 상태로 설정 */
}

#sidebar-divider {
	width: 1px;
	height: 100vh;
	background-color: black;
	float: right;
}

.card {
	margin-top: 120px !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $('#cancel').on('click', function () {
    	event.preventDefault();
        console.log("hello");
        $('#sidebar').hide();
        // 본문의 내용들 사라진 사이드바의 영역만큼 여백 제거
        $('.container').css("margin-left", 300);
    });
});
</script>
<body style="background-color: rgba(248, 249, 250) !important;">
	<div id="sidebar"
		style="position: fixed; top: 0; left: 0; width: 400px; height: 100vh; background-color: rgb(248, 249, 250)">
		<!-- 숙박 정보 띄우기  -->
		<form action="" method="get">
			<input type="hidden" id="lodging_id" name="lodging_id">
			<div class="card mt-5">
				<div id="lodging_image"></div>
				<div class="card-body">
					<h1 class="card-title mt-3 mb-4" id="lodging_name"
						style="font-family: 'KBO-Dia-Gothic_bold'; text-align: center;"></h1>
					<div class="">
						<img src="images/icon/icon1.png" width="13" height="13"> <span
							id="lodging_addr" style="font-family: 'KBO-Dia-Gothic_light';"></span>
						<p></p>
						<img src="images/icon/icon4.png" width="13" height="13"><span
							style="font-family: 'KBO-Dia-Gothic_light';">&nbsp;<span
							style="font-family: ' KBO-Dia-Gothic_bold">잠실 종합운동장</span>에서 <span
							id="distance" style="font-family: 'KBO-Dia-Gothic_bold'; color: green;"></span>
						</span>
					</div>
					<p></p>
					<img src="images/icon/icon3.png" width="13" height="13"><span
						style="font-family: 'KBO-Dia-Gothic_bold';">&nbsp;4.5</span>
					<p class="card-text mt-3" id="lodging_content"
						style="font-family: 'KBO-Dia-Gothic_light';"></p>
					<div id="lodging_url"></div>
					<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰
						보러가기</button>
					<button id="cancel" class="btn btn-primary mx-3">닫기</button>
				</div>
			</div>
		</form>
	</div>
	<div id="containerDiv">
		<div id="googleMap" style="width: 100%; height: 700px;"></div>
	</div>
	<script>
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

                // 잠실 종합운동장 (두산, LG)
                var mapOptions = {
                    center: new google.maps.LatLng(37.514353,  127.076276),
                    zoom: 15 /* 음식점 & 숙소 마커 포함 이후 zoom 확대 예정 */
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

                        if (locations[i].place === "잠실 종합운동장") {
                            // 경기장은 다른 아이콘을 사용
                            markerIcon = new google.maps.MarkerImage("images/icon/playground_icon.png", null, null, null, new google.maps.Size(50, 57));
                        }
                        var marker = new google.maps.Marker({
                            map: map,
                            position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                            icon: markerIcon
                        });

     

                        // 마커를 클릭했을 때 정보 창을 표시
                        marker.addListener('click', function () {

                        	if (locations[i].place === "잠실 종합운동장") {
                                // 경기장인 경우에는 InfoWindow를 사용하여 라벨 텍스트를 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: '잠실 종합운동장'
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
                    { place: "잠실 종합운동장", lat: 37.515833, lng:  127.072778 },
                    
                    { place: "시그니엘 서울", lat: 37.5126039, lng:  127.1025242 },
                    { place: "롯데호텔 월드", lat: 37.511534, lng:  127.099981 },
                    { place: "잠실 상주호텔", lat: 37.510081, lng:  127.080441 },
                    { place: "신라스테이 삼성", lat: 37.5099527, lng:  127.0631277 },
                    { place: "그랜드 인터컨티넨탈 서울 파르나스", lat: 37.5088823, lng:  127.0608141 },
                    { place: "파크 하얏트 서울 호텔", lat: 37.5085791, lng:  127.0641676 },
                    { place: "Hotel in 9", lat: 37.5154693, lng:  127.0600658 },
                    { place: "글래드 강남 코엑스센터", lat: 37.508825, lng:  127.064533 },
                    { place: "잠실포레스타호텔", lat: 37.5109145, lng:  127.0813744 },
                    { place: "잠실스테이호텔", lat: 37.504832, lng:  127.088065 },
                    { place: "호텔유리앤", lat: 37.508952, lng:  127.057689 },
                    { place: "오크우드 프리미어 코엑스 센터", lat: 37.5105848, lng:  127.058177 },
                    { place: "인터컨티넨탈 서울 코엑스", lat: 37.512708, lng:  127.057389 },
                    { place: "호텔 페이토 삼성", lat: 37.508494, lng:  127.058701 },
                    { place: "이비스 스타일 앰배서더 강남3", lat: 37.505205, lng:  127.057162 },
                    { place: "호텔 더 캐슬 신천", lat: 37.511099, lng:  127.081836 },

                    

            ];

            window.initMap = initMap;
	
        </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
</body>

</html>