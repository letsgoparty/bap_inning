<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가쓴글_식당리뷰</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">

  .table td, .table th {
    white-space: nowrap; /* 줄 바꿈 금지 */
    overflow: hidden;
    text-overflow: ellipsis; /* 길 경우 ... 으로 표시 */
    max-width:200px
  }
  
          .input-form {
            min-width:800px;
            margin-top: 80px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
        
  .pagination{
   display:flex;
   justify-content:center;
  }     
        
</style>

	
</head>
<body>
	<jsp:include page="../common/nav.jsp" flush="true"/> 
	


 <div class="container">
  <div class="input-form-background row">
   <div class="input-form col-md-8 mx-auto">


	<h3>내 활동_식당리뷰</h3>	
	
<div class="body_top" style="display:flex; justify-content: space-between; align-items: center;">

<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
<!--   <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio1">게시글</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2">댓글</label> -->

  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio3">식당리뷰</label>
  
  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio4">숙소리뷰</label>
</div>
					<div>
						<select name="amount" id="amount">
							<option value="10">--페이지 선택--</option>
							<option value="10">10개 보기</option>
							<option value="20">20개 보기</option>
							<option value="50">50개 보기</option>
						</select>

					</div>
				</div>

<br>
<div class="table-responsive">
<table class="table">
  <thead>
    <tr>
      <th scope="col" style="width: 40px;">식당이름</th>
      <th scope="col" style="width: 200px;">내용</th>
      <th scope="col" style="width: 100px;">이미지</th>      
<!--       <th scope="col" style="width: 100px;">작성자</th> -->
      <th scope="col" style="width: 100px;">별점</th>
      <th scope="col" style="width: 100px;">추천</th>
      <th scope="col" style="width: 100px;">수정</th>
      <th scope="col" style="width: 100px;">삭제</th>
    </tr>
  </thead>
  <tbody>
  	<c:choose>
  		<c:when test="${not empty pageDTO.list}">
		    <c:forEach var="review" items="${pageDTO.list}">
		    <tr>
		      <th hidden data-res-id="${review.res_id}">${review.res_id}</th>
		      <th scope="row" >${review.res_name}</th>
		      <td>${review.review_content}</td>
		      <td>이미지</td>
		<%--       <td>${review.user_id}</td> --%>
		      <td>
		      	<c:choose>
		      		<c:when test="${review.rating == 1}">⭐</c:when>
		      		<c:when test="${review.rating == 2}">⭐⭐</c:when>
		      		<c:when test="${review.rating == 3}">⭐⭐⭐</c:when>
		      		<c:when test="${review.rating == 4}">⭐⭐⭐⭐</c:when>
		      		<c:when test="${review.rating == 5}">⭐⭐⭐⭐⭐</c:when>
		      	</c:choose>
		      </td>
		      <td>${review.like_cnt}</td>
		      <td><a href="reviewRetrieve?review_id=${review.review_id}">수정</a></td>
		      <td><a href="javascript:void(0);" onclick="confirmDelete(${review.review_id},${pageDTO.curPage},${pageDTO.amount})">삭제</a></td>
		    </tr>
		    </c:forEach>
  		
  		</c:when>
  		<c:otherwise>
  			<tr>
  				<td colspan="7" style="text-align:center;">아직 작성한 리뷰가 없습니다</td>
  			</tr>
  		</c:otherwise>
  	</c:choose>
  
  
  </tbody>
  
 
</table>
  <!-- 페이지 번호 -->
			<div class="pagination">
				<ul class="pagination">

					<!-- 페이지네이션 -->

					<li
						class="page-item ${pageDTO.curPage == 1 ? 'disabled' : ''}">
						<a class="page-link"
						href="my_r_review?curPage=1&amount=${pageDTO.amount}">&laquo;</a>
					</li>

					<li class="page-item ${pageDTO.prev ? '' : 'disabled'}">
						<a class="page-link"
						href="my_r_review?curPage=${pageDTO.startPage-1}&amount=${pageDTO.amount}">&lsaquo;</a>
					</li>


					<c:forEach var="num" begin="${pageDTO.startPage}"
						end="${pageDTO.endPage}">
						<li
							class="page-item ${num == pageDTO.curPage ? 'active' : ''}">
							<a class="page-link"
							href="my_r_review?curPage=${num}&amount=${pageDTO.amount}">${num}</a>
						</li>
					</c:forEach>


					<li class="page-item ${pageDTO.next ? '' : 'disabled'}">
						<a class="page-link"
						href="my_r_review?curPage=${pageDTO.endPage+1}&amount=${pageDTO.amount}">&rsaquo;</a>
					</li>


					<li
						class="page-item ${pageDTO.curPage == pageDTO.realEnd ? 'disabled' : ''}">
						<a class="page-link"
						href="my_r_review?curPage=${pageDTO.realEnd}&amount=${pageDTO.amount}">&raquo;</a>
					</li>




					<!-- 페이지네이션 -->
					</ul>
			</div>
 <!-- 페이지 번호 -->
</div>
   </div>
  </div>
 </div>

<script type="text/javascript">
const radioButton=document.querySelectorAll(".btn-check");
const link=[
/* 	"mytext",//게시글
	"myreply",//댓글 */
	"my_r_review",//식당리뷰
	"my_l_review"//숙소리뷰
];
for (let i=0;i<radioButton.length;i++){
	radioButton[i].addEventListener("change",function(){
		if(this.checked){
			window.location.href=link[i];
		}
	});
}
</script>

	<script>
	//삭제 눌렀을때 팝업으로 확인하기
	function confirmDelete(review_id,curPage,amount){
		var confirmation=confirm("리뷰를 삭제하시겠습니까?");
		if(confirmation){
			//확인 눌렀을때 진짜 삭제하기
			window.location.href="delete_my_r_review?num="+review_id+ "&curPage=" + curPage + "&amount=" + amount;
		}
	}
	</script>

	<script>
		//페이징에서 게시글amount 드롭다운변경이벤트
		$(document)
				.ready(
						function() {
							$("#amount").on(
									"change",
									function() {
										var selectedAmount = $(this).val();
										var currentUrl = window.location.href;
										var newUrl = updateUrlParameter(
												currentUrl, "amount",
												selectedAmount);
										window.location.href = newUrl;
									});

							function updateUrlParameter(url, param, paramValue) {
								//지금 준열에서 특정 매개변수 찾기
								var re = new RegExp("([?&])" + param
										+ "=.*?(&|$)", "i");
								//다른매개변수 있는지확인하고 그거에따라서 &? 뭘줄지 선택
								var separator = url.indexOf("?") !== -1 ? "&"
										: "?";
								//매개변수가 있다면
								if (url.match(re)) {
									//url업데이트
									return url.replace(re, "$1" + param + "="
											+ paramValue + "$2");
								} else {
									//매개변수없다면 새로 추가하고 반환
									return url + separator + param + "="
											+ paramValue;
								}
							}
						});
	</script>


</body>
</html>