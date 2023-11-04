<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보보기</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
	
<style>
.input-form {
	max-width: 680px;
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
span {
    display: block;
    text-align: right;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	//나의 팀 드롭다운이 선택되어있게끔
	$(document).ready(function(){
		var userTeamCode=document.getElementById("user_team_code").textContent;
		//select요소에 해당하는거 선택
		$("#myTeam").val(userTeamCode);
		 
/* 		//이메일도메인 변경시 자동입력
		$("#emailDomain").change(function() {
			var selectedDomain = $("#emailDomain").val();
			$("#email2").val(selectedDomain);
		}); */	
		
		//인풋활성화 와 정보수정하기
		$('#editBtn').click(function(){
			//버튼 이름따라 js로 함수줄거임.
				enableEdit(); //인풋박스활성화
				document.getElementById("submitBtn").disabled=false;
				document.getElementById("editBtn").disabled=true;
				
		});
			
		 
	});
	function enableEdit() {
		// 인풋박스 활성화
		var editableInput = document.querySelectorAll(".form-control");
		for (var i = 0; i < editableInput.length; i++) {
			editableInput[i].disabled = false;
		}
		var editableSelect = document.querySelectorAll(".form-select");
		for (var i = 0; i < editableSelect.length; i++) {
			editableSelect[i].disabled = false;
		}
		document.getElementById("userid").disabled="true";
		document.getElementById("email1").disabled="true";
		document.getElementById("email2").disabled="true";
		
	};
	function disableEdit() {
		//인풋박스 비활성화
		var editableInput = document.querySelectorAll(".form-control");
		for (var i = 0; i < editableInput.length; i++) {
			editableInput[i].disabled = true;
		}
		var editableSelect = document.querySelectorAll(".form-select");
		for (var i = 0; i < editableSelect.length; i++) {
			editableSelect[i].disabled = true;
		}
		document.getElementById("userid").disabled="true";
		
	};
	


</script>
	
</head>
<body>
	<jsp:include page="../common/nav.jsp" flush="true"/> 
		<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-7 mx-auto">
				<h3>내 정보</h3>
<span id="user_team_code" hidden>${user.team_code}</span>
				<br>
				<form action="myinfo" method="post" onsubmit="return validateEmail()">
				<input type="hidden" name="userid" value="${user.userid}">
					<div>
					<span style="color: red" id="result"></span>
					<div class="input-group">
						<span class="input-group-text" id="useridLabel">아이디</span> <input
							type="text" class="form-control" disabled readonly required value="${user.userid}"
							id="userid" name="userid" autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">

					</div>
					</div>

	
					<div class="input-group mb-3 mt-3">
						<span class="input-group-text" id="nicknameLabel">닉네임</span> <input
							type="text" class="form-control" disabled required id="nickname"
							name="nickname" value="${user.nickname}"  autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="emailLabel">이메일</span> 
						<input type="text" class="form-control" readonly  disabled required id="email1"
							name="email1" value="${user.email.split('@')[0]}"  autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default"> <span
							class="input-group-text" id="emailDomainLabel">@</span> <input
							type="text" class="form-control" readonly disabled required id="email2"
							name="email2" value="${user.email.split('@')[1]}"  autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default"> 
<!-- 						<select
							class="form-select" id="emailDomain" disabled>
							<option value="">--직접입력--</option>
							<option value="daum.net">daum.net</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
						</select> -->
					</div>



					<div class="input-group mb-3">
						<label class="input-group-text" for="inputGroupSelect01">나의팀</label>
						<select class="form-select" id="myTeam" name="myTeam" disabled>
							<option value="1">SSG 랜더스</option>
							<option value="2">키움 히어로즈</option>
							<option value="3">LG 트윈스</option>
							<option value="4">KT wiz</option>
							<option value="4">KIA 타이거즈</option>
							<option value="6">NC 다이노스</option>
							<option value="7">삼성 라이온즈</option>
							<option value="8">롯데 자이언츠</option>
							<option value="9">두산 베어스</option>
							<option value="10">한화 이글스</option>
						</select>
					</div>
					<div style="display: flex; justify-content: space-between;"
						class="mb-3">
						<button class="btn btn-primary" type="button" id="deleteUserBtn" onclick="location.href='/app/user_delete'">탈퇴하기</button>
						<div>
						<button class="btn btn-primary" type="button" id="editBtn">수정하기</button>
						<button class="btn btn-primary" type="submit" id="submitBtn" disabled>변경내용 확정</button>
						</div>
					</div>
					<div style="float: right">
						<a href="pwchange">비밀번호 변경 ></a>
					</div>
				</form>

			</div>
		</div>
	</div>

<script>

/* //이메일을 올바른 형식으로 썼는지 확인
function validateEmail(){
	var email1=document.getElementById("email1").value;
	var email2=document.getElementById("email2").value;
	//이메일1 영어필수 숫자선택 특수문자선택 임. 
	var email1Vaild=/^[a-zA-Z0-9._%+]+$/;
	if (!email1Vaild.test(email1)){
		alert("이메일 형식이 올바르지 않습니다.");
		return false;
	}
	//이메일2 영어필수 온점필수
	var email2Vaild=/^[a-zA-Z0-9-]+[.]+[a-zA-Z0-9-]+$/;
	if(!email2Vaild.test(email2)){
		alert("이메일 형식이 올바르지 않습니다.");
		return false;
	}
	
	//올바르게 썼을시 폼 제출
	return true;
} */
</script> 
 
</body>
</html>