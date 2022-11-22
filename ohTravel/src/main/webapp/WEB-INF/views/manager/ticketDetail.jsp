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
			form.action="updateCoupon";
			form.submit();
		}else if(str=='delete'){
			console.log(str);
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deleteCoupon";
				form.submit();
			} else {
				alert("삭제되지 않았습니다");
			}
		}
	}
	
	function getCountry_id(){
		var country_id = $('#country_id').val();
		console.log(country_id);
		$.ajax({
			url:"changeCountry",
			data : country_id,
			success:function(data){
				
			}
			
		});
	}
</script>

</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">입장권상세</h1>
			<form method="post" id="form">
				<div class="row">
				<div class="col-lg-12 col-sm-12 text-lg-end text-center">
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
				</div>
				<c:forEach var="ticketDetail" items="${ticketDetail }">
					<table border="1" class="table table-striped">
						<thead>
						<tr>
							<th>입장권번호</th>
							<th>입장권이름</th>
							<th>입장권위치</th>
							<th>성인가격</th>
							<th>아이가격</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td><input type="text" name="ticket_id" value="${ticketDetail.ticket_id }" readonly="readonly"></td>
							<td><input type="text" name="ticket_name" value="${ticketDetail.ticket_name }" required="required"></td>
							<td><input type="text" name="ticket_name" value="${ticketDetail.ticket_location }" required="required"></td>
							<td><input type="number" name="ticket_adult_price" value="${ticketDetail.ticket_adult_price }" required="required"></td>
							<td><input type="number" name="ticket_child_price" value="${ticketDetail.ticket_child_price }"></td>
						</tr>
						<tr>
							<th>평점</th>
							<th>입장권유효기간</th>
							<th>입장권판매갯수</th>
							<th>국가명</th>
							<th>도시명</th>
						</tr>
						<tr>
							<td><input type="text" name="ticket_score" value="${ticketDetail.ticket_score }" readonly="readonly"></td>
							<td><input type="date" name="ticket_due_date" value="${ticketDetail.ticket_due_date }" required="required"></td>
							<td><input type="number" min="0" max="100000" name="ticket_sales_cnt" value="${ticketDetail.ticket_sales_cnt }" ></td>
							<td>
								<select name="country_id" onchange="getCountry_id()" id="country_id">
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
							<td>
								<select>
									<c:forEach var="cityList" items="${cityList }">
										<c:choose>
											<c:when test="${cityList.city_name eq ticketDetail.city_name }">
												<option value="${cityList.city_id }" selected="selected">${cityList.city_name }</option>		
											</c:when>
											<c:otherwise>
												<option value="${cityList.city_id }">${cityList.city_name }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
						</tr>
						</tbody>
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="쿠폰수정">
					</div>
					<div>
						<input type="button" onclick="moveForm('delete')" class="genric-btn danger radius elb" value="쿠폰삭제">
					</div>
					</c:forEach>
					<!-- 여기에 회원들어갈꺼 -->
					<div class="mt-3 big">
					<table border="1" class="table table-striped">
						<thead>
						<tr>
							<th>회원이름</th>
							<th>쿠폰다운로드일시</th>
							<th>쿠폰사용여부 사용시1</th>
							<th>쿠폰유효기간</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="couponMemberDetail" items="${couponMemberDetail }">
						<tr>
							<td><input type="text" name="membership_id" value="${couponMemberDetail.mem_id }" readonly="readonly"></td>
							<td><input type="text" name="membership_name" value="${couponMemberDetail.coupon_down }" required="required"></td>
							<td><input type="text" name="membership_mile" value="${couponMemberDetail.coupon_use }" ></td>
							<td><input type="text" name="membership_discount" value="${couponMemberDetail.coupon_limit_date }" required="required"></td>
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