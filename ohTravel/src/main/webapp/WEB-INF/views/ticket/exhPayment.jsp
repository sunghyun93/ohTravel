<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<!-- jQuery --> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
<!-- iamport.payment.js --> 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<style>
/* required (빨간색) */
.table-row .required:after {
	display: inline-block;
	content: "*";
	margin: 1px 0 0 4px;
	font-size: 12px;
	line-height: 12px;
	color: #e55a72;
	vertical-align: middle;
}

/* 상품 정보 css */
.product-detail {
	margin-top: 20px;
	padding: 30px 40px;
	background-color: #f7f7f7;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
}

.product-detail .product-type .item:first-child {
	margin-top: 0;
}

.product-detail .product-type .item {
	display: flex;
	color: #666;
	margin-top: 20px;
}

.product-detail .product-type .item strong {
	width: 160px;
}

/* 사용일 기준 1일전까지 무료 취소 가능 */
.product-detail .product-type .cancel-notice {
	margin-top: 35px;
}

.product-detail .product-type .cancel-notice li {
	font-size: 12px;
	color: #e55a72;
	margin-bottom: 12px;
}

/* 쿠폰 할인 */
.sale-content {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.sale-content .btn-select-coupon {
	position: absolute;
	top: 20px;
	right: 0;
}

.el-button--primary {
	color: #fff;
	background-color: #f06c5e;
}

.el-button--medium, .el-button--small {
	min-width: 80px;
	height: 35px;
	line-height: 35px;
	padding: 0 18px;
	font-size: 13px;
	font-weight: 700;
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	border-bottom-left-radius: 7px;
}
/* 할인 쿠폰 선택 */
button>span {
	position: relative;
	display: inline-block;
	vertical-align: top;
}

.sale-content .coupon-list .list .no-item {
	padding: 10px 0;
}

/* 결제 방법 선택 */
.select-payment {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.order-wrap .radio-group .el-form-item, .order-wrap .radio-group .el-radio-group
	{
	display: block;
}

.order-wrap[data-v-6de10866] .el-form-item {
	margin: 0;
	display: inline-block;
	vertical-align: top;
}

.el-form-item {
	margin: 25px 0 0;
	margin-bottom: 22px;
}

.el-form-item:after, .el-form-item:before {
	display: table;
	content: "";
}

.el-form-item__content {
	line-height: 40px;
	position: relative;
	font-size: 14px;
}

.el-radio-group {
	display: inline-block;
	line-height: 1;
	vertical-align: middle;
	font-size: 0;
}

.select-payment .radio-group .el-radio[data-v-6de10866] {
	vertical-align: top;
}

.order-wrap .radio-group .el-radio[data-v-6de10866] {
	width: 25%;
}

.el-radio {
	color: #606266;
	font-weight: 500;
	line-height: 1;
	cursor: pointer;
	white-space: nowrap;
	outline: 0;
}

.el-radio, .el-radio--medium.is-bordered .el-radio__label {
	font-size: 14px;
}

.el-radio, .el-radio__inner, .el-radio__input {
	position: relative;
	display: inline-block;
}

.el-radio .el-radio__input {
	vertical-align: top;
}

.el-radio__input {
	white-space: nowrap;
	cursor: pointer;
	outline: 0;
	line-height: 1;
	vertical-align: middle;
}

.el-radio.is-checked .el-radio__inner {
	background: #715fc7;
	border-color: #715fc7;
	-webkit-transition: background .3s;
	transition: background .3s;
}

.el-radio .el-radio__inner {
	width: 18px;
	height: 18px;
	border: none;
	background-color: #ccc;
}

.el-radio__input.is-checked .el-radio__inner:after {
	transform: translate(-50%, -50%) scale(1);
}

.el-radio .el-radio__inner:after {
	width: 5px !important;
	height: 5px !important;
	background-color: #fff !important;
}

.el-radio .el-radio__input.is-checked+.el-radio__label {
	color: #666;
}

.el-radio__input.is-checked+.el-radio__label {
	color: #409eff;
}

.el-radio .el-radio__label {
	padding-left: 8px;
	color: #666;
	vertical-align: top;
	line-height: 16px;
}

.el-radio__label {
	font-size: 14px;
	padding-left: 10px;
}

/* 내용 약관 */
.el-checkbox {
	color: #606266;
	font-size: 14px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.el-checkbox, .el-checkbox__input {
	display: inline-block;
	position: relative;
	white-space: nowrap;
}

.el-button, .el-checkbox {
	-ms-user-select: none;
	font-weight: 500;
}

.el-checkbox .el-checkbox__input .el-checkbox__inner {
	border-radius: 3px;
	background: #ccc;
	border-color: #ccc;
}

.el-checkbox .el-checkbox__inner {
	width: 18px;
	height: 18px;
	border: none;
}

.el-checkbox .el-checkbox__inner:before {
	font-family: Mohaji-Icons;
	font-style: normal;
	font-weight: 400;
	content: "";
	font-size: 18px;
	color: #fff;
}

.terms-agree .el-checkbox__label {
	font-size: 15px;
	font-weight: 700;
	color: #333;
}

.el-checkbox .el-checkbox__label {
	padding-left: 8px;
	vertical-align: top;
	line-height: inherit;
}

/* 개인정보 수집 및 이용 동의 */
.terms-agree .inner .box.full {
	width: 100%;
	-webkit-box-flex: 1;
	flex: auto;
}

.terms-agree .inner .box {
	width: 49%;
	margin-bottom: 20px;
}

.terms-agree .inner .box .item {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	padding: 18px 28px;
	background-color: #f7f7f7;
}

.terms-agree .inner .box .detail-wrap {
	border: 1px solid #e5e5e5;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-top: 0;
	padding: 20px 0;
	font-size: 13px;
}

.terms-agree .inner .box .detail-wrap table {
	margin-bottom: 20px;
}

.table-row {
	width: 100%;
	table-layout: fixed;
	border-top: 1px solid #999;
	border-bottom: 1px solid #999;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.terms-agree .inner .box .detail-wrap[data-v-6de10866] table th {
	width: 180px;
	padding: 17px 20px 15px;
}

.table-row th {
	min-width: 120px;
	padding: 22px 20px 20px;
	font-weight: 700;
	text-align: left;
	background: #f7f7f7;
	color: #333;
	vertical-align: top;
	line-height: 1.6;
}

.table-row td {
	padding: 15px 12px;
	vertical-align: middle;
	line-height: 1.6;
	color: #666;
}

/* 취소 및 환불정책 */
.terms-agree .inner .box {
	width: 49%;
	margin-bottom: 20px;
}

.terms-agree .inner .box .item {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	padding: 18px 28px;
	background-color: #f7f7f7;
}

.terms-agree .inner .box .detail h1 {
	font-size: 15px;
	margin-bottom: 10px;
}

.terms-agree .inner .box .detail h2 {
	margin-bottom: 5px;
}

.terms-agree .inner .box .detail li {
	position: relative;
	padding-left: 20px;
	word-spacing: 3px;
	line-height: 20px;
}

.terms-agree .inner .box[data-v-6de10866] .detail {
	height: 180px;
	overflow-y: auto;
	margin: 0 15px 0 28px;
	padding: 5px 13px 30px 0;
	color: #666;
	line-height: 1.6;
	box-sizing: border-box;
}

col {
	display: table-column;
}
</style>

<body>
	<div id="container">
		<div class="inr" style="min-height: 70vh;">
			<div class="contents fontCtrl" id="contents">
				<!-- text_wrap -->
				<div class="ly_wrap pay_info">
					<div class="inr">
						<!-- 기본주문정보 -->
						<div class="text_wrap mid">
							<strong class="tit" style="font-weight: 500;">기본주문정보</strong>
						</div>
						<!-- text_wrap -->
						<div class="tbl">
							<table class="type2">
								<colgroup>
									<col style="width: 17%;" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td><input type="text" placeholder="${sessionName }" style="width:174px; height:29px;" readonly></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="email" placeholder="${sessionEmail }" readonly></td>
									</tr>
									<tr>
										<th>휴대전화 번호</th>
										<td><input type="tel" placeholder="${sessionTel}" readonly></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- tbl -->

						<!-- 상품 정보 -->
						<div class="text_wrap mid">
							<strong class="tit" style="font-weight: 500;">상품 정보</strong>
						</div>
						<!-- text_wrap -->

						<div class="product-detail" style="height: 212px; background: #F7F7F7;">
							<div class="product-info" style="margin-bottom: 25px;">
								<p class="product-title" style="font-weight: 700; font-size: 16px;"></p>
							</div>
							<div class="product-type">
								<div class="item">
									<strong style="font-weight: 700;">상품명</strong>
									<div>${ticket_name}</div>
								</div>
								<div class="item">
									<strong style="font-weight: 700;">사용일</strong>
									<div>${adDate }</div>
								</div>
								<div class="item">
									<strong style="font-weight: 700;">인원 옵션</strong>
									<div>성인 ${adultCnt} / 아동 ${childCnt}</div>
								</div>
								<ul class="cancel-notice">
									<li>사용일 기준 1일 전까지 무료 취소 가능</li>
								</ul>
							</div>
						</div>

						<!-- text_wrap -->
						<%-- <div class="text_wrap mid">
							<!-- 약관동의 -->
							<div class="terms-agree checkbox_group" style="margin-top: 80px;">
								<div class="payment-agree" style="padding-bottom: 30px;">
									<label role="checkbox" class="el-checkbox">
									<span aria-checked="mixed" class="el-checkbox__input">
										<input type="checkbox" name="check_all" id="chk" class="el-checkbox__original chkAll" svalue="내용을 모두 확인하였으며 결제에 동의합니다.">
									</span>
									<span class="el-checkbox__label">내용을 모두 확인하였으며 결제에 동의합니다.</span>
									</label>
								</div>

								<!-- 개인정보 수집 및 이용 동의 -->
								<div class="inner">
									<div class="box full">
										<div class="item">
											<label role="checkbox" class="el-checkbox">
											<input type="checkbox" name="check_1" class="el-checkbox__original normal">
												<span class="el-checkbox__label"> <span>개인정보 수집 및 이용 동의 <span class="require" style="color: #e55973;">(필수)</span>
												</span>
											</span>
											</label>
										</div>
										<div class="detail-wrap">
											<div class="detail" style="padding: 10px 30px 20px 30px;">
												<strong>동의를 거부할 권리 및 동의를 거부할 경우의 불이익</strong>
												<p style="margin-bottom: 15px;">개인정보주체는 개인정보 수집 및 이용 동의를
													거부할 권리가 있습니다. 동의를 거부할 경우 여행상품 예약 서비스 이용이 불가함을 알려드립니다.</p>
												<table class="table-row repeat">
													<colgroup style="display: table-column-group;">
														<col style="width: 33.3%">
														<col style="width: 33.3%">
														<col style="width: 33.3%">
													</colgroup>
													<thead>
														<tr>
															<th>개인정보 수집 및 이용 항목</th>
															<th>개인정보 수집 및 이용 목적</th>
															<th>개인정보 수집 및 이용 기간</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>예약자: 이름, 이메일, 휴대전화번호 <br> 여행자: -
															</td>
															<td>여행상품 예약 및 상담</td>
															<td>서비스 제공 및 관계법령에 따른 보존 기간 <br> 미결제 취소 정보: 예약
																취소일로부터 3개월
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<!-- 왼쪽 : 취소 및 환불정책 -->
									<div class="box" style="display: inline-block; height:">
										<div class="item">
											<label role="checkbox" class="el-checkbox"> <span aria-checked="mixed" class="el-checkbox__input">
											<input type="checkbox" id="check_2" name="chk" class="el-checkbox__original normal">
											</span> <span class="el-checkbox__label"> <span>취소 및 환불정책 <span class="require">(필수)</span>
												</span>
											</span>
											</label>
										</div>
										<div class="detail-wrap" style="height: 446.78px;">
											<div class="detail" style="padding: 0 20px 20px 20px;">
												<h1>취소 및 환불 정책</h1>
												<h1>제22조 (반품/환불/취소)</h1>
												<ol>
													<li>① ’전자상거래 등에서의 소비자보호에 관한 법률’ 제17조에 따라 구매자는 상품을 배송받은
														날로부터 7일 이내에 반품을 요청할 수 있으며, 반품에 관한 일반적인 사항은 ’전자상거래 등에서의
														소비자보호에 관한 법률’ 등 관련 법령이 판매자가 제시한 조건보다 우선합니다. 단, 다음 각 호의
														경우에는 구매자가 반품을 요청할 수 없습니다.
														<ol>
															<li>1. 구매자의 귀책사유로 말미암아 상품이 훼손된 경우</li>
															<li>2. 구매자의 사용 또는 일부 소비로 말미암아 상품의 가치가 현저히 감소한 경우</li>
															<li>3. 시간이 지나 재판매가 어려울 정도로 상품의 가치가 현저히 감소한 경우</li>
															<li>4. 복제가 가능한 상품의 포장을 훼손한 경우</li>
															<li>5. 기타 구매자가 환불을 요청할 수 없는 합리적인 사유가 있는 경우</li>
														</ol>
													</li>
												</ol>
											</div>
										</div>
									</div>

									<!-- 오른쪽 : 개인정보 제 3자 제공 -->
									<div class="box" style="display: inline-block; translate: 0 -310px; height: 532px;">
										<div class="item">
											<label role="checkbox" class="el-checkbox">
											<span aria-checked="mixed" class="el-checkbox__input">
												<input type="checkbox" id="check_3" name="chk" class="el-checkbox__original normal">
											</span> <span class="el-checkbox__label"> <span>개인정보 제 3자 제공 <span class="require">(필수)</span>
												</span>
											</span>
											</label>
										</div>

										<div class="detail-wrap" style="padding: 20px 20px 20px 20px;" style="height: 446.78px;">
											<div class="detail">
												<p style="margin-bottom: 15px; padding: 0 10px 10px 15px;">고객님께서는
													아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 상품 배송(예약), 고객상담이 제한됩니다.</p>
												<table class="table-row repeat">
													<colgroup style="display: table-column-group;">
														<col>
														<col>
													</colgroup>
													<tbody>
														<tr>
															<th style="width: 120px;">제공 받는자</th>
															<td>ohTravel</td>
														</tr>
														<tr>
															<th>목적</th>
															<td>주문 상품의 배송(예약), 고객상담 및 불만처리</td>
														</tr>
														<tr>
															<th>항목</th>
															<td>예약자 : 이름 , 이메일, 휴대전화번호 <br> 여행자 : -
															</td>
														</tr>
														<tr>
															<th>보유기간</th>
															<td>구매확정 후 3개월까지</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> --%>
						<!-- text_wrap -->

					</div>
					<!-- inr -->
					<div class="inr right"
						style="right: auto; left: 0px; width: 306px;">
						<div class="text_wrap mid">
							<strong class="tit">결제 정보</strong>
						</div>
						<!-- text_wrap -->
						<div class="js_acc multi filter_wrap">
							<div class="pay_area">
								<div class="info_area total">
									<div class="info">
										<strong class="tit">최종 결제 금액</strong>
										<span>성인 ${adultCnt}</span>
										<span class="divider_dot">아동 ${childCnt }</span>
									</div>
									<div class="mileage_save"></div>
									<!-- mileage_ave -->
									<strong class="price">${totalPay }<span>원</span></strong>
									<div class="mileage_save">
										<p>
											마일리지 적립, 결제 <strong style="color: #f06c5e;">불가 상품</strong>입니다.
										</p>
									</div>
									<!-- mileage_save -->
								</div>
								<!-- info_area total -->
								<div class="info_area">
									<div class="info">
										<strong class="tit">총 상품 금액</strong> <span>${totalPay}원</span>
									</div>
								</div>
								<!-- info_area -->
							</div>
							<!-- pay_area -->
							<div class="btn_wrap">
								<button id="payBtn" type="button" class="btn big pink btn-rsv" style="width:306px; height: 56px; line-height: 54px;">결제하기 </button>
							</div>
						</div>
						<!-- js_acc -->
					</div>
					<!-- inr right -->
				</div>
				<!-- ly_wrap -->
			</div>
			<!-- contents -->
		</div>
		<!-- inr -->
	</div>
	<!-- container -->

	
	<!-- 찐예약 -->
 	<form action="/ticket/realReserve" id="payment" method="post">
		<input type="hidden" name="ticket_id"   value="">
		<input type="hidden" name="mem_id"      value="">	
		<input type="hidden" name="ticket_name" value="">
		
		<input type="hidden" name="ticket_admission_date" value="">
		
		<input type="hidden" name="ticket_adult_per"   value="">
		<input type="hidden" name="ticket_child_per"   value="">
		<input type="hidden" name="ticket_total_price" value="">
	</form>
	<form id="ticketResultForm">
		<input type="hidden" name="ticket_order_id" value="">
	</form>
	
	<script>
		$('#payBtn').click(function() {
			requestPay();
		})
	
		// 사용일 받아오기 위한 자바스크립트 날짜 포맷 함수 (yyyy-mm-dd)
		function dateFormat(date) {
			let dateFormat2 = date.getFullYear() +
				'-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
				'-' + ( (date.getDate()) < 9 ? "0" + (date.getDate()) : (date.getDate()) );
			return dateFormat2;
		}
		
		var ticket_admission_date =  dateFormat(new Date('${adDate}'));		// 사용일 (=입장일)
		console.log(ticket_admission_date);

		
		/* 결제 API */
	    function requestPay() {
			
			// 예약 DB에 저장 & 결제
	    	//가져가야 할 값 : 티켓코드, 회원 ID, 사용일, 성인 인원, 아동 인원, 총 금액
			let ticket_id			  = '${ticket_id}';
			let mem_id				  = '${sessionId}';
			let ticket_name 		  = '${ticket_name}';
			
			let ticket_adult_per 	  	  = ${adultCnt};	// 성인 인원 수
			let ticket_child_per = ${childCnt};	// 아동 인원 수
			let ticket_total_price 	  	  = ${totalPay};

			$('input[name=ticket_id]').attr('value', ticket_id);
			$('input[name=mem_id]').attr('value', mem_id);
			$('input[name=ticket_name]').attr('value', ticket_name);
			$('input[name=ticket_admission_date]').attr('value', ticket_admission_date);
			$('input[name=ticket_adult_per]').attr('value', ticket_adult_per);
			$('input[name=ticket_child_per]').attr('value', ticket_child_per);
			$('input[name=ticket_total_price]').attr('value', ticket_total_price);
			
            var IMP = window.IMP; // 생략가능
            IMP.init('imp26451542');
            IMP.request_pay({
                pg: 'html5_inicis',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '${ticket_name}',
                //결제창에서 보여질 이름
                amount: 100,
                //가격
                buyer_email: 'abcMartek@siot.do',
                buyer_name: '김성현', //구매자 이름
                buyer_tel: '010-2878-7531',
                buyer_addr: '서울특별시 강남구 삼성동',
                buyer_postcode: '123-456',
            }, function (rsp) {
                console.log(rsp);
                 if (rsp.success) {
                	 $.ajax({
                		 url: "${pageContext.request.contextPath}/ticket/realReserve", //가맹점 서버
                		 type: "POST",
                		 data: $('#payment').serialize(),
                         success: function(data){
                        	 //alert(data);
                        	 alert('구매자 님의 결제가 완료되었습니다.');
		                     location.href = "${pageContext.request.contextPath}/ticket/reservationComplete";
                             },
                             error: function(err){
                                var msg2 = '결제에 실패하였습니다.';
                                alert(msg2);
                             }
                      })
            }
        })
   }  
		
	// 체크박스 전체 선택
	$(".checkbox_group").on("click", "#check_all", function () {
	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});
	
	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
	    var is_checked = true;
	
	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	
	    $("#check_all").prop("checked", is_checked);
	});
	</script>

</body>
</html>