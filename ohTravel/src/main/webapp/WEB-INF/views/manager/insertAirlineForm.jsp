<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
	<form action="insertAirline" method="post" enctype="multipart/form-data">
	<div class="container" style="min-height: 700px;">
	<h1>항공사 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="air_code" class="form-label">항공사코드</label>
			<input type="number" class="form-control" name="air_code" id="air_code" placeholder="항공사코드입력">
		</div>
		<div class="mb-3">
			<label for="air_name" class="form-label">항공사명</label>
			<input type="text" class="form-control" name="air_name" id="air_name" placeholder="항공사명 입력">
		</div>
		<div class="mb-3">
			<label for="air_picture" class="form-label">이미지</label>
			<input type="file" class="form-control" id="air_picture" name="file1" onchange="rep(event)" accept="image/*">
			<div id="image_rep_container"></div>
		</div>
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAirline'" value="돌아가기">
		<button type="submit" class="btn btn-primary">추가하기</button>
	</div>
	</form>
</body>
</html>