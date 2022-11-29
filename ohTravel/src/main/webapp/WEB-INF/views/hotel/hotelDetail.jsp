<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<meta charset="UTF-8">
<title>Oh!Travel - 상세정보</title>
	<link rel="stylesheet" href=" ${pageContext.request.contextPath}/css/hotel/style.css">
</head>
<body>
	<div class="hd_container">
		<div class="container">
			
		
				<div class="ht_image">
					<img alt="호텔대표사진" src="${pageContext.request.contextPath }/img/hotel/h_img_test.jpg">
				</div>
				<div class="hotel_info">
					${hotelDetail.hotel_grade }성급<br>
					<div class="ht_name">
						<h2>${hotelDetail.hotel_kor }</h2>
					</div>
					<div class="likebtn">
						
					</div>
					${hotelDetail.hotel_eng }<br>
					${hotelDetail.hotel_loc }<br>
					<div class="star_img">
						<img alt="별점뙇~" src="${pageContext.request.contextPath }/img/hotel/star.png">
					</div>
					<div class="star_scr">
						${hotelDetail.hotel_score }
					</div>
					<hr>
					<div class="p_info">
						1박 요금 최저가 
					</div>
					<div class="h_price">
						190,000원
					</div>
				</div> <!-- hotel_info 끝 -->
				<div class="ht_simple_option">
					<div class="info_title">숙소정보</div>
					<div class="ht_loc">주소 : ${hotelDetail.hotel_loc }</div>
					<div class="chkTime">체크인 : ${hotelDetail.checkin } 체크아웃 시간 : ${hotelDetail.checkout }</div>
					<div class="room_cnt">객실 수 : ${hotelDetail.hotel_rv_num }</div>
					<div class="ht_tel">전화번호 : ${hotelDetail.hotel_tel }</div>
				</div> <!-- ht_simple_option 끝 -->
				<div class="room_info">
					
					<div class="rev_option">
