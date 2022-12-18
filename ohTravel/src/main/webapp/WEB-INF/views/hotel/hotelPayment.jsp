<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
</head>
<style>
.btn::before {
	background-color: #5e2bb8;
}

.paybtn {
	margin-top: 20px;	
}

#container .inr {

	min-height: 1000px;
}

.agreerow{

	padding-bottom:20px;
}
</style>
<body>
	<div id="container">
		<div class="inr">
			<div class="contents fontCtrl" id="contents">
				<div class="text_wrap big">
					<strong class="tit">예약하기</strong>
					<div class="right_cont">
						<div class="step_wrap">
						    <ol class="step">
						        <li class="on"><span class="num num1 step_txt">예약정보확인</span></li>
						        <li class=""><span class="num num2 step_txt">옵션정보/약관결제</span></li>
						        <li class=""><span class="num num3 step_txt">결제완료</span></li>
						    </ol>
						</div>	<!-- step_wrap -->
					</div>	<!-- right_cont -->
				</div>	<!-- text_wrap -->
				<div class="ly_wrap pay_info">
					<div class="inr">
						<div class="text_wrap mid">
							<strong class="tit">상품 이름</strong>
						</div>	<!-- text_wrap -->
						<div class="tbl">
							<table class="type2">
							    <colgroup>
							        <col style="width: 17%;" />
							        <col />
							    </colgroup>
							    <tbody>
							        <tr>
							            <th>호텔 정보</th>
							            <td>${roomDetail.hotel_kor }</td>
							        </tr>
							        <tr>
							            <th>숙박 정보</th>
							            <td>
							               ${calDate }박 ( ${startDate } ~ ${endDate } )
							            </td>
							        </tr>
							        <tr>
							            <th>객실 정보</th>
							            <td>
							                ${roomDetail.room_name }
							                <span class="divider_dot">
							                    <span></span>
							                    <!---->
							                </span>
							            </td>
							        </tr>
							        <!-- 필요 시 컬럼 추가 해주세용 -->
							    </tbody>
							</table>
						</div>	<!-- tbl -->
						<div class="text_wrap mid">
							<strong class="tit">예약자 정보</strong>
						</div>	<!-- text_wrap -->
						<div>
						    <div class="tbl">
						        <table class="type2">
						            <colgroup>
						                <col style="width: 17%;" />
						                <col style="width: 33%;" />
						                <col style="width: 17%;" />
						                <col style="width: 33%;" />
						            </colgroup>
						            <tbody>
						                <tr>
						                    <th>성명(한글)</th>
						                    <td>
						                      	${sessionName }
						                    </td>
						                    <th>생년월일</th>
						                    <td>
						                       ${sessionBirthday }
						                    </td>
						                </tr>
						                <tr>
						                    <th>휴대폰 번호</th>
						                    <td>
						                       ${sessionTel}
						                    </td>
						                    <th>이메일</th>
						                    <td>
						                        ${sessionEmail }
						                    </td>
						                </tr>
						            </tbody>
						        </table>	<!-- type2 -->
						    </div>	<!-- tbl -->
						</div>
						<div>
							<div class="text_wrap mid check">
								<strong class="tit">약관동의</strong>
								<span class="right_cont">
									<span class="form_holder check">
										모든 약관에 동의합니다.
										<input type="checkbox" id="allChk" class="allChk">
									</span>
								</span>
							</div>
							<hr>
							<div class="tbl">
								<table class="type2">
									<tr class="agreerow">
										<td>예약취소 및 환불정책 안내</td>
										<td>
											<label for="checkHTL01">
												<input type="radio" name="checkHTL" id="checkHTL01" value="Y" class="inpt_checkbox chkY"> 동의합니다.
											</label>
											<label for="checkHTL02">
												<input type="radio" name="checkHTL" id="checkHTL02" value="N" class="inpt_checkbox chkN"> 동의하지 않습니다.
											</label>
										</td>
									</tr>
									<tr class="agreerow">
										<td>호텔 예약 주의사항</td>
										<td>
											<label for="checkHTL03">
												<input type="radio" name="checkHTL2" id="checkHTL03" value="Y" class="inpt_checkbox chkY"> 동의합니다.
											</label>
											<label for="checkHTL04">
												<input type="radio" name="checkHTL2" id="checkHTL04" value="N" class="inpt_checkbox chkN"> 동의하지 않습니다.
											</label>
										</td>
									</tr>
									<tr class="agreerow">
										<td>개인정보 수집 및 이용</td>
										<td>
											<label for="checkHTL05">
												<input type="radio" name="checkHTL3" id="checkHTL05" value="Y" class="inpt_checkbox chkY"> 동의합니다.
											</label>
											<label for="checkHTL06">
												<input type="radio" name="checkHTL3" id="checkHTL06" value="N" class="inpt_checkbox chkN"> 동의하지 않습니다.
											</label>
										</td>
									</tr>
									<tr class="agreerow">
										<td>개인정보 제3자 제공 동의</td>
										<td>
											<label for="checkHTL07">
												<input type="radio" name="checkHTL4" id="checkHTL07" value="Y" class="inpt_checkbox chkY"> 동의합니다.
											</label>
											<label for="checkHTL08">
												<input type="radio" name="checkHTL4" id="checkHTL08" value="N" class="inpt_checkbox chkN"> 동의하지 않습니다.
											</label>
										</td>
									</tr>
								
								</table>
							
							</div>
						
						</div>
						
					</div>	<!-- inr -->
					<div class="inr right" style="right: auto; left: 0px; width: 306px;">
					    <div class="text_wrap mid">
					    	<strong class="tit">결제 정보</strong>
					    </div>	<!-- text_wrap -->
					    <div class="js_acc multi filter_wrap">
					        <div class="pay_area">
					            <div class="info_area total">
					                <div class="info"><strong class="tit">최종 결제 금액</strong> <span>성인 ${numberOfAdult }</span> <span class="divider_dot">아동 ${numberOfChild }</span></div>
					                <div class="mileage_save">
					                </div>	<!-- mileage_save -->
					                <fmt:formatNumber type="number" maxFractionDigits="3" value="${roomDetail.room_price}" var="commaPrice"/>
					                <strong class="price">${commaPrice }<span>원</span></strong>
					                <div class="mileage_save">
					                    <p class="txt">
					                        	현재 ${sessionName } 님의 회원등급 : ${membership.membership_name }
					                    </p>
					                     <p class="txt">
					                        	현재 ${sessionName } 님의 누적 마일리지: ${membership.mem_mile }
					                    </p>
					                    <p>
					                        	Oh! Travel 마일리지
					                         <fmt:parseNumber type="number" var="mile" value="${roomDetail.room_price * membership.membership_discount * 0.01}" integerOnly="true"/>
					                        <em> ${mile } <span class="icn mileage em"></span></em>적립
					                    </p>
					                </div>	<!-- mileage_save -->
					            </div>	<!-- info_area total -->
					            <div class="info_area">
					            	<fmt:formatNumber type="number" maxFractionDigits="3" value="${roomDetail.room_price - mile}" var="realDiscountPrice"/>
					                <div class="info"><strong class="tit">총 상품 금액</strong> <span id="realDiscountPrice">${realDiscountPrice }원</span></div>
					                <p class="mem_coupon">쿠폰 적용에 따른 할인가격 : <span class="cp_discount">0</span><span>원</span></p>
					            </div>	<!-- info_area -->
					        </div>	<!-- pay_area -->
					        
					        <div class="coupon_list">
	                        	<div class="cp_name">쿠폰</div> 
	                        	<select id="cp_list" name="cp_list">
	                        		<option value="0">${couponList[0] == null ? '쿠폰 없음' : '쿠폰 적용' }</option>
	                        		<c:forEach var="coupon" items="${couponList }">
	                        			<option value="${coupon.coupon_discount }" data-cpId="${coupon.coupon_id }">${coupon.coupon_name }</option>
	                        		</c:forEach>
	                        	</select>
	                        </div>
					        
					          <div class="paybtn">
					            	<button type="button" class="genric-btn primary e-large" onclick="requestPay()">결제하기</button>
					            </div>
					    </div>	<!-- js_acc -->
					</div>	<!-- inr right -->
				</div>	<!-- ly_wrap -->
			</div>	<!-- contents -->
		</div>	<!-- inr -->
	</div>	<!-- container -->
