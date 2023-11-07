<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 화면</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
<link href="css/review.css" rel="stylesheet" />
</head>

<body style="background-color:rgba(248, 249, 250) !important;">
	<jsp:include page="../common/nav.jsp" flush="true" />

	<form id="myform" name="reviewUpdate" method="POST" action="#">
		    <input type="hidden" name="review_id" value="${reviewRetrieve.review_id}"> 
		    <input type="hidden" name="rating" value="${reviewRetrieve.rating}"> 
		    <input type="hidden" name="review_content" value="${reviewRetrieve.review_content}"> 
		    
	<div class="myform">
			<div class="container">
		 		<form name="rating" id="rating" value="${reviewDTO.rating}">
			    <fieldset style="text-align: center">
					  <legend style="font-family: 'KBO-Dia-Gothic_bold'">별점을 선택해주세요</legend>
			        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
			        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
			        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
			        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
			        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
			     </fieldset>
		 		</form>
			</div>
		
			<div class="container">
				<textarea class="col-auto form-control" type="text" id="review_content" name="review_content"
						  style="font-family: 'KBO-Dia-Gothic_light'" 
						  placeholder="직관팬이 작성하는 진짜 리뷰" required>${reviewRetrieve.review_content}</textarea>
			</div>
		
		<!-- 이미지 업로드 -->
		<div class="myform">
				<div>
					<p>리뷰 사진을 등록해주세요</p>
					<div class="input_wrap">
						<a href="javascript:" onclick="fileUploadAction()" class="my_button">사진 선택</a>
						<input type="file" id="input_imgs" name="file" multiple />
					</div>
				</div>
		
				<div>
					<div class="imgs_wrap">
						<img id="img" />
					</div>
				</div>
		
				<button class="my_button" id="uploadButton">업로드</button>
		</div>
		<!-- 이미지 업로드 -->
			
			<div class="d-grid gap-2 col-6 mx-auto" style="font-family: 'KBO-Dia-Gothic_bold'">
			  <button class="btn btn-primary" type="submit" onclick="showConfirmation()">수정</button>
			  <button class="btn btn-primary" type="button" onclick="cancel()">취소</button>
			</div>
			
		</div>
	</form>	


<script type="text/javascript">
	function showConfirmation() {
	    alert("수정이 완료되었습니다.");
	    window.location.href = "r_reviewList";
	  }
	function cancel(){
		var shouldCancel = confirm("작성 중인 리뷰가 있습니다. 저장하지 않고 나가시겠습니까?");
		if (shouldCancel) {
			location.href = document.referrer;
		}
	}
</script>
</body>
</html>
