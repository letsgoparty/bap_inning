 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<div class="container">
	<form action="reviewWrite" method="get">
   	<input type="hidden" name="res_id" value="${param.res_id}">
		<h2 class="text-center">(음식점 이름 ${param.res_id})의 리뷰 목록</h2>

<c:choose>
	<c:when test="${!empty pageDTO.list}">
	
		<select name="" class="form-select" aria-label="Default select example" style="float: right; width: 140px">
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
		<c:forEach var="reviewDTO" items="${pageDTO.list}">
			<tr>
				<td>${reviewDTO.review_id}</td>
				<td colspan="2">${reviewDTO.review_content}</td>
				<td><a href="reviewRetrieve?review_id=${reviewDTO.review_id}">더보기</a></td>
				<td>
 					<c:forEach var="url" items="${urls}">
						<div style="text-align:center;">
					    <img class="mb-2" src="${url}" width="300" height="300" alt="이미지">
					   </div>
					</c:forEach>
				</td>
				<td>${reviewDTO.user_id}</td>
	      <td>
					<c:choose>
						<c:when test="${reviewDTO.rating == 1}">⭐</c:when>
						<c:when test="${reviewDTO.rating == 2}">⭐⭐</c:when>
						<c:when test="${reviewDTO.rating == 3}">⭐⭐⭐</c:when>
						<c:when test="${reviewDTO.rating == 4}">⭐⭐⭐⭐</c:when>
						<c:when test="${reviewDTO.rating == 5}">⭐⭐⭐⭐⭐</c:when>
					</c:choose>
	    	</td>
				<td>${reviewDTO.created_date}</td>
				<td><button id="like_btn" class="btn btn-primary" onclick="like()">
					<img src="images/icon/thumb1_icon.png" width=20 height=20> ${reviewDTO.like_cnt}</button></td>
				<td><button id="like_btn" class="btn btn-primary">
					<img src="images/icon/thumb2_icon.png" width=20 height=20> 12</button></td>
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
	    <td colspan="10">
	    <c:forEach var="i" begin="1" end="${totalNum}" >
	    	<c:if test="${curPage==i}">
	    	   ${i}
	    	</c:if>
	    	<c:if test="${curPage!=i}">
	    	  <a href="r_reviewList?res_id=${res_id}&curPage=${i}">${i}</a>
	    	</c:if>
	    </c:forEach>
	     </td>
	  </tr>
	  <!--  page 번호 출력 --> 
	</table>
	  
	</c:when>
	<c:otherwise>
		<div class="container" style="text-align:center; font-size:20px; font-family: 'KBO-Dia-Gothic_light'">
			<br><br>🥲<br>
			아직 등록된 리뷰가 없어요.<br>
			${param.res_id}의 첫번째 리뷰를 작성해 보세요!<br><br><br>
		</div>
	</c:otherwise>
</c:choose>
		<button type="submit" class="btn btn-primary">리뷰작성</button>
	</form>
</div>
