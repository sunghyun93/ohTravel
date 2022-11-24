<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			form.action="updateMembership";
			form.submit();
		}else if(str=='delete'){
			console.log(str);
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deleteMembership";
				form.submit();
			} else {
				alert("삭제되지 않았습니다");
			}
		}
	}
</script>

</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a href="manageUser" class="genric-btn primary ela">회원관리</a>
				<a href="manageMemberShip" class="genric-btn primary ela">등급관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">등급상세</h1>
			<form method="post" id="form">
				<div class="row">
				<c:forEach var="detail" items="${membershipDetail }">
				<div class="col-lg-12 col-sm-12 text-lg-end text-center">
					<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageMembership'" value="돌아가기">
				</div>
					<table border="1" class="table table-striped">
						<tr>
							<th>회원등급코드</th>
							<th>회원등급명</th>
							<th>등급기준마일리지</th>
							<th>회원등급할인율</th>
						</tr>
						<tr>
							<td><input type="text" name="membership_id" value="${detail.membership_id }" readonly="readonly"></td>
							<td><input type="text" name="membership_name" value="${detail.membership_name }" required="required"></td>
							<td><input type="text" name="membership_mile" value="${detail.membership_mile }" ></td>
							<td><input type="text" name="membership_discount" value="${detail.membership_discount }" required="required"></td>
						</tr>
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="등급수정">
					</div>
					<div>
						<input type="button" onclick="moveForm('delete')" class="genric-btn danger radius elb" value="등급삭제">
					</div>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
</body>
</html>