<!-- 						<a href="myModal" class="genric-btn primary ela" data-toggle="modal" data-target="#myModal">날짜 선택</a>
 -->						<button class="genric-btn primary ela">날짜 선택</button>
 							<div class="ppl">
				<button type="button" id="modal_btn3" class="genric-btn primary ela" data-toggle="modal" data-target="#exampleModalCenter"><span class="ppl_check_text">성인 1명 / 일반석</span></button>
				<div class="black_bg3"></div>
				<div class="member_count modal_wrap3">
					<div class="modal_close3"><span>close</span></div>
					<div class="member_count_entire">
					
					<span class="ppl_select">인원</span><hr width="460px">
						<ul>
							<li>
								<p class="tit">
                                            <span class="txt">성인</span><br>
                                        </p>
                                        <span class="num_count_group">
                                            <button class="btn_decrement down"><img src="${pageContext.request.contextPath}/airport/img/minus.png"></button>
                                            <span class="inpt_counter adultCnt"></span>
                                            <button class="btn_increment up"><img src="${pageContext.request.contextPath}/airport/img/plus.png"></button>
                                        </span>
							</li>
							<!--  아동
								<li>
                                     <p class="tit">
                                            <span class="txt">아동</span>
                                     </p>
                                        <span class="num_count_group">
                                            <button class="btn_decrement down"><img src="../upload/minus.png"></button>
                                            <span class="inpt_counter childCnt"></span>
                                            <button class="btn_increment up"><img src="../upload/plus.png"></button>
                                       </span>
                             </li> -->
						</ul>
						<br><br>
						<p class="seat_select">좌석등급</p><hr width="460px">
						<label><input type="radio" value="일반석" name="radio_seat" class="radio_seat">  일반석</label><p>
						<label><input type="radio" value="비즈니스석" name="radio_seat" class="radio_seat">  비즈니스석</label><p>
						<label><input type="radio" value="일등석" name="radio_seat" class="radio_seat">  일등석</label>
						<input type="hidden" value="">
						<p><img src="${pageContext.request.contextPath}/airport/img/caution.png" width="20px" height="15px">  예약 가능 최대 인원은 9명입니다.</p>
						<div class="select_complete"><span class="select_complete_text">선택완료</span></div>
					</div>	
				</div>
				
			</div>
 							
					</div>
					
		<!--티켓 검색부분  -->


		
		<div class="date">
			<div class="date_start">
				<input type="date" name="dates_start_check" value="" id="dates_start_check" class="dates_start_check">
			</div>
			<div class="date_end">
				<input type="date" name="dates_start_end" value=""  id="dates_start_end" class="dates_start_end">
			</div>
		</div>
		
					<!-- 호텔이 가지고 있는 방 종류마다 반복될 folding box -->
					<div class="room_type_more">
						
						<div class="fluid-wrap">
						 <div class="container-fluid" >
						 	<!-- style="min-height: calc(100vh - 136px);" -->
						    <!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
						    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						      <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
						      <div class="panel panel-default">
						          <a class="r_type_name" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
							        <div class="panel-heading" role="tab">
							           	<p>방 종류 이름</p>
							        </div>
						          </a>
						        <div id="collapse1" class="panel-collapse collapse" role="tabpanel">
						          <div class="panel-body">
						            	<div class="room_type_detail">
											<div class="room_img">
												<img alt="room" src="${pageContext.request.contextPath }/img/hotel/room1.jpg">
											</div>
											<div class="r_name">
												<h3>room 이름</h3>
											</div>
											<div class="r_option">
												<h4>뭔가의 방 옵션정보</h4>
											</div>
											<div class="r_price">
												<h3>가격</h3>
											</div>
											<div class="reservation">
												<button class="genric-btn primary ela">예약하기</button>
											</div>
										</div>
									</div><!-- panel-body -->
						          </div> <!-- #collapse1 -->
						        </div> <!-- panel-default -->
						      </div> <!-- panel-group -->
							</div> <!-- container-fluid -->
						</div>
					
					</div> <!-- room_type_more 끝 -->
					
					
					<div class="ht_option">
						<div class="add_opt">
							<div class="add_title">숙소 부대시설</div>
						</div>
						<div class="conv_opt">
							<div class="conv_title">숙소 편의시설</div>
						</div>
					</div> <!-- ht_option -->
				
				
					
					<!-- 리뷰 시작 -->
					<div class="all_review">
						리뷰
						<div class="rv_stats">
							별점 통계가 들어가요
							
						</div>
						
						<div class="rv_btn">
							<button class="genric-btn primary ela" data-toggle="modal" onclick="openModal()" data-target="#reviewModal">리뷰 등록</button>
						</div>
							
						<div class="show_review"> <!-- 리뷰 테이블에서 저장된 값 불러오기 -->
							리뷰가 쌓일거예요
							
							<!-- 리뷰 들어갈 위치에 table생성 -->
							<table id="reviewTable">
								
							</table>
							
							
						<%-- 	<c:choose>
								<c:when test="${empty reviewList } ">
									<table class="empty_review">
										<tr>
											<td>
												등록된 리뷰가 없습니다.
											</td>
										</tr>
									</table>
								
								</c:when>
								
							
								<c:when test="${not empty reviewList }">
									<table>
										<c:forEach var="reviews" items="${reviewList }">	
											<tr>
												<input type="hidden" value="${reviews.rv_sort }">
												<input type="hidden" value="${reviews.rv_id }">
												<input type="hidden" value="${reviews.rv_contents }">
												<input type="hidden" value="${reviews.rv_date}">
												<input type="hidden" value="${reviews.rv_rating }">
												<td>
													<span class="rv_date">${reviews.rv_date }</span>
												</td>
												<td>
													<span class="rv_rating">${reviews.rv_rating }</span>
												</td>
												<td>
													<span class="rv_contents">${reviews.rv_contents }</span>
												</td>
											</tr>
										</c:forEach>
									</table>
								</c:when>
							</c:choose> --%>
							
						</div> <!-- show_review -->
					</div> <!-- all_review -->
					
					
					<!-- 리뷰끝  -->
					
					<div class="ht_rec">
						같은 지역의 다른 호텔 추천해주기
					
					</div>
				</div> <!-- room_info 끝 -->
			
		</div> <!-- 부트스트랩 container끝 -->
		
	</div> <!-- hd_container 끝 -->
	
		<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="modalLongTitle">리뷰 작성</h5>
			        <button type="button" class="close" data-dismiss="modal" onclick="closeModal()" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<span class="star">
				      	 ★★★★★
				      	 <span>★★★★★</span>
	 					 <input type="range" oninput="drawStar()" id="starRate" value="1" step="1" min="0" max="10">
					</span>
			      	
		        	<div class="form-group">
			            <label for="message-text" class="col-form-label">내용:</label>
			            <textarea class="form-control" id="review-text"></textarea>
		         	</div>
		         	
		       		<!-- registerReview() -->
		         	
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" onclick="registerReview()">리뷰 등록</button>
			        <button type="button" class="btn btn-secondary" onclick="closeModal()" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
					




