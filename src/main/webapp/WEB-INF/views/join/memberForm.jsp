<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면</title>

    <!-- Bootstrap CSS -->

    <style>
        .input-form {
            max-width: 680px;
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            // 비밀번호 일치 여부 확인
            $("#passwd2").on("keyup", function () {
                var passwd = $("#passwd").val();
                var passwd2 = $("#passwd2").val();
                var mesg = "비밀번호가 다릅니다";

                if (passwd == passwd2) {
                    mesg = "비밀번호가 일치합니다";
                }

                $("#pwcheck").text(mesg);
            });

            // 아이디 중복체크
            $("#idcheck").on("click", function () {
                // submit 비활성
                event.preventDefault();
                // AJAX 연동
                $.ajax({
                    type: "get",
                    url: " ",
                    data: {
                        userid: $("#userid").val()
                    },
                    dataType: 'text',
                    success: function (data, status, xhr) {
                        console.log(data);
                        $("#result").text(data);
                    },
                    error: function (xhr, status, error) {
                        console.log("error 발생");
                    }
                });
            });

            $("#emailDomain").change(function () {
                var selectedDomain = $(this).val();
                $("#email2").val(selectedDomain);
            });
        });
    </script>
</head>

<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h3 class="mb-3">회원가입</h3>
                <form action="" method="" class="validation-form" novalidate onsubmit="return validateForm()">

                    <label for="userid">아이디</label> <span style="color: red" id="result"></span>
                    <div class="row">
                        <div class="col-md-9 mb-3">
                            <input type="text" class="form-control" name="userid" id="userid" required
                                autocomplete="off">
                            <div class="invalid-feedback">아이디를 입력해주세요.</div>
                        </div>
                        <div class="col-md-3">
                            <button type="button" id="idcheck" class="btn btn-primary"
                                style="height: 2.3rem;">중복확인</button>
                            <br>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="passwd">비밀번호</label>
                            <input type="password" class="form-control" name="passwd" id="passwd" required>
                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="passwd2">비밀번호 확인</label> &nbsp; <strong><span style="color: green"
                                    id="pwcheck"></span></strong> <input type="password" class="form-control"
                                id="passwd2" required>
                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                    </div>



                    <div class="mb-3">
                        <label for="username">닉네임</label>
                        <input type="text" class="form-control" id="username" name="username" required
                            autocomplete="off">
                        <div class="invalid-feedback">닉네임을 입력해주세요.</div>
                    </div>


                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email1" name="email1" autocomplete="off"
                                required>
                            <div class="invalid-feedback">이메일을 입력해주세요.</div>
                        </div>
                        <div class="col-md-4 mb-3 ">
                            <label for="email"></label>
                            <input type="text" class="form-control" id="email2" name="email2" placeholder="직접입력"
                                required>
                            <div class="invalid-feedback"></div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="email"></label>
                            <select id="emailDomain" class="form-select">
                                <option value="">--직접입력--</option>
                                <option value="daum.net">daum.net</option>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="myTeam">나의 팀</label>
                            <select name="myTeam" class="form-select" id="myTeam" style="width:120%">
                                <option value="0">---해당없음---</option>
                                <option value="1">SSG 랜더스</option>
                                <option value="2">키움 히어로즈</option>
                                <option value="3">LG 트윈스</option>
                                <option value="4">KT wiz</option>
                                <option value="4">KIA 타이거즈</option>
                                <option value="6">NC 다이노스</option>
                                <option value="7">삼성 라이온즈</option>
                                <option value="8">롯데 자이언츠</option>
                                <option value="9">두산 베어스</option>
                                <option value="10">한화 이글스</option>
                            </select>
                        </div>
                    </div>
       

            <hr class="mb-4">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="aggrement" required> <label
                    class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
            </div>
            <div class="mb-4"></div>

            <div style="text-align: center;">
                <button class="btn btn-primary" type="submit">회원가입</button>
                <button class="btn btn-primary" type="reset" style="text-align: center;">취소</button>
            </div>

            </form>
        </div>
    </div>
    </div>
    <script>
        window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');

            Array.prototype.filter.call(forms, (form) => {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    </script>
    <script>
        function validateForm() {
            var passwd1 = document.getElementById("passwd").value;
            var passwd2 = document.getElementById("passwd2").value;

            if (passwd1 !== passwd2) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }
            return true;
        }
    </script>
</body>

</html>