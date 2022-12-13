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
	function moveForm(str){
		var form = document.getElementById('form');
		var message ="";
		if(str =='update'){
			console.log(str);
			form.action="updateAirline";
			form.submit();
		}else if(str=='delete'){
			console.log(str);
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deleteAirline";
				form.submit();
			} else {
				alert("삭제되지 않았습니다");
			}
		}
	}
	
	
	function deleteAirline(){
		let message ="";
		message = confirm("정말로 삭제하시겠습니까?");
		if(message){
			let air_num = $('#air_num').val();
			alert(air_num);
			$.ajax({
				url : 'deleteAirline',
				method : 'POST',
				data : {'air_num' : air_num},
				success : function(data){
					if(data == 1){
						alert("삭제가 성공되었습니다")	;
						location.href='manageAirline';
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
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAirline'" value="돌아가기">
				</div>
				<c:forEach var="airlineDetail" items="${airlineDetail }">
					<table border="1" class="table table-striped">
						<tr>
							<th>항공사번호</th>
							<td><input type="text" class="form-control-plaintext" id="air_num" name="air_num" value="${airlineDetail.air_num }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>항공사코드</th>
							<td><input type="text" class="form-control-plaintext" name="air_code" value="${airlineDetail.air_code }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>항공사명</th>
							<td><input type="text" class="form-control" name="air_name" value="${airlineDetail.air_name }"></td>
						</tr>
						
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="항공사 수정">
					</div>
					<div>
						<input type="button" onclick="deleteAirline()" class="genric-btn danger radius elb" value="항공사 삭제">
					</div>
					</c:forEach>
					<!-- 여기에 회원들어갈꺼 -->
					<div class="mt-3 big">
					<table border="1" class="table table-striped">
						<thead>
						<tr>
							<th>이미지경로</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="airlineDetail" items="${airlineDetail }">
						<tr>
							<td>
								<span>현재 경로 : ${airlineDetail.air_picture }</span><br>
								<input type="file" id="air_picture" class="form-control" name="file1" accept="image/*">
								<input type="hidden" name="air_picture" value="${airlineDetail.air_picture }">
							</td>
						</tr>
						<tr>
							<td>
								<img src="${airlineDetail.air_picture }">
							</td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>