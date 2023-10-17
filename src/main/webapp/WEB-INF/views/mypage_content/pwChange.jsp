<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
    <style>
        .input-form {
            max-width: 500px;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		//새비번 확인
		$("#newpw2").on("keyup", function() {
			var newpw = $("#newpw").val();
			var newpw2 = $("#newpw2").val();
			var mesg = "비밀번호가 다릅니다.";

			if (newpw == newpw2) {
				mesg = "비밀번호가 일치합니다.";
			}
			$("#pwcheck").text(mesg);
		})
	})
</script>

</head>
<body>


	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h3>비밀번호 변경</h3>
				<form action="">
				
					<div class="input-group mb-3">
						<span class="input-group-text col-4" >현재 비밀번호</span> 
						<input
							type="password" class="form-control" required id="currpw"
							name="currpw" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>
					<span>비번 조건 아직 미정. (8-16글자, 영어, 특수문자, 숫자 필수?)</span>
					<div class="input-group mb-3">
						<span class="input-group-text col-4" >새 비밀번호</span> 
						<input
							type="password" class="form-control" required id="newpw"
							name="newpw" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>
					<div class="input-group ">
						<span class="input-group-text col-4" >새 비밀번호 확인</span> 
						<input
							type="password" class="form-control" required id="newpw2"
							name="newpw2" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>
					<div style="float:right">
							<strong><span class="" style="color:green" id="pwcheck"></span></strong>
					</div><br><br>
            <div class="d-flex justify-content-center" >
                <button type="" class="btn btn-primary" style="width:30%">변경하기</button>
            </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>