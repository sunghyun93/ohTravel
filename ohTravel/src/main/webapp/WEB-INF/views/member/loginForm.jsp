<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">

</head>
<body>
	<div id="container">
		<div class="inr">
			<div class="contents" id="contents">
				<div class="login_wrap">
					<div class="text_wrap top" style="margin-bottom: 50px;">
						<strong class="tit">로그인</strong>
					</div>	<!-- text_wrap -->
					<form action="">
						<ul class="form_wrap">
						    <li>
						        <input type="text" title="아이디" placeholder="아이디" class="input_text v-placeholder" />
						        <p class="error_message" style="display: none;"></p>
						    </li>
						    <li>
						        <input type="password" title="비밀번호" placeholder="비밀번호" maxlength="16" class="input_text v-placeholder" />
						        <p class="error_message" style="display: none;"></p>
						    </li>
						    <!---->
						    <li class="form_holder check"><input type="checkbox" id="chkLogin01" class="inpt_checkbox" /> <label for="chkLogin01" class="label_checkbox">아이디 저장</label></li>
						</ul>	<!-- form_wrap -->
						<div class="btn_wrap login_btn">
						    <a class="btn gray big mb20 pink">로그인</a> 
						    <a href="${pageContext.request.contextPath}/member/findID" class="txt">아이디 찾기</a> 
						    <span class="divider_dot"><a href="${pageContext.request.contextPath}/member/findPassword" class="txt">비밀번호 찾기</a></span>
						    <span class="divider_dot"><a href="${pageContext.request.contextPath}/member/memberForm" class="txt">회원가입</a></span>
						</div>	<!-- btn_wrap -->
					</form>
				</div>	<!-- login_wrap -->
			</div>	<!-- contents -->
		</div>	<!-- inr -->
	</div>	<!-- container -->
</body>
</html>