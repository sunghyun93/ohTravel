<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
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
	$(document).ready(function(){
		var updateMsg1 = '${updateMsg1}';
		var deleteMsg1 = '${deleteMsg1}';
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
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">회원관리</h1>
			<div class="row">
				<table border="1" class="table table-hover">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>비밀번호</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>생년월일</th>
						<th>가입날짜</th>
						<th>회원권한</th>
					</tr>
					<c:forEach var="member" items="${memberList }">
						<tr onclick="location.href='manageUserDetail?mem_id=${member.mem_id}'">
							<td>${member.mem_id }</td>
							<td>${member.mem_name }</td>
							<td>${member.mem_password }</td>
							<td>${member.mem_email }</td>
							<td>${member.mem_tel }</td>
							<td>${member.mem_birthday }</td>
							<td>${member.mem_create }</td>
							<td>${member.mem_role }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>