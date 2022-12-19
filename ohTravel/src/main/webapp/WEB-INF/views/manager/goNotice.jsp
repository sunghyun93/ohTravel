<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.content{
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>
	
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">공지사항</h1>
			<div class="row">
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>글내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					</thead>
					<c:forEach var="notice" items="${notice }">
					<tbody>
					<tr onclick="goNoticeDetail(${notice.notice_id },${page.currentPage})">
						<td>${notice.notice_id }</td>
						<td>${notice.notice_title}</td>
						<td class="content">${notice.notice_content}</td>
						<td>${notice.notice_writer}</td>
						<td><fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${notice.notice_write_date}"/></td>
						<td>${notice.notice_count}</td>
					</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link" href="goNotice?currentPage=${page.startPage-page.pageBlock}">[이전]</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<li class="page-item"><a class="page-link" href="goNotice?currentPage=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${page.endPage < page.totalPage }">
						<a href="manageUser?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
						<li class="page-item"><a class="page-link" href="goNotice?currentPage=${page.startPage+page.pageBlock}">[다음]</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
<script type="text/javascript">
	function goNoticeDetail(str1,str2){
		notice_id = str1;
		currentPage = str2;
		$.ajax({
			url : 'updateNoticeCount',
			data : {'notice_id' : notice_id},
			method : 'POST',
			success : function(data){
				if(data >0){
					alert('조회수 올림');
					location.href="goNoticeDetail?notice_id="+notice_id+"&currentPage="+currentPage+"";
				}
			}
		})
	}
</script>
</html>