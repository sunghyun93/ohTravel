<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 

<meta charset="UTF-8">
<title>Oh!Travel - 상세정보</title>
	<link rel="stylesheet" href=" ${pageContext.request.contextPath}/css/hotel/style.css">
</head>
<body>
	<input type="hidden" id="rv_real_id" value="${rv_real_id}">

	<div class="hd_container">
		<div class="container">
			<div class="ht_image">
				<img alt="호텔대표사진" src="${hotelDetail.h_img_path }">
			</div>
			<div class="hotel_info">
				${hotelDetail.hotel_grade }성급<br>
				<div class="ht_name">
					<h2>${hotelDetail.hotel_kor }</h2>
				</div>
				<div class="likebtn">
					
				</div>
				${hotelDetail.hotel_eng }<br>
				<div class="star_img">
					<img alt="위치" src="${pageContext.request.contextPath }/img/hotel/location.png">
				</div>
				${hotelDetail.hotel_loc }<br>
				

				<!-- 찜 버튼 -->
				
					<div class="btn-group" style="position: absolute; transform: translate(355px, -19px);">
						<c:if test="${hotelDetail.basket_id == 0}">
							<i class="bskt bi-heart" id="heart" style="font-size:2.2rem; color: red; cursor: pointer;"></i>
						</c:if>
						<c:if test="${hotelDetail.basket_id != 0 }">
							<i class="bskt bi-heart-fill" id="heart" style="font-size:2.2rem; color: red; cursor: pointer;"></i>
						</c:if>
					</div>

				<!-- 평균 별점 ajax 계산되어 들어가는 부분 -->
				<div class="withReview">
					<div class="star_img">
						<img alt="별점" src="${pageContext.request.contextPath }/img/hotel/star.png">
					</div>
					<div class="star_scr" id="star_scr">
						
					</div>
					<div class="star_img">
						<img alt="위치" src="${pageContext.request.contextPath }/img/hotel/comment.png">
					</div>
					<div class="totalReviewCnt">
						 ${totalReviewCnt }개
					</div>
				</div>
				
				<hr>
				
				<div class="p_info">
					1박 요금 최저가 
				</div>
				
				<div class="h_price">
					 <fmt:formatNumber type="number" maxFractionDigits="3" value="${hotelDetail.room_min_price }" var="minRoomPrice"/>
					${minRoomPrice }원 ~
				</div>
			</div> <!-- hotel_info 끝 -->
			
			<div class="ht_simple_option">
				<div class="info_title">숙소정보</div>
				<div class="ht_loc">주소 : ${hotelDetail.hotel_loc }</div>
				<div class="chkTime">체크인 : ${hotelDetail.checkin }  /  체크아웃 시간 : ${hotelDetail.checkout }</div>
				<div class="room_cnt">객실 수 : ${hotelDetail.room_cnt }</div>
				<div class="ht_tel">전화번호 : ${hotelDetail.hotel_tel }</div>
			</div> <!-- ht_simple_option 끝 -->
			
			<div class="room_info">
				<div class="rev_option">
