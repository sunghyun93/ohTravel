<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hotel_container {
		margin : 20px;
	}
	
	.hotel_container h1 {
		font-size : 25px;
	}

</style>
</head>
<body>
	<div class="hotel_container">
		<h1>숙박 예약 화면 / tiles 적용 예시~</h1>
		<p> body태그 안쪽에 원하는 틀을 코딩해주시면 적용됩니다.<br>
			부트스트랩의 css가 먼저 적용되기 때문에, 작성할 페이지를 하나의 큰 div class로 감싸고, 자식태그 값에 css를 건다고 생각하고 코딩하시면 편할 것으로 . . .<br>
			css / JavaScript 링크는 WEB-INF/views/layouts/layout-basic.jsp 에 걸어주셔도 정상 작동 할거예요<br>
			css format수정 후에도 잘 먹나 확인용 멘트</p>
	</div>
</body>
</html>