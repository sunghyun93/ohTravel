<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertNotice" method="post">
	<div class="container" style="min-height: 700px;">
	<h1>공지사항 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="notice_title" class="form-label">글 제목</label>
			<input type="text" class="form-control" name="notice_title" id="notice_title" required="required" placeholder="글 제목을 입력하세요">
		</div>
		<div class="mb-3">
			<label for="notice_content" class="form-label">글 내용</label>
			<textarea class="form-control" id="notice_content" maxlength="999" name="notice_content" required="required" placeholder="글 내용을 입력하세요"></textarea>
		</div>
		<div class="mb-3">
			<label for="notice_writer" class="form-label">작성자</label>
			<input type="text" class="form-control" id="notice_writer" name="notice_writer" required="required" placeholder="작성자를 입력하세요 나중에 로그인 계정으로 바꿀것">
		</div>
		
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="submit" class="btn btn-primary">추가하기</button>
	</div>
	</form>
</body>
</html>