<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertPackage" method="post" enctype="multipart/form-data">
	<div class="container" style="min-height: 700px;">
	<h1>패키지 상세 추가</h1>
	<hr>
		<input type="hidden" name="pkage_id" value="${pk.pkage_id }">
		<div class="mb-3">
			<label for="pkage_dt_name" class="form-label">패키지 상세이름</label>
			<textarea rows="20" cols="50" class="form-control" name="pkage_dt_name" id="pkage_dt_name" placeholder="패키지 상세이름을 입력하세요"></textarea>
		</div>
		<div class="mb-3">
			<label for="pkage_dt_thema" class="form-label">테마</label>
			<input type="text" class="form-control" id="pkage_dt_thema" name="pkage_dt_thema" placeholder="테마를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Aprice" class="form-label">성인가격</label>
			<input type="number" class="form-control" id="pkage_dt_Aprice" name="pkage_dt_Aprice" placeholder="성인 가격을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Cprice" class="form-label">아동가격</label>
			<input type="number" class="form-control" id="pkage_dt_Cprice" name="pkage_dt_Cprice" placeholder="아이 가격을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_cnt" class="form-label">패키지 인원</label>
			<input type="number" class="form-control" id="pkage_dt_cnt" name="pkage_dt_cnt" placeholder="패키지 인원제한수를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Mcnt" class="form-label">패키지 최소인원</label>
			<input type="number" class="form-control" id="pkage_dt_Mcnt" name="pkage_dt_Mcnt"  placeholder="패키지 최소인원을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Gname" class="form-label">가이드이름</label>
			<input type="text" class="form-control" id="pkage_dt_Gname" name="pkage_dt_Gname" placeholder="가이드이름을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_meet" class="form-label">사전미팅장소</label>
			<input type="text" class="form-control" id="pkage_dt_meet" name="pkage_dt_meet" placeholder="사전미팅장소를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_meetDate" class="form-label">사전미팅일시</label>
			<input type="datetime-local" class="form-control border-dark" id="pkage_dt_meetDate" name="pkage_dt_meetDate" placeholder="사전미팅일시를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_startDay" class="form-label">일정시작날짜</label>
			<input type="date" class="form-control border-dark" id="pkage_dt_startDay" name="pkage_dt_startDay" placeholder="일정시작날짜를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_endDay" class="form-label">일정종료날짜</label>
			<input type="date" class="form-control border-dark" id="pkage_dt_endDay" name="pkage_dt_endDay" placeholder="일정종료날짜를 입력하세요">
		</div>

		
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="submit" class="btn btn-primary">추가하기</button>
	</div>
	</form>
</body>
</html>