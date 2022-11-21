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
.elb{
	width: 100%;
}
.button-wrap{
	text-align: center;
}
.big{
	width: 100%;
}
</style>
<script type="text/javascript">
	function confirm(str){
		var form = document.getElementById('form');
		console.log(form);
		if(str =='update'){
			form.action="updateMembership";
			form.submit();
		}else if(str=='delete'){
			form.action="deleteMembership";
			form.submit();
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
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
			</div>
				<table border="1" class="table table-striped">
					<tr>
						<th>회원등급코드</th>
						<th>회원등급명</th>
						<th>등급기준마일리지</th>
						<th>회원등급할인율</th>
					</tr>
					<c:forEach var="detail" items="${membershipDetail }">
						<tr>
							<td><input type="text" name="membership_id" value="${detail.membership_id }" readonly="readonly"></td>
							<td><input type="text" name="membership_name" value="${detail.membership_name }" required="required"></td>
							<td><input type="text" name="membership_mile" value="${detail.membership_mile }" ></td>
							<td><input type="text" name="membership_discount" value="${detail.membership_discount }" required="required"></td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2"><input type="button" onclick="confirm('update')" class="genric-btn info elb" value="등급수정"></td>
							<td colspan="2"><input type="button" onclick="confirm('delete')" class="genric-btn danger radius elb" value="등급삭제"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</form>
		</div>
	</div>
</body>
</html>