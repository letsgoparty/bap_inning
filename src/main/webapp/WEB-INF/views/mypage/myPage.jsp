<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="images/icon/favicon-32x32.png">
	 
<style>
.input-form {
	max-width: 800px; 
	min-width: 500px; 
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
.myinfo{
padding:30px;
border-radius:10px;
border:1px solid #DDDDDD;
padding-bottom:40px;
}
span {
    display: block;
    text-align: right;
}

.profile-img{
width:50px;
height:50px; 
margin-bottom:10px; 
object-fin:cover;  
border-radius: 50%;
}
</style> 
	 


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script>
//나의 팀 드롭다운이 선택되어있게끔
$(document).ready(function(){
	var userTeamCode=document.getElementById("user_team_code").textContent;
	//select요소에 해당하는거 선택
	$("#myTeam").val(userTeamCode);
	 
/* 		//이메일도메인 변경시 자동입력
	$("#emailDomain").change(function() {
		var selectedDomain = $("#emailDomain").val();
		$("#email2").val(selectedDomain);
	}); */	
	
	//인풋활성화 와 정보수정하기
	$('#editBtn').click(function(){
		//버튼 이름따라 js로 함수줄거임.
			enableEdit(); //인풋박스활성화
			document.getElementById("submitBtn").disabled=false;
			document.getElementById("editBtn").disabled=true;
			
	});

	// 닉네임 중복검사
	$("#nicknameCheck").on("click", function () {
	  event.preventDefault();

	  var newNickname = $("#nickname").val();	  
	  var currNickname = $("#user_currNickname").val();

	  $.ajax({
	    type: "get",
	    url: "mypageNicknameCheck",
	    data: {
	      nickname: newNickname,
	      currNickname: currNickname
	    },
	    dataType: "text",
	    success: function (data, status, xhr) {
	      console.log(data);
	      $("#nicknameResult").text(data);
	      
	      //닉네임 전달
	      $("#newNickname").val(newNickname);
	      //중복확인 버튼 클릭시 닉네임 인풋 비활성화
	      if(data=="닉네임 중복"){
	      	$("#nickname").prop("disabled",false);	    	  
	      }else if(data=="닉네임을 입력해주세요"){
	    	  $("#nickname").prop("disabled",false);
	      }else{
	      	$("#nickname").prop("disabled",true);	    	  
	      }
	      
	      
	    },
	    error: function (xhr, status, error) {
	      console.log("error 발생");
	    }
	  });
	  
	});

	 
});
function enableEdit() {
	// 인풋박스 활성화
	var editableInput = document.querySelectorAll(".form-control");
	for (var i = 0; i < editableInput.length; i++) {
		editableInput[i].disabled = false;
	}
	var editableSelect = document.querySelectorAll(".form-select");
	for (var i = 0; i < editableSelect.length; i++) {
		editableSelect[i].disabled = false;
	}
	document.getElementById("nicknameCheck").disabled=false;
	document.getElementById("userid").disabled="true";
	document.getElementById("email1").disabled="true";
	document.getElementById("email2").disabled="true";
	
	
};
/* function disableEdit() {
	//인풋박스 비활성화
	var editableInput = document.querySelectorAll(".form-control");
	for (var i = 0; i < editableInput.length; i++) {
		editableInput[i].disabled = true;
	}
	var editableSelect = document.querySelectorAll(".form-select");
	for (var i = 0; i < editableSelect.length; i++) {
		editableSelect[i].disabled = true;
	}
	document.getElementById("userid").disabled="true";
	
}; */

</script>


</head>
<body>
	<jsp:include page="../common/nav.jsp" flush="true"/> 
	
	
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-6 mx-auto">
				
				<h3 class="mb-3">마이페이지</h3>
<span id="user_team_code" hidden>${user.team_code}</span>
<input id="user_currNickname" hidden value="${user.nickname}" disabled="disabled"/>
				
				<div class="myinfo">
				<h5 class="mb-3">내 정보</h5>
				<form action="myinfo" method="post" onsubmit="return validateSubmit();"> <!-- onsubmit="return validateEmail()" -->
				
				<!-- 프로필 이미지 변경 -->
				<%-- <div style="display: flex; align-items: center;">
					<div>
						<c:choose>
						    <c:when test="${empty user.profileimgurl}">
						        <img alt="프로필사진" src="images/icon/profile.png" class="profile-img" id="previewImage">
						    </c:when>
						    <c:otherwise>
						        <img alt="프로필사진" src="${user.profileimgurl}" class="profile-img" id="previewImage">
						    </c:otherwise>
						</c:choose>
					</div>
					<div>&nbsp;
						<button class="btn btn-primary" type="button" id="changeProfileImg" data-toggle="modal" data-target="#uploadModal">사진 변경</button>
					</div>
				</div>
					<!-- 이미지 업로드 모달 -->
					<div class="modal" id="uploadModal" tabindex="-1" role="dialog"aria-labelledby="uploadModalLabel" aria-hidden="true">
												    <div class="modal-dialog" role="document">
						        <div class="modal-content">
						            <div class="modal-header">
						                <h5 class="modal-title" id="uploadModalLabel">프로필 이미지 업로드</h5>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span>
						                </button>
						            </div>
						            <div class="modal-body">
						                <input type="file" id="profileImage" accept="image/*" class="form-control">
						            </div>
						            <div class="modal-footer">
						                <button type="button" class="btn btn-secondary" data-dismiss="modal">업로드</button>
						              
						            </div>
						        </div>
						    </div>
					 </div>
 --%>
				<!-- 프로필 이미지 변경 -->
				
				<input type="hidden" name="userid" value="${user.userid}">
					<div>
					<span style="color: red" id="result"></span>
					<div class="input-group">
						<span class="input-group-text" id="useridLabel">아이디</span> <input
							type="text" class="form-control" disabled readonly required value="${user.userid}"
							id="userid" name="userid" autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">

					</div>
					</div>

					<div class="input-group mb-3 mt-3">
						<span class="input-group-text" id="emailLabel">이메일</span> 
						<input type="text" class="form-control" readonly  disabled required id="email1"
							name="email1" value="${user.email.split('@')[0]}"  autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default"> <span
							class="input-group-text" id="emailDomainLabel">@</span> <input
							type="text" class="form-control" readonly disabled required id="email2"
							name="email2" value="${user.email.split('@')[1]}"  autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default"> 
<!-- 						<select
							class="form-select" id="emailDomain" disabled>
							<option value="">--직접입력--</option>
							<option value="daum.net">daum.net</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
						</select> -->
					</div>
	
				<div class="input-group mt-3">

						<span class="input-group-text rounded-left" id="nicknameLabel">닉네임</span> 

						<input
							type="text" class="form-control rounded-right" disabled required id="nickname"
							name="nickname" value="${user.nickname}"  autocomplete="off" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">&nbsp;
					<div class="input-group-append">					
							<button type="button" id="nicknameCheck" class="btn btn-primary" disabled="disabled">중복확인</button>
					</div>
				</div>	
				<span style="color: red" id="nicknameResult"></span>

				<!-- disabled는 form에 전달이 안되어서 hidden하나 만듬 -->
				<input hidden type="text" id="newNickname" name="newNickname" value=""/>
				



					<div class="input-group mt-3 mb-3">
						<label class="input-group-text" for="inputGroupSelect01">나의팀</label>
						<select class="form-select" id="myTeam" name="myTeam" disabled>
							<option value="1">SSG 랜더스</option>
							<option value="2">키움 히어로즈</option>
							<option value="3">LG 트윈스</option>
							<option value="4">KT wiz</option>
							<option value="5">KIA 타이거즈</option>
							<option value="6">NC 다이노스</option>
							<option value="7">삼성 라이온즈</option>
							<option value="8">롯데 자이언츠</option>
							<option value="9">두산 베어스</option>
							<option value="10">한화 이글스</option>
						</select>
					</div>
					<div style="display: flex; justify-content: space-between;"
						class="mb-3">
						<button class="btn btn-primary" type="button" id="deleteUserBtn" onclick="location.href='/app/user_delete'">탈퇴하기</button>
						<div>
						<button class="btn btn-primary" type="button" id="editBtn">수정하기</button>
						<button class="btn btn-primary" type="submit" id="submitBtn" disabled>변경내용 확정</button>
						</div>
					</div>
					<div style="float: right">
						<a href="pwchange">비밀번호 변경 ></a>
					</div>
				</form>
				
				</div>

 				<br>
 				<div class="list-group">
					<a href="like" class="list-group-item list-group-item-action">❤️ 찜한 음식점/숙소 보기</a>
					<a href="myPlayer" class="list-group-item list-group-item-action">⚾ 찜한 선수</a>
					<a href="mytext" class="list-group-item list-group-item-action">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 글</a>
						
					<a href="my_r_review" class="list-group-item list-group-item-action">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의 리뷰</a>
				</div>
			</div>
		</div>
	</div>

<script>
//닉네임 중복검사 추가
function validateSubmit(){

	var nicknameResult=$("#nicknameResult");
	
	
	if(nicknameResult.text()===""){
		alert("닉네임을 변경하지 않아도 중복확인을 해주세요");
		return false;
	}
	
	if(nicknameResult.text()==="닉네임 중복"){
		alert("중복되지 않은 닉네임으로 변경해주세요");
		return false;
	}
	if(nicknameResult.text()==="닉네임을 입력해주세요"){
		alert("닉네임을 입력해주세요");
		return false;
	}

	
	
	return true;
}

</script>

</body>
</html>