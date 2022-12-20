<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search/newCss.css">
</head>
<body>
	<div id="container">
		<div class="inr">
			<div id="contents" class="contents allsearch">
				<div class="text_wrap big type top">
					<input type="hidden" id="search_word" value="${search_word }">
					<strong class="tit" ><em>${search_word}</em> 검색결과 </strong>
				</div>
				
				<!-- 카테고리 -->
				<div class="js_tabs">
					<ul class="tabs">
						<li class="item01" style="width: 20%;"><button id="all" class="item02 selected">전체</button></li>
						<li class="item01" style="width: 20%;"><button id="pkage" class="item02">패키지</button></li>
						<li class="item01" style="width: 20%;"><button id="hotel" class="item02">호텔</button></li>
						<li class="item01" style="width: 20%;"><button id="ticket" class="item02">투어/입장권</button></li>
					</ul>
				</div>
				
				<!-- contents -->
				<div class="vote_list">
				
					<!-- 패키지 리스트 -->
					<div class="ly_wrap list_result_wrap">
						<div class="result_title">
							<strong>패키지<em>(${pkageListCount})</em></strong> <a href="#none"> 패키지 더보기 </a>
						</div>
						<div class="js_tabs list_result_tab">
							<ul class="tabs"></ul>
						</div>
						<div class="prod_list">
							<ul class="list pkg">
								<c:forEach var="pkageList" items="${pkageList}" begin="0" end="4">
								<li>
									<div>
										<div class="img">
											<div class="group_area">
												<div class="label02">예약가능</div>
											</div>
											<img src="${pkageList.pkage_Img_path}" title="" data-src="" alt="">
										</div>
										<div class="txt_info" style="width: 720px;">
											<div class="tit eps2">
												<strong>${pkageList.pkage_name}</strong>
											</div>
											<div class="type_1">
												<span>${pkageList.period}일</span> 
												<span> <fmt:formatDate value="${pkageList.pkage_dt_startday}" pattern="MM.dd.E hh:mm"/> ~ <fmt:formatDate value="${pkageList.pkage_dt_endday}" pattern="MM.dd.E hh:mm"/> </span>
											</div>
											<div class='type_2'>
												<span class='air_icon'>${pkageList.air_name} </span>
												<span>${pkageList.start_airport_name}출발</span>
											</div>
											<div class="type_2">
												<span class='ic_note'>${pkageList.pkage_dt_thema}</span>
											</div>
											<div class="type_3">
												<span class="ic_location">${pkageList.country_name}, ${pkageList.city_name}</span>
											</div>
											<div class="rating">
												<strong>${pkageList.pkage_score}</strong> <span>(${pkageList.review_cnt})</span>
											</div>
										</div>
										<div class="price_info">
											<div class="price">
												<div>
													<div>
														<strong>${pkageList.min_price}</strong>
														<p>원~</p>
													</div>
												</div>
											</div>
											<div class='choice'>
											<c:choose>
												<c:when test="${pkageList.chk == 0}">
													<button type='button' class='choice-btn' id="${pkageList.pkage_id}">즐겨찾기</button>
												</c:when>
												<c:when test="${pkageList.chk > 0}">
													<button type='button' class='choice-btn' id="${pkageList.pkage_id}" style="background-position: -458px -26px;">즐겨찾기</button>
												</c:when>
											</c:choose>
											</div>
											<div class="label"></div>
											<a href="/pkage/searchResult?toDesti=${pkageList.city_id }&dates_start_check=2022-12-20&pkage_gubun=${pkageList.pkage_gubun}&order=1" class="product_btn"><span>다른상품 더보기</span></a>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					
					<!-- 호텔 리스트 -->
					<div class="ly_wrap list_result_wrap" id="hotel_hide">
						<div class="result_title">
							<strong >호텔<em>(${hotelListCount})</em></strong> <a href="/"> 호텔 더보기 </a>
						</div>
						<div class="js_tabs list_result_tab">
							<ul class="tabs"></ul>
						</div>
						<div class="prod_list">
							<ul class="list htl eps5">
								<c:forEach var="hotelList" items="${hotelList}" begin="0" end="4">
								<li>
									<div>
										<div class="img">
											<div class="group_area">
											</div>
											<img
												src="${hotelList.h_img_path}"
												title="" data-src="" alt="">
										</div>
										<div class="txt_info">
											<div class="tit eps2">
												<strong><a href="/hotel/hotelDetail?hotel_id=${hotelList.hotel_id}">${hotelList.hotel_kor}</a></strong>
											</div>
											<div class="type_1">
												<span>호텔</span> <span>${hotelList.hotel_grade}성급</span>
											</div>
											<div class="type_2">
												<span>${hotelList.country_name}</span> <span>${hotelList.city_name} </span>
											</div>
											<div class="rating">
												<strong>${hotelList.hotel_score}</strong> <span>(${hotelList.review_cnt})</span>
											</div>
											<div class="price">
												<div>
													<div>
														<strong>${hotelList.room_min_price}</strong>
														<p>원~</p>
														<div class='choice'>
														<c:choose>
															<c:when test="${hotelList.chk == 0}">
																<button type='button' class='choice-btn' id="${hotelList.hotel_id}">즐겨찾기</button>
															</c:when>
															<c:when test="${hotelList.chk > 0}">
																<button type='button' class='choice-btn' id="${hotelList.hotel_id}" style="background-position: -458px -26px;">즐겨찾기</button>
															</c:when>
														</c:choose>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					
					<!-- 티켓 리스트 -->
					<div class="ly_wrap list_result_wrap" id="ticket_hide">
						<div class="result_title">
							<strong >투어/입장권<em>(${ticketListCount})</em></strong> <a href="#none"> 투어/입장권 더보기 </a>
						</div>
						<div class="js_tabs list_result_tab">
							<ul class="tabs"></ul>
						</div>
						<div class="prod_list">
							<ul class="list htl eps5">
								<c:forEach var="ticketList" items="${ticketList}" begin="0" end="4">
								<li>
									<div>
										<div class="img">
											<img
												src="${ticketList.ticket_rep_img_path }"
												title="" data-src="" alt="">
										</div>
										<div class="txt_info">
											<div class="tit eps2">
												<strong>${ticketList.ticket_name }</strong>
											</div>
											<div class="type_1">
												<span>입장권/패스</span>
											</div>
											<div class="type_2">
												<span>${ticketList.country_name}</span><span>${ticketList.city_name }</span>
											</div>
											<div class="price">
												<div>
													<div>
														<strong>${ticketList.ticket_adult_price}</strong>
														<p>원</p>
														<div class='choice'>
														<c:choose>
															<c:when test="${ticketList.chk == 0}">
																<button type='button' class='choice-btn' id="${ticketList.ticket_id}">즐겨찾기</button>
															</c:when>
															<c:when test="${ticketList.chk > 0}">
																<button type='button' class='choice-btn' id="${ticketList.ticket_id}" style="background-position: -458px -26px;">즐겨찾기</button>
															</c:when>
														</c:choose>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div> <!-- 티켓 리스트 -->
					
				</div> <!-- vote_list -->
			</div> <!-- contents -->
		</div> <!-- inr -->
	</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">

