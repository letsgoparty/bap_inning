<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
	
	    <style>
        .input-form {
            max-width: 600px;
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

	
</head>
<body>
	<jsp:include page="../common/nav.jsp" flush="true"/> 

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-5 mx-auto">
				<h3>탈퇴하기</h3>
				<form action="user_delete" method="post">
				
					<span>탈퇴하려면 비밀번호를 입력하세요</span>
					<div class="input-group my-3">
						<span class="input-group-text col-4" >비밀번호</span> 
						<input
							type="password" class="form-control" required id="currpw"
							name="currpw" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>
                <button class="btn btn-primary" style="width:30%" id="change" >탈퇴하기</button>
            </div>
            </form>
            
			</div>
		</div>
	</div>
</body>
</html>