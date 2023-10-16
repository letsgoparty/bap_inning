<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//새비번 확인
	$("#newpw2").on("keyup",function(){
		var newpw=$("#newpw").val();
		var newpw2=$("#newpw2").val();
		var mesg="비밀번호가 다릅니다.";
		
		if(newpw==newpw2){
			mesg="비밀번호가 일치합니다.";
		}
		$("#pwcheck").text(mesg);
	})
})
</script>

</head>
<body>
	<h1>비밀번호 변경</h1>
	
	
<form action="">
	<div>
	<label for="currpw">현재 비밀번호</label>
	<input type="password" name="currpw" id="currpw" required>
	</div>
	<div>
	<label for="newpw">새 비밀번호</label>
	<input type="password" name="newpw" id="newpw" required><br>
	<small>비밀번호는 영자 숫자 특수문자 조합이여야합니다? (비번조건출력)</small>
	</div>
	<div>
	<label for="newpwchk">새 비밀번호 확인</label> &nbsp; <strong><span style="color: green" id="pwcheck"></span></strong><br>
	<input type="password" name="newpw2" id="newpw2" required>
	</div>
	<button>변경하기</button>
</form>
</body>
</html>