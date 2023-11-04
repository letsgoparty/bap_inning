<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가쓴글_게시글</title>
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
</style>	

</head>
<body>
 <div class="container">
  <div class="input-form-background row">
   <div class="input-form col-md-12 mx-auto">


	<h1>마이페이지_내가 쓴 글_게시글</h1>

<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio1">게시글</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2">댓글</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio3">식당리뷰</label>
  
  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio4">숙소리뷰</label>
</div>

<div>
        <select name="amount" id="amount">
          <option value="10">--페이지 선택--</option>
          <option value="10">10개 보기</option>
          <option value="2">2개 보기</option>
          <option value="5">5개 보기</option>
          <option value="100">100개 보기</option>
        </select>
</div>

<br>
<div class="table-responsive">
<table class="table">
  <thead>
    <tr>
      <th scope="col" style="width: 40px;">글번호</th>
      <th scope="col" style="width: 200px;">제목</th>
      <th scope="col" style="width: 100px;">작성자</th>
      <th scope="col" style="width: 100px;">작성일</th>
      <th scope="col" style="width: 100px;">조회수</th>
      <th scope="col" style="width: 100px;">삭제</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="board" items="${pageDTO.list}">
    <tr>
      <th scope="row">${board.board_num}</th>
      <td><a href="retrieve?no=${board.board_num}">${board.title}</a></td>
      <td>${board.userid}</td>
      <td>${board.board_date}</td>
      <td>${board.count}</td>
      <td><a href="delete_mytext?no=${board.board_num}">삭제</a></td>
    </tr>
    </c:forEach>

  </tbody>
  <!-- 페이지 번호 -->

  
  
<tr>
    <td colspan="6">
      <div class="pagination">
        <ul class="pagination">
        
        <!-- 페이지네이션 -->
			
			<li class="page-item ${pageDTO.curPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="mytext?curPage=1&amount=${pageDTO.amount}">&laquo;</a>
			</li>
			
			<li class="page-item ${pageDTO.prev ? '' : 'disabled'}">
				<a class="page-link" href="mytext?curPage=${pageDTO.startPage-1}&amount=${pageDTO.amount}">&lsaquo;</a>
			</li>
			
			
 			<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
				<li class="page-item ${num == pageDTO.curPage ? 'active' : ''}">
					<a class="page-link" href="mytext?curPage=${num}&amount=${pageDTO.amount}">${num}</a>
				</li>
			</c:forEach>

			
			<li class="page-item ${pageDTO.next ? '' : 'disabled'}">
				<a class="page-link" href="mytext?curPage=${pageDTO.endPage+1}&amount=${pageDTO.amount}">&rsaquo;</a>
			</li>
			
			
			<li class="page-item ${pageDTO.curPage == pageDTO.realEnd ? 'disabled' : ''}">
				<a class="page-link" href="mytext?curPage=${pageDTO.realEnd}&amount=${pageDTO.amount}">&raquo;</a>
			</li>
			
			
			

        <!-- 페이지네이션 -->


        </ul>
      </div>
    </td>
  </tr></table>
</div>
   </div>
  </div>
 </div>

<script type="text/javascript">
const radioButton=document.querySelectorAll(".btn-check");
const link=[
	"mytext",//게시글
	"myreply",//댓글
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
//페이징에서 게시글amount 드롭다운변경이벤트
  $(document).ready(function() {
    $("#amount").on("change", function() {
      var selectedAmount = $(this).val();
      var currentUrl = window.location.href;
      var newUrl = updateUrlParameter(currentUrl, "amount", selectedAmount);
      window.location.href = newUrl;
    });

    
    function updateUrlParameter(url, param, paramValue) {
    //지금 준열에서 특정 매개변수 찾기
      var re = new RegExp("([?&])" + param + "=.*?(&|$)", "i");
    //다른매개변수 있는지확인하고 그거에따라서 &? 뭘줄지 선택
      var separator = url.indexOf("?") !== -1 ? "&" : "?";
    //매개변수가 있다면
      if (url.match(re)) {
    	  //url업데이트
        return url.replace(re, "$1" + param + "=" + paramValue + "$2");
      } else {
    	  //매개변수없다면 새로 추가하고 반환
        return url + separator + param + "=" + paramValue;
      }
    }
  });
</script>

</body>
</html>