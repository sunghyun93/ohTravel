<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">쿠폰다운로드 페이지</h1>
			<div class="row">
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>쿠폰번호</th>
						<th>쿠폰이름</th>
						<th>쿠폰할인금액</th>
						<th>사용가능수량</th>
						<th>비고</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="coupon" items="${getMemCouponList }">
					<tr>
						<td>${coupon.coupon_id }</td>
						<td>${coupon.coupon_name }</td>
						<td>${coupon.coupon_discount }</td>
						<td id="quantity">${coupon.coupon_quantity }</td>
						<td>
						<c:if test="${coupon.mem_coupon_null == 1 }">
							<button type="button" class="btn btn-primary mb-2" disabled="disabled">다운로드</button>
						</c:if>
						<c:if test="${coupon.mem_coupon_null == 0 }">
						<c:choose>
							<c:when test="${coupon.coupon_quantity != 0 }">
								<button type="button" class="btn btn-primary mb-2 couponDown" value="${coupon.coupon_id }">다운로드</button>
							</c:when>
							<c:when test="${coupon.coupon_quantity == 0 }">
								<button type="button" class="btn btn-primary mb-2" disabled="disabled">다운로드</button>	
							</c:when>
						</c:choose>
							
						</c:if>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('.couponDown').click(function(){
		let coupon_id = $(this).val();
		let a = $(this);
		let mem_id = '${sessionId}';
		let result = 1;
		$.ajax({
			url : 'insertMemCoupon',
			data : {'coupon_id' : coupon_id,
					'mem_id' :mem_id },
			method : 'POST',
			success : function(data){
				console.log(coupon_id);
				alert("다운완료");
				a.attr("disabled",true);
				location.reload();
			}
		}) 
	})
	
	
</script>
</html>