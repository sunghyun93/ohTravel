<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function getCountry_id(){
		var country_id = $('.country_id').val();
		console.log(country_id);
		$.ajax({
			url:'changeCountry',
			data : {'country_id' : country_id},
			success:function(data){
			/* $('.city_id > .list').find('li').each(function(){
					$(this).remove();
				}); */
				console.log(data);
				//$('.city_id').empty();
				$('.city_option').remove();
				$('.city_id > .list').empty();
				$.each(data, function(i){
					console.log(data[i].city_name);
					$('.city_id > .list').append("<li data-value='"+data[i].city_id+"' class='option' selected='selected'>"+data[i].city_name+"</li>");
					$('#city_ids').append("<option class='city_option' value='"+data[i].city_id+"'>"+data[i].city_name+"</option>");
				});
				$('.city_id > .current').text(data[0].city_name);
			}
		});
	}
	
	function chk(){
		let start_airport_name = $('#Start_Airport_name').val();
		let country_id = $('.country_id').val();
		let city_id = $('#city_ids').val();
		
		if(Start_Airport_name == null || Start_Airport_name ==""){
			alert("공항명이 입력되지 않았습니다");
			$('#Start_Airport_name').focus();
		}else if(city_ids == null ||city_ids ==0){
			alert("도시가 선택되지 않았습니다");
			
		}else{
			$.ajax({
				url : 'insertStartAirport',
				method : 'POST',
				data : {'start_airport_name' : start_airport_name,
						'country_id' : country_id,
						'city_id' : city_id},
				success : function(data){
					if(data == 1){
						alert("추가가 성공되었습니다")	;
						location.href='manageStartAirport';
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
	<h1>출발공항 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="ticket_name" class="form-label">출발공항 이름</label>
			<input type="text" class="form-control" name="Start_Airport_name" id="Start_Airport_name" required="required" placeholder="출발공항명 입력">
		</div>
		<div class="mb-3">
			<label for="country_id" class="form-label">국가선택</label>
			<select name="country_id" class="country_id" onchange="getCountry_id()" required="required">
				<c:forEach var="countryList" items="${countryList }">
					<option value="${countryList.country_id }">${countryList.country_name }</option>
				</c:forEach>
			</select>
		</div>
		<div class="mb-3">
			<label for="city_name" class="form-label">도시선택(국가를 먼저선택하세요)</label>
			<select class="city_id" id="city_ids" name="city_id" required="required">
			</select>
		</div>
		<hr>
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageStartAirport'" value="돌아가기">
		<button type="submit" class="btn btn-primary" onclick="chk()">추가하기</button>
	</div>
</body>
</html>