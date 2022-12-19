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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script type="text/javascript">
// 메세지
let msg = '${msg}'

if(msg == "MOD_OK"){
	alert("수정이 완료되었습니다");
}else if(msg == "DEL_OK"){
	alert("삭제가 완료되었습니다");
}else if(msg == "DEL_ERR") {
	alert("삭제에 실패했습니다.\n다시 시도해주세요.");
}else if(msg == "WRT_OK"){
	alert("상품이 추가되었습니다");
}

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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">패키지 상품 관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-2" style="float: right;" onclick="location.href='insertPackageForm?pkage_id=${pkage_id}'">패키지 상품 추가</button>
				<input type="button" class="btn btn-primary mb-2 mr-2" style="float: right;" onclick="location.href='managePackage?currentPage=${currentPage}'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover">
					<colgroup>
                        <col style="width:15%">
                        <col style="width:15%">
                        <col style="width:15%">
                        <col style="">
                    </colgroup>
					<thead>
					<tr>
						<th>패키지상품ID</th>
						<th>패키지코드</th>
						<th>도시코드</th>
						<th>패키지상품명</th>
                   <%-- <th>패키지정보</th>
						<th>패키지구분</th>
						<th>패키지판매갯수</th>
						<th>패키지점수</th> --%>
					</tr>
					</thead>
					<c:forEach var="packageDetail" items="${packageDetail }">
					<tbody>
					<tr onclick="location.href='managePackageDetailOne?pkage_id=${packageDetail.pkage_id}&pkage_dt_id=${packageDetail.pkage_dt_id }&currentPage=${currentPage }'">
						<td>${packageDetail.pkage_dt_id }</td>
						<td>${packageDetail.pkage_id}</td>
						<td>${packageDetail.city_id}</td>
						<td>${packageDetail.pkage_dt_name}</td>
						<%-- <td class="content">${packageDetail.pkage_info}</td>
						<td>${packageDetail.pkage_gubun}</td>
						<td>${packageDetail.pkage_soldCnt}</td>
						<td>${packageDetail.pkage_score}</td> --%>
					</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>