//찜 선택
$(function() {
	$(document).on('click', '.choice-btn', function() {
		let basket_ref_id = $(this).attr('id');
		if($('.choice-btn[id="'+basket_ref_id+'"]').css("background-position") == '-485px -26px') {
			$.ajax({
				url: '/insertLike',
				data: {'basket_ref_id': basket_ref_id},
				dataType: 'text',
				success: function(data) {
					console.log('찜 data -> ' + data);
					if (data == 1) {
						$('.choice-btn[id="'+basket_ref_id+'"]').css('background-position', "-458px -26px");
						alert('찜 등록 완료');
					}	
					if (data == 0) {
						alert('이미 등록된 상품입니다.');
						$('.choice-btn[id="'+basket_ref_id+'"]').css('background-position', "-458px -26px");
					} 
					if (data == -1) {
						alert('로그인이 필요합니다.');
					}
				}
			});
			
		} else {
			$.ajax({
				url: '/removeLike',
				data: {'basket_ref_id': basket_ref_id},
				dataType: 'text',
				success: function(data) {
					console.log('찜 삭제 data -> ' + data);
					if (data == -1) {
						alert('로그인이 필요합니다.');
					}	
					if (data == 0) {
						alert('삭제 되지 않음...?');
					} else {
						alert('찜 삭제');
						$('.choice-btn[id="'+basket_ref_id+'"]').css("background-position", "-485px -26px");
					}
				}
			});
		}
	})	
})

// 날짜 formatDate
function getFullYmdStr(){
    //년월일시분초 문자열 생성
    var d = new Date();
    return (d.getMonth()+1) + "." + d.getDate() + "." + '일월화수목금토'.charAt(d.getUTCDay()) + ' ' + d.getHours() + ":" + d.getMinutes();
}

// 카테고리 선택
$(function() {
	$(document).on("click", ".item02", function() {
		$('.selected').removeClass('selected');
		$(this).addClass('selected');
		pageList($(this).attr('id'));
	});
	
	// 페이징
	$(document).on("click", ".page-item", function() {
		let gubun = $('.selected').attr('id');
		console.log('gubun -> '+gubun);
		let currentPage = $(this).val();
		pageList(gubun, currentPage);
	});
	
	// 다음 페이지
	$(document).on("click", ".nextPage", function() {
		let gubun = $('.selected').attr('id');
		console.log('gubun -> '+gubun);
		let currentPage = parseInt($(".page-item:last").val())+1;
		pageList(gubun, currentPage);
	});
})

