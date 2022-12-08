<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a href="manageBoard" class="genric-btn primary ela">게시판관리</a>
				<a href="manageNotice" class="genric-btn primary ela">공지사항관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">게시판관리</h1>
			<div class="row">
				<table border="1" class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>작성자</th>
						<th>구분자</th>
						<th>별점</th>
						<th>내용</th>
						<th>작성일자</th>
						<th>참조아이디</th>
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>