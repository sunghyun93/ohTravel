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
	function updateAirplane(){
		let message ="";
		message = confirm("정말로 수정하시겠습니까?");
		if(message){
			let airplane_name = $('#airplane_name').val();
			let general_seat = $('#general_seat').val();
			let business_seat = $('#business_seat').val();
			let first_seat = $('#first_seat').val();
			if(general_seat==null||general_seat==''){
				alert('일반석 갯수에  숫자가 아닌 문자가 있습니다');
				return false;
			}
			if(business_seat == null|| business_seat==''){
				alert("비즈니석 갯수에 숫자가 아닌 문자가 있습니다");
				return false;
			}
			if(first_seat == null||first_seat==''){
				alert("일등석 갯수에 숫자가 아닌 문자가 있습니다");
				return false;
			}
			$.ajax({
				url : 'updateAirplane',
				method : 'POST',
				data : {'airplane_name' : airplane_name,
						'general_seat' : general_seat,
						'business_seat' : business_seat,
						'first_seat' : first_seat},
				success : function(data){
					if(data == 1){
						alert("수정이 성공되었습니다")	;
						location.href='manageAirplane';
					}else{
						alert("문제가 있습니다");
					}
					
				}
			})
		}else{
			alert("수정하기가 취소되었습니다");
		}
		
	}
	function deleteAirplane(){
		let message ="";
		message = confirm("정말로 삭제하시겠습니까?");
		if(message){
			let airplane_name = $('#airplane_name').val();
			$.ajax({
				url : 'deleteAirplane',
				method : 'POST',
				data : {'airplane_name' : airplane_name},
				success : function(data){
					if(data == 1){
						alert("삭제가 성공되었습니다")	;
						location.href='manageAirplane';
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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">항공사 상세</h1>
			<form method="post" id="form" enctype="multipart/form-data">
				<div class="row">
				<div class="col-lg-12 col-sm-12 text-lg-end text-center">
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAirplane'" value="돌아가기">
				</div>
				<c:forEach var="airplaneDetail" items="${airplaneDetail }">
					<table border="1" class="table table-striped">
						<tr>
							<th>항공사번호</th>
							<td><input type="text" class="form-control-plaintext" id="airplane_name" name="airplane_name" value="${airplaneDetail.airplane_name }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>일반석 갯수</th>
							<td><input type="number" class="form-control" id="general_seat" name="general_seat" value="${airplaneDetail.general_seat }"></td>
						</tr>
						<tr>
							<th>비즈니스석 갯수</th>
							<td><input type="number" class="form-control" id="business_seat" name="business_seat" value="${airplaneDetail.business_seat }"></td>
						</tr>
						<tr>
							<th>일등석 갯수</th>
							<td><input type="number" class="form-control" id="first_seat" name="first_seat" value="${airplaneDetail.first_seat }"></td>
						</tr>
					</table>
					<div style="flex: 2">
						<input type="button" onclick="updateAirplane()" class="genric-btn info elb" value="비행기 수정">
					</div>
					<div>
						<input type="button" onclick="deleteAirplane()" class="genric-btn danger radius elb" value="비행기 삭제">
					</div>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
</body>
</html>