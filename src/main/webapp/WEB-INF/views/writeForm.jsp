<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기 화면</title>

<script type="text/javascript">
	function go_list() {
		location.href = "list";
	}
</script>
</head>
<body>
<jsp:include page="common/nav.jsp" flush="true" />
	<div class="container">
		<form class="form-horizontal" action="write" method="post">
			<div class="form-group">
				<div class="col-sm-10">
					<img src="image/multicampus.png">
					<h2 class="text-center">공지사항 글쓰기 화면</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title"
						placeholder="title">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 mb-3">
					<label for="team_code">나의 팀</label> 
					<select name="team_code"
						class="form-select"  style="width: 120%">
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
				<label for="text" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="text"></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">저장</button>
					<input type="button" value="목록" class="btn btn-default"
						onclick="go_list()">
				</div>
			</div>
		</form>

	</div>
</body>
</html>