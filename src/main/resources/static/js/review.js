//이미지 클릭 시
//모달 열기
function openModal(url) {
//    var modal = document.getElementById('myModal');
//    var modalImg = document.getElementById('modalImg');
//    modal.style.display = 'block';
//    modalImg.src = url;
    window.open(url, '_blank', 'width=600, height=400');
    // 새 창에 클릭 이벤트 추가
    if (newWindow) {
        newWindow.addEventListener('click', function() {
            // 클릭 시 창 닫기
            newWindow.close();
        });
    }
}

// 모달 닫기
function closeModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'none';
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    var modal = document.getElementById('myModal');
    if (event.target === modal) {
        modal.style.display = 'none';
    }
}


//리뷰 작성 글자수 제한
var textarea = document.getElementById('review_content');
var charCount = document.getElementById('charCount');

textarea.addEventListener('input', function () {
  var currentLength = textarea.value.length;
  var maxLength = parseInt(textarea.getAttribute('maxlength'));
  
  if (currentLength > maxLength) {
    textarea.value = textarea.value.substring(currentLength, maxLength);
    currentLength = maxLength;
  }

  charCount.textContent = currentLength + '/400';
});
