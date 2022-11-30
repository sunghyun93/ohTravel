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
	
	function detail(event) {
		var reader = new FileReader();
		$("#image_detail_container").empty();
		reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		document.querySelector("div#image_detail_container").appendChild(img);
		};
	reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>
<body>
	<form action="insertTicket" method="post" enctype="multipart/form-data">
	<div class="container" style="min-height: 700px;">
	<h1>입장권추가</h1>
	<hr>
		<div class="mb-3">
			<label for="ticket_name" class="form-label">입장권 이름</label>
			<input type="text" class="form-control" name="ticket_name" id="ticket_name" required="required" placeholder="입장권명입력">
		</div>
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
			<label for="ticket_location" class="form-label">입장권 위치</label>
			<input type="text" class="form-control" id="ticket_location" name="ticket_location" required="required" placeholder="입장권 위치를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="ticket_adult_price" class="form-label">어른가격</label>
			<input type="number" class="form-control" id="ticket_adult_price" name="ticket_adult_price" required="required" placeholder="성인 가격을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="ticket_child_price" class="form-label">아이가격</label>
			<input type="number" class="form-control" id="ticket_child_price" name="ticket_child_price" required="required" placeholder="아이 가격을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="ticket_rep_img_path" class="form-label">작은 이미지</label>
			<input type="file" class="form-control" id="ticket_rep_img_path" name="file1" required="required" onchange="rep(event)" accept="image/*">
			<div id="image_rep_container"></div>
		</div>
		 <div class="mb-3 imgg">
			<label for="ticket_detail_img_path" class="form-label">상세 이미지</label>
			<input type="file" class="form-control" id="ticket_detail_img_path" name="file1" required="required" onchange="detail(event)" accept="image/*">
			<div id="image_detail_container"></div>
		</div>
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="submit" class="btn btn-primary">추가하기</button>
	</div>
	</form>
</body>
</html>