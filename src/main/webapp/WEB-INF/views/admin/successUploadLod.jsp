<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		 Swal.fire({
 	        text: "등록이 완료되었습니다.",
 	        icon: 'success',
 	        confirmButtonColor: '#3085d6',
 	        button: {
 	            text: '확인',
 	            closeModal: true 
 	        }
		 }).then(() => {
			    window.location.href = '../admin/lod'; 
		 });
	});
</script>
</head>
   
<body class="text-center">

</body>

</html>