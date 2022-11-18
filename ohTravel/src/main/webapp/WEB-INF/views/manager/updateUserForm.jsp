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



</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a href="manageUser" class="genric-btn primary ela">회원관리</a>
				<a href="manageMemberShip" class="genric-btn primary ela">등급관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">회원상세</h1>
			<form action="updateUser" method="post">
			<div class="row">
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
							<td>
								<select name="mem_role">
									<c:choose>
										<c:when test="${detail.mem_role == 'ADMIN'}">
											<option selected="selected" value="ADMIN">ADMIN</option>
											<option value="MANAGER">MANAGER</option>		
											<option value="USER">USER</option>		
										</c:when>
										<c:when test="${detail.mem_role eq 'MANAGER'}">
											<option value="ADMIN">ADMIN</option>
											<option selected="selected" value="MANAGER">MANAGER</option>		
											<option value="USER">USER</option>		
										</c:when>
										<c:when test="${detail.mem_role eq 'USER'}">
											<option value="ADMIN">ADMIN</option>
											<option value="MANAGER">MANAGER</option>		
											<option selected="selected" value="USER">USER</option>
										</c:when>
									</c:choose>
								</select>
							</td>
							<td><input type="hidden" name="mem_mile" value="${detail.mem_mile }">${detail.mem_mile }</td>
							<td>
								<select name="membership_id">
								<c:forEach var="membershipList" items="${membershipList }">
									<c:choose>
									<c:when test="${membershipList.membership_mile < detail.mem_mile}">
										<c:choose>
											<c:when test="${membershipList.membership_name eq detail.membership_name}">
												<option value="${membershipList.membership_id }">${membershipList.membership_name }</option>
											</c:when>										
											<c:otherwise>
												<option value="${membershipList.membership_id }" disabled="disabled">${membershipList.membership_name }</option>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${membershipList.membership_name eq detail.membership_name}">
										<option value="${membershipList.membership_id }" selected="selected">${membershipList.membership_name }</option>
									</c:when>
									<c:otherwise>
										<option value="${membershipList.membership_id }">${membershipList.membership_name }</option>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="5"><a href="#" onclick="window.history.back()" class="genric-btn success elb">돌아가기</a></td>
							<td colspan="5"><input type="submit" class="genric-btn info elb" value="수정완료"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</form>
		</div>
	</div>
</body>
</html>