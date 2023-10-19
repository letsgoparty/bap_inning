<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>

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
</head>

<body class="text-center">

    <div class="container">
        <div class="input-form-backgroud row">
            <form action="loginsubmit" method="get" class="validation-form" novalidate>
                <div class="input-form col-md-12 mx-auto">
                    <h4 class="mb-3">로그인</h4>
                    <div id="inputBox">
                        <div class="input-form-box mb-3"><span style="text-align: left; display: block;">아이디 </span>
                            <input type="text" name="userid" class="form-control" autocomplete="off" required>
                            <div class="invalid-feedback">아이디를 입력해주세요.</div>
                        </div>
                        <div class="input-form-box mb-3"><span style="text-align: left; display: block;">비밀번호 </span>
                            <input type="password" name="password" class="form-control" required>
                        <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                        <div class="button-login-box">
                            <button type="submit" class="btn btn-primary btn-xs" style="width:100%">로그인</button>
                        </div>
                    </div>
                </div>
            </form>
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
</body>

</html>