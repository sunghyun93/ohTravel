<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titleFont {
    font-weight: 600;
    font-size: 25px;
    border-bottom: 1px solid black;
    margin-bottom: 15px;
}
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script>
// controller 에서 오는 메세지들
let msg = '${msg}';
if(msg == 'WRT_OK') alert("패키지 상세 추가에 성공하였습니다.\n여행 일정을 추가해주세요.");
if(msg == "WRT_ERR") alert("패키지 여행 일정 추가에 실패하였습니다.\n다시 시도해주세요.");
</script>
</head>
<body>
	<form action="/manager/insertPkgSche" id="pkageInsertForm" method="post">
	<div class="container" style="min-height: 700px;">
	<h1>패키지 상세의 여행일정 추가</h1>
	<hr>
		<input type="hidden" name="scheDays" value="${pkage_detailDTO.day }">
		<%-- 패키지 상세에서 startDay 와 endDay 의 차이 일 수 만큼 여행일차가 생성되도록 함 --%>
		<c:forEach begin="1" end="${pkage_detailDTO.day }" varStatus="status">
			<div data-scheDay="${status.count }" style="margin-top:30px;">
				<h2>${status.count }일차</h2>
				<input type="hidden" name="pkage_sche_dayList" value="${status.count }">
				<input type="hidden" name="pkage_dt_idList" value="${pkage_detailDTO.pkage_dt_id }">
				<div class="mb-3">
					<div class="titleFont">이동수단</div>
					<input type="text" class="form-control text" id="pkage_sche_trans" name="pkage_sche_transList" placeholder="이동수단을 입력하세요">
				</div>
				<hr>
				<div class="mb-3">
					<div class="titleFont">조식</div>
					<input type="text" class="form-control text" id="pkage_sche_b" name="pkage_sche_bList" placeholder="조식을 입력하세요">
				</div>
				<hr>
				<div class="mb-3">
					<div class="titleFont">중식</div>
					<input type="text" class="form-control text" id="pkage_sche_l" name="pkage_sche_lList" placeholder="중식을 입력하세요">
				</div>
				<hr>
				<div class="mb-3">
					<div class="titleFont">석식</div>
					<input type="text" class="form-control text" id="pkage_sche_d" name="pkage_sche_dList" placeholder="석식을 입력하세요">
				</div>
				<hr>
			</div>
			<hr>
		</c:forEach>

		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="button" id="insertPkgScheBtn" class="btn btn-primary">추가하기</button>
	</div>
	</form>
	
<script>
$(function() {
	// 패키지 일정 추가하기 버튼 클릭 시
	let flag = true;
	$('#insertPkgScheBtn').click(function() {
		
		console.log("오냐?");
		// 유효성 검사(빈 값만)
		$('.form-control').each(function(index, item) {
			// console.log($(item));
			if($(item).val() == "") {
				alert("값을 입력해주세요");
				$(item).focus();
				flag = false;
				return false;
			} else {
				flag = true;
			}

		});
		
		// 유효성 검사 대충  빈값만 통과하면 submit
		if(flag) {
			$('#pkageInsertForm').submit();
		}
	});
});
</script>
</body>
</html>