<script type="text/javascript">


/////////////////////////인원수와 좌석선택 모달/////////////////////////////////
	function pplOnClick() {
	    document.querySelector('.modal_wrap3').style.display ='block';
	    document.querySelector('.black_bg3').style.display ='block';
	    
	}
	
	function pplOffClick() {
	    document.querySelector('.modal_wrap3').style.display ='none';
	    document.querySelector('.black_bg3').style.display ='none';
	    
	}
	
	document.getElementById('modal_btn3').addEventListener('click', pplOnClick);
	document.querySelector('.modal_close3').addEventListener('click', pplOffClick);
///////////////////////////////////////////////////////////////////////////////

////////////////////////인원수 선택 모달///////////////////////////////////////
$(function() {
            // 인원 수 버튼 증감 및 총 금액 부분의 합계 script 부분
            let adultCnt = $('.adultCnt');
            let childCnt = $('.childCnt');

                // 업 버튼 / 다운 버튼
            let up = $('.up');
            let down = $('.down');

                // 성인 가격 / 아동 가격 (서버에서 받아와야 함 - 우선 하드코딩)
            let adultPrice;
            let childPrice;
                // 총 금액 
            let totalPay = $('.con');

                // 인원 수 기본 설정
            adultCnt.text("1");
            childCnt.text("0");

                // 총 금액 기본 설정 (서버에서 받아와야 함 - 우선 하드코딩)
            //totalPay.html('789,000<em>원</em>');

            up.on('click', function() {
                // 누른 버튼 구분 (up / down)
                let isUp = $(this).hasClass('up');

                // 클릭 했을 때의 인원 수
                let cnt = Number($(this).siblings('span').text());
                console.log(cnt);

                // 클릭 했을 때의 전체 인원 수 (패키지 상세 인원 제한을 위한 변수)
                let totalCnt = Number(adultCnt.text()) + Number(childCnt.text());

                // 클릭 했을 때 성인 / 아동 구분
                let isAdult = $(this).siblings('span').hasClass('adultCnt');
                console.log(isAdult);

                // 성인 / 아동 , up / down 구분
                if(isAdult && !isUp) {
                    console.log('성인 down');
                } else if(isAdult && isUp) {
                    console.log('성인 up');
                    // 개수 제한 거는 부분.. (패키지 상세의 인원제한)
                    if(totalCnt >= 9) {
                        return;
                    } else {
                        cnt += 1;
                        adultCnt.text(cnt);
                    }
                } else if(!isAdult && !isUp) {
                    console.log("아동 down");
                } else if(!isAdult && isUp){
                    console.log('아동 up');
                    // 개수 제한 거는 부분.. (패키지 상세의 인원제한)
                    if(totalCnt >= 9) {
                        return;
                    } else {
                        cnt += 1;
                        childCnt.text(cnt);
                    }
                }
            });

            down.on('click', function() {
                // 누른 버튼 구분 (up / down)
                let isUp = $(this).hasClass('up');

                // 클릭 했을 때의 인원 수
                let cnt = $(this).siblings('span').text();
                console.log(cnt);

                // 클릭 했을 때 성인 / 아동 구분
                let isAdult = $(this).siblings('span').hasClass('adultCnt');
                console.log(isAdult);

                // 성인 / 아동 , up / down 구분
                if(isAdult && !isUp) {
                    console.log('성인 down');
                    if(cnt <= 1) {
                        return;
                    }
                    else {
                        cnt -= 1;
                        adultCnt.text(cnt);
                    }
                } else if(isAdult && isUp) {
                    console.log('성인 up');
                } else if(!isAdult && !isUp) {
                    console.log("아동 down");
                    if(cnt <= 0) {
                        return;
                    }
                    else {
                        cnt -= 1;
                        childCnt.text(cnt);
                    }
                } else if(!isAdult && isUp){
                    console.log('아동 up');
                }
            });
        });