function pageList(gubun, currentPage) {
			console.log('gubun -> ' + gubun);
			console.log('currentPage -> '+currentPage);
			let str = '';
			let datas = {'search_word' : $('#search_word').val(),
					'gubun' : gubun, 'currentPage': currentPage};
			if(gubun == 'all'){
				datas = {'search_word' : $('#search_word').val(),
						'gubun' : gubun};
			}
			console.log($('#search_word').val());
			console.log(datas);
			$.ajax({
				url: '/search/searchCategoryAjax',
				data: datas,
				dataType: 'json',
				success: function(data) {
					$('.vote_list').empty();
					if(gubun == 'pkage') {
						let endPage = data.paging.endPage;
						let pageCnt = data.paging.pageCnt;
						let startPage = data.paging.startPage;
						let currentPage = data.paging.currentPage;
						let pageBlock = data.paging.pageBlock;
						let totalPage = data.paging.totalPage;
						str += "<div class='ly_wrap list_result_wrap'>";
						str += 	"<div class='inr filter'>";
						str += "<div class='reset_wrap'>";
							str += "<strong class='tit'>필터</strong>";
							str += "<input type='button' id='reset-btn' value='필터 초기화'>";
							str += "<label for='reset-btn' class='reset-label'>";
						str += "</div>";
						str += 	"<div class='js_acc multi filter_wrap'>";
						str += 		"<div class='inr'>";
						str += 			"<a href='#filter-6' class='header active'>여행 기간</a>";
						str += 			"<div id='filter-6' class='view active' style='display: block;'>";
						str += 				"<div class='form_wrap'>";
						str += 					"<span class='form_holder text'>";
						str +=						"<input type='checkbox' id='trvlDayCnt-0' class='inpt_checkbox'>"; 
						str +=						"<label for='trvlDayCnt-0' class='label_checkbox trvlDayCnt-0'> 5일 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='trvlDayCnt-1' class='inpt_checkbox'>"; 
						str +=						"<label for='trvlDayCnt-1' class='label_checkbox trvlDayCnt-1'> 4일 </label></span>";
						str +=					"<span class='form_holder text'>";
						str +=						"<input type='checkbox'id='trvlDayCnt-2' class='inpt_checkbox'>"; 
						str +=						"<label for='trvlDayCnt-2' class='label_checkbox trvlDayCnt-2'> 3일 </label></span>";
						str +=					"<span class='form_holder text'>";
						str +=						"<input type='checkbox' id='trvlDayCnt-3' class='inpt_checkbox'>"; 
						str +=						"<label for='trvlDayCnt-3' class='label_checkbox trvlDayCnt-3'> 2일 </label></span>";
						str += 				"</div>";
						str += 			"</div>";
						str += 		"</div>";
						str += 		"<div class='inr'>";
						str += 			"<a href='#filter-9' class='header active'>가격</a>";
						str += 			"<div id='filter-9' class='view active' style='display: block;''>";
						str += 				"<div class='form_wrap'>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='adtMinAmt-0' class='inpt_checkbox'>"; 
						str += 						"<label for='adtMinAmt-0' class='label_checkbox adtMinAmt-0'> 0~20만원 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='adtMinAmt-1' class='inpt_checkbox'>"; 
						str += 						"<label for='adtMinAmt-1' class='label_checkbox adtMinAmt-1'> 20~50만원 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='adtMinAmt-2' class='inpt_checkbox'>"; 
						str += 						"<label for='adtMinAmt-2' class='label_checkbox adtMinAmt-2'> 50~70만원 </label></span>";
						str += 					"<span class='form_holder text'>";
						str +=						"<input type='checkbox' id='adtMinAmt-3' class='inpt_checkbox'>"; 
						str +=						"<label for='adtMinAmt-3' class='label_checkbox adtMinAmt-3'> 70만원~200만원 </label></span>";
						str += 				"</div>";
						str += 			"</div>";
						str += 		"</div>";
						str += 		"<div class='inr'>";
						str += 			"<a href='#filter-14' class='header active'>출발 시간</a>";
						str += 			"<div id='filter-14' class='view active' style='display: block;'>";
						str += 				"<div class='form_wrap'>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depTms-0' class='inpt_checkbox'>";
						str += 						"<label for='depTms-0' class='label_checkbox depTms-0'> 05~12시 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depTms-1' class='inpt_checkbox'>";
						str += 						"<label for='depTms-1' class='label_checkbox depTms-1'> 12~18시 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depTms-2' class='inpt_checkbox'>"; 
						str += 						"<label for='depTms-2' class='label_checkbox depTms-2'> 18~24시 </label></span>";
						str += 				"</div>";
						str += 			"</div>";
						str += 		"</div>";
						str += 		"<div class='inr'>";
						str += 			"<a href='#filter-15' class='header active'>항공사</a>";
						str += 			"<div id='filter-15' class='view active' style='display: block;'>";
						str += 				"<div class='form_wrap'>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-0' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-0' class='label_checkbox depAirCds-0'> 대한항공 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-1' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-1' class='label_checkbox depAirCds-1'> 동방항공 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-2' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-2' class='label_checkbox depAirCds-2'> 아시아나항공 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-3' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-3' class='label_checkbox depAirCds-3'> 에어부산 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-4' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-4' class='label_checkbox depAirCds-4'> 에어차이나 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-5' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-5' class='label_checkbox depAirCds-5'> 에어서울 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-6' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-6' class='label_checkbox depAirCds-6'> 일본항공 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-7' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-7' class='label_checkbox depAirCds-7'> 전일본공수항공 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-8' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-8' class='label_checkbox depAirCds-8'> 제주항공 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-9' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-9' class='label_checkbox depAirCds-9'> 진에어 </label></span>";
						str += 					"<span class='form_holder text'>";
						str += 						"<input type='checkbox' id='depAirCds-10' class='inpt_checkbox'>";
						str += 						"<label for='depAirCds-10' class='label_checkbox depAirCds-10'> 타이항공 </label></span>";
						str += "				</div>";
						str += "			</div>";
						str += "		</div>";
						str += "	</div>";
						str += "</div>";
						str += "<div class='inr right'>";
						str += "	<div class='option_wrap result'>";
						str += "		<span class='count'><em>"+data.totalPkage+"</em>개</span>";
						str += "		<div class='right_cont'>";
						str += "			<ul class='list_sort'>";
						str += "				<li class='item01'>";
						str += "					<input type='radio' class='item_order inpt_checkbox' name='order' id='buy_order'>";
						str += "					<label for='buy_order' class='inpt_checkbox buy_order'> 구매순 </label></span></li>";
						str += "				<li class='item01'>";
						str += "					<input type='radio' class='item_order inpt_checkbox' name='order' id='high_score'>";
						str += "					<label for='high_score' class='inpt_checkbox high_score'> 평점순 </label></span></li>";
						str += "				<li class='item01'>";
						str += "					<input type='radio' class='item_order inpt_checkbox' name='order' id='high_price'>";
						str += "					<label for='high_price' class='inpt_checkbox high_price'>높은  가격순</label></span></li>";
						str += "				<li class='item01'>";
						str += "	 				<input type='radio' class='item_order inpt_checkbox' name='order' id='row_price'>";
						str += "					<label for='row_price' class='inpt_checkbox row_price'>낮은 가격순</label></span></li>";
						str += "			</ul>";
						str += "		</div>";
						str += "	</div>";
						str += "	<div>";
						str += "		<div class='prod_list'>";
						str += "			<ul class='list pkg'>";
					$(data.pkageList).each(function() {
						str += "				<li>";
						str += "					<div>";
						str += "						<div class='img'>";
						str += "							<div class='group_area'>";
						str += "								<div class='label02'>예약가능</div>";
						str += "							</div>";
						str += "							<img src="+this.pkage_Img_path+" title='' data-src='' alt=''>";
						str += "						</div>";
						str += "					<div class='txt_info'>";
						str += "							<div class='tit eps2'>";
						str += "								<strong>"+this.pkage_name+"</strong>";
						str += "							</div>";
						str += "							<div class='type_1'>";
						str += "								<span>"+this.period+"일</span> <span> "+new Date(this.pkage_dt_startday).toLocaleString()+" ~ "+new Date(this.pkage_dt_endday).toLocaleString()+"</span>";
						str += "							</div>";
						str += "							<div class='type_2'>";
						str += "								<span class='air_icon'>"+this.air_name+" </span>";
						str += "								<span>"+this.start_airport_name+"출발</span>";
						str += "							</div>";
						str += "							<div class='type_2'>";
						str += "								<span class='ic_note'>"+this.pkage_dt_thema+"</span>";
						str += "							</div>";
						str += "							<div class='type_3'>";
						str += "								<span class='ic_location'>"+this.country_name+", "+this.city_name+"</span>";
						str += "							</div>";
						str += "							<div class='rating'>";
						str += "								<strong>"+this.pkage_score+"</strong> <span>("+this.review_cnt+")</span>";
						str += "							</div>";
						str += "						</div>";
						str += "						<div class='price_info'>";
						str += "							<div class='price'>";
						str += "								<div>";
						str += "									<div>";
						str += "										<strong>"+this.min_price+"</strong>";
						str += "										<p>원~</p>";
						str += "									</div>";
						str += "								</div>";
						str += "							</div>";
						str += "							<div class='choice'>";
															if(this.chk == 0) {
						str += "								<button type='button' class='choice-btn' id="+this.pkage_id+">즐겨찾기</button>";
															}
															else {
						str += 									"<button type='button' class='choice-btn' id="+this.pkage_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
															}
						str += "							</div>";
						str += "							<a href='/pkage/searchResult?toDesti="+this.city_id+"&dates_start_check=2022-12-20&pkage_gubun="+this.pkage_gubun+"&order=1' class='product_btn'><span>다른상품 더보기</span></a>";
						str += "						</div>";
						str += "					</div>";
						str += "				</li>";
					});
						str += "			</ul>";
						str += "		</div>";
						str += "		<div class='paginate_wrap'>";
						str += "			<div class='paginate type2'>";
						str += "				<div>";
						console.log('endPage -> '+data.paging.endPage);
						if(data.paging.startPage > data.paging.pageBlock) {
							str += "<input class='prevPage' type='button' value='[이전]'>";
						}
						for(let i = data.paging.startPage; i <= data.paging.endPage; i++) {
							str += "<input class='pageNum curPage page-item' type='button' value="+i+">";
						}
						if(data.paging.endPage < data.paging.totalPage) {
							str += "<input class='nextPage' type='button' value='[다음]'>";
						}
						str += "				</div>";
						str += "			</div>";
						str += "		</div>";
						str += 		"</div>";
						str += 	"</div>";
						str += "</div>";
					}
					
					if(gubun == 'hotel') {
						let endPage = data.paging.endPage;
						let pageCnt = data.paging.pageCnt;
						let startPage = data.paging.startPage;
						let currentPage = data.paging.currentPage;
						let pageBlock = data.paging.pageBlock;
						let totalPage = data.paging.totalPage;
						str += "<div class='ly_wrap list_result_wrap'>";
						str += "<div class='inr filter'>";
							str += "<div class='reset_wrap'>";
								str += "<strong class='tit'>필터</strong>";
								str += "<input type='button' id='reset-btn_h' value='필터 초기화'>";
								str += "<label for='reset-btn_h' class='reset-label'>";
							str += "</div>";
							str += "<div class='js_acc multi filter_wrap'>";
							str += "<div class='inr'>";
								str += "<a href='#filter-1' class='header active'>숙소 종류</a>";
									str += "<div id='filter-1' class='view active' style='display: block;'>";
									str += "<div class='form_wrap'>";
										str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='kind-0' class='inpt_checkbox_h'>"; 
												str += "<label for='kind-0' class='label_checkbox_h kind-0'> 호텔 </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='kind-1' class='inpt_checkbox_h'>"; 
												str += "<label for='kind-1' class='label_checkbox_h kind-1'> 레지던스 </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='kind-2' class='inpt_checkbox_h'>"; 
												str += "<label for='kind-2' class='label_checkbox_h kind-2'> 펜션 </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='kind-3' class='inpt_checkbox_h'>";
												str += "<label for='kind-3' class='label_checkbox_h kind-3'> 리조트 </label></span>";
												str += "<span class='form_holder text'>";
											str += "</div>";
										str += "</div>";
									str += "</div>";
									str += "<div class='inr'>";
									str += "<a href='#filter-8' class='header active'>가격</a>";
										str += "<div id='filter-8' class='view active' style='display: block;'>";
										str += "<div class='form_wrap'>";
											str += "<span class='form_holder text'>";
											str += 		"<input type='checkbox' id='adtMinAmt-0' class='inpt_checkbox_h'>"; 
											str += 		"<label for='adtMinAmt-0' class='label_checkbox_h adtMinAmt-0'> 4~8만원 </label></span>";
											str += 	"<span class='form_holder text'>";
											str += 		"<input type='checkbox' id='adtMinAmt-1' class='inpt_checkbox_h'>"; 
											str += 		"<label for='adtMinAmt-1' class='label_checkbox_h adtMinAmt-1'> 8~12만원 </label></span>";
											str += 	"<span class='form_holder text'>";
											str += 		"<input type='checkbox' id='adtMinAmt-2' class='inpt_checkbox_h'>"; 
											str += 		"<label for='adtMinAmt-2' class='label_checkbox_h adtMinAmt-2'> 12~16만원 </label></span>";
												str += "</div>";
											str += "</div>";
										str += "</div>";
								str += "<div class='inr'>";
								str += "<a href='#filter-2' class='header active'>숙소 평점</a>";
									str += "<div id='filter-2' class='view active' style='display: block;'>";
									str += "<div class='form_wrap'>";
										str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='score-0' class='inpt_checkbox_h'>"; 
												str += "<label for='score-0' class='label_checkbox_h score-0'> 양호(3+) </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='score-1' class='inpt_checkbox_h'>"; 
												str += "<label for='score-1' class='label_checkbox_h score-1'> 양호(3.5+) </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='score-2' class='inpt_checkbox_h'>"; 
												str += "<label for='score-2' class='label_checkbox_h score-2'> 양호(4+) </label></span>";
												str += "</div>";
										str += "</div>";
									str += "</div>";
								str += "<div class='inr'>";
								str += "<a href='#filter-3' class='header active'>숙소 등급</a>";
									str += "<div id='filter-3' class='view active' style='display: block;'>";
									str += "<div class='form_wrap'>";
										str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='class-0' class='inpt_checkbox_h'>"; 
												str += "<label for='class-0' class='label_checkbox_h class-0'> 3성급 </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='class-1' class='inpt_checkbox_h'>"; 
												str += "<label for='class-1' class='label_checkbox_h class-1'> 4성급  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='class-2' class='inpt_checkbox_h'>"; 
												str += "<label for='class-2' class='label_checkbox_h class-2'> 5성급  </label></span>";
												str += "</div>";
										str += "</div>";
									str += "</div>";
								/* str += "<div class='inr'>";
								str += "<a href='#filter-6' class='header active'>숙소 옵션</a>";
									str += "<div id='filter-6' class='view active' style='display: block;'>";
									str += "<div class='form_wrap'>";
										str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-0' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-0' class='label_checkbox_h othFacili-0'> wifi </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-1' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-1' class='label_checkbox_h othFacili-1'> 흡연가능  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-2' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-2' class='label_checkbox_h othFacili-2'> 레스토랑  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-3' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-3' class='label_checkbox_h othFacili-3'> 주차가능  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-4' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-4' class='label_checkbox_h othFacili-4'> 장애인 편의시설  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-5' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-5' class='label_checkbox_h othFacili-5'> 룸서비스  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-6' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-6' class='label_checkbox_h othFacili-6'> 안전금고  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-7' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-7' class='label_checkbox_h othFacili-7'> 커피 메이커  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-8' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-8' class='label_checkbox_h othFacili-8'> 전기차 충전소  </label></span>";
												str += "<span class='form_holder text'>";
											str += "<input type='checkbox' id='othFacili-9' class='inpt_checkbox_h'>";
												str += "<label for='othFacili-9' class='label_checkbox_h othFacili-9'> 욕실용품 </label></span>";
												str += "<span class='form_holder text'>";
											str += "</div>";
										str += "</div>";
									str += "</div>"; */
								str += "</div>";
							str += "</div>";
						str += "<div class='inr right'>";
						str += "<div class='option_wrap result'>";
							str += "<span class='count'><em>"+data.totalHotel+"</em>개</span>";
								str += "<div class='right_cont'>";
									str += "<ul class='list_sort'>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox_h' name='order' id='high_grade'>";
											str += "<label for='high_grade' class='inpt_checkbox_h high_grade'> 성급 높은순 </label></span></li>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox_h' name='order' id='row_grade'>";
											str += "<label for='row_grade' class='inpt_checkbox_h row_grade'> 성급 낮은순 </label></span></li>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox_h' name='order' id='high_price'>";
											str += "<label for='high_price' class='inpt_checkbox_h high_price'> 가격 높은순 </label></span></li>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox_h' name='order' id='row_price'>";
											str += "<label for='row_price' class='inpt_checkbox_h row_price'> 가격 낮은순 </label></span></li>";
									str += "</ul>";
								str += "</div>";
							str += "</div>";
							str += "<div>";
							str += "<div class='prod_list'>";
								str += "<ul class='list htl eps4'>";
								$(data.hotelList).each(function() {
									str += "<li>";
										str += "<div>";
											str += "<div class='img'>";
												str += "<div class='group_area'>";
													str += "</div>";
													str += "<img src="+this.h_img_path+" alt='' class=''>";
													str += "</div>";
												str += "<div class='txt_info'>";
												str += "<div class='tit eps2'>";
													str += "<strong><a href='/hotel/hotelDetail?hotel_id="+this.hotel_id+"'>"+this.hotel_kor+"</a></strong>";
														str += "</div>";
													str += "<div class='type_1'>";
													str += "<span>호텔</span> <span>"+this.hotel_grade+"성급</span>";
														str += "</div>";
													str += "<div class='type_2'>";
													str += "<span>"+this.country_name+"</span> <span>"+this.city_name+"</span>";
														str += "</div>";
													str += "<div class='rating'>";
													str += "<strong>"+this.hotel_score+"</strong> <span>("+this.review_cnt+")</span>";
														str += "</div>";
													str += "<div class='price'>";
														str += "<div>";
															str += "<div>";
																str += "<strong>"+this.room_min_price+"</strong>";
																	str += "<p>원~</p>";
																	str += "<div class='choice'>";
																	if(this.chk == 0) {
																		str += "<button type='button' class='choice-btn' id="+this.hotel_id+">즐겨찾기</button>";
																	}
																	else {
																		str += "<button type='button' class='choice-btn' id="+this.hotel_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
																	}
																	str += "</div>";
															str += "</div>";
														str += "</div>";
													str += "</div>";
												str += "</div>";
											str += "</div>";
										str += "</li>";
								});
										str += "</ul>";
									str += "</div>";
								str += "<div class='paginate_wrap'>";
								str += "<div class='paginate type2'>";
									str += "<div>";
										console.log('endPage -> '+data.paging.endPage);
										if (data.paging.startPage > data.paging.pageBlock) {
											str += "<input class='prevPage' type='button' value='[이전]'>";
										}
										for (let i = data.paging.startPage; i <= data.paging.endPage; i++) {
											str += "<input class='pageNum curPage page-item' type='button' value="+i+">";
										}
										if (data.paging.endPage < data.paging.totalPage) {
											str += "<input class='nextPage' type='button' value='[다음]'>";
										}
									str += "</div>";
								str += "</div>";
							str += 	"</div>";
						str += "</div>";
					}
					
					if(gubun == 'ticket') {
						let endPage = data.paging.endPage;
						let pageCnt = data.paging.pageCnt;
						let startPage = data.paging.startPage;
						let currentPage = data.paging.currentPage;
						let pageBlock = data.paging.pageBlock;
						let totalPage = data.paging.totalPage;
						str += "<div class='ly_wrap list_result_wrap'>";
						str += "<div class='inr filter'>";
						str += "<strong class='tit'>필터</strong>";
							str += "<div class='js_acc multi filter_wrap'>";
								str += "<div class='inr'>";
								str += "<a href='#filter-8' class='header active'></a>";
									str += "<div id='filter-8' class='view active' style='display: block;'>";
									/* str += "<div class='form_wrap'>";
										str += "<span class='form_holder text'>";
										str += 		"<input type='checkbox' id='adtMinAmt-0' class='inpt_checkbox'>"; 
										str += 		"<label for='adtMinAmt-0' class='label_checkbox adtMinAmt-0'> 1만원 이하 </label></span>";
										str += 	"<span class='form_holder text'>";
										str += 		"<input type='checkbox' id='adtMinAmt-1' class='inpt_checkbox'>"; 
										str += 		"<label for='adtMinAmt-1' class='label_checkbox adtMinAmt-1'> 1~5만원 </label></span>";
										str += 	"<span class='form_holder text'>";
										str += 		"<input type='checkbox' id='adtMinAmt-2' class='inpt_checkbox'>"; 
										str += 		"<label for='adtMinAmt-2' class='label_checkbox adtMinAmt-2'> 5~20만원 </label></span>";
										str += 	"<span class='form_holder text'>";
										str +=		"<input type='checkbox' id='adtMinAmt-3' class='inpt_checkbox'>"; 
										str +=		"<label for='adtMinAmt-3' class='label_checkbox adtMinAmt-3'> 20~50만원 </label></span>";
										str += "</div>"; */
										str += "</div>";
									str += "</div>";
								str += "</div>";
							str += "</div>";
						str += "<div class='inr right'>";
						str += "<div class='option_wrap result'>";
							str += "<span class='count'><em>"+data.totalTicket+"</em>개</span>";
								str += "<div class='right_cont'>";
									str += "<ul class='list_sort'>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox' name='order' id='buy_order'>";
											str += "<label for='buy_order' class='inpt_checkbox buy_order'> 구매순 </label></span></li>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox' name='order' id='high_score'>";
											str += "<label for='high_score' class='inpt_checkbox high_score'> 평점순 </label></span></li>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox' name='order' id='high_price'>";
											str += "<label for='high_price' class='inpt_checkbox high_price'>높은  가격순</label></span></li>";
										str += "<li class='item01'>";
											str += "<input type='radio' class='item_order inpt_checkbox' name='order' id='row_price'>";
											str += "<label for='row_price' class='inpt_checkbox row_price'>낮은 가격순</label></span></li>";
									str += "</ul>";
								str += "</div>";
							str += "</div>";
							str += "<div>";
							str += "<div class='prod_list'>";
								str += "<ul class='list htl eps4'>";
								$(data.ticketList).each(function() {
									str += "<li>";
										str += "<div>";
											str += "<div class='img'>";
												str += "<div class='group_area'>";
													str += "</div>";
													str += "<img src="+this.ticket_rep_img_path+" alt='' class=''>";
													str += "</div>";
												str += "<div class='txt_info'>";
												str += "<div class='tit eps2'>";
													str += "<strong>"+this.ticket_name+"</strong>";
														str += "</div>";
													str += "<div class='type_1'>";
													str += "<span>입장권/패스</span>";
														str += "</div>";
													str += "<div class='type_2'>";
													str += "<span>"+this.country_name+"</span> <span>"+this.city_name+"</span>";
														str += "</div>";
													str += "<div class='price'>";
														str += "<div>";
															str += "<div>";
																str += "<strong>"+this.ticket_adult_price+"</strong>";
																str += "<p>원</p>";
																str += "<div class='choice'>";
																if(this.chk == 1) {
																	str += "<button type='button' class='choice-btn' id="+this.ticket_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
																}
																else {
																	str += "<button type='button' class='choice-btn' id="+this.ticket_id+">즐겨찾기</button>";
																}
																str += "</div>";
															str += "</div>";
														str += "</div>";
													str += "</div>";
												str += "</div>";
											str += "</div>";
										str += "</li>";
								});
										str += "</ul>";
									str += "</div>";
								str += "<div class='paginate_wrap'>";
								str += "<div class='paginate type2'>";
									str += "<div>";
										console.log('endPage -> '+data.paging.endPage);
										if(data.paging.startPage > data.paging.pageBlock) {
											str += "<input class='prevPage' type='button' value='[이전]'>";
										}
										for(let i = data.paging.startPage; i <= data.paging.endPage; i++) {
											str += "<input class='pageNum curPage page-item' type='button' value="+i+">";
										}
										if(data.paging.endPage < data.paging.totalPage) {
											str += "<input class='nextPage' type='button' value='[다음]'>";
										}
									str += "</div>";
								str += "</div>";
							str += "</div>";
						str += "</div>";
					str += 	"</div>";
				str += "</div>";
					}
					
					if(gubun == 'all') {
						str += 	"<div class='vote_list'>";
						str += 	"<div class='ly_wrap list_result_wrap'>";
						str += 		"<div class='result_title'>";
						str += 			"<strong>패키지</strong> <a href='#none'> 패키지 더보기 </a>";
						str += 		"</div>";
						str += 		"<div class='js_tabs list_result_tab'>";
						str += 			"<ul class='tabs'></ul>";
						str += 		"</div>";
						str += 		"<div class='prod_list'>";
						str += 			"<ul class='list pkg'>";
					$(data.pkageList).each(function() {
						str += 				"<li>";
						str += 					"<div>";
						str += 						"<div class='img'>";
						str += 							"<div class='group_area'>";
						str += 								"<div class='label02'>예약가능</div>";
						str += 							"</div>";
						str += 							"<img src="+this.pkage_Img_path+" title='' data-src='' alt=''>";
						str += 						"</div>";
						str += 						"<div class='txt_info' style='width: 720px;'>";
						str += 							"<div class='tit eps2'>";
						str += 								"<strong>"+this.pkage_name+"</strong>";
						str += 							"</div>";
						str += 							"<div class='type_1'>";
						str += 								"<span>"+this.period+"일</span>"; 
						str += 								"<span> "+new Date(this.pkage_dt_startday).toLocaleString()+" ~ "+new Date(this.pkage_dt_endday).toLocaleString()+" </span>";
						str += 							"</div>";
						str += 							"<div class='type_2'>";
						str += 								"<span class='ic_note'>패키지</span>";
						str += 							"</div>";
						str += 							"<div class='type_3'>";
						str += 								"<span class='ic_location'>"+this.country_name+", "+this.city_name+"</span>";
						str += 							"</div>";
						str += 							"<div class='rating'>";
						str += 								"<strong>"+this.pkage_score+"</strong> <span>("+this.review_cnt+")</span>";
						str += 							"</div>";
						str += 						"</div>";
						str += 						"<div class='price_info'>";
						str += 							"<div class='price'>";
						str += 								"<div>";
						str += 									"<div>";
						str += 										"<strong>"+this.min_price+"</strong>";
						str += 										"<p>원</p>";
						str += 									"</div>";
						str += 								"</div>";
						str += 							"</div>";
						str += 							"<div class='choice'>";
						if(this.chk == 0) {
							str += "<button type='button' class='choice-btn' id="+this.pkage_id+">즐겨찾기</button>";
						}
						else {
							str += "<button type='button' class='choice-btn' id="+this.pkage_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
						}
						str += 							"</div>";
						str += 							"<div class='label'></div>";
						str += 							"<a href='/pkage/searchResult?toDesti="+this.city_id+"&dates_start_check=2022-12-20&pkage_gubun="+this.pkage_gubun+"&order=1' class='product_btn'><span>판매상품상세보기</span></a>";
						str += 						"</div>";
						str += 					"</div>";
						str += 				"</li>";
					});
						str += 			"</ul>";
						str += 		"</div>";
						str += 	"</div>";
						str += 	"<div class='ly_wrap list_result_wrap'>";
						str += 		"<div class='result_title'>";
						str += 			"<strong>호텔</strong> <a href='#none'> 호텔 더보기 </a>";
						str += 		"</div>";
						str += 		"<div class='js_tabs list_result_tab'>";
						str += 			"<ul class='tabs'></ul>";
						str += 		"</div>";
						str += 		"<div class='prod_list'>";
						str += 			"<ul class='list htl eps5'>";
					$(data.hotelList).each(function() {
						str += 				"<li>";
						str += 					"<div>";
						str += 						"<div class='img'>";
						str += 							"<div class='group_area'>";
						str += 							"</div>";
						str += 							"<img src="+this.h_img_path+" title='' data-src='' alt=''>";
						str += 						"</div>";
						str += 						"<div class='txt_info'>";
						str += 							"<div class='tit eps2'>";
						str += 								"<strong>"+this.hotel_kor+"</strong>";
						str += 							"</div>";
						str += 							"<div class='type_1'>";
						str += 								"<span>호텔</span> <span>"+this.hotel_grade+"성급</span>";
						str += 							"</div>";
						str += 							"<div class='type_2'>";
						str += 								"<span>"+this.country_name+"</span> <span>"+this.city_name+"</span>";
						str += 							"</div>";
						str += 							"<div class='rating'>";
						str += 								"<strong>"+this.hotel_score+"</strong> <span>(리뷰수)</span>";
						str += 							"</div>";
						str += 							"<div class='price'>";
						str += 								"<div>";
						str += 									"<div>";
						str += 										"<strong>"+this.room_min_price+"</strong>";
						str += 										"<p>원~</p>";
						str += 										"<div class='choice'>";
						if(this.chk == 0) {
							str += "<button type='button' class='choice-btn' id="+this.hotel_id+">즐겨찾기</button>";
						}
						else {
							str += "<button type='button' class='choice-btn' id="+this.hotel_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
						}
						str += 										"</div>";
						str += 									"</div>";
						str += 								"</div>";
						str += 							"</div>";
						str += 						"</div>";
						str += 					"</div>";
						str += 				"</li>";
					});	
						str += 			"</ul>";
						str += 		"</div>";
						str += 	"</div>";
						str += 	"<div class='ly_wrap list_result_wrap'>";
						str += 		"<div class='result_title'>";
						str += 			"<strong >투어/입장권</strong> <a href='#none'> 투어/입장권 더보기 </a>";
						str += 		"</div>";
						str += 		"<div class='js_tabs list_result_tab'>";
						str += 			"<ul class='tabs'></ul>";
						str += 		"</div>";
						str += 		"<div class='prod_list'>";
						str += 			"<ul class='list htl eps5'>";
					$(data.ticketList).each(function() {
						str += 				"<li>";
						str += 					"<div>";
						str += 						"<div class='img'>";
						str += 							"<img src="+this.ticket_rep_img_path+" title='' data-src='' alt=''>";
						str += 						"</div>";
						str += 						"<div class='txt_info'>";
						str += 							"<div class='tit eps2'>";
						str += 								"<strong>"+this.ticket_name+"</strong>";
						str += 							"</div>";
						str += 							"<div class='type_1'>";
						str += 								"<span>입장권/패스</span>";
						str += 							"</div>";
						str += 							"<div class='type_2'>";
						str += 								"<span>"+this.city_name+"</span>";
						str += 							"</div>";
						str += 							"<div class='price'>";
						str += 								"<div>";
						str += 									"<div>";
						str += 										"<strong>"+this.ticket_adult_price+"</strong>";
						str += 										"<p>원</p>";
						str += 							"<div class='choice'>";
						if(this.chk == 0) {
							str += "<button type='button' class='choice-btn' id="+this.ticket_id+">즐겨찾기</button>";
						}
						else {
							str += "<button type='button' class='choice-btn' id="+this.ticket_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
						}
						str += 							"</div>";
						str += 									"</div>";
						str += 								"</div>";
						str += 							"</div>";
						str += 						"</div>";
						str += 					"</div>";
						str += 				"</li>";
					});
						str += 			"</ul>";
						str += 		"</div>";
						str += 	"</div>";
						str += "</div>";
					}
						
					$('.vote_list').html(str);
					$('#'+gubun).addClass('selected');
				}
			})
	}

