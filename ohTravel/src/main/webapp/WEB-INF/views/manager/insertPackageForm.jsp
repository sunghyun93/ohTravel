<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
</head>
<script>
// 성공 / 실패 메세지
let msg = '${msg}';
if(msg == 'WRT_ERR') alert("패키지 상세 추가에 실패하였습니다.");

</script>
<body>
	<form action="/manager/insertPackage" method="post" id="pkageInsertForm">
	<div class="container" style="min-height: 700px;">
	<!-- <input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기"> -->
	<h1>패키지 상세 추가</h1> 
	<hr>
		<input type="hidden" name="pkage_id" value="${pk.pkage_id }">
		<div class="mb-3">
			<label for="pkage_dt_name" class="form-label">패키지 상세이름</label>
			<textarea rows="5" cols="50" class="form-control" name="pkage_dt_name" id="pkage_dt_name" placeholder="패키지 상세이름을 입력하세요">${pk.pkage_dt_name }</textarea>
		</div>
		<div class="mb-3">
			<label for="pkage_dt_thema" class="form-label">테마</label>
			<input type="text" class="form-control" id="pkage_dt_thema" name="pkage_dt_thema" value="${pk.pkage_dt_thema }" placeholder="테마를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Aprice" class="form-label">성인가격</label>
			<input type="number" class="form-control" id="pkage_dt_Aprice" name="pkage_dt_Aprice" value="${pk.pkage_dt_Aprice }" placeholder="성인 가격을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Cprice" class="form-label">아동가격</label>
			<input type="number" class="form-control" id="pkage_dt_Cprice" name="pkage_dt_Cprice" value="${pk.pkage_dt_Cprice }" placeholder="아이 가격을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_cnt" class="form-label">패키지 인원</label>
			<input type="number" class="form-control" id="pkage_dt_cnt" name="pkage_dt_cnt" value="${pk.pkage_dt_cnt }" placeholder="패키지 인원제한수를 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Mcnt" class="form-label">패키지 최소인원</label>
			<input type="number" class="form-control" id="pkage_dt_Mcnt" name="pkage_dt_Mcnt" value="${pk.pkage_dt_Mcnt }" placeholder="패키지 최소인원을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_Gname" class="form-label">가이드이름</label>
			<input type="text" class="form-control" id="pkage_dt_Gname" name="pkage_dt_Gname" value="${pk.pkage_dt_Gname }" placeholder="가이드이름을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_meet" class="form-label">사전미팅장소</label>
			<input type="text" class="form-control" id="pkage_dt_meet" name="pkage_dt_meet" value="${pk.pkage_dt_meet }" placeholder="사전미팅장소를 입력하세요" required="required">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_meetDate" class="form-label">사전미팅일시</label>
			<input type="datetime-local" class="form-control border-dark" id="pkage_dt_meetDate1" name="pkage_dt_meetDate1" value="${pk.pkage_dt_meetDate1 }" placeholder="사전미팅일시를 입력하세요" required="required">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_startDay" class="form-label">일정시작날짜</label>
			<input type="datetime-local" class="form-control border-dark" id="pkage_dt_startDay1" name="pkage_dt_startDay1" value="${pk.pkage_dt_startDay1 }" placeholder="일정시작날짜를 입력하세요" required="required">
		</div>
		<div class="mb-3">
			<label for="pkage_dt_endDay" class="form-label">일정종료날짜</label>
			<input type="datetime-local" class="form-control border-dark" id="pkage_dt_endDay1" name="pkage_dt_endDay1" value="${pk.pkage_dt_endDay1 }" placeholder="일정종료날짜를 입력하세요" required="required">
		</div>

		
		<button type="button" id="pkgDetailInsertBtn" class="btn btn-primary">추가하기</button>
	</div>
	</form>
<script>
$(function() {
	// 패키지 상세 추가하기 버튼 클릭 시
	$('#pkgDetailInsertBtn').click(function() {
		let flag = true;
		let pkage_dt_meetDate = $('#pkage_dt_meetDate1').val();
		let pkage_dt_startDay = $('#pkage_dt_startDay1').val();
		let pkage_dt_endDay = $('#pkage_dt_endDay1').val();
		//1,2,3 은 날짜 비교용
		let result1 = pkage_dt_meetDate.substring(0,4)+pkage_dt_meetDate.substring(5,7)+pkage_dt_meetDate.substring(8,10);
		let result2 = pkage_dt_startDay.substring(0,4)+pkage_dt_startDay.substring(5,7)+pkage_dt_startDay.substring(8,10);
		let result3 = pkage_dt_endDay.substring(0,4)+pkage_dt_endDay.substring(5,7)+pkage_dt_endDay.substring(8,10);
		//4,5,6 은 시간비교용
		let result4 = pkage_dt_meetDate.substring(11,13)+pkage_dt_meetDate.substring(14,16)+pkage_dt_meetDate.substring(17,19);
		let result5 = pkage_dt_startDay.substring(11,13)+pkage_dt_startDay.substring(14,16)+pkage_dt_startDay.substring(17,19);
		let result6 = pkage_dt_endDay.substring(11,13)+pkage_dt_endDay.substring(14,16)+pkage_dt_endDay.substring(17,19);
		console.log(result1);
		console.log(result2);
		console.log(result3);
		console.log(result4);
		console.log(result5);
		console.log(result6);
		console.log("오냐?");
		// 유효성 검사(빈 값만)
		$('.form-control').each(function(index, item) {
			if($(item).val() == '') {
				flag = false;
				alert("값을 입력해주세요.");
				$(item).focus();
				return false;
			}
		});
		//유효성 검사 시간 날짜 비교 추가
		if((result1 - result2)>0){
			alert("미팅 날짜는 일정시작 날짜보다 이후 일수 없습니다");
			flag = false;
			return false;
		}
		if ((result1 - result2)==0){
			if((result4 - result5) >= 0){
				alert("같은날에 일정시작 시간은 미팅시작 시간보다 이전일수 없습니다");
				flag = false;
				return false;
			}
		}
		if((result2 - result3)>0){
			alert("일정종료 날짜는 일정시작 날짜보다 이전일수 없습니다");
			flag = false;
			return false;
		}
		if ((result2 - result3)==0){
			if((result5 - result6) >= 0){
				alert("같은날에 일정종료 시간은 일정시작 날짜 시간보다 이전일수 없습니다");
				flag = false;
				return false;
			}
		}
		
		
		// 유효성 검사 대충  빈값만 통과하면 submit
		if(flag) {
			$('#pkageInsertForm').submit();
		}
	});
});

$(document).ready(function(){
	let pkage_dt_meetDate = $('#pkage_dt_meetDate1');
	let pkage_dt_startDay = $('#pkage_dt_startDay1');
	let pkage_dt_endDay = $('#pkage_dt_endDay1');
	let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -8);
	console.log(date);
	pkage_dt_meetDate.attr("min",date);
	pkage_dt_meetDate.val(date);
	
	pkage_dt_startDay.attr("min",date);
	pkage_dt_startDay.val(date);
	
	pkage_dt_endDay.attr("min",date);
	pkage_dt_endDay.val(date);
})

</script>
</body>
</html>