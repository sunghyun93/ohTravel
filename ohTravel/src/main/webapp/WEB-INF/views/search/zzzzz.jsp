<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search/newCss.css">
</head>
<body>
	<div class="ly_wrap list_result_wrap">
		<div class="inr filter">
			<strong class="tit">필터</strong>
			<div class="js_acc multi filter_wrap">
				<div class="inr">
					<a href="#filter-6" class="header active">여행 기간</a>
					<div id="filter-6" class="view active" style="display: block;">
						<div class="form_wrap">
							<span class="form_holder text"><input type="checkbox"
								id="trvlDayCnt-0" class="inpt_checkbox"> <label
								for="trvlDayCnt-0" class="label_checkbox"> 7일 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="trvlDayCnt-1" class="inpt_checkbox"> <label
								for="trvlDayCnt-1" class="label_checkbox"> 5일 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="trvlDayCnt-2" class="inpt_checkbox"> <label
								for="trvlDayCnt-2" class="label_checkbox"> 4일 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="trvlDayCnt-3" class="inpt_checkbox"> <label
								for="trvlDayCnt-3" class="label_checkbox"> 3일 </label></span>
						</div>
					</div>
				</div>
				<div class="inr">
					<a href="#filter-9" class="header active">가격</a>
					<div id="filter-9" class="view active" style="display: block;">
						<div class="form_wrap">
							<span class="form_holder text"><input type="checkbox"
								id="adtMinAmt-0" class="inpt_checkbox"> <label
								for="adtMinAmt-0" class="label_checkbox"> 6~120만원 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="adtMinAmt-1" class="inpt_checkbox"> <label
								for="adtMinAmt-1" class="label_checkbox"> 120~206만원 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="adtMinAmt-2" class="inpt_checkbox"> <label
								for="adtMinAmt-2" class="label_checkbox"> 206~294만원 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="adtMinAmt-3" class="inpt_checkbox"> <label
								for="adtMinAmt-3" class="label_checkbox"> 294~1170만원 </label></span>
						</div>
						<a href="#none" class="btn gray">직접입력</a>
					</div>
				</div>
				<div class="inr">
					<a href="#filter-12" class="header active">출발 도시</a>
					<div id="filter-12" class="view active" style="display: block;">
						<div class="form_wrap">
							<span class="form_holder text"><input type="checkbox"
								id="depCityCds-0" class="inpt_checkbox"> <label
								for="depCityCds-0" class="label_checkbox"> 인천 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depCityCds-1" class="inpt_checkbox"> <label
								for="depCityCds-1" class="label_checkbox"> 부산 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depCityCds-2" class="inpt_checkbox"> <label
								for="depCityCds-2" class="label_checkbox"> 대구 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depCityCds-3" class="inpt_checkbox"> <label
								for="depCityCds-3" class="label_checkbox"> 김포시 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depCityCds-4" class="inpt_checkbox"> <label
								for="depCityCds-4" class="label_checkbox"> 제주시 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depCityCds-5" class="inpt_checkbox"> <label
								for="depCityCds-5" class="label_checkbox"> 양양군 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depCityCds-6" class="inpt_checkbox"> <label
								for="depCityCds-6" class="label_checkbox"> 무안군 </label></span>
						</div>
					</div>
				</div>
				<div class="inr">
					<a href="#filter-14" class="header active">출발 시간</a>
					<div id="filter-14" class="view active" style="display: block;">
						<div class="form_wrap">
							<span class="form_holder text"><input type="checkbox"
								id="depTms-0" class="inpt_checkbox"> <label
								for="depTms-0" class="label_checkbox"> 05~12시 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depTms-1" class="inpt_checkbox"> <label
								for="depTms-1" class="label_checkbox"> 12~18시 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depTms-2" class="inpt_checkbox"> <label
								for="depTms-2" class="label_checkbox"> 18~24시 </label></span>
						</div>
					</div>
				</div>
				<div class="inr">
					<a href="#filter-15" class="header active">항공사</a>
					<div id="filter-15" class="view active" style="display: block;">
						<div class="form_wrap">
							<span class="form_holder text"><input type="checkbox"
								id="depAirCds-0" class="inpt_checkbox"> <label
								for="depAirCds-0" class="label_checkbox"> 대한항공 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-1" class="inpt_checkbox"> <label
								for="depAirCds-1" class="label_checkbox"> 베트남 항공 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-2" class="inpt_checkbox"> <label
								for="depAirCds-2" class="label_checkbox"> 아시아나항공 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-3" class="inpt_checkbox"> <label
								for="depAirCds-3" class="label_checkbox"> 에어부산 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-4" class="inpt_checkbox"> <label
								for="depAirCds-4" class="label_checkbox"> 에어프레미아 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-5" class="inpt_checkbox"> <label
								for="depAirCds-5" class="label_checkbox"> 에어서울 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-6" class="inpt_checkbox"> <label
								for="depAirCds-6" class="label_checkbox"> 전일본공수 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-7" class="inpt_checkbox"> <label
								for="depAirCds-7" class="label_checkbox"> 제주항공 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-8" class="inpt_checkbox"> <label
								for="depAirCds-8" class="label_checkbox"> 진에어 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-9" class="inpt_checkbox"> <label
								for="depAirCds-9" class="label_checkbox"> 퀸비틀 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-10" class="inpt_checkbox"> <label
								for="depAirCds-10" class="label_checkbox"> 티웨이항공 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-11" class="inpt_checkbox"> <label
								for="depAirCds-11" class="label_checkbox"> 플라이강원 </label></span><span
								class="form_holder text"><input type="checkbox"
								id="depAirCds-12" class="inpt_checkbox"> <label
								for="depAirCds-12" class="label_checkbox"> 피치항공 </label></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="inr right">
			<div class="option_wrap result">
				<span class="count"><em>174</em>개</span>
				<div class="right_cont">
					<ul class="list_sort">
						<li class="item01"><a href="#"><em>하나투어 랭킹순</em></a> <span class="tooltip em"><span class="tooltiptext">하나투어 랭킹순은 상품의 판매실적, 사용자 선호도, 검색 정확도 등을 종합적으로 고려한 순위입니다.</span></span></li>
						<li class="item01"><a href="#">구매순</a></li>
						<li class="item01"><a href="#">평점순</a></li>
						<li class="item01"><a href="#">낮은 가격순</a></li>
						<li class="item01"><a href="#">출발시간 빠른순</a></li>
					</ul>
				</div>
			</div>
			<div>
				<div class="prod_list">
					<ul class="list pkg">
						<li>
							<div>
								<div class="img">
									<div class="group_area">
										<div class="label02">예약가능</div>
									</div>
									<img
										src="https://image.hanatour.com/usr/cms/resize/400_0/2018/06/05/10000/921641f0-231f-4609-bc48-c13b4d379ee0.jpg"
										title="" data-src="" alt="">
								</div>
								<div class="txt_info">
									<div class="tit eps2">
										<strong>[굿바이2022 특별가] 도쿄 3일 #1일자유 #아사쿠사숙박 #오다이바</strong>
									</div>
									<div class="type_1">
										<span>2박 3일</span> <span> 12.14.수 08:05 ~ 12.16.금 13:30
										</span>
									</div>
									<div class="type_2">
										<span class="air_icon"><img src="https://image.hanatour.com//usr/static/img/airline/BX.png"
											title="" data-src="" alt=""> 에어부산 </span> <span> 잔여석<strong>10</strong></span>
										<span>부산출발</span> <span>가이드동행</span> <span> 쇼핑<strong>1</strong></span>
									</div>
									<div class="type_2">
										<span class="ic_note">패키지</span> <span>세이브</span> <span>관광+자유</span>
										<span>단체</span>
									</div>
									<div class="type_3">
										<span class="ic_location">도쿄(동경)</span>
									</div>
									<div class="rating">
										<strong>4.8</strong> <span>(2)</span>
									</div>
								</div>
								<div class="price_info">
									<div class="price">
										<div>
											<div>
												<strong>599,900</strong>
												<p>원</p>
											</div>
										</div>
									</div>
									<div class="label">
										<span class="label_4">선발권특가</span>
									</div>
									<a href="#none" class="product_btn"><span>다른상품 더보기</span></a>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div data-v-7bb9d6c4="" class="paginate_wrap">
					<div class="paginate type2">
						<div>
							<a href="#none" class="direction prevend" style="display: none;">처음</a>
							<a href="#none" class="direction prev" style="display: none;">이전</a>
							<span><strong>1</strong><a href="#none">2</a><a
								href="#none">3</a><a href="#none">4</a><a href="#none">5</a><a
								href="#none">6</a><a href="#none">7</a><a href="#none">8</a><a
								href="#none">9</a></span> <a href="#none" class="direction next"
								style="display: none;">다음</a> <a href="#none"
								class="direction nextend" style="display: none;">끝</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>