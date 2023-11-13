<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<style>
.gray-font, #team {
	color: rgb(143, 143, 143);
}

a {
	text-decoration: none !important;
}
</style>
<script type="text/javascript">
	function go_list() {
		location.href = "list";
	}
	function reply_delete() {
		alert(${list.reivews_num});
		
	}
</script>
</head>
<body>
	<jsp:include page="common/nav.jsp" flush="true" />
	<div class="container mt-4 board">
		<form class="form-horizontal" action="update" method="post">
			<div class="form-group">
				<div>
				<input type="hidden" name="board_num" value="${board.board_num}">
				<input type="hidden" name="userid" value="${board.userid}">
					<label for="team_code">카테고리</label> 
					<select name="team_code" class="form-select mt-2" style="width: 100%">
						<option value="0">---해당없음---</option>
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
					<p>현재 팀 : 
					<c:choose>
							<c:when test="${board.team_code eq 0}">
								<span id="team">기타</span>
							</c:when>
							<c:when test="${board.team_code eq 1}">
								<span id="team">SSG</span>
							</c:when>
							<c:when test="${board.team_code eq '2'}">
								<span id="team">키움</span>
							</c:when>
							<c:when test="${board.team_code eq 3}">
								<span id="team">LG</span>
							</c:when>
							<c:when test="${board.team_code eq 4}">
								<span id="team">KT</span>
							</c:when>
							<c:when test="${board.team_code eq 5}">
								<span id="team">KIA</span>
							</c:when>
							<c:when test="${board.team_code eq 6}">
								<span id="team">NC</span>
							</c:when>
							<c:when test="${board.team_code eq 7}">
								<span id="team">삼성</span>
							</c:when>
							<c:when test="${board.team_code eq 8}">
								<span id="team">롯데</span>
							</c:when>
							<c:when test="${board.team_code eq 9}">
								<span id="team">두산</span>
							</c:when>
							<c:when test="${board.team_code eq 10}">
								<span id="team">한화</span>
							</c:when>
						</c:choose>
						
					</p>
					<h2>
						<input type="text" name="title" value="${board.title}">
					</h2>

					<span> <c:choose>
							<c:when test="${team == 1}">
								<img src="images/logo/SSG.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 2}">
								<img src="images/logo/키움.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 3}">
								<img src="images/logo/LG.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 4}">
								<img src="images/logo/KT.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 5}">
								<img src="images/logo/KIA.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 6}">
								<img src="images/logo/NC.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 7}">
								<img src="images/logo/삼성.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 8}">
								<img src="images/logo/롯데.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 9}">
								<img src="images/logo/두산.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 10}">
								<img src="images/logo/한화.png" width=auto height="30">
							</c:when>
							<c:when test="${team == 0}">
								<img src="images/logo/noTeam.png" width=auto height="30">
							</c:when>
						</c:choose> ${board.userid}
					</span> &nbsp; <span class="gray-font"></span> &nbsp; <span
						class="gray-font"></span> <a href="retrieve?no=${board.board_num}" class="mx-1">취소</a>
					<hr>
				</div>
			</div>
			<div class="form-group">
				<div class="mb-4">
					<textarea class="form-control" rows="10"
						style="border: none; background-color: rgba(248, 249, 250, 0.5);"
						name="text">${board.text}</textarea>
				</div>
				<button type="submit" class="btn btn-primary mx-2">저장</button>
				<button type="button" class="btn btn-primary" onclick="go_list()">목록</button>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>