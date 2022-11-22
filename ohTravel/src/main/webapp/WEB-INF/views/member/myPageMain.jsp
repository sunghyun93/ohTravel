<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
</head>
<body>
	<div id="container">
		<div class="inr">
			<!-- 카테고리 -->
			<div class="lnb" id="lnb">
				<div class="inr">
					<dl>
						<dt class="type"><a href="#">마이페이지</a></dt>
						<dd>
							<ul class="list_lnb">
							    <li id="EM00000196" class="">
							        <a href="#" id="/com/mpg/CHPC0MPG0200M200">예약내역</a>
							        <!---->
							    </li>
							    <li id="EM00000203" class="">
							        <a href="#" id="/com/sbk/CHPC0COM0300M200">찜</a>
							        <!---->
							    </li>
							    <li id="EM00000208" class="">
							        <a href="#">마일리지</a>
							        <ul style="display: none;">
							            <li id="EM00000209" class=""><a href="#">내역조회</a></li>
							            <li id="EM00000213" class=""><a href="#">마일리지 양도</a></li>
							            <li id="EM00000214" class=""><a href="#">가족등록 현황</a></li>
							            <li id="EM00000216" class=""><a href="#">누락마일리지 적립</a></li>
							            <li id="EM00000218" class=""><a href="#">소멸예정 마일리지</a></li>
							            <li id="EM00002178" class=""><a href="#">마일리지샵</a></li>
							        </ul>
							    </li>
							    <li id="EM00000224">
							        <a href="#">쿠폰함</a>
							        <ul style="display: none;">
							            <li id="EM00000226" class=""><a href="#">사용 가능한 쿠폰</a></li>
							            <li id="EM00000228" class=""><a href="#">할인쿠폰 다운로드</a></li>
							            <li id="EM00000229" class=""><a href="#">지난 쿠폰</a></li>
							        </ul>
							    </li>
							    <li id="EM00002139" class="">
							        <a href="#" id="/com/mpg/CHPC0MPG0400M200">1:1 게시판 문의내역</a>
							        <!---->
							    </li>
							    <li id="EM00002140" class="">
							        <a href="#" id="/com/cuc/CHPC0CUC0001M200">자주찾는 질문</a>
							        <!---->
							    </li>
							    <li id="EM00002141" class="">
							        <a href="#" id="/com/mpg/CHPC0MPG0403M200">My 상품평</a>
							        <!---->
							    </li>
							    <li id="EM00000234" class="">
							        <a href="#" id="/com/mpg/CHPC0MPG0105M200">개인정보</a>
							        <!---->
							    </li>
							</ul>
														
						</dd>
					</dl>	
				</div>	<!-- inr -->
			</div>	<!-- lnb -->
			<div class="contents" id="contents">
				<div class="text_wrap big type mb30 mt0">
					<strong class="tit">예약내역</strong>
					<span class="right_cont">
						<a href="#" class="txt arrow_r">더보기</a>
					</span>
				</div>	<!-- text_wrap big type mb30 mt0 -->
				<!-- 예약 내역 확인 -->
				<div class="tbl">
					<table class="board_type">
					    <colgroup>
					        <col style="width: 15%;" />
					        <col />
					        <col style="width: 13%;" />
					        <col style="width: 7%;" />
					        <col style="width: 13%;" />
					        <col style="width: 11%;" />
					    </colgroup>
					    <thead>
						    <tr>
						        <th>예약날짜/예약코드</th>
						        <th>상품명</th>
						        <th>결제금액</th>
						        <th>인원</th>
						        <th>출국일/귀국일</th>
						        <th>예약상태</th>
						    </tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td colspan="6">
					                <div class="data_no">
					                    <div class="cont">
					                        <strong>현재 예약내역이 존재하지 않습니다.</strong><br />
					                        즐거운 여행계획을 준비해 보세요.
					                    </div>
					                </div>
					            </td>
					        </tr>
					    </tbody>
					</table>
				</div>	<!-- tbl -->
				<div class="ly_tbl my_qna">
					<!-- 1:1 게시판 문의 내역인데 나중에 다른 걸로 수정 -->
					<div class="inr w526">
					    <div class="text_wrap big type mb15">
					        <strong class="tit">나의 1:1 게시판 문의내역</strong> <span class="right_cont"><a href="/com/mpg/CHPC0MPG0400M200" class="txt arrow_r">더보기</a></span>
					    </div>
					    <ul class="default_list">
					        <li>
					            <div class="data_no">
					                <div class="cont"><strong>문의내역이 없습니다.</strong></div>
					            </div>
					        </li>
					    </ul>
					</div>
					<!-- 서비스 바로가기 -->
					<div class="inr">
					    <div class="text_wrap big mb15"><strong class="tit">서비스 바로가기</strong></div>
					    <ul class="box_group">
					        <li>
					            <span class="icn mpg1"></span>
					            <div class="text_wrap sml"><strong class="tit">찜</strong></div>
					        </li>
					        <li>
					            <span class="icn mpg2"></span>
					            <div class="text_wrap sml"><strong class="tit">쿠폰함</strong></div>
					        </li>
					        <li>
					            <span class="icn mpg3"></span>
					            <div class="text_wrap sml"><strong class="tit">마일리지</strong></div>
					        </li>
					    </ul>
					</div>
															
				</div>
			</div>	<!-- contents -->
		</div>	<!-- inr -->
	</div> <!-- container -->
</body>
</html>