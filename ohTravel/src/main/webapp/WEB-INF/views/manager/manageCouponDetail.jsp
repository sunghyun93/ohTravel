<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	function moveForm(str){
		var form = document.getElementById('form');
		var message ="";
		if(str =='update'){
			console.log(str);
			form.action="updateCoupon";
			form.submit();
		}else if(str=='delete'){
			console.log(str);
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deleteCoupon";
				form.submit();
			} else {
				alert("삭제되지 않았습니다");
			}
		}
	}
</script>

</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">쿠폰상세</h1>
			<form method="post" id="form">
				<div class="row">
				<div class="col-lg-12 col-sm-12 text-lg-end text-center">
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
				</div>
				<c:forEach var="couponDetail" items="${couponDetail }">
					<table border="1" class="table table-striped">
						<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰이름</th>
							<th>쿠폰할인금액</th>
							<th>쿠폰생성일</th>
							<th>쿠폰재고</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td><input type="text" name="coupon_id" value="${couponDetail.coupon_id }" readonly="readonly"></td>
							<td><input type="text" name="coupon_name" value="${couponDetail.coupon_name }" required="required"></td>
							<td><input type="number" min="0" max="100000" name="coupon_discount" value="${couponDetail.coupon_discount }" ></td>
							<td><input type="datetime" name="coupon_date" value="${couponDetail.coupon_date }" readonly="readonly"></td>
							<td><input type="number" min="0" max="10000" name="coupon_quantity" value="${couponDetail.coupon_quantity }" required="required"></td>
						</tr>
						</tbody>
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="쿠폰수정">
					</div>
					<div>
						<input type="button" onclick="moveForm('delete')" class="genric-btn danger radius elb" value="쿠폰삭제">
					</div>
					</c:forEach>
					<!-- 여기에 회원들어갈꺼 -->
					<div class="mt-3 big">
					<table border="1" class="table table-striped">
						<thead>
						<tr>
							<th>회원이름</th>
							<th>쿠폰다운로드일시</th>
							<th>쿠폰사용여부 사용시1</th>
							<th>쿠폰유효기간</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="couponMemberDetail" items="${couponMemberDetail }">
						<tr>
							<td><input type="text" name="membership_id" value="${couponMemberDetail.mem_id }" readonly="readonly"></td>
							<td><input type="text" name="membership_name" value="${couponMemberDetail.coupon_down }" required="required"></td>
							<td><input type="text" name="membership_mile" value="${couponMemberDetail.coupon_use }" ></td>
							<td><input type="text" name="membership_discount" value="${couponMemberDetail.coupon_limit_date }" required="required"></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>