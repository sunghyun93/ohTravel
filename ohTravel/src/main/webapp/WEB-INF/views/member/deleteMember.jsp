<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/modify.css">
<style type="text/css">
.msg_wrap .icn:before {
    width: 45px;
    height: 45px;
}
.icn.plane:before {
    background-position: -300px -318px;
}
</style>
</head>
<body>
	<div id="container">
		<div class="inr">
			<!-- 카테고리 -->
			<div class="lnb" id="lnb">
				<div class="inr">
					<dl>
						<dt class="type"><a href="${pageContext.request.contextPath}/member/myPageMain">마이페이지</a></dt>
						<dd>
							<ul class="list_lnb">
							    <li id="EM00000196" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageReservPackage" id="/com/mpg/CHPC0MPG0200M200">예약내역</a>
							        <!---->
							    </li>
							    <li id="EM00000203" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageLikePackage" id="/com/sbk/CHPC0COM0300M200">찜</a>
							        <!---->
							    </li>
							    <li id="EM00000224">
							        <a href="${pageContext.request.contextPath}/member/myPageCouponPackage">쿠폰함</a>
							    </li>
							    <li id="EM00002140" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageFAQ" id="/com/cuc/CHPC0CUC0001M200">자주찾는 질문</a>
							        <!---->
							    </li>
							    <li id="EM00002141" class="">
							        <a href="${pageContext.request.contextPath}/member/myPageReviewPackage" id="/com/mpg/CHPC0MPG0403M200">My 상품평</a>
							        <!---->
							    </li>
							    <li id="EM00000234" class="">
							        <a href="${pageContext.request.contextPath}/member/myPagePrivacy" id="/com/mpg/CHPC0MPG0105M200">개인정보</a>
							        <!---->
							    </li>
							</ul>
						</dd>
					</dl>	
				</div>	<!-- inr -->
			</div>	<!-- lnb -->
			<div class="contents" id="contents">
				<div class="text_wrap big fix">
					<strong class="tit">회원 탈퇴</strong>
				</div>
				<div class="js_tabs type1 v-tabs nojq">
				    <ul class="tabs">
				        <li class="fx-cobrand-pkg" style="width: 34%;"><a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a></li>
				        <li class="fx-cobrand-htl" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/modifyPassword">비밀번호 변경</a></li>
				        <li class="selected fx-cobrand-wt" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/deleteMember">회원 탈퇴</a></li>
				    </ul>
				</div>	<!-- js_tabs type1 v-tabs nojq -->
				<div class="ly_wrap pay_info" style="border-top: none;">
					<div class="inr"  style="width: 100%">
						<div class="msg_wrap bg txc">
						    <div class="msg_box txl">
						        <strong class="tit" style="margin-bottom:10px;">
						        	<span class="icn plane"></span>
						        	<em style="font-style: normal; font-weight: 500;">그동안 보내주신 성원에 감사드립니다.</em>
						       	</strong>
						        <div class="list_bul_wrap mt10">
						            <ul class="list_bul dash">
						                <li>개인정보 취급방침에 의거하여 모든 개인정보가 삭제됩니다</li>
						                <li>게시물 삭제는 고객센터(1577-1233)로 별도 문의가 필요합니다.</li>
						            </ul>
						        </div>
						    </div>
						</div>
						<div class="text_wrap mid">
							<strong class="tit">가입정보</strong>
						</div>	<!-- text_wrap -->
						<form name="deleteMember" method="post" action="deleteMember">
							<div class="tbl">
								<table class="type2">
								    <colgroup>
								        <col style="width: 17%;" />
								        <col />
								    </colgroup>
								    <tbody>
								        <tr>
								            <th>아이디</th>
								            <td>${sessionId}</td>
								        </tr>
								        <tr>
								            <th>비밀번호</th>
								            <td><input type="password" id="mem_password" name="mem_password" placeholder="비밀번호를 입력해주세요" style="width:500px;"></td>
								        </tr>
								        <!-- 필요 시 컬럼 추가 해주세용 -->
								    </tbody>
								</table>
							</div>	<!-- tbl -->
							<div class="btn_wrap">
	  							<a href="${pageContext.request.contextPath}/member/myPageMain" class="btn big gray" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;">취소</a> 
	  							<button type="submit" class="btn big pink" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;">회원탈퇴</button>
	  						</div>
						</form>
						<div>
							<c:if test="${msg == false}">
								비밀번호가 맞지 않습니다.
							</c:if>
						</div>
					</div>	<!-- inr -->
				</div>	<!-- ly_wrap pay_info -->
			</div>
		</div>
	</div>
</body>
</html>