///////////////////////////////////////////////////////////////////////////////////

/////////////////////////////성인과 좌석 선택시 값이 들어아게하는 함수///////////////////////////////
$(function(){
	 $(".select_complete").click(function(){
	    	var count = $(".inpt_counter").text();
	    	var seat = $(".radio_seat:checked").val();
	    	
	    	$(".ppl_check_text").text("");
	    	$(".ppl_check_text").text("성인"+ count+"명 / "+seat);
	    	
	    });
});
//////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////날짜 /////////////////////////////
$('.air_search').click(function(){

  var dateFrom = document.getElementById('dates_start_check');	//시작일
  var dateTo = document.getElementById('dates_start_end');	//종료일
  var today = new Date();				//오늘 날짜

  dateFrom = new Date(dateFrom.value);
  var fromYear = dateFrom.getFullYear();
  var fromMonth = dateFrom.getMonth() + 1;
  var fromDay = dateFrom.getDate();

  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
  if (isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)){
    fromYear  = 0;
    fromMonth = 0;
    fromDay   = 0;
  }

	dateFrom = fromYear +'/'+ fromMonth +'/'+fromDay; 

  dateTo = new Date(dateTo.value);
  var toYear  = dateTo.getFullYear();
  var toMonth = dateTo.getMonth() + 1;
  var toDay   = dateTo.getDate();

  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
  if (isNaN(toYear) || isNaN(toMonth) || isNaN(toDay)){
  toYear  = 0;
  toMonth = 0;
  toDay   = 0;
  }

    dateTo = toYear +'/'+ toMonth +'/'+toDay;

  //오늘날짜 날짜 형식으로 지정
  var todayYear  = today.getFullYear(); 	//2020
  var todayMonth = today.getMonth() + 1;    	//06
  var todayDay   = today.getDate();  		//11
  today = todayYear +'/'+ todayMonth +'/'+todayDay;  // 2020/06/11 (형식 지정은 본인 자유)

  //날짜 조회 시, 시작일이 오늘 날짜보다는 크고, 종료일이 시작일보다는 커야하기 때문에 조건을 걸어줌
  if(dateFrom >= today && dateTo >= dateFrom){
  	return true;
  } else {
 	 alert("올바른 날짜를 선택하세요.");
  }
});//click() end

////////////////////////////////편도클릭할때 편도날짜만 선택가능////////////////////////////
$(function(){
	$('.date_oneway').hide();
	
	$('.oneway').click(function(){
		$('.date_start, .date_end').hide();
		$('.date_oneway').show();
	});
	
	$('.round_trip').click(function(){
		$('.date_start, .date_end').show();
		$('.date_oneway').hide();
	});
	
});



// 이하 리뷰와 관련된 함수들 //


// 페이지 로딩될 때 함수 바로 실행
$(function(){
	getReviewList();
})



function openModal() {
	// 모달창 열기 
	$('#starRate').val(0)
	drawStar();
	$('#review-text').val('')
	$('#reviewModal').modal('show')
	selectedRvId = '';
}

function closeModal() {
	// 모달창 닫기
	$('#starRate').val(0)
	drawStar();
	$('#message-text').val('')
	$('#reviewModal').modal('hide')
	selectedRvId = '';
}


