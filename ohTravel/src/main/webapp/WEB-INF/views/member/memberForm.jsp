<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/memberForm.css">
<body>
	<div class="container" id="container">
		<div class="inner">
			<form name="register" id="register" method="post">
				<input type="hidden" id="mem_role" name="mem_role" value="ROLE_USER">
				<input type="hidden" id="membership_id" name="membership_id" value="5">
				<input type="hidden" id="mem_mile" name="mem_mile" value="0">
 				<div class="certify_wrap">
					<div class="text_wrap pTit">
						<strong class="tit">Oh! Travel 회원가입을 위한 고객님의 소중한 정보를 입력해 주세요.</strong>
					</div>	<!-- text_wrap pTit -->
					<!-- 회원가입 정보 입력 -->
					<div class="tbl">
						<div class="text_wrap mid">
							<strong class="tit">회원 정보</strong>
						</div>	<!-- text_wrap mid -->
						<table class="type2">
							<colgroup>
								<col style="width: 15%;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<span class="form_holder">
											<input id="mem_name" name="mem_name" type="text" title="이름" placeholder="이름을 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px; margin-right: 15px;">
										</span>
										<p class="error_message" id="name_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	이름을 입력해주세요.
								        </p>
								        <p class="error_message" id="name_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 0;">
								        	2~4자 한글만 입력 가능합니다.
								        </p>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<span class="form_holder">
											<input id="mem_id" name="mem_id" type="text" title="아이디" placeholder="아이디를 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px; margin-bottom: 5px; margin-right: 15px;">
										</span>
										<p class="error_message" id="id_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 0;">
								        	아이디를 입력해주세요.
								        </p>
								        <p class="error_message" id="id_input_re_1" style="display: none; color: green; font-size: 13px; margin: 15px 0 0 0;">
								        	사용 가능한 아이디입니다.
								        </p>
										<p class="error_message" id="id_input_re_2" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 0;">
								        	이미 존재하는 아이디입니다.
								        </p>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<span class="form_holder">
											<input id="mem_email" name="mem_email" type="text" title="이메일" placeholder="이메일을 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px; margin-right: 15px;">
										</span>
										<p class="error_message" id="email_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	이메일을 입력해주세요.
								        </p>
										<p class="error_message" id="mail_input_box_warn" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	올바르지 않은 이메일 형식입니다.
								        </p>
									</td>
								</tr>
								<tr>
									<th>휴대폰번호</th>
									<td>
										<span class="form_holder">
											<input id="mem_tel" name="mem_tel" type="text" title="휴대폰 번호" placeholder="휴대폰 번호를 입력해 주세요.   ex)01012345678" class="inpt_text v-placeholder" style="width: 360px; margin-right: 15px;">
										</span>
										<p class="error_message" id="tel_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	휴대폰번호를 입력해주세요.
								        </p>
										<p class="error_message" id="tel_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	올바르지 않은 휴대폰번호 형식입니다.
								        </p>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<span class="form_holder">
											<input id="mem_birthday" name="mem_birthday" type="text" title="생년월일" placeholder="생년월일을 입력해 주세요.       ex)20000101" class="inpt_text" style="width: 360px; margin-right: 15px;">
										</span>
										<p class="error_message" id="birth_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	생년월일을 입력해주세요.
								        </p>
										<p class="error_message" id="birth_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	YYYYMMDD 형식으로 입력해주세요.
								        </p>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td class="passwd">
										<div class="form_holder">
											<input id="mem_password" name="mem_password" type="password" title="비밀번호" placeholder="비밀번호를 입력해 주세요." maxlength="16" class="inpt_text v-placeholdder" style="width: 360px;">
										</div>
										<p class="error_message" id="pw_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	비밀번호를 입력해주세요.
								        </p>
										<p class="error_message" id="pw_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	올바르지 않은 비밀번호 형식입니다.
								        </p>
										<div class="form_holder">
											<input id="mem_password2" name="mem_password2" type="password" title="비밀번호" placeholder="비밀번호를 확인하기 위해 다시 입력해 주세요." maxlength="16" class="inpt_text v-placeholdder" style="width: 360px">
										</div>
										<p class="error_message" id="pwck_error" style="display: none; color: red; font-size: 13px; margin: 50px 0 0 15px;">
								        	비밀번호 확인을 입력해주세요.
								        </p>
								        <p class="error_message" id="pwck_input_re_1" style="display: none; color: green; font-size: 13px; margin: 15px 0 0 15px;">
								        	비밀번호가 일치합니다.
								        </p>
								        <p class="error_message" id="pwck_input_re_2" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
								        	비밀번호가 일치하지 않습니다.
								        </p>
										<p class="txt billiard">
											8~16자리의 영문 , 숫자, 특수문자 중 2개 이상을 조합해서 비밀번호를 설정해 주세요.
										</p>
									</td>
								</tr>
							</tbody>
						</table>	<!-- type2 -->
					</div>	<!-- tbl -->
					<div class="cont_unit"></div>	<!-- cont_unit -->
					<div class="btn_wrap">
						<input type="button" id="join_button"  class="btn big pink" value="회원가입">
					</div>	<!-- btn_wrap -->
					<div class="cont_unit"></div>
				</div>	<!-- certify_wrap -->
			</form>			
		</div>	<!-- inner -->
	</div>	<!-- container -->
