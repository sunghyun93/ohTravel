<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.content{
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a href="managePackage" class="genric-btn primary ela">패키지 상품 관리</a>
				<a href="manageAirline" class="genric-btn primary ela">항공권 상품 관리</a>
				<a href="manageHotel" class="genric-btn primary ela">숙박 상품 관리</a>
				<a href="manageTicket" class="genric-btn primary ela">입장권 상품 관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">입장권 상품 관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-2" style="float: right;" onclick="location.href='insertTicketForm'">입장권 상품 추가</button>
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>티켓코드</th>
						<th>입장권명</th>
						<th>누적판매갯수</th>
						<th>위치</th>
						<th>평점</th>
						<th>사용기한일</th>
						<th>성인가격</th>
						<th>아동가격</th>
					</tr>
					</thead>
					<c:forEach var="ticketList" items="${ticketList }">
					<tbody>
					<tr onclick="location.href='manageTicketDetail?ticket_id=${ticketList.ticket_id}'">
						<td>${ticketList.ticket_id }</td>
						<td>${ticketList.ticket_name}</td>
						<td>${ticketList.ticket_sales_cnt}</td>
						<td class="content">${ticketList.ticket_location}</td>
						<td>${ticketList.ticket_score}</td>
						<td>${ticketList.ticket_due_date}</td>
						<td>${ticketList.ticket_adult_price}</td>
						<td>${ticketList.ticket_child_price}</td>
					</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>