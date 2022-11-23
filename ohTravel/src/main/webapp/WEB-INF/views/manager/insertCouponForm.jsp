<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertCoupon" method="post">
	<div class="container" style="min-height: 700px;">
	<h1>쿠폰 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="coupon_name" class="form-label">쿠폰 이름</label>
			<input type="text" class="form-control" name="coupon_name" id="coupon_name" required="required" placeholder="쿠폰이름을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="coupon_discount" class="form-label">쿠폰할인금액</label>
			<input type="number" max="100000" class="form-control" name="coupon_discount" id="coupon_discount" required="required" placeholder="할인금액을 입력하세요 최대 100,000">
		</div>
		<div class="mb-3">
			<label for="coupon_quantity" class="form-label">쿠폰발행수량</label>
			<input type="number" max="10000" class="form-control" id="coupon_quantity" name="coupon_quantity" required="required" placeholder="쿠폰발행 수량을 입력하세요">
		</div>
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="submit" class="btn btn-primary">추가하기</button>
	</div>
	</form>
</body>
</html>