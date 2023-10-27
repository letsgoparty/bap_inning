<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/sidebar.css" rel="stylesheet" />
<link href="css/like.css" rel="stylesheet" />
<title>SSG 랜더스필드 주변 맛집 지도</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<!--  마커 클릭 시 사이드바 -->
	<div class="sidebar" id="sidebar">
		<!-- 가게 정보 띄우기  -->
		<form action="r_reviewList" method="get">
			<input type="hidden" id="res_id" name="res_id">
			<div class="card mt-5">
				<div id="res_image"></div>
				<div class="card-body">
					<h1 class="card-title mt-3 mb-4" id="res_name"></h1>
					<div>
						<img src="images/icon/icon1.png" width="13" height="13"> <span
							id="res_addr"></span>
						<p></p>
						<img src="images/icon/icon2.png" width="13" height="13"> <span
							style="font-family: 'KBO-Dia-Gothic_light';"> <span
							class="location">SSG 랜더스필드</span>에서 걸어서 <span id="distance"></span>분
						</span>
					</div>
					<p></p>
					<img src="images/icon/icon3.png" width="13" height="13"> <span
						id="rating">&nbsp;</span>
					<p class="card-text mt-3" id="res_content"></p>
					<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰
						보러가기</button>
					<button id="cancel" class="btn btn-primary mx-2">닫기</button>
					<button id="like_btn" class="btn btn-primary mt-3 me-3" style="float: right;">
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
		<button class="btn btn-primary mb-2 category" id="find_all">맛집
			전체보기</button>
		<button class="btn btn-primary mb-2 category" id="find_KOR">🥘
			한식</button>
		<button class="btn btn-primary mb-2 category" id="find_USA">🍖
			양식</button>
		<button class="btn btn-primary mb-2 category" id="find_CHN">🥟
			중식</button>
		<button class="btn btn-primary mb-2 category" id="find_JPN">🍣
			일식</button>
		<button class="btn btn-primary mb-2 category" id="find_CAFE">☕️
			카페</button>
		<button class="btn btn-primary mb-2 category" id="find_FF">🍔
			패스트푸드</button>
		<div id="googleMap" style="width: 100%; height: 700px;"></div>
	</div>
	<script>
	
            // '찜하기' 버튼
            $(document).on('click', '#like_btn', function () {
                event.preventDefault();
                var res_id = $(this).data('res-id');
                
                $.ajax({
                	url: 'like_res',
                    method: 'GET',
                    data: { res_id: res_id },
                    success: function (data) {
                    	if(data === '로그인이 필요합니다.') {
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
                	        text: "이미 찜한 음식점입니다.",
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
                // '전체보기' 버튼
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
                            data: { team_code: 1 },
                            success: function (data) {
								
                                $.each(data, function (idx, ele) {

                                    var cardId = 'card_' + idx;
                                    var imagePath = 'images/restaurant_images/' + ele.res_image + '.png';
                                    var res_name = ele.res_name;
										console.log(ele.rating);
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
                                        '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + ele.rating + '</span>' +
                                        '<p class="card-text mt-3" id="res_content"">' + ele.res_content + '</p>' +
                                        '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                                        '<button class="btn btn-primary mx-3 find_res_btn" data-res-name="' + res_name + '">위치 보러가기</button>' +
                                        '<button class="btn btn-primary mt-3 me-3" id="like_btn" data-res-id="'+ ele.res_id +'" style="float:right;"><img src="images/icon/dislike_icon.png" width=20 height=20></button>' +
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
                            data: { category: category, team_code: 1 },
                            success: function (data) {
            
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
                                        '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + ele.rating + '</span>' +
                                        '<p class="card-text mt-3" id="res_content"">' + ele.res_content + '</p>' +
                                        '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                                        '<button class="btn btn-primary mt-3 mb-3 mx-3 find_res_btn" data-res-name="' + res_name + '">위치 보러가기</button>' +
                                        '<button class="btn btn-primary mt-3 me-3" id="like_btn" data-res-id="'+ ele.res_id +'" style="float:right;"><img src="images/icon/dislike_icon.png" width=20 height=20></button>' +
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
                // '위치 보러가기' 버튼
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
                            if (locations[i].place === "투썸플레이스 인천문학점" || locations[i].place === "스타벅스 SSG랜더스필드" || locations[i].place === "8퍼센트커피 관교점" || locations[i].place === "더앨리 ssg랜더스필드점") {
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
                                if (locations[i].place === "인천 SSG 랜더스 필드") {
                                    // 경기장인 경우에는 라벨 텍스트를 표시
                                    var infoWindow = new google.maps.InfoWindow({
                                        content: '인천 SSG 랜더스 필드'
                                    });

                                    infoWindow.open(map, marker);
                                } else {
                                    $('.sidebar:not(#sidebar)').hide();
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
                                            var imagePath = 'images/restaurant_images/' + data.res_image + '.png';
                                            var imgTag = '<img src="' + imagePath + '" class="card-img-top" alt="img" width="300px" height="300px">'
                                            $('#res_image').html(imgTag);
                                            $('#res_name').text(data.res_name);
                                            $('#res_addr').text(data.res_addr);
                                            $('#distance').text(data.distance);
                                            $('#res_content').text(data.res_content);
                                            $('#res_id').val(data.res_id);
                                            $('#like_btn').data('res-id', data.res_id);
                                        },
                                        error: function (error) {
                                            // 오류 발생 시의 처리
                                            console.error('Error:', error);
                                        }
                                    });
                                    $.ajax({
                                        url: 'find_res_rating',
                                        method: 'GET',
                                        data: { res_name: res_name },
                                        success: function (data) {
                                            // 성공적으로 데이터를 받아왔을 때의 처리
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
                    { place: "투썸플레이스 인천문학점", lat: 37.438201, lng: 126.68757 },
                    { place: "맥도날드 문학DT점", lat: 37.438122, lng: 126.688862 },
                    { place: "착한보쌈 문학본점", lat: 37.437118, lng: 126.686306 },
                    { place: "영주셀프한우 문학점", lat: 37.435039, lng: 126.692174 },
                    { place: "곤드레가마솥추어탕", lat: 37.439687, lng: 126.694949 },
                    { place: "스타벅스 SSG랜더스필드", lat: 37.436619, lng: 126.692257 },
                    { place: "참치학교", lat: 37.437321, lng: 126.686867 },
                    { place: "돈가스유리2 세종점", lat: 37.437664, lng: 126.685495 },
                    { place: "빅브라더돈까스", lat: 37.435752, lng: 126.699119 },
                    { place: "브런치2017", lat: 37.442433, lng: 126.692603 },
                    { place: "카렌 롯데백화점 인천점", lat: 37.442174, lng: 126.701228 },
                    { place: "차이홍", lat: 37.437490, lng: 126.686189 },
                    { place: "천하원", lat: 37.438232, lng: 126.684928 },
                    { place: "마화쿵부", lat: 37.437492, lng: 126.683157 },
                    { place: "간도양꼬치본점", lat: 37.438245, lng: 126.681075 },
                    { place: "라마마라탕 관교점", lat: 37.441245, lng: 126.695329 },
                    { place: "라멘이찌방 롯데백화점 인천점", lat: 37.442772, lng: 126.701397 },
                    { place: "키노야 롯데백화점 인천점", lat: 37.442169, lng: 126.701222 },
                    { place: "오늘은카레 인천관교점", lat: 37.443332, lng: 126.692801 },
                    { place: "더앨리 ssg랜더스필드점", lat: 37.435953, lng: 126.690558 },
                    { place: "8퍼센트커피 관교점", lat: 37.440767, lng: 126.694190 },
                    { place: "노브랜드버거 SSG랜더스필드점", lat: 37.435819, lng: 126.690062 },
                    { place: "파파존스 SSG랜더스점", lat: 37.437247, lng: 126.692659 },
                ];

                window.initMap = initMap;

            </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArPT6pq4J0dihJO0wiErSQPMUaWI6MCtU&callback=initMap"></script>
</body>

</html>