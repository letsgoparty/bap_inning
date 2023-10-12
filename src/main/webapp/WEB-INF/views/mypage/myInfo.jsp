<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<h1>마이페이지_내정보보기</h1>

<form action="" method="">
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default" >아이디</span>
  <input type="text" class="form-control" disabled value="사용자아이디" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default" >비밀번호</span>
  <input type="password" class="form-control" disabled id="pwInput" value="사용자비밀번호" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default" >닉네임</span>
  <input type="text" class="form-control" disabled id="nameInput" value="사용자이름" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default" >이메일</span>
  <input type="email" class="form-control" disabled id="emailInput" value="사용자이메일" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>



<div class="input-group mb-3">
  <label class="input-group-text" for="inputGroupSelect01" >나의 팀</label>
  <select class="form-select" id="inputGroupSelect01" disabled>
    <option selected>Choose...</option>
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
  </select>
</div>

<button type="button" onclick="">탈퇴하기</button>
<button type="button" id="editBtn" onclick="toggleEdit()">수정하기</button>

</form>



<script type="text/javascript">
function toggleEdit(){
	//버튼 이름따라 js로 함수줄거임.
	var editBtn=document.getElementById("editBtn");
	if(editBtn.textContent==="수정하기"){//수정하기위한 단계
		enableEdit();
		editBtn.textContent="변경내용 확정";
	}else{//변경내용 확정단계
		updateInfo();//정보업데이트
	}
}

function enableEdit(){
	//수정버튼 클릭히 인풋박스 활성화
	var editableInput=document.querySelectorAll(".form-control");
	for(var i=0;i<editableInput.length;i++){
		editableInput[i].disabled=false;
	}
	document.getElementById("inputGroupSelect01").disabled=false;
}

function updateInfo(){
	//업데이트를 위한 문장들. 
	alert("내 정보가 변경되었습니다.");
	window.location.href="myinfo";
}
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>