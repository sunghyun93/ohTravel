<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/memberForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/find.css">
<style type="text/css">
.contents {
    min-height: 350px;
}
.text_wrap {
    position: relative;
    margin: 40px 0 0;
    padding: 0;
}
.text_wrap.mid {
    margin-top: 40px;
    margin-bottom: 24px;
}
.text_wrap strong.tit {
    display: inline-block;
    font-size: 15px;
    line-height: 1;
    font-weight: 400;
    color: #111;
}
.text_wrap.mid strong.tit {
    font-size: 17px;
    color: #111;
    font-weight: 200;
}
.text_wrap:after {
    content: '';
    display: block;
    clear: both;
}
.txc {
    text-align: center !important;
}
.msg_wrap.bg {
    background-color: #f7f7f7;
    padding: 40px 65px 40px 155px;
    position: relative;
}
.msg_wrap.bg.txc {
    min-height: 120px;
    padding: 37px 0;
}
.mt10 {
    margin-top: 10px !important;
}
.msg_wrap p:not(.txt) {
    color: #888;
    font-size: 15px;
    line-height: 24px;
}
.msg_wrap.bg p {
    color: #333;
}
em {
    color: #5e2bb8;
    font-style: normal;
}
</style>
</head>
<body>
<div id="container">
    <div class="inr">
        <!---->
        <div id="contents" class="contents">
         	<c:if test="${check == 1}">
	            <div class="msg_wrap bg txc" style="">
	                <p class="mt10"><em>일치하는 회원 정보가 없습니다.</em></p>
	            </div>
         	</c:if>
            <div class="btn_wrap"><a href="javascript:history.back();" class="btn big pink">확인</a></div>
        </div>
    </div>
</div>
</body>
</html>