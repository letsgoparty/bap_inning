<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴 성공</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		 Swal.fire({
 	        text: "회원탈퇴에 성공하였습니다.",
 	        icon: 'success',
 	        confirmButtonColor: '#3085d6',
 	        button: {
 	            text: '확인',
 	            closeModal: true 
 	        }
		 }).then(() => {
		            window.location.href = 'main'; 

		    });
	});
</script>
</head>
   
<body class="text-center">
<jsp:include page="../common/nav.jsp" flush="true" />

</body>

</html>