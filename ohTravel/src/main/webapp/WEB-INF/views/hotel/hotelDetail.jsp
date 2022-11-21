<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh!Travel - 상세정보</title>
	<link rel="stylesheet" href=" ${pageContext.request.contextPath}/css/hotel/style.css">
</head>
<body>
	<div class="hd_container">
		<div class="container">
			
		
				<div class="ht_image">
					<img alt="호텔대표사진" src="img/hotel/h_img_test.jpg">
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
						<img alt="별점뙇~" src="img/hotel/star.png">
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
 							<button class="genric-btn primary ela">인원 선택</button>
 							<button class="genric-btn primary ela">객실 검색</button>
						
					</div>
					
					
				<!-- 	모달창을 써보려던 흔적
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
					      </div>
					      <div class="modal-body">
					        <h2>띠요옹?</h2>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
					</div> 
				-->
					
					<!-- 호텔이 가지고 있는 방 종류마다 반복될 folding box -->
					<div class="room_type_more">
						
						<div class="fluid-wrap">
						 <div class="container-fluid" >
						 	<!-- style="min-height: calc(100vh - 136px);" -->
						    <!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
						    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						      <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
						      <div class="panel panel-default">
						        <div class="panel-heading" role="tab">
						          <a class="r_type_name" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
						           	방 종류 이름
						          </a>
						        </div>
						        <div id="collapse1" class="panel-collapse collapse" role="tabpanel">
						          <div class="panel-body">
						            	<div class="room_type_detail">
											<div class="room_img">
												<img alt="room" src="img/hotel/room1.jpg">
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
					<div class="all_review">
						리뷰
						<div class="rv_stats">
							별점 통계가 들어가요
							<div class="rv_btn">
								<button class="genric-btn primary ela">리뷰 등록</button>
							</div>
							
						</div>
					
						<div class="show_review"> <!-- 리뷰 테이블에서 저장된 값 불러오기 -->
							리뷰가 쌓일거예요
						</div>
					</div> <!-- all_review -->
					<div class="ht_rec">
						같은 지역의 다른 호텔 추천해주기
					
					</div>
				</div> <!-- room_info 끝 -->
			
		</div> <!-- 부트스트랩 container끝 -->
		
	</div> <!-- hd_container 끝 -->
</body>
</html>