</body>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
<script type="text/javascript">

/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;          // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;          // 비번 확인
var pwckcorCheck = false;       // 비번 확인 일치 확인
var nameCheck = false;          // 이름
var mailCheck = false;          // 이메일
var bdCheck = false;            // 생일
var telCheck = false;		    // 휴대폰 번호

$(document).ready(function() {
	
	// 회원가입 버튼(회원가입 기능 작동)
	$("#join_button").click(function() {
		/* 입력값 변수 */
        var id = $('#mem_id').val();                // id 입력란
  		var pw = $('#mem_password').val();          // 비밀번호 입력란
        var pwck = $('#mem_password2').val();       // 비밀번호 확인 입력란
        var name = $('#mem_name').val();            // 이름 입력란
        var mail = $('#mem_email').val();           // 이메일 입력란
        var addr = $('#mem_tel').val();        		// 휴대폰 번호 입력란
        var birth = $('#mem_birthday').val();       // 생년월일 입력란
		var tel = $('#mem_tel').val();				// 휴대폰번호 입력란
        
        /* 아이디 유효성 검사 */
		if(id == "") {
			$("#id_error").css('display', 'block');
			idCheck = false;
		} else {
			$("#id_error").css('display', 'none');
			idCheck = true;
		}
		
		/* 비밀번호 유효성 검사 */
		if(pw == "") {
			$('#pw_error').css('display', 'block');
			pwCheck = false;
		} else {
			if(!isPassword(pw)) {
            	$('#pw_reg').css("display", "block");
            } else {
            	$('#pw_reg').css("display", "none");
            	pwCheck = true;
            }
			$('#pw_error').css('display', 'none');
			
		}
		
		/* 비밀번호 확인 유효성 검사 */
		if(pw == "") {
			$('#pwck_error').css('display', 'block');
			pwckCheck = false;
		} else {
			$('#pwck_error').css('display', 'none');
			pwckCheck = true;
		}
		
		/* 이름 유효성 검사 */
        if(name == ""){
            $('#name_error').css('display','block');
            nameCheck = false;
        }else{
        	if(!isCorrect(name)) {
            	$('#name_reg').css("display", "block");
            } else {
            	$('#name_reg').css("display", "none");
            	nameCheck = true;
            }
            $('#name_error').css('display', 'none');
        }
		
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
        
        console.log(idCheck);
        console.log(idckCheck);
        console.log(pwCheck);
        console.log(pwckCheck);
        console.log(pwckcorCheck);
        console.log(nameCheck);
        console.log(mailCheck);
        console.log(bdCheck);
        console.log(telCheck);
        
        /* 최종 유효성 검사 */
        if(idCheck && idckCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck && mailCheck && bdCheck && telCheck) {
        	$("#register").attr("action", "${pageContext.request.contextPath}/member/register");
    		$("#register").submit();
        }
        
        return false;
	});
});

// 아이디 중복 검사
$('#mem_id').on("propertychange change keyup paste input", function() {
	// console.log("keyup 테스트");
	
	var mem_id = $('#mem_id').val()	// #mem_id에 입력되는 값
	var data = {mem_id : mem_id}		// '컨트롤에 넘길 데이터 이름' : '데이터(#mem_id에 입력되는 값)'

	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result) {
			// console.log("성공 여부 -> " + result);
			if(result != 'fail') {
				$('#id_input_re_1').css("display","inline-block");
				$('#id_input_re_2').css("display", "none");
				idckCheck = true;
			} else {
				$('#id_input_re_2').css("display","inline-block");
				$('#id_input_re_1').css("display", "none");				
				idckCheck = false;
			}
		}
	}); // ajax 종료	
}); 



/* 비밀번호 확인 일치 유효성 검사 */
$('#mem_password2').on("propertychange change keyup paste input", function(){
	var pw = $('#mem_password').val();
	var pwck = $('#mem_password2').val();
	$('#pwck_error').css('display', 'none');
	
	if(pw == pwck){
        $('#pwck_input_re_1').css('display','block');
        $('#pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    } else{
        $('#pwck_input_re_1').css('display','none');
        $('#pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }
}); 

/* 이름 형식 유효성 검사 */
function isCorrect(asValue) { // 2~4자 한글만 입력 
	var form =  /^[가-힣]{2,4}$/; ///[ㄱ-힣]{2,4}$/g;
	return form.test(asValue);
}

/* 비밀번호 유효성 검사 */
function isPassword(asValue) { // 비밀번호 체크, 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
	var form = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	return form.test(asValue);
}

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