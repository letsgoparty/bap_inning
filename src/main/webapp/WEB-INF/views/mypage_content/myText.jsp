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
  <c:set var="perPage" value="${pageDTO.perPage}"/>
  <c:set var="curPage" value="${pageDTO.curPage}"/>
  <c:set var="totalCount" value="${pageDTO.totalCount}"/>
  <c:set var="totalNum" value="${totalCount/perPage}"/>
  <c:if test="${totalCount%perPage!=0}">
  	<c:set var="totalNum" value="${totalNum+1}"/>
  </c:if>
  <tr>
  	<td colspan="6">
  		<c:forEach var="i" begin="1" end="${totalNum}">
  			<c:if test="${curPage==i}">${i}</c:if>
  			<c:if test="${curPage!=i}"><a href="mytext?curPage=${i}">${i}</a></c:if>
  		</c:forEach>
  	</td>
  </tr>
  
  
</table>
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


</body>
</html>