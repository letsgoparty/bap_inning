<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 재설정</title>
<style>
        * {
            padding: 0;
            margin: 0;
        }

        .input-form {
            max-width: 400px;
            margin-top: 40px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
      
        html,
        body {
            height: 100%;
            background: #ffffff;
        }

        #container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
    </style>
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(document).ready(function () {
    var form = $("form.validation-form");
    var passwordInput = $("#newPasswd");
    var passwordConfirmInput = $("#newPasswd2");
    var pwcheck = $("#pwcheck");

    // 비밀번호 확인이 변경될 때 비밀번호 일치 여부 확인
    passwordConfirmInput.on("input", function () {
        var password = passwordInput.val();
        var passwordConfirm = passwordConfirmInput.val();
        var mesg = "비밀번호가 다릅니다.";

        if (password === passwordConfirm) {
            mesg = "비밀번호가 일치합니다.";
        }
        pwcheck.text(mesg);
    });

    // 폼 제출 시 비밀번호 확인을 다시 확인
    form.on("submit", function (event) {
        var password = passwordInput.val();
        var passwordConfirm = passwordConfirmInput.val();
        if (password !== passwordConfirm) {
            alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
            event.preventDefault();
        }
    });
});
</script>



</head>
<body>
<body class="text-center">
<jsp:include page="../common/nav.jsp" flush="true"/> 
    <div class="container">
        <div class="input-form-backgroud row">
            <form action="resetpwd" method="post" class="validation-form" novalidate>
                <div class="input-form col-md-12 mx-auto">
                    <h4 class="mb-3">비밀번호 재설정</h4>
                     <p>안전을 위해 비밀번호를 다시 설정해주세요.</p>
                       <div id="inputBox">
                        <div class="input-form-box mb-4"><span style="text-align: left; display: block;">비밀번호 </span>
                            <input type="password" name="newPasswd" id="newPasswd" class="form-control" autocomplete="off" required
                            placeholder="8자리 이상 숫자, 영문자, 특문" required>
                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                        <div class="input-form-box mb-4"><span style="text-align: left; display: block;">비밀번호 확인</span>
                            <input type="password" id="newPasswd2" class="form-control" required>
                        <div class="invalid-feedback">비밀번호를 한번 더 입력해주세요.</div>
                        </div>
                        <div class="button-login-box">
                            <button type="submit" class="btn btn-primary btn-xs" style="width:100%">변경하기</button>
                              
                               
                            
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
   

<script>
     var passwordInput = document.getElementById('newPasswd');
     var password2Input = document.getElementById('newPasswd2');
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
     }
   </script>


		
</body>
</html>