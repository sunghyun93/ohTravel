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




	function chk(text) {
		let air_num = $('.air_num').val();
		let airplane_name = $('.airplane_name').val();
		let start_airport_name = $('.start_airport_name').val();
		let end_airport_name = $('.end_airport_name').val();
		let start_time = $('.start_time').val();
		let end_time = $('.end_time').val();
		let schedule_id = $('.schedule_id').val();
		let schedule_price = $('.schedule_price').val();
		console.log(start_time);
		console.log(end_time);
		let result1 = start_time.substring(0,4)+start_time.substring(5,7)+start_time.substring(8,10);
		let result2 = end_time.substring(0,4)+end_time.substring(5,7)+end_time.substring(8,10);
		let result3 = start_time.substring(11,13)+start_time.substring(14,16)+start_time.substring(17,19);
		let result4 = end_time.substring(11,13)+end_time.substring(14,16)+end_time.substring(17,19);
		console.log(result1);
		console.log(result2);
		console.log(result3);
		console.log(result4);
		
		if (text == 'update') {
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
			} else if ((result1 - result2)==0){
				if((result3 - result4) >= 0){
					alert("같은날에 도착시간은 출발시간보다 이전일수 없습니다")
				}
			} else if (start_time >= end_time) {
				alert("도착시간은 출발시간과 같거나 출발시간 이전일수 없습니다");
			} else {

				$.ajax({
					url : 'updateAirSchedule',
					data : {
						'air_num' : air_num,
						'airplane_name' : airplane_name,
						'start_airport_name' : start_airport_name,
						'end_airport_name' : end_airport_name,
						'start_time' : start_time,
						'end_time' : end_time,
						'schedule_id' : schedule_id,
						'schedule_price' : schedule_price
					},
					method : 'POST',
					success : function(data) {
						if (data == 1) {
							alert("수정이 성공되었습니다");
							location.href = 'manageAir';
						} else {
							alert("문제가 있습니다");
						}

					}
				})
			}
		}else if (text == 'delete') {
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				$.ajax({
					url : 'deleteAirSchedule',
					data : {
						'air_num' : air_num,
						'airplane_name' : airplane_name,
						'start_airport_name' : start_airport_name,
						'end_airport_name' : end_airport_name,
						'start_time' : start_time,
						'end_time' : end_time,
						'schedule_id' : schedule_id
					},
					method : 'POST',
					success : function(data) {
						if (data == 1) {
							alert("삭제가 성공되었습니다");
							location.href = 'manageAir';
						} else {
							alert("문제가 있습니다");
						}

					}
				})
			} else {
				alert('삭제되지 않았습니다');
			}

		}

	}

</script>

</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">항공일정 상세</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAir?currentPage=${currentPage}'" value="돌아가기">
			</div>
			<c:forEach var="airScheduleDetail" items="${airScheduleDetail }">
				<table border="1" class="table table-striped">
					<tr>
						<th>일정ID</th>
						<td><input type="text" class="form-control-plaintext schedule_id" name="schedule_id" value="${airScheduleDetail.schedule_id }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>항공사번호</th>
						<td>
							<select name="air_num" class="form-select air_num"required="required" onchange="changeAirline()">
								<c:forEach var="airlineList" items="${airlineList }">
									<c:choose>
										<c:when test="${airlineList.air_num eq airScheduleDetail.air_num }">
											<option value="${airlineList.air_num }" selected="selected">${airlineList.air_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${airlineList.air_num }">${airlineList.air_name }</option>	
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>항공편명</th>
						<td>
							<select name="airplane_name" class="form-select airplane_name" id="airplane_names" required="required">
								<c:forEach var="airplaneList" items="${airplaneList }">
									<c:choose>
										<c:when test="${airplaneList.airplane_name eq airScheduleDetail.airplane_name }">
											<option class="airplane_option" value="${airplaneList.airplane_name }" selected="selected">${airplaneList.airplane_name }</option>		
										</c:when>
										<c:otherwise>
											<option class="airplane_option" value="${airplaneList.airplane_name }">${airplaneList.airplane_name }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>출발공항</th>
						<td>
							<select name="start_airport_name" class="form-select start_airport_name"required="required">
								<c:forEach var="startAirportList" items="${startAirportList }">
									<c:choose>
										<c:when test="${startAirportList.start_airport_name eq airScheduleDetail.start_airport_name }">
											<option value="${startAirportList.start_airport_name }" selected="selected">${startAirportList.start_airport_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${startAirportList.start_airport_name }">${startAirportList.start_airport_name }</option>	
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>도착공항</th>
						<td>
							<select name="end_airport_name" class="form-select end_airport_name"required="required" size="10">
								<c:forEach var="endAirportList" items="${endAirportList }">
									<c:choose>
										<c:when test="${endAirportList.end_airport_name eq airScheduleDetail.end_airport_name }">
											<option value="${endAirportList.end_airport_name }" selected="selected">${endAirportList.end_airport_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${endAirportList.end_airport_name }">${endAirportList.end_airport_name }</option>	
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>출발시간</th>
						<td><input type="datetime-local" class="form-control start_time" name="start_time" value="${airScheduleDetail.start_time }" required="required"></td>
					</tr>
					<tr>
						<th>도착시간</th>
						<td><input type="datetime-local" class="form-control end_time" name="end_time" value="${airScheduleDetail.end_time }" required="required"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="number" class="form-control schedule_price" name="schedule_price" value="${airScheduleDetail.schedule_price }" required="required"></td>
					</tr>
				</table>
				<div style="flex: 2">
					<input type="button" onclick="chk('update')" class="genric-btn info elb" value="항공일정 수정">
				</div>
				<div>
					<input type="button" onclick="chk('delete')" class="genric-btn danger radius elb" value="항공일정 삭제">
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>