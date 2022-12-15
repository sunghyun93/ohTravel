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
	//국가변경시 도시 변경 Ajax
	function getCountry_id(){
		let country_id = $('.country_id').val();
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
	//호텔 옵션 변경 Ajax
	$(document).ready(function(){
		$(".form-check-input").change(function(){
			let hotel_option = $(this).attr('name');
			let hotel_exist = $(this).val();
			let hotel_id = $('.hotel_id').val();
			let option_id = $(this).attr('id');
			console.log('hotel_id ->'+hotel_id)
			console.log("현재 ->"+hotel_exist)
			console.log('option_id ->'+option_id);
			if(hotel_exist == 'Y'){
				$(this).attr("value","N");
				hotel_exist = $(this).val();
				
			}else if (hotel_exist =='N'){
				$(this).attr('value','Y');
				hotel_exist = $(this).val();
			}
			$.ajax({
				url : 'changeHotelOption',
				data : {'hotel_id' : hotel_id,
						'hotel_option' : hotel_option,
						'hotel_exist' : hotel_exist,
						'option_id' : option_id},
				method : 'POST',
				success : function(data){
					if(data == 1){
						alert("옵션수정 완료")	;
					}else{
						alert("문제가 있습니다");
					}
					
				}
			})
			
		});
		
	});
	
	function deleteHotel(){
		let hotel_id = $('.hotel_id').val();
		console.log('hotel_id ->'+hotel_id);
		message = confirm("정말로 삭제하시겠습니까?");
		if(message){
			$.ajax({
				url : 'deleteHotel',
				data : {'hotel_id' : hotel_id},
				type : 'POST',
				success : function(data){
					if (data > 0) {
						alert("호텔삭제가 성공되었습니다");
						location.href = 'manageHotel';
					} else {
						alert("문제가 있습니다");
					}
				}
			})	
		}else{
			alert("삭제되지 않았습니다");
		}
		
	}
	
</script>
</head>
<body>
<form action="updateHotel" method="post" enctype="multipart/form-data">
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">호텔 상세</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageHotel?currentPage=${currentPage}'" value="돌아가기">
				<input type="button" class="btn btn-primary mb-2 mr-2" style="float: right;" onclick="location.href='manageRoom?hotel_id=${hotel_id}&currentPage=${currentPage}'" value="객실보기">
			</div>
			<c:forEach var="hotelDetail" items="${hotelDetail }">
				<table border="1" class="table table-striped">
					<tr>
						<th>숙박업체ID</th>
						<td><input type="text" class="form-control-plaintext hotel_id" name="hotel_id" value="${hotelDetail.hotel_id }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>국가명</th>
						<td>
							<select name="country_id" onchange="getCountry_id()" class="country_id" required="required">
								<c:forEach var="countryList" items="${countryList }">
									<c:choose>
										<c:when test="${countryList.country_name eq hotelDetail.country_name }">
											<option value="${countryList.country_id }" selected="selected">${countryList.country_name }</option>
										</c:when>
										<c:otherwise>
											<option value="${countryList.country_id }">${countryList.country_name }</option>	
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>도시명</th>
							<td class="city_td">
								<select class="city_id" id="city_ids" name="city_id" required="required">
									<c:forEach var="cityList" items="${cityList }">
										<c:choose>
											<c:when test="${cityList.city_name eq hotelDetail.city_name }">
												<option class="city_option" value="${cityList.city_id }" selected="selected">${cityList.city_name }</option>		
											</c:when>
											<c:otherwise>
												<option class="city_option" value="${cityList.city_id }">${cityList.city_name }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
					</tr>
					<tr>
						<th>호텔명</th>
						<td><input type="text" class="form-control hotel_kor" name="hotel_kor" value="${hotelDetail.hotel_kor }" required="required"></td>
					</tr>
					<tr>
						<th>호텔영어명</th>
						<td><input type="text" class="form-control hotel_eng" name="hotel_eng" value="${hotelDetail.hotel_eng }" required="required"></td>
					</tr>
					<tr>
						<th>호텔위치</th>
						<td><input type="text" class="form-control hotel_loc" name="hotel_loc" value="${hotelDetail.hotel_loc }" required="required"></td>
					</tr>
					<tr>
						<th>호텔타입</th>
						<td><input type="text" class="form-control hotel_type" name="hotel_type" value="${hotelDetail.hotel_type }" required="required"></td>
					</tr>
					<tr>
						<th>호텔등급</th>
						<td><input type="number" min="0" max="5" class="form-control hotel_grade" name="hotel_grade" value="${hotelDetail.hotel_grade }"></td>
					</tr>
					<tr>
						<th>호텔번호</th>
						<td><input type="text" class="form-control hotel_tel" name="hotel_tel" value="${hotelDetail.hotel_tel }"></td>
					</tr>
					<tr>
						<th>객실수</th>
						<td><input type="number" min="0" class="form-control hotel_rv_num" name="room_cnt" value="${hotelDetail.room_cnt }"></td>
					</tr>
					<tr>
						<th>체크인시간</th>
						<td><input type="time" class="form-control checkin" name="checkin" value="${hotelDetail.checkin }"></td>
					</tr>
					<tr>
						<th>체크아웃시간</th>
						<td><input type="time" class="form-control checkout" name="checkout" value="${hotelDetail.checkout }"></td>
					</tr>
					<tr>
						<th>부대시설</th>
						<td>
						<c:forEach var="hotelOptionList" items="${hotelOptionList }">
							<c:if test="${hotelOptionList.option_gubun eq '부대' }">
							<div class="form-check">
								<c:if test="${hotelOptionList.hotel_exist eq 'Y' }">
									<input type="checkbox" class="form-check-input" id="${hotelOptionList.option_id }" name="${hotelOptionList.hotel_option }" value="${hotelOptionList.hotel_exist }" checked="checked">
								</c:if>
								<c:if test="${hotelOptionList.hotel_exist eq 'N' }">
									<input type="checkbox" class="form-check-input" id="${hotelOptionList.option_id }" name="${hotelOptionList.hotel_option }" value="${hotelOptionList.hotel_exist }">
								</c:if>
								<label for="${hotelOptionList.option_id }" class="form-check-label">${hotelOptionList.hotel_option }</label><br>
							</div>
							</c:if>
						</c:forEach>
						</td>
					</tr>
					<tr>
						<th>편의시설</th>
						<td>
						<c:forEach var="hotelOptionList" items="${hotelOptionList }">
							<c:if test="${hotelOptionList.option_gubun eq '편의' }">
							<div class="form-check">
								<c:if test="${hotelOptionList.hotel_exist eq 'Y' }">
									<input type="checkbox" class="form-check-input" id="${hotelOptionList.option_id }" name="optionChk" value="${hotelOptionList.hotel_exist }" checked="checked">
								</c:if>
								<c:if test="${hotelOptionList.hotel_exist eq 'N' }">
									<input type="checkbox" class="form-check-input" id="${hotelOptionList.option_id }" name="optionChk" value="${hotelOptionList.hotel_exist }">
								</c:if>
								<label for="${hotelOptionList.option_id }" class="form-check-label">${hotelOptionList.hotel_option }</label><br>
							</div>
							</c:if>
						</c:forEach>
						</td>
					</tr>
				</table>
				</c:forEach>
				<div class="mt-3 big">
					<c:forEach var="hotelDetail" items="${hotelDetail }">
					<table border="1" class="table table-striped">
						<thead>
						<tr>
							<th>호텔 이미지경로</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						
							<td>
								<span>현재 경로 : ${hotelDetail.h_img_path }</span><br>
								<input type="file" id="h_img_path" class="form-control file1" name="file1" accept="image/*">
								<input type="hidden" class="form-control h_img_path" name="h_img_path" value="${hotelDetail.h_img_path }">
							</td>
						</tr>
						<tr>
							<td>
								<img src="${hotelDetail.h_img_path }">
							</td>

						</tr>
						</tbody>
					</table>
					</c:forEach>

				</div>
				<div style="flex: 2">
					<input type="submit" class="genric-btn info elb" value="호텔 수정">
				</div>
				<div>
					<input type="button" onclick="deleteHotel()" class="genric-btn danger radius elb" value="호텔 삭제">
				</div>
				
			</div>
		</div>
	</div>
</form>
</body>
</html>