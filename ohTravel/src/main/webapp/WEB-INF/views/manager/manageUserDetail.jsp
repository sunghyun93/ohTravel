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
	function deleteConfirm(){
		var message = confirm("정말로 회원을 삭제시키겠습니까?");
		if(message){
			$("#delete").submit();
		}else{
			alert("삭제되지 않았습니다");
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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">회원상세</h1>
			<form action="deleteUser" method="post" id="delete">
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
			</div>
				<table border="1" class="table table-striped">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>비밀번호</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>생년월일</th>
						<th>가입날짜</th>
						<th>회원권한</th>
						<th>회원소유마일리지</th>
						<th>등급명</th>
					</tr>
					<c:forEach var="detail" items="${userDetail }">
						<tr>
							<td><input type="hidden" name="mem_id" value="${detail.mem_id }">${detail.mem_id }</td>
							<td>${detail.mem_name }</td>
							<td>${detail.mem_password }</td>
							<td>${detail.mem_email }</td>
							<td>${detail.mem_tel }</td>
							<td>${detail.mem_birthday }</td>
							<td>${detail.mem_create }</td>
							<td>${detail.mem_role }</td>
							<td>${detail.mem_mile }</td>
							<td>${detail.membership_name }</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="5"><input type="button" onclick="location.href='updateUserForm?mem_id=${detail.mem_id}'" class="genric-btn info elb" value="회원수정"></td>
							<td colspan="5"><input type="button" onclick="deleteConfirm()" class="genric-btn danger radius elb" value="회원탈퇴"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</form>
		</div>
	</div>
</body>
</html>