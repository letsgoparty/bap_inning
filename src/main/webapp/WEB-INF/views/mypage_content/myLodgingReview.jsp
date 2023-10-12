<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가쓴글_숙소리뷰</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style type="text/css">
  .table td, .table th {
    white-space: nowrap; /* 줄 바꿈 금지 */
    overflow: hidden;
    text-overflow: ellipsis; /* 길 경우 ... 으로 표시 */
    max-width:200px
  }
</style>	

</head>
<body>
	<h1>마이페이지_내가 쓴 글_숙소리뷰</h1>

<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio1">게시글</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2">댓글</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio3">식당리뷰</label>
  
  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio4">숙소리뷰</label>
</div>
<br>
<table class="table">
  <thead>
    <tr>
      <th scope="col" style="width: 40px;">식당이름</th>
      <th scope="col" style="width: 200px;">내용</th>
      <th scope="col" style="width: 100px;">작성자</th>
      <th scope="col" style="width: 100px;">날짜</th>
      <th scope="col" style="width: 100px;">좋아요</th>
      <th scope="col" style="width: 100px;">삭제</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>안녕</td>
      <td>박명수</td>
      <td>23.10.12</td>
      <td>0</td>
      <td><button type="button">삭제</button></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>@fat</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry the Bird 는 트윗트윗짹쨱  어쩌구어쩌구어쩌구 블라블라</td>
      <td>@twitter</td>
      <td>@twitter</td>
      <td>@twitter</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>