<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
</head>
<body>
	<div id="container">
		<div class="inr">
			<!-- 카테고리 -->
			<div class="lnb" id="lnb">
				<div class="inr">
					<dl>
						<dt class="type"><a href="${pageContext.request.contextPath}/member/myPageMain">마이페이지</a></dt>
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
					<strong class="tit">예약내역</strong>
				</div>	<!-- text_wrap big fix -->
				<div class="js_tabs type1 v-tabs nojq">
				    <ul class="tabs">
				        <li class="fx-cobrand-pkg" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservPackage">패키지</a></li>
				        <li class="selected fx-cobrand-htl" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservHotel">호텔</a></li>
				        <li class="fx-cobrand-wt" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservAir">항공</a></li>
				        <li class="fx-cobrand-fnd" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservTicket">투어/입장권</a></li>
				    </ul>
				</div>
				<div class="js_tabs type2 no_division">
					<div class="panels">
					    <div class="panel selected">
					        <div class="text_wrap inquiry mt0">
					            <div class="inr right_cont" style="width: 532px;">
					                <dl>
					                    <dt class="label">예약기간 선택하여 조회</dt>
					                    <dd>
					                        <div class="form_holder">
					                            <button type="button" data-target="#select_tripstartdate" class="calandar js_show">2021.11.22</button> 
					                            <span class="divider">~</span> 
					                            <button type="button" class="calandar">2022.11.22</button>
					                            <button type="submit" class="btn line">조회</button>
					                        </div>	<!-- form_holder -->
					                    </dd>
					                </dl>
					            </div>	<!-- inr right_cont -->
					        </div>	<!-- text_wrap inquiry mt0 -->
					        <div class="text_wrap inquiry mt0">
					            <div class="inr fl">총 <em>0</em>건</div>
					            <div class="right_cont">
					                <ul class="list_sort js_act">
					                    <li class="on"><a href="javacript:void(0);">예약일 최신순</a></li>
					                    <li><a href="javacript:void(0);">출발일 최신순</a></li>
					                </ul>
					            </div>	<!-- right_cont -->
					        </div>	<!-- text_wrap inquiry mt0 -->
					        <div class="tbl">
					            <table class="board_type">
					                <colgroup>
					                    <col style="width: 14%;" />
					                    <col />
					                    <col style="width: 14%;" />
					                    <col style="width: 8%;" />
					                    <col style="width: 12%;" />
					                </colgroup>
					                <thead>
					                    <tr>
					                        <th>예약일/예약코드</th>
					                        <th>상품명</th>
					                        <th>결제 금액</th>
					                        <th>인원</th>
					                        <th>출발일</th>
					                    </tr>
					                </thead>
					                <tbody>
					                    <tr>
					                        <td colspan="5">
					                            <div class="data_no">
					                                <div class="cont"><strong>예약내역이 없습니다.</strong></div>
					                            </div>
					                        </td>
					                    </tr>
					                </tbody>
					            </table>
					        </div>	<!-- tbl -->
					    </div>	<!-- panel selected -->
					</div>	<!-- panels -->
				</div>	<!-- js_tabs type2 no_division -->
			</div>	<!-- contents -->
		</div>
	</div>
</body>
</html>