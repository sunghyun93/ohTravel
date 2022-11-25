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
					5성급<br>
					<div class="ht_name">
						<h2>호텔이름</h2>
					</div>
					<div class="likebtn">
						
					</div>
					hotel name<br>
					location.href<br>
					<div class="star_img">
						<img alt="별점뙇~" src="${pageContext.request.contextPath }/img/hotel/star.png">
					</div>
					<div class="star_scr">
						평균 별점
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
					<div class="ht_loc">주소</div>
					<div class="chkTime">체크인 체크아웃 시간</div>
					<div class="room_cnt">객실 수</div>
					<div class="ht_tel">전화번호</div>
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
							<button class="genric-btn primary ela"  data-toggle="modal" data-target="#exampleModalCenter1"  >리뷰 등록</button>
						</div>
							
						<div class="show_review"> <!-- 리뷰 테이블에서 저장된 값 불러오기 -->
							리뷰가 쌓일거예요
							
							<c:choose>
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
										<tr>
											<c:forEach var="reviews" items="${reviewList }">
												<input type="hidden" value="${reviews.rv_sort }">
												<input type="hidden" value="${reviews.rv_id }">
												<input type="hidden" value="${reviews.rv_contents }">
												<input type="hidden" value="${reviews.rv_date}">
												<input type="hidden" value="${reviews.rv_rating }">
												<td>
													<span class="rv_date">${reviews.rv_date }</span>
													<span class="rv_rating">${reviews.rv_rating }</span>
													<span class="rv_contents">${reviews.rv_contents }</span>
												</td>
											</c:forEach> 
										</tr>
									</table>
								 
										
										
								
								</c:when>
							</c:choose>
						</div> <!-- show_review -->
					</div> <!-- all_review -->
					
					
					<!-- 리뷰끝  -->
					
					<div class="ht_rec">
						같은 지역의 다른 호텔 추천해주기
					
					</div>
				</div> <!-- room_info 끝 -->
			
		</div> <!-- 부트스트랩 container끝 -->
		
	</div> <!-- hd_container 끝 -->
	
		<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">리뷰 작성</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<span class="star">
				      	 ★★★★★
				      	 <span>★★★★★</span>
	 					 <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
					</span>
			      	0
		        	<div class="form-group">
			            <label for="message-text" class="col-form-label">Message:</label>
			            <textarea class="form-control" id="message-text"></textarea>
		         	</div>
		         	
		         	<script type="text/javascript">
		         	
			         	const drawStar = (target) => {
			         		  document.querySelector('.star span').style.width = '${target.value * 10}%'';
			         		}
			         	
		         	</script>
		         	
		         	
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary">리뷰 등록</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
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


/* // 리뷰 관련 ajax

	function getReviewList(){
	
		$.ajax({
			
			url:"${pageContext.request.contextPath }/reviewList",
			type:"get",
			dataType:"json",
			success:
				
		}
		
	);
	
	
	
	}
 */




</script>	
	
</body>
</html>