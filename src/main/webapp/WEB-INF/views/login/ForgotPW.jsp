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
        <form action="sendEmail" method="get" class="validation-form" novalidate>
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-4">본인 확인 이메일 인증</h4>
                <div id="inputBox">
                    <div class="input-form-box mb-3 row">
		                        <div class="col-md-9 mx-auto" style="margin-bottom: 10px; text-align: center;">
		                            <span style="text-align: center; display: block;">인증코드를 받을 이메일을 입력해주세요</span>
		                            <p></p>
		                            <input type="text" name="email" id="email" class="form-control" autocomplete="off" required>
		                        </div>
		                        <div class="col-md-9 mx-auto" style="text-align: center; margin-bottom: 20px;">
		                            <button type="submit" class="btn btn-primary" id="authBtn" style="width: 100%;">인증코드 전송</button>
		                        </div>
		                         
                    </div>
                </div>
            </div>
        </form>
        
    </div>
</div>

 
</body>

</html>