<!-- 					<a href="myModal" class="genric-btn primary ela" data-toggle="modal" data-target="#myModal">날짜 선택</a>
					<button type="button" class="genric-btn primary ela" onclick="getRoomOption()">날짜 선택</button> -->
					<div class="ppl">
	
					<div class="black_bg3"></div>
					<div class="member_count modal_wrap3">
						<div class="modal_close3"><span>close</span></div>
						<div class="member_count_entire">
						
						<span class="ppl_select">옵션 선택</span><hr width="460px">
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
								
									<li>
	                                    <p class="tit">
											<span class="txt">아동</span>
	                                    </p>
                                        <span class="num_count_group">
                                            <button class="btn_decrement down"><img src="${pageContext.request.contextPath}/airport/img/minus.png"></button>
                                            <span class="inpt_counter childCnt"></span>
                                            <button class="btn_increment up"><img src="${pageContext.request.contextPath}/airport/img/plus.png"></button>
                                       </span>
                           		  	</li> 
								</ul>
							<br><br>
							<div class="select_complete"><span class="select_complete_text">선택완료</span></div>
						</div>	
					</div>
				</div>
			</div>
					
		<!--티켓 검색부분  -->
		<div class="searchOption">
			<div class="date">
				<div class="date_start">
					<input type="date" name="dates_start_check" value="2022-12-20" id="dates_start_check" class="dates_start_check" min="2022-12-20" max="2022-12-27">
				</div>
				<div class="date_end">
					<input type="date" name="dates_start_end" value="2022-12-21"  id="dates_start_end" class="dates_start_end" min="2022-12-20" max="2022-12-27">
				</div>
				<div class="selectCnt">
					<button type="button" id="modal_btn3" class="genric-btn primary ela" data-toggle="modal" data-target="#exampleModalCenter"><span class="ppl_check_text">성인 1명 </span></button>
				</div>
				<div class="optionComplete">
					<button type="button" class="genric-btn primary ela" onclick="getRoomList()">객실 검색</button>
				</div>
			</div>
		</div>
		
		<!-- 예약 페이지로 정보 담기 위해 생성한 form -->
		<form action="${pageContext.request.contextPath }/hotel/hotelReservation" name="ReserveForm" method="post">
			<input type="hidden" name="startDate" value="">
			<input type="hidden" name="endDate" value="">
			<input type="hidden" name="calDate" value="">
			<input type="hidden" name="room_id" value="">
			<input type="hidden" name="numberOfAdult" value="">
			<input type="hidden" name="numberOfChild" value="">
			<input type="hidden" name="numberOfPeople" value="">
			<input type="hidden" name="memberId" value="">
		</form>
	
		<div id="roomAllInfo"> <!-- 선택한 날짜에 해당하는 객실 정보 창 나오는 div -->
		
		</div>
	
		<div class="ht_option">
			<div class="add_opt">
				<div class="add_title info_title">숙소 부대시설</div>
				<div class="add_contents">
				<c:forEach items="${hotelDetailOptions }" var="option">
					<c:if test="${option.option_gubun eq '부대'}">
						<span class="roundedOption">${option.hotel_option }</span>
					</c:if>
				</c:forEach>
				</div>
			</div>
			<div class="conv_opt">
				<div class="conv_title info_title">숙소 편의시설</div>
				<div class="conv_contents">
					<c:forEach items="${hotelDetailOptions }" var="option">
						<c:if test="${option.option_gubun eq '편의'}">
							<span class="roundedOption">${option.hotel_option }</span>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div> <!-- ht_option -->
				
		<!-- 리뷰 시작 -->
		<div class="all_review">
			<div class="review_title"> 
				<h3>리뷰</h3> 
			</div>
			<!-- <div class="rv_stats">
				별점 통계가 들어가요
			</div> -->
			
			<c:if test="${member.mem_id ne null }">
				<div class="rv_btn">
					<button class="genric-btn primary ela" data-toggle="modal" onclick="openModal()" data-target="#reviewModal">리뷰 등록</button>
				</div>
			</c:if>	
			<div class="show_review"> <!-- 리뷰 테이블에서 저장된 값 불러오기 -->
				<!-- 리뷰 들어갈 위치에 table생성 -->
				<table id="reviewTable" class="reviewTable"> <!-- id값 변경 X -->
					
				</table>
			</div> <!-- show_review -->
			
			<nav class="review-pagination blog-pagination justify-content-center d-flex">
				<!-- 페이징 처리 들어갈 위치 -->
				 <ul class="pagination" id="reviewPaginationUl">
				     
				 </ul>
			</nav>
		</div> <!-- all_review (리뷰 끝)-->
		
		<div class="ht_rec">
			<div class="htRec info_title">이 호텔은 어떠세요?</div>
			<c:forEach items="${hotelRecList }" var="recommend">
				<div class="recHotelInfo">
					<img alt="추천호텔사진" src="${recommend.h_img_path }">
					<div class="namdAndScore">
						<div class="recScore"> 
							<i class="fas fa-star" style='color : #ffa800'><span style='color : black'>${recommend.hotel_score }</span></i>
						</div>
						<div class="recName"><a href="${pageContext.request.contextPath }/hotel/hotelDetail?hotel_id=${recommend.hotel_id}">${recommend.hotel_kor }</a></div>
					</div>
				</div>
			</c:forEach>
		</div>
		</div> <!-- room_info 끝 -->
	</div> <!-- 부트스트랩 container끝 -->
