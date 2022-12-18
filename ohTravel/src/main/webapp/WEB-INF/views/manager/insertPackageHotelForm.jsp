<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script>
let msg = '${msg}'
if(msg == 'WRT_OK') alert("패키지 비행일정 추가에 성공했습니다.\n패키지 호텔을 추가해주세요.");
if(msg == 'WRT_OK_NOFLIGHT') alert("패키지 여행일정_관광지 추가에 성공했습니다.\n패키지 호텔을 추가해주세요.")
if(msg == 'WRT_ERR') alert("패키지 호텔 추가에 실패했습니다.\n다시 시도해주세요.")
</script>
<style>
	table.type08 {
	  border-collapse: collapse;
	  text-align: left;
	  line-height: 1.5;
	  border-left: 1px solid #ccc;
	  margin: 20px 10px;
	}
	
	table.type08 thead th {
	  padding: 10px;
	  font-weight: bold;
	  border-top: 1px solid #ccc;
	  border-right: 1px solid #ccc;
	  border-bottom: 2px solid #c00;
	  background: #dcdcd1;
	}
	table.type08 tbody th {
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	  background: #ececec;
	}
	table.type08 td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>
	<form action="/manager/insertPackageHotel" method="post" id="insertPackageHotelForm">
	<div class="container" style="min-height: 700px;">
	<h1>패키지 호텔 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="pkage_dt_id" class="form-label">패키지 ID</label>
			<input type="text" class="form-control" name="pkage_dt_id" id="pkage_dt_id" placeholder="패키지 상세이름을 입력하세요" value="${pkage_dt_id }" readonly>
		</div>
		<div class="mb-3">
			<div>호텔 선택</div>
			<div>
				<table class="type08">
					<tr>
						<th></th>
						<th>호텔명</th>
						<th>호텔위치</th>
						<th>호텔종류</th>
						<th>호텔등급</th>
					</tr>
					<c:forEach var="hotelDTO" items="${hotelList }" varStatus="status">
						<tr>
							<td>
								<label for="hotel_id${status.index }">선택</label>
								<input type="radio" class="hotelRadio" name="hotel_id" id="hotel_id${status.index }" value="${hotelDTO.hotel_id }">
							</td>
							<td>${hotelDTO.hotel_kor }</td>
							<td>${hotelDTO.hotel_loc }</td>
							<td>${hotelDTO.hotel_type }</td>
							<td>${hotelDTO.hotel_grade }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="button" id="insertBtn" class="btn btn-primary">추가하기</button>
	</div>
	</form>

<script>
$(function() {
	// 추가하기 버튼 클릭 시
	$('#insertBtn').click(function() {
		let flag = true;
		
		// 호텔 선택 radio 체크
		let check = 0;
		$('.hotelRadio').each(function(index, item) {
			if($(item).is(":checked")) {
				check++;
			}
		});
			
		// 체크한 것 없으면 return
		if(check == 0) {
			alert("호텔을 체크해주세요.")
			flag = false;
			return false;
		}
		
		// 유효성 검사 통과 시 insert
		if(flag) {
			$('#insertPackageHotelForm').submit();
		}
	})
})
</script>
</body>
</html>