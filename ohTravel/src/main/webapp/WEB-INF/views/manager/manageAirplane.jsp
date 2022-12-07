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
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='insertAirplaneForm'">비행기 추가</button>
				<input type="button" class="btn btn-primary mb-3" onclick="location.href='manageAir'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>항공편명</th>
						<th>일반석 갯수</th>
						<th>비즈니스석 갯수</th>
						<th>일등석 갯수</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="airplaneList" items="${airplaneList }">
					<tr onclick="location.href='manageAirplaneDetail?airplane_name=${airplaneList.airplane_name }'">
						<td>${airplaneList.airplane_name }</td>
						<td>${airplaneList.general_seat }</td>
						<td>${airplaneList.business_seat }</td>
						<td>${airplaneList.first_seat }</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link" href="manageAirplane?currentPage=${page.startPage-page.pageBlock}">[이전]</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<li class="page-item"><a class="page-link" href="manageAirplane?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link" href="manageAirplane?currentPage=${page.startPage+page.pageBlock}">[다음]</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>