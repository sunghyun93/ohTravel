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
<script type="text/javascript">
	$(document).ready(function(){
		let insertMsg = ${insertMsg};
		if(insertMsg == 1){
			alert('호텔 추가 성공');
		}
	})
</script>
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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">숙박 상품 관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='insertHotelForm'">호텔 추가</button>
				<input type="button" class="btn btn-primary mb-3" onclick="location.href='managerMain'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>숙박업체ID</th>
						<th>업체명</th>
						<th>등급</th>
						<th>업체위치</th>
						<th>도시위치</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="hotelList" items="${hotelList }">
					<tr onclick="location.href='manageHotelDetail?hotel_id=${hotelList.hotel_id }&currentPage=${currentPage}'">
						<td>${hotelList.hotel_id }</td>
						<td>${hotelList.hotel_kor }</td>
						<td>${hotelList.hotel_grade }</td>
						<td>${hotelList.hotel_loc }</td>
						<td>${hotelList.city_name }</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link" href="manageHotel?currentPage=${page.startPage-page.pageBlock}">[이전]</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<li class="page-item"><a class="page-link" href="manageHotel?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link" href="manageHotel?currentPage=${page.startPage+page.pageBlock}">[다음]</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>