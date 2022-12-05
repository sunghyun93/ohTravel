<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function insertAirplane(){
		let airplane_name = $('#airplane_name').val();
		let general_seat = $('#general_seat').val();
		let business_seat = $('#business_seat').val();
		let first_seat = $('#first_seat').val();
		$.ajax({
			url : 'insertAirplane',
			method : 'POST',
			data : {'airplane_name' : airplane_name,
					'general_seat' : general_seat,
					'business_seat' : business_seat,
					'first_seat' : first_seat},
			success : function(data){
				if(data == 1){
					alert("추가가 성공되었습니다")	;
					location.href='manageAirplane';
				}else{
					alert("문제가 있습니다");
				}
				
			}
		})
	}
</script>
</head>
<body>
	<div class="container" style="min-height: 700px;">
	<h1>비행기 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="airplane_name" class="form-label">항공편명</label>
			<input type="text" class="form-control" name="airplane_name" id="airplane_name" placeholder="항공편명 입력">
		</div>
		<div class="mb-3">
			<label for="general_seat" class="form-label">일반석 갯수</label>
			<input type="number" class="form-control" name="general_seat" id="general_seat" placeholder="항공사명 입력">
		</div>
		<div class="mb-3">
			<label for="business_seat" class="form-label">비즈니석 갯수</label>
			<input type="number" class="form-control" name="business_seat" id="business_seat" placeholder="항공사명 입력">
		</div>
		<div class="mb-3">
			<label for="first_seat" class="form-label">일등석 갯수</label>
			<input type="number" class="form-control" name="first_seat" id="first_seat" placeholder="항공사명 입력">
		</div>
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAirline'" value="돌아가기">
		<button type="submit" class="btn btn-primary" onclick="insertAirplane()">추가하기</button>
	</div>
</body>
</html>