</body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

let originRealDiscountPrice = '${roomDetail.room_price - mile }';
let realPrice = originRealDiscountPrice;
let cpId;

$(function() {
	console.log('ready')
	initPage();
})

function initPage() {
	//페이지 이동시 처음 한번만 실행되면 좋은 함수들
	//data 가져오는 함수
	// ~~~.addEventListener('click',function () {})
	// ~~~.on('click',function(){})
	//eventListener
	$('#allChk').click(function (event) {
		console.log(this.checked)
		if(this.checked) {
			$('.chkN').prop('checked',false)
			$('.chkY').prop('checked',true)
		} else {
			$('.chkY').prop('checked',false)
			$('.chkN').prop('checked',true)
		}
	})
	
	/* 쿠폰 select 박스 선택 시 */
    $('#cp_list').on('change', function() {
    	
    	/* 쿠폰 할인 가격 표시 쪽에 쿠폰에 따른 할인 가격 넣어주기 */
    	let selectCpPrice = Number($(this).val())
    	$('.cp_discount').text(selectCpPrice.toLocaleString('ko-KR'));
    	
    	// 진짜 들고갈 가격 넣어주기
    	realPrice = originRealDiscountPrice - selectCpPrice;
    	
    	// , 콤마 붙인 가격
    	let realPriceToLocale = realPrice.toLocaleString('ko-KR');
    	$('#realDiscountPrice').html(realPriceToLocale+'원');

    	// hidden 태그에 쿠폰 적용 시의 값 및 넣은 쿠폰의 id 넣어주기
    	cpId = $(this).find('option:selected').attr("data-cpid");
    })
	
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

function agreeValid() {
	
	if(!$('#checkHTL01').is(':checked')){
		alert('예약취소 및 환불정책 안내에 대한 동의가 필요합니다.');
	 	$('#checkHTL01').focus();
		return false;
	}
	
	if(!$('#checkHTL03').is(':checked')){
		alert('호텔 예약 주의사항에 대한 동의가 필요합니다.');
	 	$('#checkHTL01').focus();
		return false;
	}
	
	if(!$('#checkHTL05').is(':checked')){
		alert('개인정보 수집 및 이용에 대한 동의가 필요합니다.');
	 	$('#checkHTL01').focus();
		return false;
	}
	
	if(!$('#checkHTL07').is(':checked')){
		alert('개인정보 제3자 제공에 대한 동의가 필요합니다.');
	 	$('#checkHTL01').focus();
		return false;
	}
	
	return true;
	
}


function requestPay() {
	
	if(!isLogined()){
		return false;
	}
	
	if(!agreeValid()) {
   		return false;
   	}  
	
	
	let sendData = {
		calDate : ${calDate }
		, startDate : '${startDate }'
		, endDate : '${endDate }'
		, room_id : ${room_id}
		, mem_id : '${sessionId }'
		, rev_tot_price : realPrice
		, numberOfPeople : ${numberOfAdult } + ${numberOfChild}
		, mile : ${mile }
		, coupon_id : cpId
	}
	
	console.log(sendData)
	
	$.ajax({
        url: "${pageContext.request.contextPath}/hotel/reserve", //가맹점 서버
        method: "POST",
        data: sendData,
        dataType: 'text',
        success: function(data){
             //location.href="${pageContext.request.contextPath}/hotel/reserveComplete";
             console.log('성공')
          },
          error: function(err){
        	 console.error(err)
             alert('결제에 실패하였습니다.');
          }
          
    });
};



</script>
</html>