</div> <!-- hd_container 끝 -->
	
<!-- 리뷰 모달 (있어야할 위치는 상관없습니다..)-->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
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
			</div>
		      
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="registerReview()">리뷰 등록</button>
				<button type="button" class="btn btn-secondary" onclick="closeModal()" data-dismiss="modal">취소</button>
			</div>
			
		</div> <!-- modal-content -->
	</div> <!-- modal-dialog-centered -->
</div> <!-- 리뷰 모달 끝 -->


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
let numberOfPeople = 1;
let numberOfAdult = 1;
let numberOfChild = 0;
$(function(){
	 $(".select_complete").click(function(){
		 
	    	let adultCnt = $(".inpt_counter.adultCnt").text();
	    	let childCnt = $(".inpt_counter.childCnt").text();
	    	
	    	numberOfAdult = Number(adultCnt)
	    	numberOfChild = Number(childCnt)
	    	numberOfPeople = numberOfAdult + numberOfChild/2;
	    	
	    	let check_text = "성인 "+ adultCnt+"명";
	    	
	    	if( Number(childCnt) > 0 ) {
	    		check_text += " / 아동 "+ childCnt+"명";
	    	}
	    	
	    	$(".ppl_check_text").text(check_text);
	    	
	    	pplOffClick();
	    	
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


// 날짜수 계산 관련 함수
function getRoomOption(){
	
	let startDate = $('#dates_start_check').val()
	let endDate = $('#dates_start_end').val()
	
	let startDate_arr = startDate.split("-");
	let endDate_arr = endDate.split("-");
	
	let stDate = new Date(startDate_arr[0], startDate_arr[1], startDate_arr[2]);
	let edDate = new Date(endDate_arr[0], endDate_arr[1], endDate_arr[2]);
	
	let cal = edDate.getTime() - stDate.getTime();
	let calDate = cal / (1000*60*60*24);
	
	console.log(calDate);	
	
}

function isLogined () {
	// 로그인 체크 -> 그대로 진행
	// 로그인이 안 되어 있으면 -> return false;
	let mem_id = '${member.mem_id }'
	if(!mem_id) {
		return false;
	} else {
		return true;
	}
}

function goReserve(room_id){
	
	if(!isLogined()) {
		alert('로그인 후 예약해주세요.')
		location.href="${pageContext.request.contextPath }/member/loginForm?toURL=${redirectURL }"
		return false;
	}
	
	let startDate = $('#dates_start_check').val()
	let endDate = $('#dates_start_end').val()
	
	let startDate_arr = startDate.split("-");
	let endDate_arr = endDate.split("-");
	
	let stDate = new Date(startDate_arr[0], startDate_arr[1], startDate_arr[2]);
	let edDate = new Date(endDate_arr[0], endDate_arr[1], endDate_arr[2]);
	
	let cal = edDate.getTime() - stDate.getTime();
	let calDate = cal / (1000*60*60*24);
	
	
	$('input[name=startDate]').attr('value',startDate);
	$('input[name=endDate]').attr('value',endDate);
	$('input[name=calDate]').attr('value',calDate);
	$('input[name=room_id]').attr('value',room_id);
	
	$('input[name=numberOfAdult]').attr('value',numberOfAdult);
	$('input[name=numberOfChild]').attr('value',numberOfChild);
	$('input[name=numberOfPeople]').attr('value',numberOfPeople);
	$('input[name=memberId]').attr('value','${sessionId}')
	
	
	
	ReserveForm.submit();

	
	
}

// 호텔의 객실 리스트 가져오는 함수 
function getRoomList(){
	
	// 시작 날짜, 종료 날짜, 날짜 계산, 인원 수, 호텔 아이디 가져가서
	// 해당하는 방 보여주고
	// 반복하는 div만들어주는 함수 호출해야됨
	
	let startDate = $('#dates_start_check').val()
	let endDate = $('#dates_start_end').val()
	
	let startDate_arr = startDate.split("-");
	let endDate_arr = endDate.split("-");
	
	let stDate = new Date(startDate_arr[0], startDate_arr[1], startDate_arr[2]);
	let edDate = new Date(endDate_arr[0], endDate_arr[1], endDate_arr[2]);
	
	let cal = edDate.getTime() - stDate.getTime();
	let calDate = cal / (1000*60*60*24);
	console.log(startDate);
	console.log(endDate);
	console.log(calDate);
	console.log(numberOfPeople);
	//인원수 가져오는 코드 써야함
	
	
	let sendData = {
			
			startDate, endDate, calDate,
			hotel_id : '${hotelDetail.hotel_id}',
			//인원수
			numberOfPeople
	}
	
	
	$.ajax({
		
		url: "${pageContext.request.contextPath }/hotel/roomList",
		data: sendData,
		type: 'get',
		success: function(result){
			// 조건에 맞는 방 리스트 그려주는 함수 실행
			makeRoomList(result)
	
		},error : function (err) {
			console.error(err)
		}
		
		
		
	});
	 
	
	
}


function makeRoomList(data) {
	
	console.log(data);
	console.log(data.length);
	
	let typeSet = new Set();
	
	for(let j = 0; j < data.length; j++) {
		typeSet.add(data[j].room_type)
	}
	
	let typeArr = Array.from(typeSet);
	
	
    $('#roomAllInfo').empty(); /*Delete Tag*/
	
		<!-- 호텔이 가지고 있는 방 종류마다 반복될 folding box -->
	
    let innerHtml = '';
    let type='';
	for(let i = 0; i < typeArr.length; i++){
	
		innerHtml += '<div class="room_type_more">'
		innerHtml +=	'<div class="fluid-wrap">'
		innerHtml +=	 	'<div class="container-fluid">'

	    innerHtml +=	    	'<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">'
		innerHtml +=	      		'<div class="panel panel-default">'
		innerHtml +=	         		'<a class="r_type_name" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_'+typeArr[i]+'" aria-expanded="false">'
		innerHtml +=				        '<div class="panel-heading" role="tab">'
		innerHtml +=				           	'<p>'+typeArr[i]+'</p>'
		innerHtml +=					   	'</div>'
		innerHtml +=    				'</a>'
		innerHtml +=    				'<div id="room_'+typeArr[i]+'">'
		innerHtml +=    				'</div>'
										
	    innerHtml +=    '</div> <!-- panel-default -->'
	    innerHtml +=  '</div> <!-- panel-group -->'
		innerHtml += '</div> <!-- container-fluid -->'
		innerHtml +='</div>'
		innerHtml +='</div> <!-- room_type_more 끝 -->'
		
	}
	
	$('#roomAllInfo').append(innerHtml);
	
	
	
 	for(let j = 0; j < data.length; j++){
		let innerHtmlBody = '';
		
		innerHtmlBody +=				'<div id="collapse_'+data[j].room_type+'" class="panel-collapse collapse" role="tabpanel">'	
		innerHtmlBody +=     				'<div class="panel-body">'
		innerHtmlBody +=       					'<div class="room_type_detail">'
		innerHtmlBody +=							'<div class="room_img">'
		innerHtmlBody +=								'<img alt="room" src="'+data[j].r_img_path+'">'
		innerHtmlBody +=							'</div>'
		innerHtmlBody +=						'<div class="r_name">'
		innerHtmlBody +=							'<h3>'+data[j].room_name+'</h3>'
		innerHtmlBody +=						'</div>'
		innerHtmlBody +=						'<div class="r_price">'
		innerHtmlBody +=							'<h3>'+data[j].room_price.toLocaleString()+'원</h3>'
		innerHtmlBody +=						'</div>'
		innerHtmlBody +=						'<div class="reservation">'
		innerHtmlBody +=							'<button type="button" class="genric-btn primary ela" onclick="goReserve('+data[j].room_id+')">예약하기</button>'
		innerHtmlBody +=						'</div>'
		innerHtmlBody +=					'</div>'
		innerHtmlBody +=				'</div><!-- panel-body -->'
		innerHtmlBody +=   	 		 '</div> <!-- #collapse1 -->'
	    
			$('#room_'+data[j].room_type).append(innerHtmlBody); 
		}
 	

 		
}


//리뷰 조회 -- 랜더링 함수2 (진짜 구조 그려줌)
function makeRow(datum) {
	
	let innerHtml = ''

	innerHtml += '<tr>'
		innerHtml += '<input type="hidden" class="rv_id" value="'+datum.rv_id +'">'
		innerHtml += '<td>'
			innerHtml += '<span class="rv_date">'+datum.rv_date +'</span>'
		innerHtml += '</td>'
		innerHtml += '<td>'
			innerHtml += '<div class="star_img"> <img alt="별점뙇~" src="/img/hotel/star.png"></div>'
			innerHtml += '<span class="rv_rating">'+datum.rv_rating +'</span>'
		innerHtml += '</td>'
		innerHtml += '<td>'
			innerHtml += '<span class="rv_contents">'+datum.rv_contents +'</span>'
		innerHtml += '</td>'
		innerHtml += '<td>'
			// 작성자 = 로그인 정보여야 수정 버튼 활성화 
			if(datum.mem_id == '${sessionId}') {	
				innerHtml += '<button type="button" class="rv_modify genric-btn info radius" onclick="openUpdateModal(this)">수정</button>'
			}
		innerHtml += '</td>'
		innerHtml += '<td>'
			// 작성자 = 로그인 정보여야 수정 버튼 활성화 
			if(datum.mem_id == '${sessionId }') {	
				innerHtml += '<button type="button" class="rv_delete genric-btn info radius" onclick="deleteReview(this)">삭제</button>'
			}
		innerHtml += '</td>'
	innerHtml += '</tr>'
	
	return innerHtml;
}



$('#heart').click(function(){
	
	if("${member.mem_id }" == ""){
		if(confirm("로그인한 회원만 찜하기 기능을 이용할 수 있습니다. 로그인 하시겠습니까?")){
			location.href="${pageContext.request.contextPath }/member/loginForm?toURL=${redirectURL }"
		} else {
			return false;
		}
	}
	
	let hotel_id = "${hotelDetail.hotel_id}";
	let mem_id = '${member.mem_id }';
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/hotel/heartBasket",
		data: {hotel_id, mem_id},
		type: 'post',
		dataType: 'text',
		success: function(result){
			
			if(result == "INSERT OK!"){
				$('.bskt').removeClass('bi-heart').addClass('bi-heart-fill')
				alert("찜 목록에 해당 상품이 담겼습니다.")
			} else if(result =="DELETE OK!"){
				$('.bskt').removeClass('bi-heart-fill').addClass('bi-heart')
				alert("찜 목록에서 해당 상품이 삭제되었습니다.")
			} 
			
			
		},error : function (err) {
			console.error(err)
		}
		
		
	});

	
})


</script>	
<script src="${pageContext.request.contextPath }/js/review/review.js"></script>
</body>
</html>