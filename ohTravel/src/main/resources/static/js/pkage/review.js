let currentPage = 1;	// 페이지 기본값

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

//페이징 처리 관련 함수

function changePage(e, page) {
	// a태그 기본 작동을 막기 위한 함수(클릭 시 상단으로 올라가버린다거나 하는 ...)
	e.preventDefault();
	// 선택한 페이지 넘버값을 받아서 전역변수 currentPage에 담는다.
	currentPage = page;
	// 리뷰 가져오기
	getReviewList();
}

function makePaginationLi(pageData) {
	
	// Backtick(백틱)사용 : ES6부터 새로 도입된 문자열 표기법
	// 백틱으로 템플릿 리터럴을 사용하면 줄바꿈, 변수나 연산 삽입에 용이함(+로 연결하거나 ''로 분리하지 않아도 됨)
	//  JSON에서는 사용 불가
	let innerHTML = ``;
	
	innerHTML += `
	<li class="page-item">
	`
    if(pageData.startPage == 1) {
		innerHTML += `<a class="page-link" aria-label="Previous" onclick="return false;">`
	    // 첫 1~5페이지에서 [<] 키가 작동하지 않도록함 
    } else {
    	innerHTML += ` <a class="page-link" aria-label="Previous" onclick="changePage(event,${pageData.startPage - 1})">`
    }
    
	innerHTML += `
           <i class="ti-angle-left"></i>
       </a>
	</li>
	`
	
	for( let i = pageData.startPage; i <= pageData.endPage ; i++) {
		innerHTML += `
			<li class="page-item">
				<a class="page-link" onclick="changePage(event,${i})">${i}</a>
			</li>
		`
	}
	
	innerHTML += `<li class="page-item">`
	if(pageData.endPage == pageData.totalPage){
		innerHTML += `<a class="page-link" aria-label="Next" onclick="return false;">`
		// 마지막 PageBlock에서  [>] 버튼이 작동하지 않도록 함
	} else {
		innerHTML += `<a class="page-link" aria-label="Next" onclick="changePage(event,${pageData.endPage + 1})">`
	}
	
	innerHTML += `
			<i class="ti-angle-right"></i>
		</a>
	</li>
   `
	//
	$('#reviewPaginationUl').html(innerHTML)
	
}
