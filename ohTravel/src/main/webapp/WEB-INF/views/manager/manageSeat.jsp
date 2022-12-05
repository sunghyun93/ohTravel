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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">좌석 관리</h1>
			<div class="row d-flex justify-content-center">
			<div class="mt-4 button-wrap">
				<input type="button" class="btn btn-primary mb-3" onclick="location.href='manageAir'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>좌석등급확인</th>
						<th>등급</th>
						<th>좌석이름</th>
						<th>추가가격</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="seatList" items="${seatList }">
					<tr>
						<td>${seatList.seat_position }</td>
						<td>${seatList.seat_grade }</td>
						<td>${seatList.seat_name }</td>
						<td>${seatList.plus_seat_price }</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>