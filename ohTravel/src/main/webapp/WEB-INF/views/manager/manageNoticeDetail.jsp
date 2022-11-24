<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ManageUserWrapper {
	min-height: 700px;
}

.ela {
	width: 45%;
}

.button-wrap {
	text-align: center;
}

.big {
	width: 100%;
}

.name {
	width: 200px;
}
</style>
<script type="text/javascript">
	function moveForm(str){
		var form = document.getElementById('form');
		console.log(form);
		if(str =='update'){
			form.action="updateNotice";
			form.method="post";
			form.submit();
		}else if(str=='delete'){
			message = confirm("정말로 삭제하시겠습니까?");
			if (message) {
				form.action="deleteNotice";
				form.method="post";
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
				<a href="manageBoard" class="genric-btn primary ela">게시판관리</a>
				<a href="manageNotice" class="genric-btn primary ela">공지사항관리</a>
			</div>
			<h1
				style="text-align: center; margin-bottom: 50px; margin-top: 50px;">공지사항상세</h1>
			<form method="post" id="form">
				<div class="row">
					<div class="col-lg-12 col-sm-12 text-lg-end text-center">
						<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageNotice'"	value="돌아가기">
					</div>
					<table border="1" class="table table-striped">
						<c:forEach var="noticeDetail" items="${noticeDetail }">
							<tr>
								<td class="name">글번호</td>
								<td><input type="hidden" name="notice_id" value="${noticeDetail.notice_id }">${noticeDetail.notice_id }</td>
							</tr>
							<tr>
								<td class="name">글제목</td>
								<td><input type="text" name="notice_title" maxlength="50" value="${noticeDetail.notice_title }" required="required"></td>
							</tr>
							<tr>
								<td class="name">글내용</td>
								<td><textarea class="form-control" id="notice_content" maxlength="999" name="notice_content" required="required">${noticeDetail.notice_content }</textarea></td>
							</tr>
							<tr>
								<td class="name">작성자</td>
								<td>${noticeDetail.notice_writer }</td>
							</tr>
							<tr>
								<td class="name">작성일</td>
								<td>${noticeDetail.notice_write_date }</td>
							</tr>
							<tr>
								<td class="name">조회수</td>
								<td>${noticeDetail.notice_count }</td>
							</tr>
						</c:forEach>
					</table>
					<div style="flex: 2">
						<input type="button" onclick="moveForm('update')" class="genric-btn info elb" value="공지사항 수정">
					</div>
					<div>
						<input type="button" onclick="moveForm('delete')" class="genric-btn danger radius elb" value="공지사항 삭제">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>