// Package 필터 선택
$(function() {
	$(document).on("click", ".inpt_checkbox", function() {
		console.log($(this).siblings());
		let chk_Val = [];
	    let radioCheck = '';
	    let toHTML = function(li_html) {
	    	str = "			<ul class='list pkg'>";
			console.log(li_html)
			li_html.forEach(function(pkageList) {
				str += "				<li>";
				str += "					<div>";
				str += "						<div class='img'>";
				str += "							<div class='group_area'>";
				str += "								<div class='label02'>예약가능</div>";
				str += "							</div>";
				str += "							<img src="+pkageList.pkage_Img_path+" title='' data-src='' alt=''>";
				str += "						</div>";
				str += "					<div class='txt_info'>";
				str += "							<div class='tit eps2'>";
				str += "								<strong>"+pkageList.pkage_name+"</strong>";
				str += "							</div>";
				str += "							<div class='type_1'>";
				str += "								<span>"+pkageList.period+"일</span> <span> "+new Date(pkageList.pkage_dt_startday).toLocaleString()+" ~ "+new Date(pkageList.pkage_dt_endday).toLocaleString()+"</span>";
				str += "							</div>";
				str += "							<div class='type_2'>";
				str += "								<span class='air_icon'>"+pkageList.air_name+" </span>";
				str += "								<span>"+pkageList.start_airport_name+"출발</span>";
				str += "							</div>";
				str += "							<div class='type_2'>";
				str += "								<span class='ic_note'>"+pkageList.pkage_dt_thema+"</span>";
				str += "							</div>";
				str += "							<div class='type_3'>";
				str += "								<span class='ic_location'>"+pkageList.country_name+", "+pkageList.city_name+"</span>";
				str += "							</div>";
				str += "							<div class='rating'>";
				str += "								<strong>"+pkageList.pkage_score+"</strong> <span>("+pkageList.review_cnt+")</span>";
				str += "							</div>";
				str += "						</div>";
				str += "						<div class='price_info'>";
				str += "							<div class='price'>";
				str += "								<div>";
				str += "									<div>";
				str += "										<strong>"+pkageList.min_price+"</strong>";
				str += "										<p>원~</p>";
				str += "									</div>";
				str += "								</div>";
				str += "							</div>";
				str += "							<div class='choice'>";
				str += "								<button type='button' class='choice-btn' id="+pkageList.pkage_id+">즐겨찾기</button>";
				str += "							</div>";
				str += "							<a href='/pkage/searchResult?toDesti="+pkageList.city_id+"&dates_start_check=2022-12-20&pkage_gubun="+pkageList.pkage_gubun+"&order=1' class='product_btn'><span>다른상품 더보기</span></a>";
				str += "						</div>";
				str += "					</div>";
				str += "				</li>";
			});
			return str += "</ul>";
	    }
	    
	    $("input:radio[name=order]").each(function() {
	    	if($(this).is(":checked")) {
	    		radioCheck = $(this).attr('id');
	    		$("." + $(this).attr('id')).css("color", "#5e2bb8");
			} else {
	    		$("." + $(this).attr('id')).css("color", "#111");
			}
		})
		
	    //$(document).on("click", ".inpt_checkbox", function() {
			//if($("input:radio[name=order]").is(":checked")) {
			if($(this).siblings().hasClass('item_order')) {
				console.log('this -> ' + $(this));
				//radioCheck = $(this).attr('id');
				//chk_Val.push($("input:radio[class=item_order]:checked").attr('id'));
				$("." + $(this).attr('id')).css("color", "purple");
				console.log("chk_Val -> " + chk_Val);
			}
		//})
		
		
		/* if($("input:radio[class=item_order]").is(":checked")) {
			alert('radio check');			
			$("input:radio[class=item_order]:checked").each(function(i) {
				chk_Val.push($(this).attr('id'));
					$("." + $(this).attr('id')).css("color", "purple");
			});
		} */
		if($("input:checkbox[class=inpt_checkbox]").is(":checked") || $("input:radio[name=order]").is(":checked")) {
			
			$("input:checkbox[class=inpt_checkbox]:checked").each(function(i) {
				chk_Val.push($(this).attr('id'));
					$("." + $(this).attr('id')).css("border-color", "purple");
					$("." + $(this).attr('id')).css("color", "purple");
			});
			
			$("input:checkbox[class=inpt_checkbox]").not(":checked").each(function(i) {
				$("."+ $(this).attr('id')).css("border-color", "#c2c2c2");
				$("."+ $(this).attr('id')).css("color", "#333");
			});
			console.log("chk_Val -> " + chk_Val);
			$.ajax({
				url: "/pkageFilter",
				data: {'radioCheck1': radioCheck, 'check':  chk_Val, 'search_word': $('#search_word').val(), 'currentPage': $('.current_page').val()},
				dataType: 'json',
				traditional: true,
				success: function(data) {
					console.log("data -> " + data);
					$('.prod_list').empty();
					$('.prod_list').html(toHTML(data));
				}
			});
		}
		else {
			$("."+ $(this).attr('id')).css("border-color", "#c2c2c2");
			$("."+ $(this).attr('id')).css("color", "#333");
			$.ajax({
				url: "/packageFilterReset",
				data: {'radioCheck1': radioCheck, 'search_word': $('#search_word').val(), 'currentPage': $('.current_page').val()},
				dataType: 'json',
				traditional: true,
				success: function(data) {
					console.log("data -> " + data);
					$('.prod_list').empty();
					$('.prod_list').html(toHTML(data));
					console.log("chk_Val -> " + chk_Val);
				}
			});
		}
		
	})
	
})

