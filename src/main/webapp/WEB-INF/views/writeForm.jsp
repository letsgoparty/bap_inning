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
</style>
<script type="text/javascript">
	function go_list() {
		location.href = "list";
	}
</script>
</head>
<body>
	<jsp:include page="common/nav.jsp" flush="true" />
	<div class="container mt-5">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-10 mx-auto">
				<form class="form-horizontal" action="write" method="post">
					<div class="form-group">
						<div class="col-sm-14">
						</div>
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