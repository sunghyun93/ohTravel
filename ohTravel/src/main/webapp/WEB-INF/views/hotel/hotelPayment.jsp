<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<body>
	<div id="container">
		<div class="inr" style="min-height: 800px">
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
							            <th>예약 정보(도시 이름 등)</th>
							            <td>일본(오사카)</td>
							        </tr>
							        <tr>
							            <th>체크인/체크아웃</th>
							            <td>
							                <div class="item_course">
							                   
							                    <span class="divider_dot"></span>1박 ${startDate }, ${endDate }
							                </div>
							            </td>
							        </tr>
							        <tr>
							            <th>예약 정보(객실 정보, 항공명 등)</th>
							            <td>
							                ${roomName }
							                <span class="divider_dot">
							                    <span>성인2</span>
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
						                      	홍길동
						                    </td>
						                    <th>생년월일</th>
						                    <td>
						                        20000101
						                    </td>
						                </tr>
						                <tr>
						                    <th>휴대폰 번호</th>
						                    <td>
						                        01011112222
						                    </td>
						                    <th>이메일</th>
						                    <td>
						                        sample@sample.com
						                    </td>
						                </tr>
						            </tbody>
						        </table>	<!-- type2 -->
						    </div>	<!-- tbl -->
						</div>
						<div class="btn_wrap">
						    <!---->
						    <span class="btn big pink" style="height: 56px; line-height: 54px;">다음단계</span>
						</div>
					</div>	<!-- inr -->
					<div class="inr right" style="right: auto; left: 0px; width: 306px;">
					    <div class="text_wrap mid">
					    	<strong class="tit">결제 정보</strong>
					    </div>	<!-- text_wrap -->
					    <div class="js_acc multi filter_wrap">
					        <div class="pay_area">
					            <div class="info_area total">
					                <div class="info"><strong class="tit">최종 결제 금액</strong> <span>성인 2</span> <span class="divider_dot">아동 0</span></div>
					                <div class="mileage_save">
					                    <p class="txt">
					                        (JPY 12,376)
					                    </p>
					                </div>	<!-- mileage_save -->
					                <strong class="price">121,037<span>원</span></strong>
					                <div class="mileage_save">
					                    <p class="txt">
					                        * 적용환율 JPY=9.78 (2022.11.25)기준
					                    </p>
					                    <p>
					                        	Oh! Travel 마일리지
					                        <em>121<span class="icn mileage em"></span></em>적립
					                    </p>
					                </div>	<!-- mileage_save -->
					            </div>	<!-- info_area total -->
					            <div class="info_area">
					                <div class="info"><strong class="tit">총 상품 금액</strong> <span>121,037원</span></div>
					            </div>	<!-- info_area -->
					        </div>	<!-- pay_area -->
					    </div>	<!-- js_acc -->
					</div>	<!-- inr right -->
				</div>	<!-- ly_wrap -->
			</div>	<!-- contents -->
		</div>	<!-- inr -->
	</div>	<!-- container -->
</body>
</html>