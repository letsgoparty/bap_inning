<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
    <style>
        .input-form {
            max-width: 800px;
            margin-top: 80px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
    </style>

</head>
<body>

<div class="container">
 <div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto"> 
<!-- 여기 col-md-12 이거 사이즈 더 작게 해도 될것같음.  -->
				<h3 class="mb-3">마이페이지</h3>
				<div style="display:flex; justify-content:space-between; align-items: flex-end;">
					<div>
						<img src="" width="100" height="100"
							class="img-thumbnail" id="myTeamLogo">
					</div>
					<div>
						<a class="btn btn-primary" href="" role="button" id="myTeamPage">내 팀 홈페이지</a> 
						<a class="btn btn-primary" href="" role="button" id="myTeamWeather">내 구장 날씨 확인</a>
					</div>
				</div>
				<!-- 나의팀 경기일정 등 출력 -->
				<div class="list-group">
					<a href="myinfo" class="list-group-item list-group-item-action">내
						정보 보기</a> <a href="mytext"
						class="list-group-item list-group-item-action">내가 쓴 글</a>
				</div>
			</div>
		</div>
</div>

<script type="text/javascript">
	window.onload=function(){
		updateTeamElement();
	}
	function updateTeamElement(){
		//내팀 찾는 변수 지정
		var selectedTeam="10";
		//내팀 찾는 변수 지정
		var logoElement=document.getElementById("myTeamLogo");
		var pageElement=document.getElementById("myTeamPage");
		var weatherElement=document.getElementById("myTeamWeather");
		
		switch(selectedTeam){
		case "1":
			logoElement.src="images/logo/SSG.png";
			pageElement.href="https://www.ssglanders.com/main";
			weatherElement.href="https://weather.naver.com/today/11177107";
			break;
		case "2":
			logoElement.src="images/logo/키움.png";
			pageElement.href="https://www.heroesbaseball.co.kr/index.do";
			weatherElement.href="https://weather.naver.com/today/09530106";
			break;
		case "3":
			logoElement.src="images/logo/LG.png";
			pageElement.href="https://www.lgtwins.com/service/html.ncd?view=/pc_twins/twins_main/twins_main";
			weatherElement.href="https://weather.naver.com/today/09710101";
			break;
		case "4":
			logoElement.src="images/logo/KT.png";
			pageElement.href="https://www.ktwiz.co.kr/sports/site/baseball/main.do";
			weatherElement.href="https://weather.naver.com/today/02111136";
			break;
		case "5":
			logoElement.src="images/logo/KIA.png";
			pageElement.href="https://tigers.co.kr/";
			weatherElement.href="https://weather.naver.com/today/05170105";
			break;
		case "6":
			logoElement.src="images/logo/NC.png";
			pageElement.href="https://www.ncdinos.com/";
			weatherElement.href="https://weather.naver.com/today/03127105";
			break;
		case "7":
			logoElement.src="images/logo/삼성.png";
			pageElement.href="https://www.samsunglions.com/index.asp";
			weatherElement.href="https://weather.naver.com/today/06260123";
			break;
		case "8":
			logoElement.src="images/logo/롯데.png";
			pageElement.href="https://www.giantsclub.com/html/";
			weatherElement.href="https://weather.naver.com/today/08260109";
			break;
		case "9":
			logoElement.src="images/logo/두산.png";
			pageElement.href="https://www.doosanbears.com/";
			weatherElement.href="https://weather.naver.com/today/09710101";
			break;
		case "10":
			logoElement.src="images/logo/한화.png";
			pageElement.href="https://www.hanwhaeagles.co.kr/index.do";
			weatherElement.href="https://weather.naver.com/today/07140111";
			break;
		default:
			//팀 선택 안한경우
			logoElement.src="...";
			pageElement.href="...";
			weatherElement.href="...";
		}
	}
	
	
</script>
</body>
</html>