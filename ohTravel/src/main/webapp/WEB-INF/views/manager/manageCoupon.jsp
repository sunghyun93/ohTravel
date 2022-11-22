<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
.ManageUserWrapper{
	min-height: 700px;
}

.ela{
	width: 45%;
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
		var updateMsg1 = '${updateCouponMsg1}';
		var deleteMsg1 = '${deleteCouponMsg1}';
		if(updateMsg1 == 1){
			alert("수정이 완료되었습니다");
		}else if(deleteMsg1 ==1){
			alert("삭제가 완료되었습니다");
		}
	});
</script>
</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">쿠폰관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-2" style="float: right;" onclick="location.href='insertCouponForm'">쿠폰추가</button>
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>쿠폰번호</th>
						<th>쿠폰이름</th>
						<th>쿠폰할인금액</th>
						<th>쿠폰생성일</th>
						<th>사용가능수량</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="coupon" items="${couponList }">
					<tr onclick="location.href='manageCouponDetail?coupon_id=${coupon.coupon_id}'">
						<td>${coupon.coupon_id }</td>
						<td>${coupon.coupon_name }</td>
						<td>${coupon.coupon_discount }</td>
						<td>${coupon.coupon_date }</td>
						<td>${coupon.coupon_quantity }</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>