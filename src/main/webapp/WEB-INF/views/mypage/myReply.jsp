<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가쓴글_댓글</title>
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
            max-width: 800px;
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

<script>
$(document).ready(function(){
	
	//전체선택
	$("#allCheck").click(function(){
		var allChecked=!$(this).data("allChecked");
		$(this).data("allChecked",allChecked);
		
		$(".check").prop("checked",allChecked);
		
		if(allChecked){
			$(this).text("전체 해제");			
		}else{
			$(this).text("전체 선택");
		}
	});
	
	//선택항목 삭제
	$("#deleteAll").click(function(){
		//확인 대화상자 띄워서 삭제여부 확인
		var confirmed= confirm("정말 삭제하시겠습니까?");
		
		//사용자가 확인 선택시에만 삭제 진행
		if(confirmed){
			var checkedValues=[];
			//선택된 체크박스 가져오기
			$(".check:checked").each(function(){
				checkedValues.push($(this).val());
			});
			
			$.ajax({
				url:"deleteAll_myreply",
				method:"get",
				data:{check: checkedValues},
				success:function(data){
					if(data==="로그인이 필요합니다"){
						alert(data);
						window.location.href="/app/loginForm";
					}else{
						window.location.href="/app/myreply";
					}
				},
				error:function(error){
                	alert("에러 발생");
                    console.error('error: ', error);
                    window.location.href="/app/myreply";
				}
				
			});//end ajax
			
		}//endif
		
	});//end 선택항목삭제

	
});
</script>

</head>
<body>
	<jsp:include page="../common/nav.jsp" flush="true"/> 
	 <div class="container">
  <div class="input-form-background row">
   <div class="input-form col-md-8 mx-auto">


	<h3>내 활동_댓글</h3>

		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
		  <label class="btn btn-outline-primary" for="btnradio1">내 게시글</label>
		
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked>
		  <label class="btn btn-outline-primary" for="btnradio2">내 댓글</label>
		
<!-- 		  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
		  <label class="btn btn-outline-primary" for="btnradio3">식당리뷰</label>
		  
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
		  <label class="btn btn-outline-primary" for="btnradio4">숙소리뷰</label> -->
		</div>
		
		
<div class="body_top pt-3" style="display:flex; justify-content: space-between; align-items: center;">
		<div>
		<select name="amount" id="amount">
			<option value="10">--페이지 선택--</option>
			<option value="10">10개 보기</option>
			<option value="20">20개 보기</option>
			<option value="50">50개 보기</option>
			<option value="100">100개 보기</option>
		</select>
	</div>
				<div>
					<button class="btn btn-primary" id="allCheck">전체 선택</button>
					<button class="btn btn-primary" id="deleteAll">선택항목 삭제</button>
				</div>
</div>

	
	
<br>
<div class="table-responsive">
<table class="table">
  <thead>
    <tr>
      <th scope="col" style="width: 40px;">글번호</th>
      <th scope="col" style="width: 200px;">내용</th>
    <!--   <th scope="col" style="width: 100px;">작성자</th> -->
      <th scope="col" style="width: 100px;">작성일</th>
      <th scope="col" style="width: 100px;">삭제</th>
    </tr>
  </thead>
  <tbody>

    <c:forEach var="reply" items="${pageDTO.list}">
    
    <tr>
      <td scope="row"><input type="checkbox" class="check" name="check" value="${reply.reviews_num}"> </td>
      <td><a href="retrieve?no=${reply.board_num}">${reply.text}</a></td>
<%--       <td>${reply.userid}</td> --%>
      <td>${reply.replyDate}</td>
      <td><a href="javascript:void(0);" onclick="confirmDelete(${reply.reviews_num},${pageDTO.curPage},${pageDTO.amount})">삭제</a></td>

    </tr>
    
    </c:forEach>

  </tbody>

  
</table>

  				 <!-- 페이지 번호 -->
								<div class="pagination">
									<ul class="pagination">

										<!-- 페이지네이션 -->

										<li
											class="page-item ${pageDTO.curPage == 1 ? 'disabled' : ''}">
											<a class="page-link"
											href="myreply?curPage=1&amount=${pageDTO.amount}">&laquo;</a>
										</li>

										<li class="page-item ${pageDTO.prev ? '' : 'disabled'}">
											<a class="page-link"
											href="myreply?curPage=${pageDTO.startPage-1}&amount=${pageDTO.amount}">&lsaquo;</a>
										</li>


										<c:forEach var="num" begin="${pageDTO.startPage}"
											end="${pageDTO.endPage}">
											<li
												class="page-item ${num == pageDTO.curPage ? 'active' : ''}">
												<a class="page-link"
												href="myreply?curPage=${num}&amount=${pageDTO.amount}">${num}</a>
											</li>
										</c:forEach>


										<li class="page-item ${pageDTO.next ? '' : 'disabled'}">
											<a class="page-link"
											href="myreply?curPage=${pageDTO.endPage+1}&amount=${pageDTO.amount}">&rsaquo;</a>
										</li>


										<li
											class="page-item ${pageDTO.curPage == pageDTO.realEnd ? 'disabled' : ''}">
											<a class="page-link"
											href="myreply?curPage=${pageDTO.realEnd}&amount=${pageDTO.amount}">&raquo;</a>
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
	"mytext",//게시글
	"myreply",//댓글
/* 	"my_r_review",//식당리뷰
	"my_l_review"//숙소리뷰 */
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
	function confirmDelete(reviews_num,curPage,amount){
		var confirmation=confirm("댓글을 삭제하시겠습니까?");
		if(confirmation){
			//확인 눌렀을때 진짜 삭제하기
			window.location.href="delete_myreply?no="+reviews_num+ "&curPage=" + curPage + "&amount=" + amount;
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