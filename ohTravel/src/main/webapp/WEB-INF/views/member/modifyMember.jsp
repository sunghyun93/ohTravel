<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/myPage.css">
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
					<strong class="tit">회원정보 수정</strong>
				</div>
				<div class="js_tabs type1 v-tabs nojq">
				    <ul class="tabs">
				        <li class="selected fx-cobrand-pkg" style="width: 34%;"><a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a></li>
				        <li class="fx-cobrand-htl" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/modifyPassword">비밀번호 변경</a></li>
				        <li class="fx-cobrand-wt" style="width: 33%;"><a href="${pageContext.request.contextPath}/member/deleteMember">회원 탈퇴</a></li>
				    </ul>
				</div>	<!-- js_tabs type1 v-tabs nojq -->
				<div class="ly_wrap pay_info" style="border-top: none;">
					<div class="inr"  style="width: 100%">
						
						<div class="text_wrap mid">
							<strong class="tit">가입정보</strong>
						</div>	<!-- text_wrap -->
						<form action="updateMember" method="post" action="updateMember">
							<div class="tbl">
								<table class="type2">
								    <colgroup>
								        <col style="width: 17%;" />
								        <col />
								    </colgroup>
								    <tbody>
								        <tr>
								            <th>이름</th>
								            <td><input type="hidden" id="mem_name" name="mem_name" value="${sessionName}">${sessionName}</td>
								        </tr>
								        <tr>
								            <th>아이디</th>
								            <td><input type="hidden" id="mem_id" name="mem_id" value="${sessionId}">${sessionId}</td>
								        </tr>
								        <tr>
								            <th>휴대폰번호</th>
								            <td><input type="text" id="mem_tel" name="mem_tel" placeholder="휴대폰번호" style="width:500px;"></td>
								        </tr>
								        <tr>
								            <th>이메일</th>
								            <td><input type="text" id="mem_email" name="mem_email" placeholder="이메일" style="width:500px;"></td>
								        </tr>
								        <tr>
								            <th>생년월일</th>
								            <td><input type="text" id="mem_birthday" name="mem_birthday" placeholder="생년월일" style="width:500px;"></td>
								        </tr>
								        <!-- 필요 시 컬럼 추가 해주세용 -->
								    </tbody>
								</table>
							</div>	<!-- tbl -->
							<div class="btn_wrap">
	  							<a href="${pageContext.request.contextPath}/member/myPageMain" class="btn big gray" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;">취소</a> 
	  							<button type="submit" class="btn big pink" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;">수정</button>
	  						</div>
						</form>
					</div>	
				</div>	<!-- ly_wrap pay_info -->
			</div>
		</div>
	</div>
</body>
</html>