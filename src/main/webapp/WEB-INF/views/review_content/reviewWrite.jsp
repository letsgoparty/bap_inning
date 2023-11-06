<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

input[type=file] {
    display: none;
}

.my_button {
    display: inline-block;
    width: 200px;
    text-align: center;
    padding: 10px;
    background-color: #006BCC;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
}

.imgs_wrap {
    border: 2px solid #A8A8A8;
    margin-top: 30px;
    margin-bottom: 30px;
    margin: 3% auto;
    padding-top: 10px;
    padding-bottom: 10px;

}
.imgs_wrap img {
    max-width: 150px;
    margin-left: 10px;
    margin-right: 10px;
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	
	//이미지 정보들을 담을 배열
	var sel_files = [];
	
	$(document).ready(function() {
	  $("#input_imgs").on("change", handleImgFileSelect);
	  
	  const fileInput = $("#input_imgs");
	
	  const uploadButton = $("#uploadButton");
	
	fileInput.change(function() {
	  // 선택한 파일을 FormData 객체에 추가
	  const selectedFiles = fileInput[0].files;
	  if (selectedFiles.length > 0) {
	      const formData = new FormData();
	      for (let i = 0; i < selectedFiles.length; i++) {
	          formData.append("file", selectedFiles[i]);
	      }
	      // formData를 전역 변수로 설정
	      window.uploadFormData = formData;
	  }
	});
	
	  // 업로드 버튼 클릭 시
	  uploadButton.click(function() {
	      // 이미지가 저장된 formData를 사용하여 AJAX 요청
	      const formData = window.uploadFormData;
	
	      if (formData) {
	          $.ajax({
	              url: "uploadAction",
	              type: "POST",
	              data: formData,
	              processData: false,
	              contentType: false,
	              success: function(response) {
	                  // 업로드가 성공한 경우, review_id를 등록 form에 넘어갈 데이터로 지정 
											$("#review_id").val(response);
	              },
	              error: function() {
	                  // 업로드가 실패한 경우
	                  console.error("파일 업로드 실패");
	              }
	          });
	      } else {
	          // 파일을 선택하지 않은 경우 경고 메시지 표시
	          alert("파일을 선택해주세요.");
	      }
	  });
	}); 
	
	function fileUploadAction() {
	  console.log("fileUploadAction");
	  $("#input_imgs").trigger('click');
	}
	
	function handleImgFileSelect(e) {
	  // 이미지 정보들을 초기화
	  sel_files = [];
	  $(".imgs_wrap").empty();
	
	  var files = e.target.files;
	  var filesArr = Array.prototype.slice.call(files);
	
	  var index = 0;
	  filesArr.forEach(function(f) {
	      if(!f.type.match("image.*")) {
	          alert("이미지 파일만 선택 가능합니다.");
	          return;
	      }
	
	      sel_files.push(f);
	
	      var reader = new FileReader();
	      reader.onload = function(e) {
	          var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
	          $(".imgs_wrap").append(html);
	          index++;
	
	      }
	      reader.readAsDataURL(f);
	      
	  });
	}
	
	function deleteImageAction(index) {
	  console.log("index : "+index);
	  console.log("sel length : "+sel_files.length);
	
	  sel_files.splice(index, 1);
	
	  var img_id = "#img_id_"+index;
	  $(img_id).remove(); 
	}
	
</script>

<div class="myform">
	<form action="reviewWrite" method="post">
	<input type="hidden" id="review_id" name="review_id">
	<input type="hidden" id="res_id" name="res_id" value="${res_id}">
 		<div class="container">
		    <fieldset style="text-align: center">
				  <legend style="font-family: 'KBO-Dia-Gothic_bold'">별점을 선택해주세요</legend>
		        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
		        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
		        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
		        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
		        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
		     </fieldset>
		</div>

		<div class="container">
			<textarea class="col-auto form-control" type="text" id="review_content" name="review_content"
					  style="font-family: 'KBO-Dia-Gothic_light'" 
					  placeholder="직관팬이 작성하는 진짜 리뷰" required></textarea>
		</div>
			
		<div class="d-grid gap-2 col-6 mx-auto" style="font-family: 'KBO-Dia-Gothic_bold'">
		  <button class="btn btn-primary" type="submit" id="registerBtn">등록</button>
		  <button class="btn btn-primary" type="button" onclick="cancel()">취소</button>
		</div>
		
	</form>	
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

