<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

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
	        max-width: 560px; 
	        margin-top: 40px;
	        padding: 32px;
	        background: #fff;
	        border-radius: 10px;
	        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
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
	

       
</head>
   
<body class="text-center">
<jsp:include page="../common/nav.jsp" flush="true" />
<div class="container">
    <div class="input-form-backgroud row">
        <form action="codeconfirm" method="post" class="validation-form" novalidate>
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-4">본인 확인 이메일 인증</h4>
                <p style="font-size: 14px; text-align: center; margin-bottom: 20px;">전송된 이메일의 인증코드를 입력하세요.인증코드의 유효시간은 2분입니다.</p>
                <div id="inputBox">   
                    <div class="row">
                        <div class="col-md-9 mx-auto" style="margin-bottom: 10px; text-align: center;">
                            <input type="text" class="form-control" id="authCodeInput" name="verificationCode" required>
                        </div>
                        <div class="col-md-9 mx-auto" style="text-align: center; margin-bottom: 20px;">
                            <button type="submit" class="btn btn-primary" id="authCheck" style="width: 100%;">인증코드 확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

 
</body>

</html>