// 선택한 리뷰 아이디에 대한 전역변수 설정
let selectedRvId;


//별 그리기 함수
function drawStar() {
	let width = $('#starRate').val();
	document.querySelector('.star span').style.width = (width * 10) + '%'
}
 	

//기존 리뷰 수정과 등록이 모두 같은 등록하기 버튼을 사용하기 때문에,
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
	
	// 각자의 상품 Id값 변수 선언
	let hotelId = '${hotelDetail.hotel_id}'
	
	$.ajax({
		
				url:"${pageContext.request.contextPath }/review/reviewList",
				data:{
					// 리뷰 테이블의 해당 상품id값을 읽어오는 부분
					rv_real_id : hotelId
				},
				type:"get",
				dataType:"json",
				success: function(result) {
					
					// 가지고온 리뷰 데이터들을 포함해 화면 랜더링 함수 호출
					makeReviewTable(result);
					
				}
		
	});
	
}

// 리뷰 조회 ajax -- 랜더링 함수1
function makeReviewTable(data) {
	
	let targetTable = $('#reviewTable');
	
	targetTable.html('')
	
	let innerHtml = '';
	
	for(let datum of data) {
		innerHtml += makeRow(datum)
	}
	
	targetTable.append(innerHtml);
}

// 리뷰 조회 ajax -- 랜더링함수2 (구조 만들어줌)
function makeRow(datum) {
	
	
	let innerHtml = ''
	innerHtml += '<tr>'
		innerHtml += '<input type="hidden" class="rv_sort" value="'+datum.rv_sort+'">'
		innerHtml += '<input type="hidden" class="rv_id" value="'+datum.rv_id +'">'
		innerHtml += '<td>'
			innerHtml += '<span class="rv_date">'+datum.rv_date +'</span>'
		innerHtml += '</td>'
		innerHtml += '<td>'
			innerHtml += '<span class="rv_rating">'+datum.rv_rating +'</span>'
		innerHtml += '</td>'
		innerHtml += '<td>'
			innerHtml += '<span class="rv_contents">'+datum.rv_contents +'</span>'
		innerHtml += '</td>'
		innerHtml += '<td>'
			// 작성자 = 로그인 정보여야 수정 버튼 활성화 
			//if(aaaa) {	
				innerHtml += '<button type="button" class="rv_modify genric-btn primary ela" onclick="openUpdateModal(this)">수정</button>'
			//	innerHtml += '<button type="button" class="rv_modify genric-btn primary ela" onclick="openUpdateModal(this)">삭제</button>'
			//}
		innerHtml += '</td>'
	innerHtml += '</tr>'
	
	return innerHtml;
}


// 리뷰 등록 ajax
function writeReview(){
	
	// 가져가야할 data : 작성자 mem_id, rv_sort (하드코딩), rv_rating(별점), rv_contents(리뷰 내용), rv_date (작성시점 : service에서 해결), rv_real_id(상품id값)
	
	let sendData = {
					//나중에 세션?에 있는 정보로 읽어와야함
					mem_id: 'test1',
					rv_sort: '숙박',
					rv_rating: ($('#starRate').val())/2, // starRate에서 10에 해당하는 값이 별점 5점이기 때문에 /2
					rv_contents: $('#review-text').val(),
					rv_real_id: ${hotelDetail.hotel_id}
	}
	
	
	$.ajax({
				url:"${pageContext.request.contextPath }/review/writeReview",
				data: sendData,
				type:'post',
				//dataType:'json',
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
					//랜더링 함수 호출
					getReviewList();
					
				}
				
		
	});
}


function updateReview(){
	
	
	let sendData = {
			
			rv_id : selectedRvId,
			mem_id : 'test1',
			rv_sort : '숙박',
			rv_rating : ($('#starRate').val())/2,
			rv_contents : $('#review-text').val(),
			rv_real_id : ${hotelDetail.hotel_id}
			
	}
	
	$.ajax({
				url:"${pageContext.request.contextPath }/review/updateReview",
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


//리뷰 수정 ajax
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





</script>	
	
</body>
</html>