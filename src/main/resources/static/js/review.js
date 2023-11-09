//이미지 클릭 시
//모달 열기
function openModal(url) {
    var modal = document.getElementById('myModal');
    var modalImg = document.getElementById('modalImg');
    modal.style.display = 'block';
    modalImg.src = url;
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


