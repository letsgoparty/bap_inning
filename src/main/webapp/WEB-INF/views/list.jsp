<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기 화면</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$("#searchForm button").on("click", function(e) {
			if (!$("#searchForm").find("option:selected").val()) {
				alert("검색 종류를 선택하세요");
				return false;
			}
			if (!$("#searchForm").find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			e.preventDefault();
			searchForm.submit();
		});
	});
</script>
<script type="text/javascript">
	function writeui() {
		location.href = "write";
	}
</script>


</head>
<body>
	<jsp:include page="common/nav.jsp" flush="true" />
	+
	<div class="container">
		<h2 class="text-center">밥이닝 게시판</h2>

		<form action="list">
			<div class="container mt-2"
				style="font-family: 'KBO-Dia-Gothic_bold';">
				<ul class="nav list-unstyled d-flex" name="team_code">
					<li class="nav-item pt-1"><a href="list" value="1"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="all"> <img src="images/icon/baseball_icon.png"
							width="20" height="20"> 전체
					</a></li>
					<li class="nav-item mt-1"><a href="list" value="2"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="SSG"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_SK.png"
							alt="SSG"> SSG
					</a></li>
					<li class="nav-item pt-1"><a href="#kiwoom"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="키움"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_WO.png"
							alt="키움"> 키움
					</a></li>
					<li class="nav-item pt-1"><a href="#LG"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="LG"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_LG.png"
							alt="LG"> LG
					</a></li>
					<li class="nav-item pt-1"><a href="#KT"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="KT"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_KT.png"
							alt="kt"> KT
					</a></li>
					<li class="nav-item pt-1"><a href="#KIA"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="KIA"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_HT.png"
							alt="KIA"> KIA
					</a></li>
					<li class="nav-item pt-1"><a href="#NC"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="NC"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_NC.png"
							alt="NC"> NC
					</a></li>
					<li class="nav-item pt-1"><a href="#samsung"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="삼성"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_SS.png"
							alt="삼성"> 삼성
					</a></li>
					<li class="nav-item pt-1"><a href="#lotte"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="롯데"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_LT.png"
							alt="롯데"> 롯데
					</a></li>
					<li class="nav-item pt-1"><a href="#doosan"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="두산"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_OB.png"
							alt="두산"> 두산
					</a></li>
					<li class="nav-item pt-1"><a href="#hanwha"
						class="nav-link text-decoration-none text-dark table-link"
						data-target="한화"> <img
							src="//lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/emblem/regular/2023/initial_HH.png"
							alt="한화"> 한화
					</a></li>
				</ul>
			</div>
		</form>

		<form action="list" id="searchForm">
			<div class="fields">
				<div class="field">
					<div id="searchWarp">
						<select name="type">
							<option value="">검색 기준</option>
							<option value="T">제목</option>
							<option value="C">내용</option>
							<option value="W">작성자</option>
							<option value="TC">제목 또는 내용</option>
							<option value="TW">제목 도는 작성자</option>
							<option value="TCW">제목 또는 내용 또는 작성자</option>
						</select> <input type="text" name="keyword">
						<button class="btn btn-primary btn-sm">검색</button>
					</div>
				</div>
			</div>
		</form>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자명</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="pageDTO" value="${pageDTO}" />
				<c:forEach var="board" items="${pageDTO.list}">
					<tr>
						<td>${board.board_num}</td>
						<td><a href="retrieve?no=${board.board_num}">${board.title}</a></td>
						<td>${board.userid}</td>
						<td>${board.board_date}</td>
						<td>${board.count}</td>
						<td><a href="delete?no=${board.board_num}">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
			<!--  page 번호 출력 -->
			<c:set var="perPage" value="${pageDTO.perPage}" />
			<c:set var="curPage" value="${pageDTO.curPage}" />
			<c:set var="totalCount" value="${pageDTO.totalCount}" />
			<c:set var="totalNum" value="${totalCount / perPage}" />
			<c:if test="${totalCount%perPage != 0}">
				<c:set var="totalNum" value="${totalNum+1}" />
			</c:if>
			<tr>
				<td colspan="6"><c:forEach var="i" begin="1" end="${totalNum}">
						<c:if test="${curPage==i}">${i}
    				</c:if>
						<c:if test="${curPage!=i}">
							<a href="list?curPage=${i}">${i}</a>
						</c:if>
					</c:forEach></td>
			</tr>
			<!--  page 번호 출력 -->
		</table>
		<button onclick="writeui()">글쓰기</button>
	</div>

</body>
</html>