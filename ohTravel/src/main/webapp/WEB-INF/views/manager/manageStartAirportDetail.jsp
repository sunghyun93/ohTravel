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
	
	
	function updateStartAirport(){
		let message ="";
		message = confirm("정말로 수정하시겠습니까?");
		if(message){
			let start_airport_name = $('#start_airport_name').val();
			let country_id = $('.country_id').val();
			let city_id = $('#city_ids').val();
			alert(country_id);
			$.ajax({
				url : 'updateStartAirport',
				method : 'POST',
				data : {'start_airport_name' : start_airport_name,
						'country_id' : country_id,
						'city_id' : city_id},
				success : function(data){
					if(data == 1){
						alert("수정이 성공되었습니다")	;
						location.href='manageStartAirport';
					}else{
						alert("문제가 있습니다");
					}
					
				}
			})
		}else{
			alert("수정하기가 취소되었습니다");
		}
		
	}
	function deleteStartAirport(){
		let message ="";
		message = confirm("정말로 삭제하시겠습니까?");
		if(message){
			let start_airport_name = $('#start_airport_name').val();
			alert(start_airport_name);
			$.ajax({
				url : 'deleteStartAirport',
				method : 'POST',
				data : {'start_airport_name' : start_airport_name},
				success : function(data){
					if(data == 1){
						alert("삭제가 성공되었습니다")	;
						location.href='manageStartAirport';
					}else{
						alert("문제가 있습니다");
					}
					
				}
			})
		}else{
			alert("삭제가 취소되었습니다");
		}
		
	}
	

</script>

</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">출발공항 상세</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAttraction?currentPage=${currentPage}'" value="돌아가기">
			</div>
			<c:forEach var="startAirportDetail" items="${startAirportDetail }">
				<table border="1" class="table table-striped">
					<tr>
						<th>출발공항 명</th>
						<td><input type="text" class="form-control-plaintext" id="start_airport_name" name="attrstart_airport_name_id" value="${startAirportDetail.start_airport_name }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>도시ID</th>
						<td>
							<select name="country_id" onchange="getCountry_id()" class="country_id" required="required">
								<c:forEach var="countryList" items="${countryList }">
									<c:choose>
										<c:when test="${countryList.country_name eq startAirportDetail.country_name }">
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
						<th>도시코드</th>
						<td class="city_td">
							<select class="city_id" id="city_ids" name="city_id" required="required">
								<c:forEach var="cityList" items="${cityList }">
									<c:choose>
										<c:when test="${cityList.city_name eq startAirportDetail.city_name }">
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
				</table>
				<div style="flex: 2">
					<input type="button" onclick="updateStartAirport()" class="genric-btn info elb" value="출발공항 수정">
				</div>
				<div>
					<input type="button" onclick="deleteStartAirport()" class="genric-btn danger radius elb" value="출발공항 삭제">
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>