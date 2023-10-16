<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//이메일도메인 변경시 자동입력
		$("#emailDomain").change(function(){
			var selectedDomain=$(this).val();
			$("#email2").val(selectedDomain);
		});
	});
</script>
</head>
<body>
	<h1>마이페이지_내정보보기</h1>

	<form action="" method="">
		<div class="input-group mb-3">
			<span class="input-group-text" id="useridLabel">아이디</span>
			<input type="text" class="form-control" disabled value="사용자아이디" id="userid" name="userid"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="nicknameLabel">닉네임</span>
			<input type="text" class="form-control" disabled id="nickname" name="nickname"
				value="사용자이름" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="emailLabel" >이메일</span>
			<input type="email" class="form-control" disabled id="email"
				value="사용자이메일" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
			<span class="input-group-text" id="emailDomainLabel">@</span>
			<input type="email" class="form-control" disabled id="email2"
				value="사용자이메일" aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default">
			<select class="form-select" id="emailDomain" disabled>
                 <option value="">--직접입력--</option>
                 <option value="daum.net">daum.net</option>
                 <option value="naver.com">naver.com</option>
                 <option value="google.com">google.com</option>
			</select>
		</div>



		<div class="input-group mb-3">
			<label class="input-group-text" for="inputGroupSelect01">나의팀</label> 
			<select class="form-select" id="myTeam" disabled>
				<option value="0">---해당없음---</option>
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
		<div>
			<button type="button" onclick="">탈퇴하기</button>
			<button type="button" id="editBtn" onclick="toggleEdit()">수정하기</button>
		</div>
		<a href="pwchange">비밀번호 변경></a>

	</form>



	<script type="text/javascript">
		function toggleEdit() {
			//버튼 이름따라 js로 함수줄거임.
			var editBtn = document.getElementById("editBtn");
			if (editBtn.textContent === "수정하기") {//수정하기위한 단계
				enableEdit();
				editBtn.textContent = "변경내용 확정";
			} else {//변경내용 확정단계
				updateInfo();//정보업데이트
			}
		}

		function enableEdit() {
			//수정버튼 클릭히 인풋박스 활성화
			var editableInput = document.querySelectorAll(".form-control");
			for (var i = 0; i < editableInput.length; i++) {
				editableInput[i].disabled = false;
			}
			var editableSelect=document.querySelectorAll(".form-select");
			for (var i=0;i<editableSelect.length;i++){
				editableSelect[i].disabled=false;
			}
		}

		function updateInfo() {
			//업데이트를 위한 문장들. 
			alert("내 정보가 변경되었습니다.");
			window.location.href = "myinfo";
		}
	</script>

</body>
</html>