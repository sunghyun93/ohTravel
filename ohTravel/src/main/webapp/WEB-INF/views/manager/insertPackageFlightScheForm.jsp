<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script>
let msg = '${msg}'
if(msg == 'WRT_OK') alert("패키지 여행일정_관광지 추가에 성공했습니다.\n비행일정을 추가해주세요.");
if(msg == 'WRT_ERR') alert("패키지 비행일정 추가에 실패했습니다.\n다시 시도해주세요.")
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
	<form action="/manager/insertPackageFlightSche" id="packageFlightScheForm" method="post">
	<div class="container" style="min-height: 700px;">
	<h1>패키지 비행 일정 추가</h1>
	<hr>
		<input type="hidden" name="pkage_dt_id" value="${pkage_dt_id }">
		<%-- 비행기 시간으로 패키지 일정시작날짜 조정 --%>
		<input type="hidden" name="updateStartDate" id="updateStartDate" value="">
		<%-- 비행기 시간으로 패키지 일정종료날짜 조정 --%>
		<input type="hidden" name="updateEndDate" id="updateEndDate" value="">
		<div class="mb-3">
			<div>출발 비행기 목록</div>
			<input type="hidden" name="pkage_dt_idL" id="pkage_dt_idL" value="${pkage_dt_id }"></input>
			<input type="hidden" name="pkage_gubunL" id="pkage_gubunL" value="0"> <%-- 출발 --%>
			
			<table border="1" class="type08">
				<tr>
					<th></th>
					<th>출발공항명</th>
					<th>도착공항명</th>
					<th>출발시간</th>
					<th>도착시간</th>
				</tr>
				<c:forEach var="beginAirSche" items="${beginAirScheList }" varStatus="status">
					<tr>
						<td>
							<label for="startSchedule_id${status.index }">선택</label>
							<input type="radio" class="startRadio" name="startSchedule_id" id="startSchedule_id${status.index }" value="${beginAirSche.schedule_id }">
						</td>
						<td>${beginAirSche.start_airport_name }</td>
						<td>${beginAirSche.end_airport_name }</td>
						<td id="startDateTd"><fmt:formatDate value="${beginAirSche.start_time }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td><fmt:formatDate value="${beginAirSche.end_time }" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<hr>
		<div class="mb-3">
			<div class="mb-30">도착 비행기 목록</div>
			<input type="hidden" name="pkage_dt_idL" id="pkage_dt_idL" value="${pkage_dt_id }"></input>
			<input type="hidden" name="pkage_gubunL" id="pkage_gubunL" value="1"> <%-- 출발 --%>
			<table border="1" class="type08">
				<tr>
					<th></th>
					<th>출발공항명</th>
					<th>도착공항명</th>
					<th>출발시간</th>
					<th>도착시간</th>
				</tr>
				<c:forEach var="endAirSche" items="${endAirScheList }" varStatus="status">
					<tr>
						<td>
							<label for="endSchedule_id${status.index }">선택</label>
							<input type="radio" class="endRadio" name="endSchedule_id" id="endSchedule_id${status.index }" value="${endAirSche.schedule_id }">
						</td>
						<td>${endAirSche.start_airport_name }</td>
						<td>${endAirSche.end_airport_name }</td>
						<td><fmt:formatDate value="${endAirSche.start_time }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td id="endDateTd"><fmt:formatDate value="${endAirSche.end_time }" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="button" id="insertBtn" class="btn btn-primary">추가하기</button>
	</div>
	</form>

<script>
$(function() {
	// 시작/종료 일정 input 태그에 넣어주기
	$('.startRadio').click(function() {
		// 시작 일정 input 태그에 시작 일정 넣기
		$('#updateStartDate').val($(this).closest('td').siblings('#startDateTd').text());
	})
	$('.endRadio').click(function() {
		// 종료 일정 input 태그에 종료 일정 넣기
		$('#updateEndDate').val($(this).closest('td').siblings('#endDateTd').text());
	})
	
	
	$('#insertBtn').click(function() {
		let flag = true;
		
		// 라디오 체크 되어있는지 검사
		let check = 0;
		$('.startRadio').each(function(index, item) {
			if($(item).is(':checked')) {
				check++;
			}
		});
		
		let check1 = 0;
		$('.endRadio').each(function(index, item) {
			if($(item).is(':checked')) {
				check1++;
			}
		});
		
		console.log("check = " +check+", check1 = " + check1);
		if(check == 0) {
			alert("출발 비행기를 선택해주세요");
			flag = false;
			return false;
		}
		if(check1 == 0) {
			alert("도착 비행기를 선택해주세요");
			flag = false;
			return false;
		}
		
		if(flag) {
			$('#packageFlightScheForm').submit();
		}
	});
})
</script>
</body>
</html>