// Package 필터초기화 --(구분에 담겨있는거 비워야 됨)
$(function() {
	$(document).on("click", "#reset-btn", function() {
		let filterReset = [];
	    let sendHtml = function(li_html) {
	    	str = "<ul class='list pkg'>";
			console.log('li_html -> ' + li_html);
			li_html.forEach(function(pkageList) {
				str += "				<li>";
				str += "					<div>";
				str += "						<div class='img'>";
				str += "							<div class='group_area'>";
				str += "								<div class='label02'>예약가능</div>";
				str += "							</div>";
				str += "							<img src="+pkageList.pkage_Img_path+" title='' data-src='' alt=''>";
				str += "						</div>";
				str += "					<div class='txt_info'>";
				str += "							<div class='tit eps2'>";
				str += "								<strong>"+pkageList.pkage_name+"</strong>";
				str += "							</div>";
				str += "							<div class='type_1'>";
				str += "								<span>"+pkageList.period+"일</span> <span> "+new Date(pkageList.pkage_dt_startday).toLocaleString()+" ~ "+new Date(pkageList.pkage_dt_endday).toLocaleString()+"</span>";
				str += "							</div>";
				str += "							<div class='type_2'>";
				str += "								<span class='air_icon'>"+pkageList.air_name+" </span>";
				str += "								<span>"+pkageList.start_airport_name+"출발</span>";
				str += "							</div>";
				str += "							<div class='type_2'>";
				str += "								<span class='ic_note'>"+pkageList.pkage_dt_thema+"</span>";
				str += "							</div>";
				str += "							<div class='type_3'>";
				str += "								<span class='ic_location'>"+pkageList.country_name+", "+pkageList.city_name+"</span>";
				str += "							</div>";
				str += "							<div class='rating'>";
				str += "								<strong>"+pkageList.pkage_score+"</strong> <span>("+pkageList.review_cnt+")</span>";
				str += "							</div>";
				str += "						</div>";
				str += "						<div class='price_info'>";
				str += "							<div class='price'>";
				str += "								<div>";
				str += "									<div>";
				str += "										<strong>"+pkageList.min_price+"</strong>";
				str += "										<p>원~</p>";
				str += 										"<div class='choice'>";
				if(pkageList.chk == 0) {
					str += "<button type='button' class='choice-btn' id="+pkageList.pkage_id+">즐겨찾기</button>";
				}
				else {
					str += "<button type='button' class='choice-btn' id="+pkageList.pkage_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
				}
				str += 										"</div>";
				str += "									</div>";
				str += "								</div>";
				str += "							</div>";
				str += "							<a href='/pkage/searchResult?toDesti="+pkageList.city_id+"&dates_start_check=2022-12-20&pkage_gubun="+pkageList.pkage_gubun+"&order=1' class='product_btn'><span>다른상품 더보기</span></a>";
				str += "						</div>";
				str += "					</div>";
				str += "				</li>";
			});
			return str + "</ul>";
	    }
		$.ajax({
			url: "/packageFilterReset",
			data: {'search_word': $('#search_word').val(), 'currentPage': $('.current_page').val()},
			dataType: 'json',
			success: function(data) {
				console.log("data -> " + data);
				$('.prod_list').empty();
				$('.prod_list').html(sendHtml(data));
			    $(".label_checkbox").css("color", "#666");
			    $(".label_checkbox").css("border-color", "#c2c2c2");
			}
		});
	})
})

