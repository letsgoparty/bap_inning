<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSG 주변 맛집 지도</title>
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
	display: none; /* 초기에 숨김 상태로 설정 */
}

#allinfo_sidebar {
	display: none;
}

.card {
	margin-top: 120px !important;
}

#all_info {
	margin-left: 10px;
	max-height: 100%;
	overflow-y: auto; /* 세로 스크롤 추가 */
}

#all_info::-webkit-scrollbar {
	width: 8px; /* 스크롤 바 너비 설정 */
}

#all_info::-webkit-scrollbar-thumb {
	background-color: #4CAF50;
	border-radius: 4px;
}

#all_info::-webkit-scrollbar-track {
	background-color: #f1f1f1;
	border-radius: 4px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body style="background-color: rgba(248, 249, 250) !important;">
	<!--  마커 클릭 시 사이드바 -->
	<div id="sidebar"
		style="position: fixed; top: 0; left: 0; width: 400px; height: 100vh; background-color: rgb(248, 249, 250)">
		<!-- 가게 정보 띄우기  -->
		<form action="" method="get">
			<input type="hidden" id="res_id" name="res_id">
			<div class="card mt-5">
				<div id="res_image"></div>
				<div class="card-body">
					<h1 class="card-title mt-3 mb-4" id="res_name"
						style="font-family: 'KBO-Dia-Gothic_bold'; text-align: center;"></h1>
					<div class="">
						<img src="images/icon/icon1.png" width="13" height="13"> <span
							id="res_addr" style="font-family: 'KBO-Dia-Gothic_light';"></span>
						<p></p>
						<img src="images/icon/icon2.png" width="13" height="13"><span
							style="font-family: 'KBO-Dia-Gothic_light';">&nbsp;<span
							style="font-family: '">SSG 랜더스 필드</span>에서 걸어서 <span
							id="distance"
							style="font-family: 'KBO-Dia-Gothic_bold'; color: rgb(194, 48, 48);"></span>
							분
						</span>
					</div>
					<p></p>
					<img src="images/icon/icon3.png" width="13" height="13"><span
						style="font-family: 'KBO-Dia-Gothic_bold';">&nbsp;4.5</span>
					<p class="card-text mt-3" id="res_content"
						style="font-family: 'KBO-Dia-Gothic_light';"></p>
					<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰
						보러가기</button>
					<button id="cancel" class="btn btn-primary mx-3">닫기</button>
				</div>
			</div>
		</form>
	</div>
	<!--  전체 리스트 사이드바  -->
	<div id="allinfo_sidebar"
		style="position: fixed; top: 0; left: 0; width: 400px; height: 100vh; background-color: rgb(248, 249, 250)">
		<div id="all_info"></div>
	</div>
	<div id="containerDiv">
		<button class="btn btn-primary mb-2" id="find_all">전체 맛집보기</button>
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
	// '전체 맛집보기'
	$('#find_all').on('click', function() {  
	    // 사이드바의 현재 상태 확인
	    var SidebarOpen = $('#allinfo_sidebar').is(':visible');
		
	    if(SidebarOpen) {
	    	// 사이드바가 열려있다면 닫기
	    	$('#allinfo_sidebar').hide();
	        $('.container').css("margin-left", 300);
	        SidebarOpen = false;
	    } else {
        	
	    	$.ajax({
        	// 사이드바가 닫혀있다면 열기
            url: 'find_all_res', 
            method: 'GET',
            data: { res_addr: '인천' },
            success: function (data) {
                // 성공적으로 데이터를 받아왔을 때의 처리
                console.log(data);
                
               	$.each(data, function(idx, ele){
               		
               		var cardId = 'card_' + idx;      		
                    var imagePath = 'images/restaurant_images/' + ele.res_image + '.png';
                    var res_name = ele.res_name;
               		
               		var cardHtml = '<form id="' + cardId + '" action="" method="get">' +
                    '<input type="hidden" id="res_id" name="res_id" value="' + ele.res_id + '">' +
                    '<div class="card">' +
                    '<div"><img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px"></div>' +
                    '<div class="card-body">' +
                    '<h1 class="card-title mt-3 mb-4" id="res_name" style="font-family: \'KBO-Dia-Gothic_bold\'; text-align: center;">' + ele.res_name + '</h1>' +
                    '<div class="">' +
                    '<img src="images/icon/icon1.png" width="13" height="13"> <span id="res_addr" style="font-family: \'KBO-Dia-Gothic_light\';">' + ele.res_addr + '</span>' +
                    '<p></p>' +
                    '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span style="font-family: \'KBO-Dia-Gothic_bold\">SSG 랜더스 필드</span>에서 걸어서 <span id="distance" style="font-family: \'KBO-Dia-Gothic_bold\'; color: rgb(194, 48, 48);">' + ele.distance + '</span> 분</span>' +
                    '</div>' +
                    '<p></p>' +
                    '<img src="images/icon/icon3.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_bold\';">&nbsp;' + 4.5 + '</span>' +
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
                // 오류 발생 시의 처리
                console.error('Error:', error);
            }
        });
        
		 $('#allinfo_sidebar').show();
         // 본문의 내용들 나타난 사이드바의 영역만큼 여백 추가
         $('.container').css("margin-left", 400);
	    }
	});
	
	var markerInfo = {};
	var map;
	$(document).on('click', '.find_res_btn', function(event) {
	    event.preventDefault();
	    var res_name = $(this).data('res-name');
	    // console.log(res_name);
	    
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

                // 인천 SSG 랜더스 필드
                var mapOptions = {
                    center: new google.maps.LatLng(37.4371388889, 126.693055556),
                    zoom: 15.5 /* 음식점 & 숙소 마커 포함 이후 zoom 확대 예정 */
                };

                var map = new google.maps.Map(
                    document.getElementById("googleMap"), mapOptions);

                map.mapTypes.set("styled_map", styledMapType);
                map.setMapTypeId("styled_map")

                var myIcon = new google.maps.MarkerImage("images/icon/restaurant_icon.png", null, null, null, new google.maps.Size(50, 57));


                for (var i = 0; i < locations.length; i++) {
                    // 마커에 대한 클로저 생성
                    (function (i) {
                        var markerIcon = myIcon; 

                        if (locations[i].place === "인천 SSG 랜더스 필드") {
                            // 경기장은 다른 아이콘을 사용
                            markerIcon = new google.maps.MarkerImage("images/icon/playground_icon.png", null, null, null, new google.maps.Size(50, 57));
                        }
                        if(locations[i].place === "투썸플레이스 인천문학점" || locations[i].place === "스타벅스 SSG랜더스필드") {
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
                        
                        // 마커를 클릭했을 때, 이벤트 처리 
                        marker.addListener('click', function () {
                        	if ($('#allinfo_sidebar').is(':visible')) {
                        		// 전체 리스트 사이드바가 열려있다면 라벨 텍스트 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: locations[i].place
                                });

                                infoWindow.open(map, marker);
                        	}
                        	else if (locations[i].place === "인천 SSG 랜더스 필드") {
                                // 경기장인 경우에는 라벨 텍스트를 표시
                                var infoWindow = new google.maps.InfoWindow({
                                    content: '인천 SSG 랜더스 필드'
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
                { place: "인천 SSG 랜더스 필드", lat: 37.436588889, lng: 126.693309996 },
                { place: "삼부자 오리천국", lat: 37.436397, lng: 126.696952 },
                { place: "문가네 황제짬뽕", lat: 37.4367438, lng: 126.6832518 },
                { place: "리미니", lat: 37.4439342, lng: 126.7006496 },
                { place: "화로 품은 갈비", lat: 37.443572, lng: 126.6938256 },
                { place: "버거트레일러", lat: 37.436075, lng: 126.689138 },
                { place: "문학아구찜", lat: 37.437412, lng: 126.679422 },
                { place: "솔밭가든", lat: 37.4310861, lng: 126.69665531 },
                { place: "고구려짬뽕", lat: 37.4356137, lng: 126.6987431 },
                { place: "한우소머리곰탕", lat: 37.4374829, lng: 126.6887871 },
                { place: "투썸플레이스 인천문학점", lat: 37.438201, lng: 126.68757},
                { place: "맥도날드 문학DT점", lat: 37.438122, lng: 126.688862 },
                { place: "착한보쌈 문학본점", lat: 37.437118, lng: 126.686306 },
                { place: "영주셀프한우 문학점", lat: 37.435039, lng: 126.692174},
                { place: "곤드레가마솥추어탕", lat: 37.439687, lng: 126.694949},
                { place: "스타벅스 SSG랜더스필드", lat: 37.436619, lng: 126.692257},
            ];

            window.initMap = initMap;
    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
</body>

</html>