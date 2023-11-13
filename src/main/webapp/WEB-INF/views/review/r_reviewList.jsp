<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 리뷰</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
<link href="css/review.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../common/nav.jsp" flush="true" />
	
	<div class="container">
		<form action="reviewWrite" method="get">
	   	<input type="hidden" name="res_id" value="${param.res_id}">
	 		<h2 class="text-center">리뷰 목록 (${pageDTO.totalCount}개)</h2><br>
	 		
	<c:choose>
		<c:when test="${!empty pageDTO.list}">
	<!-- 		<select name="" class="form-select" aria-label="Default select example" style="float: right; width: 140px">
			  <option selected>-- 정렬 --</option>
						<option value="recent">최신순</option>
						<option value="liked">추천순</option>
						<option value="ratingDesc">별점 높은 순</option>
						<option value="ratingAsc">별점 낮은 순	</option>
			</select>
			<div class="form-check form-switch" style="float: right;">
			  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			  <label class="form-check-label" for="flexSwitchCheckDefault">사진리뷰만 보기 </label>
			</div>		
	 -->
		<table class="table table-striped">
			<thead>
				<tr>
					<th>리뷰번호</th>
					<th colspan="2">내용</th>
					<th></th>
	 				<th>리뷰이미지</th>
					<th>작성자</th>
					<th>별점</th>
					<th>작성일</th>
					<th>추천</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="pageDTO" value="${pageDTO}" />
			<c:forEach var="dto" items="${pageDTO.list}">
				<tr>
					<td>${dto.review_id}</td>
					<td colspan="2">${dto.review_content}</td>
					<td><a href="reviewRetrieve?review_id=${dto.review_id}">더보기</a></td>
					<td>
					<c:forEach var="urlDTO" items="${allURLs}">
						<c:if test="${urlDTO.review_id eq dto.review_id}">
						  <c:forEach var="url" items="${urlDTO.urls}" varStatus="status">
						    <img class="mb-2" src="${url}" alt="이미지" style="height:90px; height:90px; object-fit: cover; border-radius: 5px;">
						  </c:forEach>
						</c:if>
					</c:forEach>
					</td>
					<td>${dto.nickname}</td>
		    	<td><c:forEach var="i" begin="1" end="${dto.rating}">⭐</c:forEach></td>
					<td>
						<c:choose>
						    <c:when test="${dto.created_date eq dto.modified_date}">
						       ${dto.created_date}
						    </c:when>
						    <c:otherwise>
						       ${dto.modified_date} (수정됨)
						    </c:otherwise>
						</c:choose>					
					</td>
					
					<td><a href="res_like_cnt?review_id=${dto.review_id}" class="btn btn-primary">
						<img src="images/icon/thumb2_icon.png" width=20 height=20> ${dto.like_cnt}</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
			
			<!--  page 번호 출력 -->
		  <c:set var="res_id" value="${param.res_id}" />
		  <c:set var="perPage" value="${pageDTO.perPage}" />
		  <c:set var="curPage" value="${pageDTO.curPage}" />
		  <c:set var="totalCount" value="${pageDTO.totalCount}" />
		  <c:set var="totalNum" value="${totalCount / perPage}" />
		  <c:if test="${totalCount%perPage != 0}">
		    <c:set var="totalNum" value="${totalNum+1}" />
		  </c:if>
		   <tr>
		    <td colspan="9">
					<nav aria-label="...">
					  <ul class="pagination pagination-sm justify-content-center">
					  	<c:forEach var="i" begin="1" end="${totalNum}" >
					   		<c:if test="${curPage==i}">
							    <li class="page-item active" aria-current="page">
						      	<span class="page-link">${i}</span>
					    		</li>
					     	</c:if>
							 	<c:if test="${curPage!=i}">
					  		  <li class="page-item"><a class="page-link" href="r_reviewList?res_id=${res_id}&curPage=${i}">${i}</a></li>
					    	</c:if>
							</c:forEach>
					  </ul>
					</nav>
		    </td>
		  </tr>
		  <!--  page 번호 출력 --> 
		</table>
		  
		</c:when>
		<c:otherwise>
			<div class="container" style="text-align:center; font-size:20px; font-family: 'KBO-Dia-Gothic_light'">
				<br><br>🥲<br>
				아직 등록된 리뷰가 없어요.<br>
				첫번째 리뷰를 작성해 보세요!<br><br><br>
			</div>
		</c:otherwise>
	</c:choose>
	
			<div class="container">
				<button type="submit" class="btn btn-primary">리뷰작성</button>
			</div>
		</form>
	</div>

</body>
</html>