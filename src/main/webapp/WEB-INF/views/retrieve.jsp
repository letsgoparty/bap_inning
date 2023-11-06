<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기 화면</title>
<style>
.gray-font, #team {
	color: rgb(143, 143, 143);
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
	<div class="container mt-4 board">
		<form class="form-horizontal" action="updateForm" method="post">
		<input type="text" name="title" value="${retrieve.title}">
		<input type="text" name="team_code" value="${retrieve.team_code}">
		<input type="text" name="text" value="${retrieve.text}">
		<input type="text" name="text" value="${retrieve.text}">dd
		<input type="text" name="text" value="${retrieve.text}">dd2
			<div class="form-group">
				<div>
					<p>
						<c:choose>
							<c:when test="${retrieve.team_code eq 0}">
								<span id="team">기타</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 1}">
								<span id="team">SSG</span>
							</c:when>
							<c:when test="${retrieve.team_code eq '2'}">
								<span id="team">키움</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 3}">
								<span id="team">LG</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 4}">
								<span id="team">KT</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 5}">
								<span id="team">KIA</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 6}">
								<span id="team">NC</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 7}">
								<span id="team">삼성</span>
							</c:when>
							<c:when test="${dto.team_code eq 8}">
								<span id="team">롯데</span>
							</c:when>
							<c:when test="${dto.team_code eq 9}">
								<span id="team">두산</span>
							</c:when>
							<c:when test="${retrieve.team_code eq 10}">
								<span id="team">한화</span>
							</c:when>
						</c:choose>
					</p>
					<h2>${retrieve.title}</h2>
					<c:choose>
						<c:when test="${myTeam eq 0}">
							<img src="images/logo/noTeam.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 1}">
							<img src="images/logo/SSG.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 2}">
							<img src="images/logo/키움.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 3}">
							<img src="images/logo/LG.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 4}">
							<img src="images/logo/KT.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 5}">
							<img src="images/logo/KIA.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 6}">
							<img src="images/logo/NC.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 7}">
							<img src="images/logo/삼성.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 8}">
							<img src="images/logo/롯데.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 9}">
							<img src="images/logo/두산.png" width="35" height="30">
						</c:when>
						<c:when test="${myTeam eq 10}">
							<img src="images/logo/한화.png" width="35" height="30">
						</c:when>
					</c:choose>
					<span> ${retrieve.userid}</span> &nbsp; <span class="gray-font">2023.10.25</span>
					&nbsp; <span class="gray-font">조회수: ${retrieve.count}</span>
					<hr>
				</div>
			</div>
			<div class="form-group">
				<div class="mb-4">
					<textarea class="form-control" rows="10"
						style="border: none; background-color: rgba(248, 249, 250, 0.5);" name="text">${retrieve.text}</textarea>
				</div>
			</div>
			<div class="form-group">
				<div>
					<button type="submit" class="btn btn-primary">글수정</button>
					<input type="button" value="목록" class="btn btn-primary"
						onclick="go_list()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>