// Hotel 필터 선택
$(function() {
	$(document).on("click", ".inpt_checkbox_h", function() {
		console.log($(this).siblings());
		let chk_Val = [];
	    let radioCheck = '';
	    let toHTML = function(li_html) {
	    	str = "			<ul class='list htl eps4'>";
			console.log('li_html -> ' + li_html);
			li_html.forEach(function(hotelList) {
				str += 				"<li>";
				str += 					"<div>";
				str += 						"<div class='img'>";
				str += 							"<div class='group_area'>";
				str += 							"</div>";
				str += 							"<img src="+hotelList.h_img_path+" title='' data-src='' alt=''>";
				str += 						"</div>";
				str += 						"<div class='txt_info'>";
				str += 							"<div class='tit eps2'>";
				str += 								"<strong>"+hotelList.hotel_kor+"</strong>";
				str += 							"</div>";
				str += 							"<div class='type_1'>";
				str += 								"<span>호텔</span> <span>"+hotelList.hotel_grade+"성급</span>";
				str += 							"</div>";
				str += 							"<div class='type_2'>";
				str += 								"<span>"+hotelList.country_name+"</span> <span>"+hotelList.city_name+"</span>";
				str += 							"</div>";
				str += 							"<div class='rating'>";
				str += 								"<strong>"+hotelList.hotel_score+"</strong> <span>("+hotelList.review_cnt+")</span>";
				str += 							"</div>";
				str += 							"<div class='price'>";
				str += 								"<div>";
				str += 									"<div>";
				str += 										"<strong>"+hotelList.room_min_price+"</strong>";
				str += 										"<p>원~</p>";
				str += 										"<div class='choice'>";
				if(hotelList.chk == 0) {
					str += "<button type='button' class='choice-btn' id="+hotelList.hotel_id+">즐겨찾기</button>";
				}
				else {
					str += "<button type='button' class='choice-btn' id="+hotelList.hotel_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
				}
				str += 										"</div>";
				str += 									"</div>";
				str += 								"</div>";
				str += 							"</div>";
				str += 						"</div>";
				str += 					"</div>";
				str += 				"</li>";
			});
			return str += "</ul>";
	    }
	    
	    $("input:radio[name=order]").each(function() {
	    	if($(this).is(":checked")) {
	    		radioCheck = $(this).attr('id');
	    		chk_Val.push($(this).attr('id'));
	    		$("." + $(this).attr('id')).css("color", "#5e2bb8");
			} else {
	    		$("." + $(this).attr('id')).css("color", "#111");
			}
		})
		
			if($(this).siblings().hasClass('item_order')) {
				console.log('this -> ' + $(this));
				chk_Val.push($(this).siblings('input[type="radio"]').attr('id'));
				$("." + $(this).attr('id')).css("color", "purple");
				console.log("chk_Val -> " + chk_Val);
			}
		
		if($("input:checkbox[class=inpt_checkbox_h]").is(":checked") || $("input:radio[name=order]").is(":checked")) {
			$("input:checkbox[class=inpt_checkbox_h]:checked").each(function(i) {
				chk_Val.push($(this).attr('id'));
					$("." + $(this).attr('id')).css("border-color", "purple");
					$("." + $(this).attr('id')).css("color", "purple");
			});
			
			$("input:checkbox[class=inpt_checkbox_h]").not(":checked").each(function(i) {
				$("."+ $(this).attr('id')).css("border-color", "#c2c2c2");
				$("."+ $(this).attr('id')).css("color", "#333");
			});
			console.log("hotel Chk_val = " + chk_Val);
			
			$.ajax({
				url: "/hotelFilter",
				data: {'radioCheck1': radioCheck, 'check':  chk_Val, 'search_word': $('#search_word').val(), 'currentPage': $('.current_page').val()},
				dataType: 'json',
				traditional: true,
				success: function(data) {
					console.log(data);
					$('.prod_list').empty();
					$('.prod_list').html(toHTML(data));
				}
			});
		}
		else {
			$("."+ $(this).attr('id')).css("border-color", "#c2c2c2");
			$("."+ $(this).attr('id')).css("color", "#333");
			$.ajax({
				url: "/hotelFilterReset",
				data: {'search_word': $('#search_word').val(), 'currentPage': $('.current_page').val()},
				dataType: 'json',
				traditional: true,
				success: function(data) {
					console.log("success data -> " + data);
					$('.prod_list').empty();
					$('.prod_list').html(toHTML(data));
				}
			});
		}
		
	})
	
})

