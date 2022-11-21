<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertMembership" method="post">
	<div class="container" style="min-height: 700px;">
	<h1>등급추가</h1>
	<hr>
		<div class="mb-3">
			<label for="membership_name" class="form-label">등급명을 입력하세요</label>
			<input type="text" class="form-control" name="membership_name" id="membership_name" required="required" placeholder="등급명입력">
		</div>
		<div class="mb-3">
			<label for="membership_mile" class="form-label">기준마일리지</label>
			<input type="number" min="0" class="form-control" id="membership_mile" name="membership_mile" required="required" placeholder="기준마일리지를 입력하세요 0이상">
		</div>
		<div class="mb-3">
			<label for="membership_discount" class="form-label">할인율설정</label>
			<input type="number" max="100" min="0" class="form-control" id="membership_discount" name="membership_discount" required="required" placeholder="할인율을 입력하세요 0~100까지">
		</div>
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="submit" class="btn btn-primary">추가하기</button>
	</div>
	</form>
</body>
</html>