<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 상품평</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
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
					<strong class="tit">My 상품평</strong>
				</div>	<!-- text_wrap big fix -->
				<div class="js_tabs type1 v-tabs nojq">
				    <ul class="tabs">
				        <li class="fx-cobrand-pkg" style="width: 34%;"><a href="${pageContext.request.contextPath}/member/myPageReviewPackage">패키지</a></li>
				        <li class="fx-cobrand-htl" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/myPageReviewHotel">호텔</a></li>
				        <li class="selected fx-cobrand-wt" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/myPageReviewTicket">티켓</a></li>
				    </ul>
				</div>	<!-- js_tabs type1 v-tabs nojq -->
				<div class="js_tabs type2 no_division">
					<div class="panels">
					    <div class="panel selected">
					        <div class="tbl">
					            <table class="board_type">
					                <colgroup>
					                    <col style="width: 20%;" />
					                    <col style="width: 20%;" />
					                    <col style="width: 40%;" />
					                    <col style="width: 20%;" />
					                </colgroup>
					                <thead>
					                    <tr>
					                        <th>리뷰 ID</th>
					                        <th>상품명</th>
					                        <th>리뷰</th>
					                        <th>작성일자</th>
					                    </tr>
					                </thead>
					                <tbody>
					                    <c:forEach var="ticketReviewList" items="${ticketReviewList}">
					                    <tr>
					   						<td>${ticketReviewList.rv_id}</td>
					                    	<td>${ticketReviewList.ticket_name}</td>
					                    	<td>${ticketReviewList.rv_contents}</td>
					                    	<td>${ticketReviewList.rv_date}</td>
					                    </tr>
					                    </c:forEach>
					                    <c:if test="${ticketReviewListSize == 0}">
					                    	<tr>
						                        <td colspan="5">
						                            <div class="data_no">
						                                <div class="cont"><strong>등록된 리뷰가 없습니다.</strong></div>
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
									<li class="page-item"><a class="page-link" href="myPageReviewTicket?currentPage=${page.startPage-page.pageBlock}">[이전]</a></li>
								</c:if>
								<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
									<li class="page-item"><a class="page-link" href="myPageReviewTicket?currentPage=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${page.endPage < page.totalPage }">
									<li class="page-item"><a class="page-link" href="myPageReviewTicket?currentPage=${page.startPage+page.pageBlock}">[다음]</a></li>
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