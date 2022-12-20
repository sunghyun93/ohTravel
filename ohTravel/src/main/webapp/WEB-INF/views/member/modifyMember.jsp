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
						<form action="updateMember" method="post" id="updateMember">
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
								            <td>
								            	<input type="text" id="mem_tel" name="mem_tel" placeholder="휴대폰번호" style="width:500px;" value="${sessionTel }">
								           		<p class="error_message" id="tel_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
										        	휴대폰번호를 입력해주세요.
										        </p>
												<p class="error_message" id="tel_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
										        	올바르지 않은 휴대폰번호 형식입니다.
										        </p>	
								            </td>
								        </tr>
								        <tr>
								            <th>이메일</th>
								            <td>
								            	<input type="text" id="mem_email" name="mem_email" placeholder="이메일" style="width:500px;" value="${sessionEmail }">
								            	<p class="error_message" id="email_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
										        	이메일을 입력해주세요.
										        </p>
												<p class="error_message" id="mail_input_box_warn" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
										        	올바르지 않은 이메일 형식입니다.
										        </p>
								            </td>
								        </tr>
								        <tr>
								            <th>생년월일</th>
								            <td>
								            	<input type="text" id="mem_birthday" name="mem_birthday" placeholder="생년월일" style="width:500px;" value="${sessionBirthday }">
								            	<p class="error_message" id="birth_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
										        	생년월일을 입력해주세요.
										        </p>
												<p class="error_message" id="birth_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
										        	YYYYMMDD 형식으로 입력해주세요.
										        </p>
								            </td>
								        </tr>
								        <!-- 필요 시 컬럼 추가 해주세용 -->
								    </tbody>
								</table>
							</div>	<!-- tbl -->
							<div class="btn_wrap">
	  							<a href="${pageContext.request.contextPath}/member/myPagePrivacy" class="btn big gray" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;">취소</a> 
	  							<input type="button" id="modify_button" class="btn big pink" style="min-width: 140px; height: 56px; line-height: 54px; font-size: 17px; padding: 0 35px;" value="수정">
	  						</div>
						</form>
					</div>	
				</div>	<!-- ly_wrap pay_info -->
			</div>
		</div>
	</div>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
var mailCheck = false;          // 이메일
var bdCheck = false;            // 생일
var telCheck = false;		    // 휴대폰 번호

$(document).ready(function() {
	// 수정 버튼
	$("#modify_button").click(function() {
		var mail = $('#mem_email').val();
		var birth = $('#mem_birthday').val();
		var tel = $('#mem_tel').val();
		
		/* 이메일 유효성 검사 */
        if(mail == ""){
            $('#email_error').css('display','block');
            mailCheck = false;
        }else{
        	if(!mailFormCheck(mail)) {
            	$('#mail_input_box_warn').css("display", "block");
            } else {
            	$('#mail_input_box_warn').css("display", "none");
            	mailCheck = true;
            }
            $('#email_error').css('display', 'none');
           
        }
		
        /* 휴대폰번호 유효성 검사 */
        if(tel == ""){
            $('#tel_error').css('display','block');
            telCheck = false;
        }else{
        	if(!tCheck(tel)) {
            	$('#tel_reg').css("display", "block");
            } else {
            	$('#tel_reg').css("display", "none");
            	 telCheck = true;
            }
            $('#tel_error').css('display', 'none');
           
        }
        
        /* 생년월일 유효성 검사 */
        if(birth == ""){
            $('#birth_error').css('display','block');
            bdCheck = false;
        }else{
        	if(!birthCheck(birth)) {
            	$('#birth_reg').css("display", "block");
        	} else {
            	$('#birth_reg').css("display", "none");
            	bdCheck = true;
            }
            $('#birth_error').css('display', 'none');
            
        }
        
        console.log(mailCheck);
        console.log(bdCheck);
        console.log(telCheck);
        
        if(mailCheck && bdCheck && telCheck) {
        	$("#updateMember").attr("action", "${pageContext.request.contextPath}/member/updateMember")
        	$("#updateMember").submit();
        }
        
        
        
        return false;
	});
});
/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(email){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}
/* 생년월일 형식 유효성 검사 */
function birthCheck(birth) {
	var form = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return form.test(birth);
}

/* 휴대폰번호 형식 유효성 검사 */
function tCheck(tel) {
	var form = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	return form.test(tel);
}
</script>
</html>