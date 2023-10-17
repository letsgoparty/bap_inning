<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>삼성 라이온즈 파크 주변 맛집 지도</title>
</head>
<link href="css/sidebar.css" rel="stylesheet" />
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
							style="font-family: 'KBO-Dia-Gothic_bold">삼성 라이온즈파크</span>에서 걸어서 <span
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
	<div id="allinfo_sidebar" style="position: fixed; top: 0; left: 0; width: 400px; height: 100vh; background-color: rgb(248, 249, 250)">
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
            data: { res_addr: '대구' },
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

        //삼성 라이온즈파크
        var mapOptions = { 
            center: new google.maps.LatLng(35.840891, 128.686557),
            zoom: 16.5 /* 음식점 & 숙소 마커 포함 이후 zoom 확대 예정 */
        };

        var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);

        map.mapTypes.set("styled_map", styledMapType);
        map.setMapTypeId("styled_map")
		
        // 기본 마커 아이콘
        var myIcon = new google.maps.MarkerImage("images/icon/restaurant_icon.png", null, null, null, new google.maps.Size(50, 57));


        for (var i = 0; i < locations.length; i++) {
        	// 마커에 대한 클로저 생성
            (function (i) {
            	var markerIcon = myIcon; // 기본 아이콘을 사용

                if (locations[i].place === "삼성 라이온즈파크") {
                    // 경기장은 다른 아이콘을 사용
                	markerIcon = new google.maps.MarkerImage("images/icon/playground_icon.png", null, null, null, new google.maps.Size(50, 57));
                }
            	
                if(locations[i].place === "쌀빵라팡" || locations[i].place === "카페봄봄 수성IC점") {
                    // 카페는 다른 아이콘을 사용
                    markerIcon = new google.maps.MarkerImage("images/icon/cafe_icon.png", null, null, null, new google.maps.Size(50, 57));
                }
                
                var marker = new google.maps.Marker({
                            map: map,
                            position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                            icon: markerIcon
                });

                // 위치 보러가기 기능 위해 
                var infowindow = new google.maps.InfoWindow({
                    content: locations[i].place
                });

                // 마커와 InfoWindow를 객체에 저장
                markerInfo[locations[i].place] = { marker: marker, infowindow: infowindow };

                // 마커를 클릭했을 때 정보 창을 표시
                marker.addListener('click', function () {
                	if (locations[i].place === "삼성 라이온즈파크") {
                        // 경기장인 경우에는 InfoWindow를 사용하여 라벨 텍스트를 표시
                    	var infoWindow = new google.maps.InfoWindow({
                        	content: '삼성 라이온즈파크'
                        });

                        infoWindow.open(map, marker);
                   	} else {
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
                { place: "삼성 라이온즈파크", lat: 35.841181, lng: 128.681794 },
                { place: "더포 시지점", lat: 35.842026,  lng: 128.6922692 },
                { place: "국밥한그릇", lat: 35.837467,  lng: 128.682933},
                { place: "참한차림한식뷔페", lat: 35.837836,  lng: 128.682457 },
                { place: "로드락후라이드 삼성라이온즈파크점", lat: 35.840660,  lng: 128.681322 },
                { place: "해피치즈스마일", lat: 35.841071,  lng: 128.680899 },
                { place: "파파존스 대구삼성라이온즈파크점", lat: 35.841553,  lng: 128.681084 },
                { place: "땅땅치킨 삼성라이온즈파크점", lat: 35.841780,  lng: 128.681388},
                { place: "쌀빵라팡", lat: 35.841369,  lng: 128.686849 },
                { place: "카페봄봄 수성IC점", lat: 35.837728,  lng: 128.683645},
                { place: "채다올김밥 알파시티점", lat: 35.839629,  lng: 128.691826},
                { place: "닭올닭 삼계탕 시지 직영점", lat: 35.841248,  lng: 128.692148},
                { place: "봉창이해물칼국수", lat: 35.840597,  lng: 128.693893},
                { place: "금족발 시지 본점", lat: 35.840298,  lng: 128.692688},
                { place: "진강정 대구수성알파시티점", lat: 35.39764,  lng: 128.691382 },
                { place: "미스터삼겹", lat: 35.840334,  lng: 128.692026 },
  	];

    window.initMap = initMap;
	
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
</body>
</html>