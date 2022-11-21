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
	$(document).ready(function(){
		var updateMsg1 = '${updateMembershipMsg1}';
		var deleteMsg1 = '${deleteMembershipMsg1}';
		if(updateMsg1 == 1){
			alert("수정이 완료되었습니다");
		}else if(deleteMsg1 ==1){
			alert("삭제가 완료되었습니다");
		}
	});
</script>
</head>
<body>
	
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a href="manageUser" class="genric-btn primary ela">회원관리</a>
				<a href="manageMemberShip" class="genric-btn primary ela">등급관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">등급관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-2" style="float: right;" onclick="location.href='insertMembershipForm'">등급추가</button>
			</div>
				<table border="1" class="table table-hover">
					<tr>
						<th>회원등급코드</th>
						<th>회원등급명</th>
						<th>등급기준마일리지</th>
						<th>회원등급할인율</th>
					</tr>
					<c:forEach var="membershipList" items="${membershipList }">
					<tr onclick="location.href='manageMembershipDetail?membership_id=${membershipList.membership_id}'">
						<td>${membershipList.membership_id }</td>
						<td>${membershipList.membership_name }</td>
						<td>${membershipList.membership_mile }</td>
						<td>${membershipList.membership_discount }</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>