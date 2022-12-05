<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.ela{
	width: 20%;
}
.button-wrap{
	text-align: center;
}
.big{
	width: 100%;
}
</style>
</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a href="managePackage" class="genric-btn primary ela">패키지 상품 관리</a>
				<a href="manageAir" class="genric-btn primary ela">항공권 상품 관리</a>
				<a href="manageHotel" class="genric-btn primary ela">숙박 상품 관리</a>
				<a href="manageTicket" class="genric-btn primary ela">입장권 상품 관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">항공권 상품 관리</h1>
			<div class="row d-flex justify-content-center">
			<div class="mt-4 button-wrap">
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='manageAirline'">항공사 관리</button>
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='manageAirplane'">비행기 관리</button>
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='manageStartAirport'">출발공항 관리</button>
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='manageEndAirport'">도착공항 관리</button>
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='manageSeat'">좌석 관리</button>
				<button class="btn btn-primary mb-3" onclick="location.href='insertAirScheduleForm'">일정 추가하기</button>
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>일정ID</th>
						<th>항공사번호</th>
						<th>항공편명</th>
						<th>출발공항명</th>
						<th>도착공항명</th>
						<th>출발시간</th>
						<th>도착시간</th>
						<th>가격</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="AirScheduleList" items="${AirScheduleList }">
					<tr onclick="location.href='manageAirScheduleDetail?schedule_id=${AirScheduleList.schedule_id}&currentPage=${page.currentPage}'">
						<td>${AirScheduleList.schedule_id }</td>
						<td>${AirScheduleList.air_num }</td>
						<td>${AirScheduleList.airplane_name }</td>
						<td>${AirScheduleList.start_airport_name }</td>
						<td>${AirScheduleList.end_airport_name }</td>
						<td>${AirScheduleList.start_time }</td>
						<td>${AirScheduleList.end_time }</td>
						<td>${AirScheduleList.schedule_price }</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link" href="manageAir?currentPage=${page.startPage-page.pageBlock}">[이전]</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<li class="page-item"><a class="page-link" href="manageAir?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link" href="manageAir?currentPage=${page.startPage+page.pageBlock}">[다음]</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>