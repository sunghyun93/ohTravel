<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

</script>
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
					<strong class="tit">예약내역</strong>
				</div>	<!-- text_wrap big fix -->
				<div class="js_tabs type1 v-tabs nojq">
				    <ul class="tabs">
				        <li class="fx-cobrand-pkg" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservPackage">패키지</a></li>
				        <li class="fx-cobrand-htl" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservHotel">호텔</a></li>
				        <li class="selected fx-cobrand-wt" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservAir">항공</a></li>
				        <li class="fx-cobrand-fnd" style="width: 25%;"><a href="${pageContext.request.contextPath}/member/myPageReservTicket">투어/입장권</a></li>
				    </ul>
				</div>
				<div class="js_tabs type2 no_division">
					<div class="panels">
					    <div class="panel selected">
					        <div>${sessionId}</div>
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
					                        <th>예약일</th>
					                        <th>예매번호</th>
					                        <th>좌석등급</th>
					                        <th>항공편</th>
					                        <th>출발공항</th>
					                        <th>도착공항</th>
					                        <th>예매가격</th>
					                        <th>출발일</th>
					                    </tr>
					                </thead>
					                <tbody>
					                <c:if test="${airReservList != null}">
					                <c:forEach var="reserve" items="${airReservList}">
					                	<tr>
					                		<td><fmt:formatDate value="${reserve.reservation_date}" pattern="yy-MM-dd"/></td>
					                		<td>${reserve.reservation_id }</td>
					                		<td>${reserve.seat_position }</td>
					                		<td>${reserve.airplane_name }</td>
					                		<td>${reserve.start_airport_name }</td>
					                		<td>${reserve.end_airport_name }</td>
					                		<td>${reserve.reservation_price }</td>
					                		<td><fmt:formatDate value="${reserve.start_time}" pattern="yy-MM-dd"/></td>
					                	</tr>
					                </c:forEach>
					                 </c:if>
					                 <!--예약내역이 없으면  -->
					                 <c:if test="${airReservList == null}">
					                	 <tr>
					                        <td colspan="5">
					                            <div class="data_no">
					                                <div class="cont"><strong>예약내역이 없습니다.</strong></div>
					                            </div>
					                        </td>
					                    </tr>
					                 </c:if>
					                </tbody>
					            </table>
					        </div>	<!-- tbl -->
					    </div>	<!-- panel selected -->
					    <!-- 페이징 -->
					    <nav aria-label="Page navigation example" style="margin-top: 50px;">
							<ul class="pagination justify-content-center">
								<c:if test="${page.startPage > page.pageBlock }">
									<li class="page-item"><a class="page-link" href="myPageReservAir?currentPage=${page.startPage-page.pageBlock}">[이전]</a></li>
								</c:if>
								<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
									<li class="page-item"><a class="page-link" href="myPageReservAir?currentPage=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${page.endPage < page.totalPage }">
									<li class="page-item"><a class="page-link" href="myPageReservAir?currentPage=${page.startPage+page.pageBlock}">[다음]</a></li>
								</c:if>
							</ul>
						</nav>
					</div>	<!-- panels -->
				</div>	<!-- js_tabs type2 no_division -->
			</div>	<!-- contents -->
		</div>
	</div>
</body>
</html>