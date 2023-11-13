<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

a {
	text-decoration: none;
}

input[type=file] {
	display: none;
}

.imgs_wrap {
	border: 1px solid #d4d4d4;
	margin-top: 30px;
	margin-bottom: 30px;
	margin: 3% auto;
	padding-top: 10px;
	padding-bottom: 10px;
	border-radius: 10px;
	max-width: 980px;
}

.imgs_wrap img {
	max-width: 150px;
	margin-left: 10px;
	margin-right: 10px;
}
</style>
<script type="text/javascript">
	function go_list() {
		location.href = "list";
	}
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
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
					url : "uploadImage",
					type : "POST",
					data : formData,
					processData : false,
					contentType : false,
					success : function(response) {
						// 업로드가 성공한 경우, review_id를 등록 form에 넘어갈 데이터로 지정 
						$("#board_num").val(response);
						Swal.fire({
							title : '파일 업로드 성공',
							text : '사진이 등록되었습니다. 게시글 작성을 완료해주세요.',
							icon : 'success',
							confirmButtonText : '확인'
						});
					},
					error : function() {
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
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("이미지 파일만 선택 가능합니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='" + f.name + "' class='selProductFile' title='Click to remove'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);

		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}
</script>
</head>
<body>
	<jsp:include page="common/nav.jsp" flush="true" />
	<div class="container mt-5">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-10 mx-auto">
				<form class="form-horizontal" action="write" method="post">
					<input type="hidden" id="board_num" name="board_num">
					<div class="form-group">
						<div class="col-sm-14"></div>
					</div>
					<div class="row">
						<div class="col-md-3 my-3 ms-5">
							<label for="team_code">카테고리</label> <select name="team_code"
								class="form-select mt-2" style="width: 180%">
								<option value="0" selected>---해당없음---</option>
								<option value="1">SSG 랜더스</option>
								<option value="2">키움 히어로즈</option>
								<option value="3">LG 트윈스</option>
								<option value="4">KT wiz</option>
								<option value="5">KIA 타이거즈</option>
								<option value="6">NC 다이노스</option>
								<option value="7">삼성 라이온즈</option>
								<option value="8">롯데 자이언츠</option>
								<option value="9">두산 베어스</option>
								<option value="10">한화 이글스</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10 ms-5">
							제목 <input type="text" class="form-control mt-2" name="title"
								placeholder="제목을 입력하세요..">
						</div>
					</div>

					<div class="form-group">

						<div class="col-sm-10 ms-5 my-3">
							내용
							<textarea class="form-control mt-2" rows="7" name="text"></textarea>
						</div>
						<div>
							<div class="input_wrap ms-5 mt-4"
								style="display: flex; flex-direction: column;">
								<div>
									<a href="javascript:" onclick="fileUploadAction()"
										class="btn btn-primary">사진 선택</a> <input type="file"
										id="input_imgs" name="file" multiple />
									<button class="btn btn-primary" id="uploadButton">첨부하기</button>
								</div>
							</div>
							<div>
								<div class="imgs_wrap"></div>
								<img id="img" />
							</div>
						</div>
					</div>
					<div class="form-group ms-5 my-3">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary mx-2">저장</button>
							<input type="button" value="목록" class="btn btn-primary"
								onclick="go_list()">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>