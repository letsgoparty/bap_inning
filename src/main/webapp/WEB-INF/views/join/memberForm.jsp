<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면</title>

<!-- Bootstrap CSS -->
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
        $(document).ready(function () {
            // 비밀번호 일치 여부 확인
            $("#passwd2").on("keyup", function () {
                var passwd = $("#passwd").val();
                var passwd2 = $("#passwd2").val();
                var mesg = "비밀번호가 다릅니다";

                if (passwd == passwd2) {
                    mesg = "비밀번호가 일치합니다";
                }
                $("#pwcheck").text(mesg);
            });

            // 아이디 중복체크
            $("#idcheck").on("click", function () {

                event.preventDefault();

                $.ajax({
                    type: "get",
                    url: "memberIdCheck",
                    data: {
                        userid: $("#userid").val()
                    },
                    dataType: 'text',
                    success: function (data, status, xhr) {
                        console.log(data);
                        $("#idResult").text(data);
                    },
                    error: function (xhr, status, error) {
                        console.log("error 발생");
                    }
                });
            });
            
            
         // 닉네임 중복체크
           $("#nicknameCheck").on("click", function () {

              event.preventDefault();

               $.ajax({
                  type: "get",
                  url: "nicknameCheck",
                  data: {
                   nickname: $("#nickname").val()
                  },
                  dataType: 'text',
                  success: function (data, status, xhr) {
                     console.log(data);
                     $("#nicknameResult").text(data);
                    },
                  error: function (xhr, status, error) {
                        console.log("error 발생");
                  }
              });
          });
            
            
            
            
            

            $("#emailDomain").change(function () {
                var selectedDomain = $(this).val();
                $("#email2").val(selectedDomain);
            });
            
            var isAuthCodeVerified = false;
            
            $("#authBtn").on("click", function(){
            	event.preventDefault();
            	var email1 = $("#email1").val();
            	var email2 = $("#email2").val();
            	var email = email1+ "@" + email2;
            	
                if (email1 === "" || email2 === "") {
                    alert("이메일을 입력해주세요."); 
                    return; 
                }
            	$("#email1, #email2").prop("readonly", true);
            	$.ajax({
                    type: "get",
                    url: "sendMailCode",
                    dataType: 'text',
                    data: {
                    	email:email
                    },
                    success: function (data) {
                    	
                    	$("#authCode").val(data);
                    	
                    	// 함수실행될 때 시스템 시간을 히든 필드에 할당
                        var clientSystemTime = new Date().getTime();
                        $('#hiddenSystemTime').val(clientSystemTime);
                        
                        $("#authBtn").hide();
                        $("#authCheck").show();
              	
                        $("#authCodeInput").show();
                    },
                    error: function (xhr, status, error) {
                        console.log("error 발생");
                    }
                });
                
            });
            
            $("#authCheck").on("click", function(){
            	event.preventDefault();
            	var authCode = $("#authCode").val();
            	console.log(authCode);
            	var authCodeInput = $("#authCodeInput").val();
            	var authCheckTime = new Date().getTime();
            	var hiddenSystemTime = $("#hiddenSystemTime").val();
            	if(authCode === authCodeInput && Math.abs(authCheckTime - hiddenSystemTime) <= 180000) {
            		$("#auth_result").html('<span style="color:green"><img src="images/icon/o-icon.png" width=18 height=18> 인증을 성공하셨습니다.</span>');
            		isAuthCodeVerified = true;
            	} else {
            		$("#auth_result").html('<img src="images/icon/x-icon.png" width=20 height=20> 인증을 실패하였습니다. 인증코드를 재확인하시거나 3분 유효시간을 확인해주세요.');
            		isAuthCodeVerified = false;
            	}
            });
            
            $("#joinBtn").on("click", function(event) {
            	  if (!isAuthCodeVerified) {
            	    event.preventDefault(); // 인증코드 확인이 완료되지 않으면 제출을 막음
            	    alert("인증코드 확인을 완료하세요.");
            	  }
            	});
        });
    </script>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h3 class="mb-3">회원가입</h3>
				<form action="memberAdd" method="POST" class="validation-form"
					novalidate onsubmit="return validateForm()">

					<label for="userid">아이디</label> <span style="color: red"
						id="idResult"></span>
					<div class="row">
						<div class="col-md-9 mb-3">
							<input type="text" class="form-control" name="userid" id="userid"
								required autocomplete="off">
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-md-3">
							<button type="button" id="idcheck" class="btn btn-primary"
								style="height: 2.3rem;">중복확인</button>
							<br>
						</div>
					</div>



					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="passwd">비밀번호</label> <input type="password"
								class="form-control" name="password" id="passwd" required
								placeholder="8자리 이상 숫자, 영문자, 특문" required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="passwd2">비밀번호 확인</label> &nbsp; <strong><span
								style="color: green" id="pwcheck"></span></strong> <input type="password"
								class="form-control" id="passwd2" required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
					</div>



					<label for="nickname">닉네임</label> <span style="color: red"
						id="nicknameResult"></span>
					<div class="row">
						<div class="col-md-9 mb-3">
							<input type="text" class="form-control" name="nickname" id="nickname"
								required autocomplete="off">
							<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						</div>
						<div class="col-md-3">
							<button type="button" id="nicknameCheck" class="btn btn-primary"
								style="height: 2.3rem;">중복확인</button>
							<br>
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 mb-4">
							<label for="email">이메일</label> 
								<div class="d-flex align-items-center">
					            <input type="text" class="form-control" id="email1" name="email1" autocomplete="off" required>
					            <span class="mx-2">@</span>
					            <input type="text" class="form-control" id="email2" name="email2" placeholder="직접입력" required>
					           </div>
					        <div class="invalid-feedback">이메일을 입력해주세요.</div>
					    </div>
						<div class="col-md-6 mb-4">
							  <label for="email"></label>
					        <select id="emailDomain" class="form-select">
					            <option value="">--직접입력--</option>
					            <option value="daum.net">daum.net</option>
					            <option value="naver.com">naver.com</option>
					            <option value="gmail.com">gmail.com</option>
					        </select>
					    </div>
					</div>

					<div class="row">
						<div class="col-md-8">
							<input type="text"
								class="form-control" id="authCodeInput" required
								style="display: none;"> <input type="hidden"
								id="authCode"><input type="hidden"
								id="hiddenSystemTime">
							<p id="auth_result" style="color: red;"></p>
							<div class="invalid-feedback"></div>
						</div>
						<div class="col-md-4">
							<button class="btn btn-primary" id="authBtn">인증코드
								전송</button>
							<button class="btn btn-primary" id="authCheck"
								style="display: none">인증코드 확인</button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="myTeam">나의 팀</label> <select name="team_code"
								class="form-select" id="myTeam" style="width: 120%">
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
					</div>


					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>

					<div style="text-align: center;">
						<button class="btn btn-primary" type="submit" id="joinBtn">회원가입</button>
						<button class="btn btn-primary" type="reset"
							style="text-align: center;">취소</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script>
        window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');

            Array.prototype.filter.call(forms, (form) => {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    </script>

	<script>
    const useridInput = document.getElementById('userid');

    useridInput.addEventListener('input', function() {
        const useridValue = useridInput.value;

        // 정규 표현식을 사용하여 한글이 포함된 경우 입력을 제한
        if (/[\u3130-\u318F\uAC00-\uD7A3]+/.test(useridValue)) {
            alert('한글은 아이디로 사용할 수 없습니다.');
            useridInput.value = ''; 
        }
    });
   </script>

	<script>
     var passwordInput = document.getElementById('passwd');
     var password2Input = document.getElementById('passwd2');
     var passwordValid = false; // 비밀번호 유효성 상태를 저장하는 변수

       passwordInput.addEventListener('input', function () {
        var password = this.value;
        var passwdcheck = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{8,}$/;
        
        // 비밀번호 유효성 검사
        if (password.match(passwdcheck)) {
            passwordValid = true;
        } else {
            passwordValid = false;
        }
       });

     password2Input.addEventListener('focus', function () {
        if (!passwordValid) {
            alert("비밀번호는 8자리 이상의 숫자, 영문자, 특수문자를 포함해야 합니다.");
            passwordInput.focus(); // 비밀번호 필드로 포커스
        }
      });

     function validateForm() {
        if (!validateEmail()) {
 		return false;
 	    }
        if (!passwordValid) {
            alert("비밀번호는 8자리 이상의 숫자, 영문자, 특수문자를 포함해야 합니다.");
            passwordInput.focus(); // 비밀번호 필드로 포커스
            return false;
        }

        var passwd1 = passwordInput.value;
        var passwd2 = password2Input.value;

        if (passwd1 !== passwd2) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
        return true;
     }
   </script>
	<script>
    function validateEmail() {
	  var email1 = document.getElementById("email1").value;
	  var email2 = document.getElementById("email2").value;
			  
	  var email1Valid = /^[a-zA-Z0-9!@#$%^&*()_+{}\[\]:;<>,.?~\\-]+$/;
	  var email2Valid = /^[a-zA-Z0-9]+[.]+[a-zA-Z0-9]+$/;
			
		if (!email1Valid.test(email1)) {
			alert("이메일 주소를 다시 한 번 확인해주세요");
			 return false;
			}
			
	    if (!email2Valid.test(email2)) {
			 alert("이메일 주소를 다시 한 번 확인해주세요");
			 return false;
			}
			
	    return true;
	  }
   </script>

</body>

</html>
