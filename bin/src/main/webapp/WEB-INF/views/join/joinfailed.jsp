<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>환영합니다</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		 Swal.fire({
 	        text: "죄송합니다. 이미 사용 중인 이메일 주소이거나 아이디 혹은 닉네임 중복 여부를 확인하시거나 닉네임 길이를 다시 확인해주시기 바랍니다 (닉네임 한글 20자 이상 입력 불가)",
 	        icon: 'error',
 	        confirmButtonColor: '#3085d6',
 	        button: {
 	            text: '확인',
 	            closeModal: true 
 	        }
		 }).then(() => {
			    window.location.href = 'memberForm'; 
		 });
	});
</script>
</head>
   
<body class="text-center">
<jsp:include page="../common/nav.jsp" flush="true" />

</body>

</html>