<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 화면</title>
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
<jsp:include page="../common/nav.jsp" flush="true" />
    <div class="container">
        <div class="input-form-backgroud row">
            <form action="sendEmail" method="get" class="validation-form" novalidate>
                <div class="input-form col-md-12 mx-auto">
                    <h4 class="mb-4">비밀번호 찾기</h4>
                    <div id="inputBox">
                        <div class="input-form-box mb-3">
                        <span class="mb-3" style="text-align: left; display: block;">이메일을 입력해주세요.</span>
                            <input type="text" name="email" class="form-control" autocomplete="off" required>
                        </div>
                         <div class="button-login-box">
                            <button type="submit" class="btn btn-primary btn-xs" style="width:100%">확인</button></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>