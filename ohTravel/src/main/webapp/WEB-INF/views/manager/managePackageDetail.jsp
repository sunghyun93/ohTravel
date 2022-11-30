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
<script type="text/javascript">
	$(document).ready(function(){
		var updateMsg1 = '${updateTicketMsg1}';
		var deleteMsg1 = '${deleteTicketMsg1}';
		var insertMsg1 = '${insertTicketMsg1}';
		console.log(updateMsg1);
		console.log(deleteMsg1);
		console.log(updateMsg1);
		if(updateMsg1 == 1){
			alert("수정이 완료되었습니다");
		}else if(deleteMsg1 ==1){
			alert("삭제가 완료되었습니다");
		}else if(insertMsg1 ==1){
			alert("상품이 추가되었습니다");
		}
	});
</script>
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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">패키지 상품 관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-2" style="float: right;" onclick="location.href='insertPackageForm'">패키지 상품 추가</button>
				<input type="button" class="btn btn-primary mb-2 mr-2" style="float: right;" onclick="location.href='managePackage?currentPage=${currentPage}'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>패키지코드</th>
						<th>도시코드</th>
						<th>패키지명</th>
						<th>패키지정보</th>
						<th>패키지구분</th>
						<th>패키지판매갯수</th>
						<th>패키지점수</th>
					</tr>
					</thead>
					<c:forEach var="packageDetail" items="${packageDetail }">
					<tbody>
					<tr onclick="location.href='managePackageDetailOne?pkage_id=${packageDetail.pkage_id}&pkage_dt_id=${packageDetail.pkage_dt_id }'">
						<td>${packageDetail.pkage_id}</td>
						<td>${packageDetail.city_id}</td>
						<td>${packageDetail.pkage_name}</td>
						<td class="content">${packageDetail.pkage_info}</td>
						<td>${packageDetail.pkage_gubun}</td>
						<td>${packageDetail.pkage_soldCnt}</td>
						<td>${packageDetail.pkage_score}</td>

					</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>