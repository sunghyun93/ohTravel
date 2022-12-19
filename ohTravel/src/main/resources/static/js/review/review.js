// 이하 리뷰와 관련된 함수들 //
// 선택한 리뷰 아이디 / 페이지 / 리뷰 아이디에 대한 전역변수 설정 -> 리뷰아이디는 해당 jsp 최상단 #rv_real_id에 hidden값으로 설정해줌
let selectedRvId;
let currentPage = 1;
let rv_real_id;


// 페이지 로딩될 때 리뷰 조회 함수 바로 실행
$(function(){
	rv_real_id = $('#rv_real_id').val();
	getReviewList();
})


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


//리뷰 등록과 수정이 같은 [리뷰 등록] 버튼을 사용하기 때문에,
//rv_id 값의 유무에 따라 작동해야하는 함수가 달라져야함
//rv_id 값이 이미 있으면 : 수정 / 없다면 : 새로 등록
function registerReview() {
	
	if(!selectedRvId) {
		writeReview()
	} else {
		updateReview()
	}
	
}


// 리뷰 조회 ajax
// 처음 Detail 페이지에 들어왔을 때 DB review테이블의 데이터를 가져와서 뿌림
// 가져올 데이터는 해당 Detail 페이지의 []_id에 해당하는 값들
function getReviewList(){
	
	$.ajax({
		url:"/review/reviewList",
		data:{
			// 설정해준 전역변수 rv_real_id = 상품id , currentPage=1
			rv_real_id,
			currentPage
		},
		type:"get",
		dataType:"json",
		success: function(result) {
			// 가지고온 리뷰 데이터들을 포함해 화면 랜더링 함수 호출
			makeReviewTable(result.reviewList);
			$('#star_scr').text(result.avgScore);
			//페이징 처리
			makePaginationLi(result.page);
		}
		
	});
	
}


// 리뷰 조회 -- 랜더링 함수1 (append)
function makeReviewTable(data) {
	
	let targetTable = $('#reviewTable');
	
	let innerHtml = '';
	
	for(let datum of data) {
		innerHtml += makeRow(datum)
	}
	
	targetTable.html(innerHtml);
}




//[수정] 버튼을 클릭한 해당 행의 review 정보를 모두 가져와야함
function openUpdateModal(target){
	
	let targetTr =  $(target).closest('tr')
	// 수정할 리뷰가 있다면, 해당 행의 hidden값 rv_id값을 가져옴
	selectedRvId = targetTr.find('.rv_id').val();
	
	// 별점이 작성자가 등록한 별점대로 보여야함 (DB에는 5가 max값이므로 별 표시가 제대로 되려면 *2)
	let currentValue = Number(targetTr.find('.rv_rating').text()) * 2
	$('#starRate').val(currentValue)
	drawStar();
	
	// 내용도 작성자가 등록한 내용으로 불러와야한다.
	let currentContents = targetTr.find('.rv_contents').text()
	$('#review-text').val(currentContents)
	
	// 모달창을 open
	$('#reviewModal').modal('show')

}

// 리뷰 등록 ajax
function writeReview(){
	
	// 유효성 검사
	if(!valid_chk()){
		return false;
	}
	
	// 가져가야할 data : 작성자 mem_id, rv_rating(별점), rv_contents(리뷰 내용), 
	//				  rv_date (작성시점 : ReviewServiceImpl에서 해결), rv_real_id(전역변수에서 해결)
	
	let sendData = {
		//TODO:나중에 세션?에 있는 정보로 읽어와야함
		rv_rating: ($('#starRate').val())/2, // starRate에서 10에 해당하는 값이 별점 5점이기 때문에 /2
		rv_contents: $('#review-text').val(),
		rv_real_id
	}
	
	
	$.ajax({
		url:"/review/writeReview",
		data: sendData,
		type:'post',
		success: function(result) {
			// insert 성공시, 성공 알림
			if(result == "SUCCESS"){
				alert("리뷰가 등록되었습니다.")
			} else {
			// insert 실패하면 실패 alert
				alert("등록이 실패하였습니다.")
			}
			
			//모달창 닫기
			$('#reviewModal').modal('hide');
			// 특정 리뷰 페이지를 조회하던 중에 리뷰를 등록하면, 본인이 등록한 리뷰를 볼 수 있도록 첫페이지로 이동
			currentPage = 1;
			//랜더링 함수 호출
			getReviewList();
			
		}
				
		
	});
}


// 리뷰 수정 ajax
function updateReview(){
	
	// 유효성 검사
	if(!valid_chk()){
		return false;
	}
	
	
	let sendData = {
			
			rv_id : selectedRvId,
			mem_id : 'test1',
			rv_rating : ($('#starRate').val())/2,
			rv_contents : $('#review-text').val(),
			rv_real_id
	}
	
	$.ajax({
		url:"/review/updateReview",
		data: sendData,
		type:'post',
		success: function(result){
			// update 성공하면 성공 alert
			if(result == "SUCCESS"){
				alert("리뷰가 수정되었습니다.")
			} else {
			// update 실패하면 실패 alert
				alert("수정에 실패하였습니다.")
			}
			
			//모달창 닫기
			$('#reviewModal').modal('hide');
			//랜더링 함수 호출
			getReviewList();
			
			
		}
	
	});
	
	
}


// [삭제] 버튼을 클릭한 해당 행의 review 정보를 가져와서 삭제
function deleteReview(target){
	
	let targetTr =  $(target).closest('tr')
	// 삭제할 리뷰 행의 hidden값 rv_id값을 가져옴
	selectedRvId = targetTr.find('.rv_id').val();
	
	if(!confirm("해당 리뷰를 삭제하시겠습니까?")){
		alert("삭제가 취소되었습니다.")
	} else {
		$.ajax({
			
			url:"/review/deleteReview",
			data:{	
				rv_id : selectedRvId,
				rv_real_id			
			},
			type: 'post',
			success: function(result){
				alert("리뷰가 삭제되었습니다.")
				//랜더링 함수 호출
				getReviewList();
			},
			error : function (err) {
				console.error(err)
			}
				
	});
	
	
	}
		
}


// 페이징 처리 관련 함수

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