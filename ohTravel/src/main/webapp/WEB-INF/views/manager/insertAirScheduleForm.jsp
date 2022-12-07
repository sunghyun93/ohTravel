<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function changeAirline(){
		let air_num = $('.air_num').val();
		console.log(air_num);
		$.ajax({
			url:'changeAirline',
			data : {'air_num' : air_num},
			success:function(data){
			/* $('.city_id > .list').find('li').each(function(){
					$(this).remove();
				}); */
				console.log(data);
				//$('.city_id').empty();
				$('.airplane_option').remove();
				$('.airplane_name > .list').empty();
				$.each(data, function(i){
					console.log(data[i].city_name);
					$('.airplane_name > .list').append("<li data-value='"+data[i].airplane_name+"' class='option' selected='selected'>"+data[i].airplane_name+"</li>");
					$('#airplane_names').append("<option class='airplane_option' value='"+data[i].airplane_name+"'>"+data[i].airplane_name+"</option>");
				});
				$('.airplane_name > .current').text(data[0].airplane_name);
			}
		});
	}
	
	
	
	function chk(){
		let air_num = $('.air_num').val();
		let airplane_name = $('.airplane_name').val();
		let start_airport_name = $('.start_airport_name').val();
		let end_airport_name = $('.end_airport_name').val();
		let start_time = $('.start_time').val();
		let end_time = $('.end_time').val();
		let result1 = start_time.substring(0,4)+start_time.substring(5,7)+start_time.substring(8,10);
		let result2 = end_time.substring(0,4)+end_time.substring(5,7)+end_time.substring(8,10);
		let result3 = start_time.substring(11,13)+start_time.substring(14,16)+start_time.substring(17,19);
		let result4 = end_time.substring(11,13)+end_time.substring(14,16)+end_time.substring(17,19);
		console.log(result1);
		console.log(result2);
		console.log(result3);
		console.log(result4);
		
		if (air_num == null || air_num == "") {
			alert('항공사를 선택하세요');
		} else if (airplane_name == null || airplane_name == "") {
			alert("항공편명을 선택하세요");
		} else if (start_airport_name == null || start_airport_name == "") {
			alert("출발공항을 선택하세요");
		} else if (end_airport_name == null || end_airport_name == "") {
			alert("도착공항을 선택하세요");
		} else if (start_airport_name == end_airport_name) {
			alert("출발공항과 도착공항은 같을수 없습니다")
		} else if((result1 - result2)>0){
			alert("도착날짜는 출발날짜보다 이전일수 없습니다")
		} else if (start_time >= end_time) {
			alert("도착시간은 출발시간과 같거나 출발시간 이전일수 없습니다");
		} else {
			$.ajax({
				url : 'insertAirSchedule',
				data : {'air_num' : air_num,
						'airplane_name' : airplane_name,
						'start_airport_name' : start_airport_name,
						'end_airport_name' : end_airport_name,
						'start_time' : start_time,
						'end_time' : end_time},
				method : 'POST',
				success : function(data){
					if(data == 1){
						alert("추가가 성공되었습니다")	;
						location.href='manageAir';
					}else{
						alert("문제가 있습니다");
					}
					
				}
			})
			
		}
		
	}
</script>
</head>
<body>
	<div class="container" style="min-height: 700px;">
	<h1>비행일정 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="air_num" class="form-label">항공사선택</label>
			<select name="air_num" class="form-select air_num"required="required" onchange="changeAirline()">
				<c:forEach var="airlineList" items="${airlineList }">
					<option value="${airlineList.air_num }">${airlineList.air_name }</option>
				</c:forEach>
			</select>
		</div>
		<div class="mb-3">
			<label for="airplane_name" class="form-label">항공편명 선택(항공사를 먼저 선택하세요)</label>
			<select name="airplane_name" class="form-select airplane_name" id="airplane_names" required="required">
			</select>
		</div>
		<div class="mb-3">
			<label for="start_airport_name" class="form-label">출발공항</label>
			<select name="start_airport_name" class="form-select start_airport_name"required="required">
				<c:forEach var="startAirportList" items="${startAirportList }">
					<option value="${startAirportList.start_airport_name }">${startAirportList.start_airport_name }</option>
				</c:forEach>
			</select>
		</div>
		<div class="mb-3">
			<label for="end_airport_name" class="form-label">도착공항</label>
			<select name="end_airport_name" class="form-select end_airport_name"required="required" size="10">
				<c:forEach var="endAirportList" items="${endAirportList }">
					<option value="${endAirportList.end_airport_name }">${endAirportList.end_airport_name }</option>
				</c:forEach>
			</select>
		</div>
		
		<div class="mb-3">
			<label for="start_time" class="form-label">출발시간</label>
			<input type="datetime-local" class="form-control start_time" id="start_time" name="start_time"placeholder="출발시간을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="end_time" class="form-label">도착시간</label>
			<input type="datetime-local" class="form-control end_time" id="end_time" name="end_time"placeholder="도착시간을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="schedule_price" class="form-label">가격</label>
			<input type="number" class="form-control" id="schedule_price" name="schedule_price"placeholder="가격을 입력하세요">
		</div>
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAir'" value="돌아가기">
		<button type="button" class="btn btn-primary" onclick="chk()">추가하기</button>
	</div>
</body>
</html>