//hotel 필터초기화 --(구분에 담겨있는거 비워야 됨)
$(function() {
	$(document).on("click", "#reset-btn_h", function() {
		let filterReset = [];
	    let sendHtml = function(li_html) {
	    	str = "			<ul class='list htl eps4'>";
			console.log('li_html -> ' + li_html)
			li_html.forEach(function(filteredHotelList) {
				str += 				"<li>";
				str += 					"<div>";
				str += 						"<div class='img'>";
				str += 							"<div class='group_area'>";
				str += 							"</div>";
				str += 							"<img src="+filteredHotelList.h_img_path+" title='' data-src='' alt=''>";
				str += 						"</div>";
				str += 						"<div class='txt_info'>";
				str += 							"<div class='tit eps2'>";
				str += 								"<strong>"+filteredHotelList.hotel_kor+"</strong>";
				str += 							"</div>";
				str += 							"<div class='type_1'>";
				str += 								"<span>호텔</span> <span>"+filteredHotelList.hotel_grade+"성급</span>";
				str += 							"</div>";
				str += 							"<div class='type_2'>";
				str += 								"<span>"+filteredHotelList.country_name+"</span> <span>"+filteredHotelList.city_name+"</span>";
				str += 							"</div>";
				str += 							"<div class='rating'>";
				str += 								"<strong>"+filteredHotelList.hotel_score+"</strong> <span>("+filteredHotelList.review_cnt+")</span>";
				str += 							"</div>";
				str += 							"<div class='price'>";
				str += 								"<div>";
				str += 									"<div>";
				str += 										"<strong>"+filteredHotelList.room_min_price+"</strong>";
				str += 										"<p>원~</p>";
				str += 										"<div class='choice'>";
				if(this.chk == 0) {
					str += "<button type='button' class='choice-btn' id="+filteredHotelList.hotel_id+">즐겨찾기</button>";
				}
				else {
					str += "<button type='button' class='choice-btn' id="+filteredHotelList.hotel_id+" style='background-position: -458px -26px;'>즐겨찾기</button>";
				}
				str += 										"</div>";
				str += 									"</div>";
				str += 								"</div>";
				str += 							"</div>";
				str += 						"</div>";
				str += 					"</div>";
				str += 				"</li>";
			});
			return str += "</ul>";
	    }
		$.ajax({
			url: "/hotelFilterReset",
			data: {'search_word': $('#search_word').val(), 'currentPage': $('.current_page').val()},
			dataType: 'json',
			success: function(data) {
				console.log(data);
				$('.prod_list').empty();
				$('.prod_list').html(sendHtml(data));
			    $(".label_checkbox").css("color", "#666");
			    $(".label_checkbox").css("border-color", "#c2c2c2");
			    $(".label_checkbox_h").css("color", "#666");
			    $(".label_checkbox_h").css("border-color", "#c2c2c2");
			}
		});
	})
})

</script>
</html>