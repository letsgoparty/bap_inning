<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 화면</title>
</head>
<style>
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
	font-weight: 700;
	font-style: normal;
}
@font-face {
	font-family: 'KBO-Dia-Gothic_light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_light.woff')
		format('woff');
	font-weight: 300;
	font-style: normal;
}
.myform{
	   width: 70%;
	   margin: 3% auto; /* 수평 가운데 정렬을 위한 마진 설정 */
	   height: auto;
	   padding: 50px;
	   box-sizing: border-box;
	   border: solid 1.5px #D3D3D3;
	   border-radius: 5px;
	   background-color: rgba(255, 255, 255, 0.5);
	   resize: none;
}
.container {
  display: flex;
  justify-content: center; /* 수평 가운데 정렬 */
  align-items: center; /* 수직 가운데 정렬 */
}
#rating fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 1px; /* 필드셋 테두리 제거 */
    direction: rtl; /* 이모지 순서 반전 */    
}
#rating input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#rating input[type=radio]:checked ~ label{
    color: activeborder; /* 마우스 클릭 체크 */
}
#rating label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#rating label:hover,
#rating label:hover ~ label{ /* 마우스 호버 뒤에오는 이모지들 */
    color: activeborder;
}
#review_content {
	   width: 80%;
	   margin: 0 auto; /* 수평 가운데 정렬을 위한 마진 설정 */
	   height: 150px;
	   padding: 10px;
	   box-sizing: border-box;
	   border: solid 1.5px #D3D3D3;
	   border-radius: 5px;
	   font-size: 16px;
	   resize: none;
}
</style>

<body>
<div class="myform">
	<form action="reviewWrite" method="post">
	
		<div class="container">
	 		<form name="rating" id="rating" method="post" action="./save">
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
					  placeholder="직관팬이 작성하는 진짜 리뷰"></textarea>
		</div>
	
		<!-- 이미지 업로드 -->
 		추후 수정 예정
		<div>
			<form action="upload" method="post" enctype="multipart/form-data">
				리뷰사진을 올려주세요 <br>
				<input type="file" name="theFile"><br>
				<input type="submit" value="업로드">
			</form>
		</div>
		<!-- 이미지 업로드 -->
		
		<div class="d-grid gap-2 col-6 mx-auto" style="font-family: 'KBO-Dia-Gothic_bold'">
		  <button class="btn btn-primary" type="submit" onclick="showConfirmation()">등록</button>
		  <button class="btn btn-primary" type="button" onclick="cancel()">취소</button>
		</div>
		
	</form>	
</div>


<script type="text/javascript">
	function showConfirmation() {
	    alert("등록이 완료되었습니다.");
	    window.location.href = "r_reviewList";
	  }
	function cancel(){
		var shouldCancel = confirm("작성 중인 리뷰가 있습니다. 저장하지 않고 나가시겠습니까?");
		if (shouldCancel) {
			location.href = "r_reviewList";
		}
	}
</script>

</body>
</html>