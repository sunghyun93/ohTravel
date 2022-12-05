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
		var updateMsg1 = '${updateAttractionMsg1}';
		var deleteMsg1 = '${deleteAttractionMsg1}';
		var insertMsg1 = '${insertAttractionMsg1}';
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
				<a href="manageAir" class="genric-btn primary ela">항공권 상품 관리</a>
				<a href="manageHotel" class="genric-btn primary ela">숙박 상품 관리</a>
				<a href="manageTicket" class="genric-btn primary ela">입장권 상품 관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">관광지 관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-2" style="float: right;" onclick="location.href='insertAttractionForm'">관광지  추가</button>
				<input type="button" class="btn btn-primary mb-2 mr-2" style="float: right;" onclick="location.href='managePackage'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>관광지ID</th>
						<th>도시ID</th>
						<th>관광지이름</th>
						<th>관광지영어이름</th>
						<th>관광지 정보</th>
					</tr>
					</thead>
					<c:forEach var="attractionList" items="${attractionList }">
					<tbody>
					<tr onclick="location.href='manageAttractionDetail?attr_id=${attractionList.attr_id }&attr_Img_code=${attractionList.attr_Img_code}&currentPage=${page.currentPage}'">
						<td>${attractionList.attr_id }</td>
						<td>${attractionList.city_id}</td>
						<td>${attractionList.attr_name}</td>
						<td>${attractionList.attr_ename}</td>
						<td class="content">${attractionList.attr_info}</td>
					</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link" href="manageAttraction?currentPage=${page.startPage-page.pageBlock}">[이전]</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<li class="page-item"><a class="page-link" href="manageAttraction?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link" href="manageAttraction?currentPage=${page.startPage+page.pageBlock}">[다음]</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>