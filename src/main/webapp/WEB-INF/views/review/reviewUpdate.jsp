<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
<link href="css/review.css" rel="stylesheet" />
</head>

<body style="background-color:rgba(248, 249, 250) !important;">
	<jsp:include page="../common/nav.jsp" flush="true" />

	<form id="myform" action="reviewUpdate" method="POST">
	   	<input type="hidden" name="res_id" value="${reviewRetrieve.res_id}">
 	  	<input type="hidden" name="review_id" value="${reviewRetrieve.review_id}"> 
<%-- 				<input type="text" name="res_id" value="${reviewDTO.res_id}">
		    <input type="text" name="review_id" value="${reviewUpdate.review_id}"> 
		    <input type="hidden" name="rating" value="${reviewUpdate.rating}"> 
		    <input type="hidden" name="review_content" value="${reviewUpdate.review_content}"> 
 --%>		    
	<div class="myform">
			<div class="container">
		 		<div name="rating" id="rating" value="${reviewRetrieve.rating}">
			    <fieldset style="text-align: center">
					  <legend style="font-family: 'KBO-Dia-Gothic_bold'">별점을 선택해주세요</legend>
		        <input type="radio" name="rating" value="5" id="rate5" required><label for="rate5">⭐</label>
		        <input type="radio" name="rating" value="4" id="rate4" required><label for="rate4">⭐</label>
		        <input type="radio" name="rating" value="3" id="rate3" required><label for="rate3">⭐</label>
		        <input type="radio" name="rating" value="2" id="rate2" required><label for="rate2">⭐</label>
		        <input type="radio" name="rating" value="1" id="rate1" required><label for="rate1">⭐</label>
		     </fieldset>
		 		</div>
			</div>
		
			<div class="container" style="display: flex; flex-direction: column;">
				<textarea class="col-auto form-control" type="text" id="review_content" name="review_content"
						  style="font-family: 'KBO-Dia-Gothic_light'" 
						  placeholder="직관팬이 작성하는 진짜 리뷰" required>${reviewUpdate.review_content}</textarea>
				<p id="charCount" style="color: gray; font-size: 14px;">0/400</p>
			</div>
		
		<!-- 이미지 업로드 -->

		<c:choose>
		    <c:when test="${!empty urls}">
				  <div class="imgs_wrap">
		        <c:forEach var="url" items="${urls}">
		            <div style="text-align:center; display: inline-block;">
		            	 <a href="#" onclick="openModal('${url}')">
		                <img id="img" class="mb-2" src="${url}" alt="이미지">
		               </a>
		            </div>
		        </c:forEach>
						<div id="myModal" class="modal">
						    <span class="close" onclick="closeModal()">&times;</span>
						    <img id="modalImg" src="" alt="모달 이미지">
						</div>
					</div>
		    </c:when>
		</c:choose>		
		<div>
			<div class="input_wrap" style="display: flex; flex-direction: column;">
				<div>
					<a href="javascript:" onclick="fileUploadAction()" class="btn btn-primary">사진 선택</a>
					<input type="file" id="input_imgs" name="file" multiple />
					<button class="btn btn-primary" id="uploadButton">첨부하기</button>
				</div>
			</div>
			<div>
				<div class="imgs_wrap">
				</div>
					<img id="img" />
			</div>
		<!-- 이미지 업로드 -->
			
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button class="btn btn-primary" type="submit" id="registerBtn">리뷰 등록</button>
			  <button class="btn btn-primary" type="button" onclick="cancel()">취소</button>
			</div>

		</div>
		</div>
	</form>	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
/* 	function showConfirmation() {
	    alert("수정이 완료되었습니다.");	
	    window.location.href = "r_reviewList";
	  }
	 */
	function cancel() {
		var shouldCancel = confirm("작성 중인 리뷰가 있습니다. 저장하지 않고 나가시겠습니까?");
		if (shouldCancel) {
			window.location.href = document.referrer;
		}
	}
		
		//이미지 업로드
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
			  	event.preventDefault();
		      // 이미지가 저장된 formData를 사용하여 AJAX 요청
		      const formData = window.uploadFormData;
		
		      if (formData && sel_files.length <= 3) {
		          $.ajax({
		              url: "uploadAction",
		              type: "POST",
		              data: formData,
		              processData: false,
		              contentType: false,
		              success: function(response) {
		                  // 업로드가 성공한 경우, review_id를 등록 form에 넘어갈 데이터로 지정 
											$("#review_id").val(response);
		                  console.error("파일 업로드 성공");
		                  Swal.fire({
		                      title: '파일 업로드 성공',
		                      text: '사진이 등록되었습니다. 리뷰 작성을 완료해주세요.',
		                      icon: 'success',
		                      confirmButtonText: '확인'
		                    });
		              },
		              error: function() {
		                  // 업로드가 실패한 경우
		                  console.error("파일 업로드 실패");
		              }
		          });
		      } else {
		          // 파일을 선택하지 않거나 3개 초과한 경우 경고 메시지 표시
		          alert("파일을 선택해주세요. 최대 3개까지만 업로드 가능합니다.");
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
		//이미지 업로드 끝

		//리뷰 글자수 제한
	  var textarea = document.getElementById('review_content');
	  var charCount = document.getElementById('charCount');

	  textarea.addEventListener('input', function () {
	    var currentLength = textarea.value.length;
	    var maxLength = parseInt(textarea.getAttribute('maxlength'));
	    
	    if (currentLength > maxLength) {
	      textarea.value = textarea.value.substring(0, maxLength);
	      currentLength = maxLength;
	    }

	    charCount.textContent = currentLength + '/' + maxLength;
	  });
	  
</script>

</body>
</html>
