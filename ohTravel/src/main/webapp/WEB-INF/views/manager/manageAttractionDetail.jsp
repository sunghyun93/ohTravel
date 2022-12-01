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
			form.action="updateAttraction";
			form.submit();
		}else if(str=='delete'){
			console.log(str);
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deleteAttraction";
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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">관광지 상세</h1>
			<form method="post" id="form" enctype="multipart/form-data">
				<div class="row">
				<div class="col-lg-12 col-sm-12 text-lg-end text-center">
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAttraction?currentPage=${currentPage}'" value="돌아가기">
				</div>
				<c:forEach var="attractionDetail" items="${attractionDetail }">
					<input type="hidden" name="attr_Img_code" value="${attractionDetail.attr_Img_code }">
					<table border="1" class="table table-striped">
						<tr>
							<th>관광지ID</th>
							<td><input type="text" class="form-control-plaintext" name="attr_id" value="${attractionDetail.attr_id }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>도시ID</th>
							<td>
								<select name="country_id" onchange="getCountry_id()" class="country_id" required="required">
									<c:forEach var="countryList" items="${countryList }">
										<c:choose>
											<c:when test="${countryList.country_name eq ticketDetail.country_name }">
												<option value="${countryList.country_id }" selected="selected">${countryList.country_name }</option>
											</c:when>
											<c:otherwise>
												<option value="${countryList.country_id }">${countryList.country_name }</option>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>도시코드</th>
							<td class="city_td">
								<select class="city_id" id="city_ids" name="city_id" required="required">
									<c:forEach var="cityList" items="${cityList }">
										<c:choose>
											<c:when test="${cityList.city_name eq ticketDetail.city_name }">
												<option class="city_option" value="${cityList.city_id }" selected="selected">${cityList.city_name }</option>		
											</c:when>
											<c:otherwise>
												<option class="city_option" value="${cityList.city_id }">${cityList.city_name }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>관광지명</th>
							<td><input type="text" class="form-control" name="attr_name" value="${attractionDetail.attr_name }" required="required"></td>
						</tr>
						<tr>
							<th>관광지영어명</th>
							<td><input type="text" class="form-control" name="attr_ename" value="${attractionDetail.attr_ename }" required="required"></td>
						</tr>
						<tr>
							<th>관광지설명</th>
							<td>
								<textarea rows="20" cols="50" name="attr_info">${attractionDetail.attr_info }</textarea>
							</td>
						</tr>
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="관광지수정">
					</div>
					<div>
						<input type="button" onclick="moveForm('delete')" class="genric-btn danger radius elb" value="관광지삭제">
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
						<c:forEach var="attractionDetail" items="${attractionDetail }">
						<tr>
							<td>
								<span>현재 경로 : ${attractionDetail.attr_Img_path }</span><br>
								<input type="file" id="attr_img_path" class="form-control" name="file1" accept="image/*">
								<input type="hidden" name="attr_Img_path" value="${attractionDetail.attr_Img_path }">
							</td>
						</tr>
						<tr>
							<td>
								<img src="${attractionDetail.attr_Img_path }">
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