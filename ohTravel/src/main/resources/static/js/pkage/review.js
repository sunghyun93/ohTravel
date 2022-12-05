//유효성 검사 함수
function valid_chk(){

	let rvContents = $('#review-text').val();
	let rvScore = $('#starRate').val();
	let isValid = true;
	
	// 리뷰 등록(수정)시 내용이 없으면 등록 불가
	if(rvContents == ""){
		
		alert('내용을 입력해주세요')
		isValid = false;
	
	// 리뷰 등록(수정)시 별점이 없으면 등록 불가
	} else if (rvScore == "0") {
		
		alert('별점을 선택해주세요')
		isValid = false;
		
	}
	
	return isValid;
}
/* 리뷰 모달 */
function openModal() {
	// 모달창 열기 
	// 수정 창 열었다가 새로 등록 눌렀을 때 기록이 남아있지 않도록 해줌
	$('#starRate').val(0)
	drawStar();
	$('#review-text').val('')
	$('#reviewModal').modal('show')
	selectedRvId = '';
}
function closeModal() {
	// 모달창 닫기
	// 닫으면서 이전 조회 기록 모두 지워줌
	$('#starRate').val(0)
	drawStar();
	$('#message-text').val('')
	$('#reviewModal').modal('hide')
	selectedRvId = '';
}
//별 그리기 함수
function drawStar() {
	let width = $('#starRate').val();
	document.querySelector('.star span').style.width = (width * 10) + '%'
}