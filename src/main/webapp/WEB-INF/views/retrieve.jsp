<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기 화면</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	function go_list(){
		location.href="list";
	}
</script>	
</head>
<body>
	<div class="container">
		<form class="form-horizontal" action="update" method="post">
			<div class="form-group">
				<div class="col-sm-10" >
						<img src="image/multicampus.png">
						<h2 class="text-center">공지사항 자세히 보기 화면</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">글번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="board_num" value="${retrieve.board_num}" readonly="readonly">
				</div>
				<label for="title" class="col-sm-2 control-label">조회수</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="board_num" value="${retrieve.count}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title" value="${retrieve.title}" >
				</div>
			</div>
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="username" value="${retrieve.username}">
				</div>
			</div>
			<div class="form-group">
				<label for="text" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="text">${retrieve.text}</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">글수정</button>
					<input type="button" value="목록" class="btn btn-default" onclick="go_list()">
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>