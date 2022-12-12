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
			form.action="updateTicket";
			form.submit();
		}else if(str=='delete'){
			console.log(str);
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deleteTicket";
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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">입장권상세</h1>
			<form method="post" id="form" enctype="multipart/form-data">
				<div class="row">
				<div class="col-lg-12 col-sm-12 text-lg-end text-center">
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageTicket?currentPage=${currentPage}'" value="돌아가기">
				</div>
				<c:forEach var="ticketDetail" items="${ticketDetail }">
					<table border="1" class="table table-striped">
						<tr>
							<th>입장권번호</th>
							<td><input type="text" class="form-control" name="ticket_id" value="${ticketDetail.ticket_id }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>입장권이름</th>
							<td><input type="text" class="form-control" name="ticket_name" value="${ticketDetail.ticket_name }" required="required"></td>
						</tr>
						<tr>
							<th>입장권위치</th>
							<td><input type="text" class="form-control" name="ticket_location" value="${ticketDetail.ticket_location }" required="required"></td>
						</tr>
						<tr>
							<th>성인가격</th>
							<td><input type="number" class="form-control" name="ticket_adult_price" value="${ticketDetail.ticket_adult_price }" required="required"></td>
						</tr>
						<tr>
							<th>아이가격</th>
							<td><input type="number" class="form-control" name="ticket_child_price" value="${ticketDetail.ticket_child_price }"></td>
						</tr>
						<tr>
							<th>평점</th>
							<td><input type="text" class="form-control" name="ticket_score" value="${ticketDetail.ticket_score }"></td>
						</tr>
						<tr>
							<th>입장권유효기간</th>
							<td><input type="datetime-local" class="form-control" name="ticket_due_date" value="${ticketDetail.ticket_due_date }"></td>
						</tr>
						<tr>
							<th>입장권판매갯수</th>
							<td><input type="number" min="0" max="100000" name="ticket_sales_cnt" value="${ticketDetail.ticket_sales_cnt }" ></td>
						</tr>
						<tr>
							<th>국가명</th>
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
							<th>도시명</th>
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
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="입장권수정">
					</div>
					<div>
						<input type="button" onclick="moveForm('delete')" class="genric-btn danger radius elb" value="입장권삭제">
					</div>
					</c:forEach>
					<!-- 여기에 회원들어갈꺼 -->
					<div class="mt-3 big">
					<table border="1" class="table table-striped">
						<thead>
						<tr>
							<th>작은이미지경로</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="ticketDetail" items="${ticketDetail }">
						<tr>
							<td>
								<span>현재 경로 : ${ticketDetail.ticket_rep_img_path }</span><br>
								<input type="file" id="ticket_rep_img_path" class="form-control" name="file1" accept="image/*">
								<input type="hidden" name="ticket_rep_img_path" value="${ticketDetail.ticket_rep_img_path }">
							</td>
						</tr>
						<tr>
							<td>
								<img src="${ticketDetail.ticket_rep_img_path }">
							</td>
						</tr>
						<tr>
							<td>
								<span>현재 경로 : ${ticketDetail.ticket_detail_img_path }</span><br>
								<input type="file" id="ticket_detail_img_path" class="form-control" name="file2" accept="image/*">
								<input type="hidden" name="ticket_detail_img_path" value="${ticketDetail.ticket_detail_img_path }">
							</td>
						</tr>
						<tr>
							<td>
								<img src="${ticketDetail.ticket_detail_img_path }">
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