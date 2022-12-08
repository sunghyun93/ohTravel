<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/modify.css">
<style type="text/css">
.msg_wrap .icn:before {
    width: 45px;
    height: 45px;
}
.icn.lock:before {
    background-position: -200px -318px;
}
.list_bul>li {
    position: relative;
    padding-left: 10px;
    line-height: 23px;
    font-size: 13px;
    color: #888;
}
.list_bul.billiard>li.em {
    color: #5e2bb8;
}
.list_bul.billiard>li:before {
    content: '※';
    width: auto;
    height: auto;
    display: inline-block;
    background-color: transparent;
    margin-right: 3px;
    top: 0;
}
</style>
</head>
<body>
	<div id="container" style="min-height: 850px;">
		<div class="inr">
			<!-- 카테고리 -->
			<div class="lnb" id="lnb">
				<div class="inr">
					<dl>
						<dt class="type"><a href="${pageContext.request.contextPath}/member/myPageReservPackage">마이페이지</a></dt>
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
					<strong class="tit">비밀번호 변경</strong>
				</div>
				<div class="js_tabs type1 v-tabs nojq">
				    <ul class="tabs">
				        <li class="fx-cobrand-pkg" style="width: 34%;"><a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a></li>
				        <li class="selected fx-cobrand-htl" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/modifyPassword">비밀번호 변경</a></li>
				        <li class="fx-cobrand-wt" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/deleteMember">회원 탈퇴</a></li>
				    </ul>
				</div>	<!-- js_tabs type1 v-tabs nojq -->
				<div class="ly_wrap pay_info" style="border-top: none;">
					<div class="inr"  style="width: 100%">
						<div class="msg_wrap bg" style="background-color: #fff;">
						    <strong class="tit" style="margin-bottom: 20px;">
						        <span class="icn lock"></span> 
						        <em style="font-style: normal">선예림</em> 님의 개인정보 보호를 위해<br />
						      	 비밀번호를 주기적으로 변경해 주세요.
						    </strong>
						</div>
						<div class="tbl">
							<table class="type2">
							    <colgroup>
							        <col style="width: 17%;" />
							        <col />
							    </colgroup>
							    <tbody>
							        <tr>
							            <th>현재 비밀번호</th>
							            <td><input type="password" placeholder="현재 비밀번호를 입력해주세요" style="width:500px;"></td>
							        </tr>
							        <tr>
							            <th>신규 비밀번호</th>
							            <td><input type="password" placeholder="변경할 비밀번호를 입력해주세요" style="width:500px;"></td>
							        </tr>
							        <tr>
							            <th>비밀번호 확인</th>
							            <td><input type="password" placeholder="비밀번호를 입력해주세요" style="width:500px;"></td>
							        </tr>
							        <!-- 필요 시 컬럼 추가 해주세용 -->
							    </tbody>
							</table>
						</div>	<!-- tbl -->
						<ul class="list_bul billiard mt15" style="margin-top: 20px;">
						    <li class="em">임시비밀번호 발급후에는 임시비밀번호를 기입해 주세요</li>
						    <li>
						        8~16자의 영문 대소문자, 숫자, 특수문자 2개 이상을 사용하시기 바랍니다.
						        <ul class="list_bul dash">
						            <li>아이디, 생년월일, 동일한 연속 문자/숫자 사용 불가능</li>
						            <li>특수 문자의 경우 -!@#$%^*?_~ 이외 특수문자 사용시 비밀번호 설정이 불가 합니다.</li>
						        </ul>
						    </li>
						    <li>아이디와 유사하거나 유추하기 쉬운 비밀번호는 유출의 위험이 많습니다.</li>
						    <li>주기적인 비밀번호 변경으로 고객님의 소중한 개인정보를 보호해 주세요.</li>
						    <li>비밀번호 변경시 우측 보안등급을 참고하여 안전한 비밀번호를 변경하시기 바랍니다.</li>
						</ul>
						<div class="btn_wrap">
  							<a href="${pageContext.request.contextPath}/member/myPageMain" class="btn big gray" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;">취소</a> 
  							<a href="#" class="btn big pink" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;">비밀번호 변경</a>
  						</div>
					</div>	<!-- inr -->
				</div>	<!-- ly_wrap pay_info -->
			</div>
		</div>
	</div>
</body>
</html>