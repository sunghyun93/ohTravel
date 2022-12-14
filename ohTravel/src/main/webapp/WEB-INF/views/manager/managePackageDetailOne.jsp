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
			form.action="updatePackage";
			form.submit();
		}else if(str=='delete'){
			console.log(str);
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deletePackage";
				form.submit();
			} else {
				alert("삭제되지 않았습니다");
			}
		}
	}
	
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

</script>

</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">패키지 상세</h1>
			<form method="post" id="form" enctype="multipart/form-data">
				<div class="row">
				<div class="col-lg-12 col-sm-12 text-lg-end text-center">
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='managePackageDetail?pkage_id=${pkage_id}&currentPage=${currentPage}'" value="돌아가기">
				</div>
				<c:forEach var="packageDetailOne" items="${packageDetailOne }">
					<table border="1" class="table table-striped">
						<tr>
							<th>패키지상세ID</th>
							<td><input type="text" class="form-control-plaintext" name="pkage_dt_id" value="${packageDetailOne.pkage_dt_id }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>패키지ID</th>
							<td><input type="text" class="form-control-plaintext" name="pkage_id" value="${packageDetailOne.pkage_id }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>패키지상세명</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_name }"></td>
						</tr>
						<tr>
							<th>테마</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_thema }"></td>
						</tr>
						<tr>
							<th>으른가격</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_Aprice }"></td>
						</tr>
						<tr>
							<th>아동가격</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_Cprice }"></td>
						</tr>
						<tr>
							<th>총인원</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_cnt }"></td>
						</tr>
						<tr>
							<th>최소인원</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_Mcnt }"></td>
						</tr>
						<tr>
							<th>예약인원</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_Rcnt }"></td>
						</tr>
						<tr>
							<th>가이드명</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_Gname }"></td>
						</tr>
						<tr>
							<th>미팅장소</th>
							<td><input type="text" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_meet }"></td>
						</tr>
						<tr>
							<th>미팅날짜</th>
							<td><input type="datetime-local" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_meetDate }"></td>
						</tr>
						<tr>
							<th>출발날짜</th>
							<td><input type="datetime-local" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_startDay }"></td>
						</tr>
						<tr>
							<th>도착날짜</th>
							<td><input type="datetime-local" class="form-control" name="pkage_dt_name" value="${packageDetailOne.pkage_dt_endDay }"></td>
						</tr>
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="패키지 상세 수정">
					</div>
					<div>
						<input type="button" onclick="moveForm('delete')" class="genric-btn danger radius elb" value="패키지 상세 삭제">
					</div>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
</body>
</html>