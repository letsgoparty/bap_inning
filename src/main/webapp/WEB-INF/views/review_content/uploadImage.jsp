<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

input[type=file] {
    display: none;
}

.my_button {
    display: inline-block;
    width: 200px;
    text-align: center;
    padding: 10px;
    background-color: #006BCC;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
}

.imgs_wrap {
    border: 2px solid #A8A8A8;
    margin-top: 30px;
    margin-bottom: 30px;
    margin: 3% auto;
    padding-top: 10px;
    padding-bottom: 10px;

}
.imgs_wrap img {
    max-width: 150px;
    margin-left: 10px;
    margin-right: 10px;
}
</style>

<script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script>
<script type="text/javascript">

// 이미지 정보들을 담을 배열
var sel_files = [];

$(document).ready(function() {
    $("#input_imgs").on("change", handleImgFileSelect);
}); 

function fileUploadAction() {
    console.log("fileUploadAction");
    $("#input_imgs").trigger('click');
}

function handleImgFileSelect(e) {

    // 이미지 정보들을 초기화
    sel_files = [];
    $(".imgs_wrap").empty();

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("이미지 파일만 선택 가능합니다.");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
            $(".imgs_wrap").append(html);
            index++;

        }
        reader.readAsDataURL(f);
        
    });
}



function deleteImageAction(index) {
    console.log("index : "+index);
    console.log("sel length : "+sel_files.length);

    sel_files.splice(index, 1);

    var img_id = "#img_id_"+index;
    $(img_id).remove(); 
}

function fileUploadAction() {
    console.log("fileUploadAction");
    $("#input_imgs").trigger('click');
}

function submitAction() {
    console.log("업로드 파일 갯수 : "+sel_files.length);
    var data = new FormData();

    for(var i=0, len=sel_files.length; i<len; i++) {
        var name = "image_"+i;
        data.append(name, sel_files[i]);
    }
    data.append("image_count", sel_files.length);
    
    if(sel_files.length < 1) {
        alert("한개이상의 파일을 선택해주세요.");
        return;
    }           

    var xhr = new XMLHttpRequest();
    xhr.open("POST","./study01_af.php");
    xhr.onload = function(e) {
        if(this.status == 200) {
            console.log("Result : "+e.currentTarget.responseText);
        }
    }

    xhr.send(data);

}

</script>

<div class="myform">
	<div>
	    <p>///임시페이지/// 리뷰 사진을 등록해주세요</p>
	    <div class="input_wrap">
	      <a href="javascript:" onclick="fileUploadAction()" class="my_button">사진 선택</a>
	    	<input type="file" id="input_imgs" multiple/>
			</div>
	</div>
	
	<div>
	    <div class="imgs_wrap">
	        <img id="img" />
	    </div>
	</div>
	
	<a href="javascript:" class="my_button" onclick="submitAction();">업로드</a>
</div>