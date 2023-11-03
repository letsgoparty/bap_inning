 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		$(".deleteBtn").on("click", function() {
		    var num = $(this).attr("data-num");
		    location.href = "reviewDelete?num=" + review_id;
		}); // end deleteBtn
		
	};

</script>

<script type="text/javascript">

	document.getElementById("writeBtn").addEventListener("click", function() {
	    // 선택한 res_id 가져오기
	    const res_id = document.getElementById("res_id").value;

	    // res_id를 사용하여 리뷰 작성 페이지로 이동
	    window.location.href = "reviewWrite?res_id=${res_id}";
	});
	

	function reviewDelete(){
		var shouldDelete = confirm("리뷰를 삭제하시겠습니까?");
		if (shouldDelete) {
		    // AJAX 요청을 사용하여 서버에 리뷰 삭제 요청
		    $.ajax({
		      url: "reviewDelete",
		      method: "GET",
		      data: { num: review_id },
		      success: function(data) {
		        // 삭제 요청이 성공시
		        location.href="reviewDelete?num="+num;
		        alert("리뷰가 삭제되었습니다.");
		      },
		      error: function(xhr, status, error) {
		        // 삭제 요청이 실패시
		        console.error("삭제 요청 실패:", error);
		      }
		    });
	}

</script>

<div class="container">
	<form action="reviewWrite" method="get">
   	<input type="hidden" name="res_id" value="${param.res_id}">
		<h2 class="text-center">임시 음식점 리뷰 목록</h2>
		
		<select id="orderby" onchange="sortOptions(this)">		
			<option value="recent">최신순</option>
			<option value="ratingDesc">별점 높은 순	</option>
			<option value="ratingAsc">별점 낮은 순	</option>
		</select>
		
		    <script>
        function sortOptions(selectElement) {
            var options = Array.from(selectElement.options);

            options.sort(function (a, b) {
                // 정렬 로직 추가
                
                return a.text.localeCompare(b.text);
            });

            // 정렬된 옵션을 <select> 요소에 추가
            options.forEach(function (option) {
                selectElement.appendChild(option);
            });
        }
    </script>
    
		<input type="checkbox">사진리뷰만 보기
		
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
					<td>${reviewDTO.review_content}</td>
					<td>이미지추가</td>
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
					<td>${reviewDTO.like_cnt}</td>
					<td>${reviewDTO.modified_date}</td>
					<td><a href="reviewRetrieve?review_id=${reviewDTO.review_id}">수정</a></td>
					<td><button onclick="reviewDelete()">삭제</button></td>
					<td><input type="button" value="삭제" class="deleteBtn" data-num="${reviewDTO.review_id}"/></td>
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
    	  <a href="r_reviewList?curPage=${i}">${i}</a>
    	</c:if>
    </c:forEach>
     </td>
  </tr>
  <!--  page 번호 출력 --> 
		</table>
		<button type="submit" id="writeBtn">리뷰작성</button>
	</form>
</div>
