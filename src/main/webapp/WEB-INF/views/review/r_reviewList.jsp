<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 음식점 리뷰 목록</title>
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
	function writeui(){
		location.href="write";
	}
</script>
</head>
<body>
	<div class="container">
						<h2 class="text-center">임시 음식점 리뷰 목록</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>리뷰번호</th>
					<th>내용</th>
					<th>리뷰이미지</th>
					<th>작성자</th>
					<th>별점</th>
					<th>추천</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="pageDTO" value="${pageDTO}" />
			<c:forEach var="reviewDTO" items="${pageDTO.list}">
				<tr>
					<td>${reviewDTO.review_id}</td>
					<td><a href="retrieve?no=${reviewDTO.review_id}">${reviewDTO.review_content}</a></td>
					<td>이미지추가</td>
					<td>${reviewDTO.user_id}</td>
					<td>${reviewDTO.rating}</td>
					<td>${reviewDTO.like_cnt}</td>
					<td>${reviewDTO.modified_date}</td>
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
    <td colspan="6">
    <c:forEach var="i" begin="1" end="${totalNum}" >
    	<c:if test="${curPage==i}">
    	   ${i}
    	</c:if>
    	<c:if test="${curPage!=i}">
    	  <a href="list?curPage=${i}">${i}</a>
    	</c:if>
    </c:forEach>
     </td>
  </tr>
  <!--  page 번호 출력 --> 
		</table>
		<button onclick="writeui()">글쓰기</button>
	</div>

</body>
</html>