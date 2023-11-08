<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="css/review.css" rel="stylesheet" />

<form id="myform" name="reviewUpdate" method="get" action="#">
	    <input type="hidden" name="review_id" value="${reviewRetrieve.review_id}"> 
	    <input type="hidden" name="rating" value="${reviewRetrieve.rating}"> 
	    <input type="hidden" name="review_content" value="${reviewRetrieve.review_content}"> 
	    
<div class="myform">
		<div class="container">
 	 		<form name="rating" id="rating" method="post" value="${reviewRetrieve.rating}">
		    <fieldset style="text-align: center">
				  <legend style="font-family: 'KBO-Dia-Gothic_bold'">별점</legend>
		        <input type="radio" name="rating" value="1" id="rate1" disabled><label for="rate1">⭐</label>
		        <input type="radio" name="rating" value="2" id="rate2" disabled><label for="rate2">⭐</label>
		        <input type="radio" name="rating" value="3" id="rate3" disabled><label for="rate3">⭐</label>
		        <input type="radio" name="rating" value="4" id="rate4" disabled><label for="rate4">⭐</label>
		        <input type="radio" name="rating" value="5" id="rate5" disabled><label for="rate5">⭐</label>
		     </fieldset>
 	 		</form>
		</div>
		<div style="float: right">
			<span>${reviewRetrieve.user_id}</span> &nbsp;
			<span>${reviewRetrieve.created_date}</span>	&nbsp;
			<span>추천수: ${reviewRetrieve.like_cnt}</span>
		</div>
		<div class="container">
			<textarea class="col-auto form-control" type="text" id="review_content" name="review_content"
					  style="font-family: 'KBO-Dia-Gothic_light'" 
					  placeholder="${reviewRetrieve.review_content}" readonly></textarea>
		</div>

		<c:choose>
		    <c:when test="${not empty urls}">
				    <div class="imgs_wrap">
		        <c:forEach var="url" items="${urls}">
		            <div style="text-align:center; display: inline-block;">
		            	 <a href="#" onclick="showImage('${url}')">
		                <img id="img" class="mb-2" src="${url}"alt="이미지">
		               </a>
		            </div>
		        </c:forEach>
						</div>
		    </c:when>
		</c:choose>
		
			***추후 수정 - 수정, 삭제버튼: 로그인 후 내 글일 경우에만 보이기 
			<div class="d-grid gap-2 col-6 mx-auto" style="font-family: 'KBO-Dia-Gothic_bold'">
			  <button class="btn btn-primary" type="submit">수정</button>
			  <button class="btn btn-primary" type="button" onclick="del()">삭제</button>
			  <button class="btn btn-primary" type="button" onclick="cancel()">목록보기</button>
			</div>
		
	</div>
</form>	


<script type="text/javascript">
	function del(){
		var shouldDel = confirm("리뷰를 삭제하시겠습니까?");
		if (shouldDel) {
			//삭제
		}
	}
	function cancel(){
			window.location.href = "r_reviewList?res_id=" + res_id;
	}
</script>
