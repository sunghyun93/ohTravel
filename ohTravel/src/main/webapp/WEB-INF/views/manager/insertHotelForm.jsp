<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('.option').click(function(){
			let optionVal = $(this).val();
			console.log("현재 ->"+optionVal);
			if(optionVal == 'Y'){
				$(this).attr("value","N");
				optionVal = $(this).val();
				
			}else if (optionVal =='N'){
				$(this).attr('value','Y');
				optionVal = $(this).val();
			}
			console.log("후 ->"+optionVal);
		});
	});

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
	};
	
	
	function rep(event) {
		var reader = new FileReader();
		$("#image_rep_container").empty();
		reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		document.querySelector("div#image_rep_container").appendChild(img);
		};
	reader.readAsDataURL(event.target.files[0]);
	}

</script>
</head>
<body>
	<form action="insertHotel" method="post" enctype="multipart/form-data">
	<div class="container" style="min-height: 700px;">
	<h1>호텔 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="country_name" class="form-label">국가선택</label>
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
		<div class="mb-3">
			<label for="hotel_kor" class="form-label">호텔 한글명</label>
			<input type="text" class="form-control" name="hotel_kor" id="hotel_kor" required="required" placeholder="호텔 한글명 입력">
		</div>
		<div class="mb-3">
			<label for="hotel_eng" class="form-label">호텔 영문명</label>
			<input type="text" class="form-control" name="hotel_eng" id="hotel_eng" placeholder="호텔 영문명 입력">
		</div>
		<div class="mb-3">
			<label for="hotel_loc" class="form-label">호텔 주소</label>
			<input type="text" class="form-control" name="hotel_loc" id="hotel_loc" required="required" placeholder="호텔 주소입력">
		</div>
		<div class="form-check mb-3">
			<label>호텔타입 선택</label><br>			
			<input type="radio" class="form-check-input" name="hotel_type" id="hotel_type_hotel" required="required" value="hotel">
			<label for="hotel_type_hotel" class="form-check-label">호텔</label><br>
			<input type="radio" class="form-check-input" name="hotel_type" id="hotel_type_resort" required="required" value="resort">
			<label for="hotel_type_resort" class="form-check-label">리조트</label>
		</div>
		<div class="form-check mb-3">
			<label>호텔등급 선택</label><br>
			<input type="radio" class="form-check-input" name="hotel_grade" id="hotel_grade_1" required="required" value="1">
			<label for="hotel_grade_1" class="form-check-label">1성급</label><br>
			<input type="radio" class="form-check-input" name="hotel_grade" id="hotel_grade_2" required="required" value="2">
			<label for="hotel_grade_2" class="form-check-label">2성급</label><br>
			<input type="radio" class="form-check-input" name="hotel_grade" id="hotel_grade_3" required="required" value="3">
			<label for="hotel_grade_3" class="form-check-label">3성급</label><br>
			<input type="radio" class="form-check-input" name="hotel_grade" id="hotel_grade_4" required="required" value="4">
			<label for="hotel_grade_4" class="form-check-label">4성급</label><br>
			<input type="radio" class="form-check-input" name="hotel_grade" id="hotel_grade_5" required="required" value="5">
			<label for="hotel_grade_5" class="form-check-label">5성급</label>
		</div>
		<div class="mb-3">
			<label for="attr_id" class="form-label">호텔 전화번호</label>
			<input type="text" class="form-control" name="hotel_tel" id="hotel_tel" placeholder="호텔 대표번호 입력">
		</div>
		<div class="mb-3">
			<label for="room_cnt" class="form-label">호텔 객실수</label>
			<input type="number" class="form-control" name="room_cnt"  id="room_cnt" value="0" placeholder="호텔 객실수 입력">
		</div>
		<div class="mb-3">
			<label for="checkin" class="form-label">호텔 체크인시간</label>
			<input type="time" class="form-control" name="checkin" id="checkin" placeholder="체크인 시간 입력">
		</div>
		<div class="mb-3">
			<label for="checkout" class="form-label">호텔 체크아웃시간</label>
			<input type="time" class="form-control" name="checkout" id="checkout" placeholder="체크아웃 시간 입력">
		</div>
		<div class="form-check mb-3">
			<label>호텔옵션 선택</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="wifi" id="hotel_option_wifi">
			<label class="form-check-label" for="hotel_option_wifi">WIFI</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="smoke" id="hotel_option_smoke">
			<label class="form-check-label" for="hotel_option_smoke">흡연가능</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="restaurant" id="hotel_option_restaurant">
			<label class="form-check-label" for="hotel_option_restaurant">레스토랑</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="parking" id="hotel_option_parking">
			<label class="form-check-label" for="hotel_option_parking">주차</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="shopping" id="hotel_option_shopping">
			<label class="form-check-label" for="hotel_option_shopping">쇼핑시설</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="charging_station" id="hotel_option_charging_station">
			<label class="form-check-label" for="hotel_option_charging_station">전기차 충전소</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="bath" id="hotel_option_bath">
			<label class="form-check-label" for="hotel_option_bath">욕실욕품</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="coffee" id="hotel_option_coffee">
			<label class="form-check-label" for="hotel_option_coffee">커피메이커</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="roomservice" id="hotel_option_roomservice">
			<label class="form-check-label" for="hotel_option_roomservice">룸서비스</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="disabled" id="hotel_option_disabled">
			<label class="form-check-label" for="hotel_option_disabled">장애인 편의시설</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="balcony" id="hotel_option_balcony">
			<label class="form-check-label" for="hotel_option_balcony">발코니/테라스</label><br>
			<input class="form-check-input option" type="checkbox" value="N" name="safe" id="hotel_option_safe">
			<label class="form-check-label" for="hotel_option_safe">안전금고</label>
		</div>

		<div class="mb-3">
			<label for="air_picture" class="form-label">이미지</label>
			<input type="file" class="form-control" id="air_picture" name="file1" onchange="rep(event)" accept="image/*" required="required">
			<div id="image_rep_container"></div>
		</div>
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAir'" value="돌아가기">
		<input type="submit" class="btn btn-primary" value="추가하기">
	</div>
	</form>
</body>
</html>