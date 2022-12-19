<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<c:if test="${msg == false}">
							<p class="error_message" id="id_error" style="text-align: center;">
						        	아이디 또는 비밀번호가 올바르지 않습니다.
						    </p>
					</c:if>
					<form name="login" id="login" method="post" action="login">
					<input type="hidden" name="toURL" value="${toURL }">
						<ul class="form_wrap">
						    <li>
						        <input type="text" id="mem_id" name="mem_id" title="아이디" placeholder="아이디" class="input_text v-placeholder" />
						        <p class="error_message" id="id_error" style="display: none;">
						        	아이디를 입력해주세요.
						        </p>
						    </li>
						    <li>
						        <input type="password" id="mem_password" name="mem_password" title="비밀번호" placeholder="비밀번호" maxlength="16" class="input_text v-placeholder" />
						        <p class="error_message" id="pw_error" style="display: none;">
						        	아이디 또는 비밀번호를 제대로 입력해주세요.
						        </p>
						    </li>
						    <!-- 아이디 저장 버튼 -->
						    <!--  
						    <li class="form_holder check"><input type="checkbox" id="chkLogin01" class="inpt_checkbox" /> <label for="chkLogin01" class="label_checkbox">아이디 저장</label></li>
							-->
						</ul>	<!-- form_wrap -->
						<div class="btn_wrap login_btn">
						    <input class="btn gray big mb20 pink" type="button" id="loginFormBtn" value="로그인" onclick="return frmCheck();">
						    <a href="${pageContext.request.contextPath}/member/findID" class="txt">아이디 찾기</a> 
						    <span class="divider_dot"><a href="${pageContext.request.contextPath}/member/findPassword" class="txt">비밀번호 찾기</a></span>
						    <span class="divider_dot"><a href="${pageContext.request.contextPath}/member/memberForm" class="txt">회원가입</a></span>
						</div>	<!-- btn_wrap -->
					</form>
				</div>	<!-- login_wrap -->
			</div>	<!-- contents -->
		</div>	<!-- inr -->
	</div>	<!-- container -->
<script type="text/javascript">
/* 아이디나 비밀번호 입력하지 않았을 때 에러 메시지 */
function frmCheck() {
	if($("#mem_id").val() == "" || $("#mem_password").val() == "") {
		$("#pw_error").css("display", "block");
	} else {
		$("#login").submit();
	}
}
</script>
</body>
</html>