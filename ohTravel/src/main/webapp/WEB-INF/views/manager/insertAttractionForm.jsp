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
	
	function chk(){
		var city_id = $('.city_id').val();
		console.log('city_id ->'+city_id);
		if(city_id == null || city_id ==''){
			alert('도시정보를 입력하세요');
			$('.city_id').focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form action="insertAttraction" method="post" enctype="multipart/form-data">
	<div class="container" style="min-height: 700px;">
	<h1>관광지 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="attr_id" class="form-label">관광지 ID</label>
			<input type="number" class="form-control" name="attr_id" id="attr_id" required="required" placeholder="관광지ID입력">
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
			<label for="attr_name" class="form-label">관광지 이름</label>
			<input type="text" class="form-control" name="attr_name" id="attr_name" placeholder="관광지 한글명입력">
		</div>
		<div class="mb-3">
			<label for="attr_ename" class="form-label">관광지 영어 이름</label>
			<input type="text" class="form-control" id="attr_ename" name="attr_ename" placeholder="관광지 영어 이름을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="attr_info" class="form-label">관광지정보</label>
			<textarea rows="20" cols="20" class="form-control" id="attr_info" name="attr_info" placeholder="관광지 정보를 입력하세요"></textarea>
		</div>
		<div class="mb-3">
			<label for="attr_img_path" class="form-label">이미지</label>
			<input type="file" class="form-control" id="attr_img_path" name="file1" required="required" onchange="rep(event)" accept="image/*">
			<div id="image_rep_container"></div>
		</div>
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAttraction'" value="돌아가기">
		<button type="submit" class="btn btn-primary" onclick="chk()">추가하기</button>
	</div>
	</form>
</body>
</html>