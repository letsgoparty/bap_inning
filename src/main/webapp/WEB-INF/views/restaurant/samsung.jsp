<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/sidebar.css" rel="stylesheet" />
<title>삼성 라이온즈파크 주변 맛집 지도</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
 	<jsp:include page="../common/nav.jsp" flush="true"/> 
	<!--  마커 클릭 시 사이드바 -->
	<div class="sidebar" id="sidebar">
		<!-- 가게 정보 띄우기  -->
		<form action="r_reviewList" method="get">
			<input type="hidden" id="res_id" name="res_id">
			<div class="card mt-5">
				<div id="res_image"></div>
				<div class="card-body">
					<h1 class="card-title mt-3 mb-4" id="res_name"></h1>
					<div class="">
						<img src="images/icon/icon1.png" width="13" height="13"> <span
							id="res_addr"></span>
						<p></p>
						<img src="images/icon/icon2.png" width="13" height="13"> <span
							style="font-family: 'KBO-Dia-Gothic_light';">&nbsp;<span
							class="location">라이온즈파크</span>에서 걸어서 <span id="distance"></span>분
						</span>
					</div>
					<p></p>
					<img src="images/icon/icon3.png" width="13" height="13"> <span
						id="rating">&nbsp;</span>
					<p class="card-text mt-3" id="res_content"></p>
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
	$('#find_all').on('click', function() {  
		
		 $('.sidebar:not(#allinfo_sidebar)').hide();
		 
	    // 사이드바의 현재 상태 확인
	    var SidebarOpen = $('#allinfo_sidebar').is(':visible');
		
	    if(SidebarOpen) {
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
            data: { team_code: 7 },
            success: function (data) {
                // 성공적으로 데이터를 받아왔을 때의 처리
                
               	$.each(data, function(idx, ele){
               		
               		var cardId = 'card_' + idx;      		
               		var imagePath = 'https://kr.object.ncloudstorage.com/team2-bucket/restaurant_images/' + ele.res_image + '.png';
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
                    '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span class="location">라이온즈파크</span>에서 걸어서 <span id="distance">' + ele.distance + '</span> 분</span>' +
                    '</div>' +
                    '<p></p>' +
                    '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + ele.rating + '</span>' +
                    '<p class="card-text mt-3" id="res_content">' + ele.res_content + '</p>' +
                    '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                    '<button class="btn btn-primary mt-3 mb-3 mx-3 find_res_btn" data-res-name="' + res_name + '">위치 보러가기</button>' +
                    '<button class="btn btn-primary mt-3 me-3" id="like_btn" data-res-id="' + ele.res_id + '" style="float:right;"><img src="images/icon/dislike_icon.png" width=20 height=20></button>' +
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
                data: { category: category, team_code: 7 },
                success: function (data) {
                    // 성공적으로 데이터를 받아왔을 때의 처리
                    $.each(data, function (idx, ele) {
                        var cardId = 'card_' + idx;
                        var imagePath = 'https://kr.object.ncloudstorage.com/team2-bucket/restaurant_images/' + ele.res_image + '.png';
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
                            '<img src="images/icon/icon2.png" width="13" height="13"><span style="font-family: \'KBO-Dia-Gothic_light\';">&nbsp;<span class="location">라이온즈파크</span>에서 걸어서 <span id="distance">' + ele.distance + '</span> 분</span>' +
                            '</div>' +
                            '<p></p>' +
                            '<img src="images/icon/icon3.png" width="13" height="13"><span>&nbsp;' + ele.rating + '</span>' +
                            '<p class="card-text mt-3" id="res_content"">' + ele.res_content + '</p>' +
                            '<button type="submit" class="btn btn-primary mt-3 mb-3">리뷰 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 mb-3 mx-3 find_res_btn" data-res-name="' + res_name + '">위치 보러가기</button>' +
                            '<button class="btn btn-primary mt-3 me-3" id="like_btn" data-res-id="' + ele.res_id + '" style="float:right;"><img src="images/icon/dislike_icon.png" width=20 height=20></button>' +
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
	$(document).on('click', '.find_res_btn', function(event) {
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

        //삼성 라이온즈파크
        var mapOptions = { 
            center: new google.maps.LatLng(35.839579, 128.688307),
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
            	
                if(locations[i].place === "쌀빵라팡" || locations[i].place === "핑퐁커피 알파시티점"|| locations[i].place === "버터우드 대구점") {
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
                     if (locations[i].place === "마산 종합 운동장") {
                        // 경기장인 경우에는 라벨 텍스트를 표시
                        var infoWindow = new google.maps.InfoWindow({
                            content: '마산 종합 운동장'
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
                                console.log(data);
                                console.log(data.res_content);
                                var imagePath = 'https://kr.object.ncloudstorage.com/team2-bucket/restaurant_images/' + data.res_image + '.png';
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
                { place: "삼성 라이온즈파크", lat: 35.841181, lng: 128.681794 },
                { place: "더포 시지점", lat: 35.842026,  lng: 128.6922692 },
                { place: "국밥한그릇", lat: 35.837467,  lng: 128.682933},
                { place: "참한차림한식뷔페", lat: 35.837836,  lng: 128.682457 },
                { place: "로드락후라이드 삼성라이온즈파크점", lat: 35.840660,  lng: 128.681322 },
                { place: "해피치즈스마일", lat: 35.841071,  lng: 128.680899 },
                { place: "파파존스 대구삼성라이온즈파크점", lat: 35.841553,  lng: 128.681084 },
                { place: "땅땅치킨 삼성라이온즈파크점", lat: 35.841780,  lng: 128.681388},
                { place: "쌀빵라팡", lat: 35.841369,  lng: 128.686849 }, 
                { place: "채다올김밥 알파시티점", lat: 35.839629,  lng: 128.691826},
                { place: "닭올닭 삼계탕 시지 직영점", lat: 35.841248,  lng: 128.692148},
                { place: "봉창이해물칼국수", lat: 35.840597,  lng: 128.693893},
                { place: "금족발 시지 본점", lat: 35.840298,  lng: 128.692688},
                { place: "진강정 대구수성알파시티점", lat: 35.839752,  lng: 128.691268 },
                { place: "미스터삼겹", lat: 35.840334,  lng: 128.692026 },
                { place: "중화면가", lat: 35.840077,  lng: 128.693189 },
                { place: "멘츠로에비야", lat: 35.839554,  lng: 128.691405 },
                { place: "핑퐁커피 알파시티점", lat: 35.839631,  lng: 128.691886 },
                { place: "코레와카레 시지점", lat: 35.840704,  lng: 128.691960 },
                { place: "마리테이블", lat: 35.840985,  lng: 128.692115 },
                { place: "듀얼몬스터 시지점", lat: 35.839503,  lng: 128.696377 },
                { place: "하이니콜 수성본점", lat: 35.837826,  lng: 128.683847 },
                { place: "버터우드 대구점", lat: 35.841449,  lng: 128.682271 },
  	];

    window.initMap = initMap;
	
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=${googleMapsApiKey}&callback=initMap"></script>
</body>
</html>