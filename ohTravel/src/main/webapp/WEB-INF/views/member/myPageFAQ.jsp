<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 찾는 질문</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
<style type="text/css">
.faq-box {
  border:2px solid #ddd;
  background-color:#fff;
  color:inherit;
  padding:20px;
  font-size:16px;
}

.faq-box__question {
  cursor:pointer;
}

.faq-box__question::after {
  content:"▼";
  float:right;
  color:#ddd;
}

.faq-box > ul > li {
  padding:10px;
}

.faq-box > ul > li.hover > .faq-box__question::after {
  content:"▲";
}

.faq-box__answer {
  display:none;
  background-color:#f7f7f7;
  border-radius:10px;
  padding:10px;
  margin-top: 20px;
  font-size: 13px;
}
.faq-box__answer>div {
  margin: 10px;
  line-height: 150%;
}
</style>
</head>
<body>
	<div id="container">
		<div class="inr">
			<!-- 카테고리 -->
			<div class="lnb" id="lnb">
				<div class="inr">
					<dl>
						<dt class="type"><a href="${pageContext.request.contextPath}/member/myPageReservPackage">마이페이지</a></dt>
						<dd>
							<ul class="list_lnb">
							    <li id="EM00000196" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageReservPackage" id="/com/mpg/CHPC0MPG0200M200">예약내역</a>
							        <!---->
							    </li>
							    <li id="EM00000203" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageLikePackage" id="/com/sbk/CHPC0COM0300M200">찜</a>
							        <!---->
							    </li>
							    <li id="EM00000224">
							        <a href="${pageContext.request.contextPath}/member/myPageCouponPackage">쿠폰함</a>
							    </li>
							    <li id="EM00002140" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageFAQ" id="/com/cuc/CHPC0CUC0001M200">자주찾는 질문</a>
							        <!---->
							    </li>
							    <li id="EM00002141" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageReviewPackage" id="/com/mpg/CHPC0MPG0403M200">My 상품평</a>
							        <!---->
							    </li>
							    <li id="EM00000234" class="">
							        <a href="${pageContext.request.contextPath}/member/myPagePrivacy" id="/com/mpg/CHPC0MPG0105M200">개인정보</a>
							        <!---->
							    </li>
							</ul>
						</dd>
					</dl>	
				</div>	<!-- inr -->
			</div>	<!-- lnb -->
			<div class="contents" id="contents">
				<div class="text_wrap big fix">
					<strong class="tit">자주 찾는 질문</strong>
				</div>
				<section class="section section-faq">
				  <div class="container mx-auto">
				
				    <div class="faq-box">
				      <!--
				      ul>li*10>div.faq-box__question>span{질문 $}^div.faq-box__answer>lorem*10
				    -->
				      <ul>
				        <li>
				          <div class="faq-box__question"><span>Q. 예약한 상품의 예약번호를 잊어버렸어요.</span></div>
				          <div class="faq-box__answer">
				            <div>
				           		하나투어 고객센터 ARS로 문의해주시기 바랍니다.
				            </div>
				            <div>
				                (지역번호없이) 1577-1233<br><br>
								상담시간 : 09:00~18:00 (주말 및 공휴일은 휴무)
				            </div>
				          </div>
				        </li>
				        <li>
				          <div class="faq-box__question"><span>Q. 고객센터의 상담 시간을 알고 싶어요.</span></div>
				          <div class="faq-box__answer">
				            <div>
				              - 고객센터 전화번호 : 1544-9180
				            </div>
				            <div>
				              - 상담 시간 : 평일 오전 9시 30분 ~ 오후 6시 (점심시간 : 오전 11시 30분 ~ 오후 1시 30분 / 주말, 공휴일 휴무)
				            </div>
				            <div>
				              - 전화 연결이 어려운 경우 카카오 상담톡으로 문의를 남겨주시면 확인 후 정성껏 답변드리겠습니다.
				            </div>
				            <div>
				              ※ 문의량이 많을 경우 상담 연결 및 답변이 지연될 수 있습니다.
				            </div>
				          </div>
				        </li>
				        <li>
				          <div class="faq-box__question"><span>Q. 예약내역 조회/확인은 어떻게 하나요?</span></div>
				          <div class="faq-box__answer">
				            <div>
					             하나투어 홈페이지 및 모바일을 통한 예약은 예약과 동시에 고객님의 이메일과 알림톡(또는 문자)을 통해 알려 드리며 공식인증예약센터 예약 담당자가<br>
					             영업일 기준 24시간 이내에 고객님께 예약 확인 전화를 드립니다. 또한 예약하신 상품은 하나﻿투어 PC 홈페이지/모바일 앱에서 아래의 경로로 확인 가능<br>
					             합니다. 회원 조회가 어려우실 경우 비회원 예약조회로도 예약정보 확인이 가능합니다.&nbsp;
				            </div>
				            <div>
				            	※ 예약번호(영문, 숫자 포함 12자리)는 고객님의 핸드폰으로 발송된 알림톡(또는 문자)에서 확인 가능합니다.
				            </div>
				          </div>
				        </li>
				        <li>
				          <div class="faq-box__question"><span>Q. 비밀번호 변경은 어디에서 하나요?</span></div>
				          <div class="faq-box__answer">
				           <div>
				             PC의 경우, Oh! Travel 홈페이지 회원 로그인 후 [마이페이지&gt;개인정보 &gt;비밀번호 변경] 메뉴를 통해 이용 가능합니다. 모바일 웹/앱 의 경우, [마이페이지 &gt;내정보 관리&gt;회원 비밀번호 변경] 메뉴를 통해 이용 가능합니다. 단, 
				           </div>
				          </div>
				        </li>
				        <li>
				          <div class="faq-box__question"><span>Q. 결제를 호텔에서 해도 되나요?</span></div>
				          <div class="faq-box__answer">
				            <div>
				             	하나투어 호텔 예약은 선불제 호텔입니다. 모든 예약은 하나투어로 지불이 완료가 되어야 하며 호텔에 직접 결제하시는 것은 불가능합니다.
				            </div>
				          </div>
				        </li>
				        <li>
				          <div class="faq-box__question"><span>Q. 무통장 결제로 입금했는데 확인되지 않아요.</span></div>
				          <div class="faq-box__answer">
				           <div>
				             - 무통장입금 건은 입금 후 영업시간이내 1~2시간 이후에 확인이 가능하며,
				           </div>
				            <div>
				              주문 후 7일 이내로 입금 확인이 안될 경우 주문이 자동으로 취소 처리됩니다.
				            </div>
				            <br>
				            <div style="font-weight:bold;">
				              ▼자동 입금이 되지 않는 4가지 경우▼
				            </div>
				            <div>
				               1. 입금자명이 다를 경우 - 주문 시 기재한 입금자명과 실제 입금자명이 다를 경우 연락 부탁드립니다.
				            </div>
				            <div>
				              2. 결제 금액과 입금 금액이 불일치할 경우 - 결제 금액과 입금 금액이 일치하지 않을 경우 연락 부탁드리며, 초과 입금해주신 금액은 환불 처리 가능합니다.
				            </div>
				            <div>
				               3. 같은 주문서가 중복으로 존재할 경우 동일한 결제 정보의 주문서가 두 개 이상일 경우 자동 입금 연결이 되지 않습니다.
				            </div>
				            <div>
				              4. 구매의사가 없는 주문서의 경우 마이페이지 주문내역에서 취소하시고, 입금해주신 금액은 환불 처리 가능합니다.
				            </div>
				          </div>
				        </li>
				        <li>
				          <div class="faq-box__question"><span>Q. 비회원으로 주문이 가능한가요?</span></div>
				          <div class="faq-box__answer">
				          <div>
				            - 회원가입 없이 [비회원 구매] 버튼을 선택하여 주문이 가능합니다.
				          </div>
				            <div>
				              - 비회원으로 주문시 주문 내용을 확인을 위해 '주문번호'와 '비밀번호'를 꼭 메모 부탁드립니다.
				            </div>
				            <div>
				              - 주문번호를 잊으신 경우에는 고객센터(1544-9180)으로 연락 부탁드립니다.
				            </div>
				          </div>
				        </li>
				        <li>
				          <div class="faq-box__question"><span>Q. 비회원 주문시 취소 및 변경은 어떻게 하나요?</span></div>
				          <div class="faq-box__answer">
				           <div>
				             - 비회원 주문의 경우 직접 취소 및 주문서 변경 처리가 어렵습니다.
				           </div>
				            <div>
				              - 비회원 or 네이버 로그인으로 주문 후 취소/변경 및 교환/반품을 원하실 경우,
				            </div>
				            <div>
				              고객센터(1544-9180)로 주문자이름 , 휴대폰번호, 요청 내용과 함께 문의주시면 도와드리겠습니다.
				            </div>
				            <div>
				              - 단, 이미 제품이 발송된 경우에는 주문 취소가 불가합니다.
				            </div>
				          </div>
				        </li>
				      </ul>
				    </div>
				  </div>
				</section>
			</div>
		</div>
	</div>
</body>
<!-- 제이쿼리 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function FaqBox__init() {
	  $('.faq-box > ul > li').click(function() {
	    let $this = $(this);
	    
	    $this.siblings('.hover').find(' > .faq-box__answer').stop().slideUp(300); 
	    $this.siblings('.hover').removeClass('hover');
	    
	    if ( $this.hasClass('hover') ) {
	      $this.find(' > .faq-box__answer').stop().slideUp(300); 
	      $this.removeClass('hover');
	    }
	    else {
	      $this.find(' > .faq-box__answer').stop().slideDown(300); 
	      $this.addClass('hover');
	    }
	  });
	  
	  $('.faq-box__answer').click(function() {
	    return false;
	  });
	}

	FaqBox__init();
</script>
</html>