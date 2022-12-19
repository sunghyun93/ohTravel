<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/find.css">
</head>
<body>
	<div class="container" id="container">
		<div class="inr">
			<div class="contents" id="contents">
				<form name="findID" id="findID" method="post">
					<div class="certify_wrap">
						<div class="text_wrap pTit">
						    <strong class="tit">아이디/비밀번호를 잊어버리셨나요?</strong>
						</div>	<!-- text_wrap -->
						<div class="js_tabs link type1 v-tabs">
							<!-- 아이디/비밀번호 찾기 선택 -->
							<ul class="tabs">
							    <li class="selected" style="width: 50%;"><a href="${pageContext.request.contextPath}/member/findID" aria-current="page" class="nuxt-link-exact-active nuxt-link-active">아이디찾기</a></li>
							    <li style="width: 50%;"><a href="${pageContext.request.contextPath}/member/findPassword" class="">비밀번호찾기</a></li>
							</ul>
							<div class="panels">
								<div class="panel selected">
									<div class="js_acc">
										<div class="inr">
											<div class="view active" id="acc_con4" style="display: block;">
											    <div class="tbl">
											        <table class="type2">
											            <colgroup>
											                <col style="width: 19%;" />
											                <col />
											            </colgroup>
											            <tbody>
											                <tr>
											                    <th>이름</th>
											                    <td>
											                        <div class="form_holder gender">
											                            <input type="text" id="mem_name" name="mem_name" title="이름" style="width: 100%;" placeholder="이름을 입력해 주세요." class="inpt_text v-placeholder" />
											                        </div>	<!-- form_holder gender -->
											                        <p class="error_message" id="name_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
															        	이름을 입력해주세요.
															        </p>
															        <p class="error_message" id="name_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 0;">
															        	2~4자 한글만 입력 가능합니다.
															        </p>
											                    </td>
											                </tr>
											                <tr>
											                    <th>생년월일</th>
											                    <td>
											                        <div class="form_holder">
											                            <input type="text" id="mem_birthday" name="mem_birthday" title="생년월일" style="width: 100%;" maxlength="8" placeholder="생년월일을 입력해 주세요. (ex: 19900101)" class="inpt_text v-placeholder" />
											                        </div>	<!-- form_holder -->
											                        <p class="error_message" id="birth_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
															        	생년월일을 입력해주세요.
															        </p>
																	<p class="error_message" id="birth_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
															        	YYYYMMDD 형식으로 입력해주세요.
															        </p>
											                    </td>
											                </tr>
											                <tr>
											                    <th>휴대폰번호</th>
											                    <td>
											                        <div class="form_holder">
											                            <input type="text" id="mem_tel" name="mem_tel" title="휴대폰번호" style="width: 100%;" placeholder="휴대폰 번호를 입력해 주세요. (ex: 01012345678)" class="inpt_text v-placeholder" />
											                        </div>	<!-- form_holder -->
											                        <p class="error_message" id="tel_error" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
															        	휴대폰번호를 입력해주세요.
															        </p>
																	<p class="error_message" id="tel_reg" style="display: none; color: red; font-size: 13px; margin: 15px 0 0 15px;">
															        	올바르지 않은 휴대폰번호 형식입니다.
															        </p>
											                    </td>
											                </tr>
											            </tbody>
											        </table>	<!-- type2 -->
											    </div>	<!-- tbl -->
											    <div class="btn_wrap">
											    	<a href="javascript:history.back();" class="btn big gray">이전</a> 
											    	<input type="button" id="find_button" class="btn big pink" value="다음">
											    </div>
											</div>	<!-- view active -->
										</div>	<!-- js_acc -->
									</div>	<!-- js_acc -->
								</div>	<!-- panel -->
							</div>	<!-- panels -->
						</div>	<!-- js_tabs link type1 v-tabs -->
					</div>	<!-- certify_wrap -->
				</form>
			</div>	<!-- contents -->
		</div>	<!-- inr -->
	</div>	<!-- container -->
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
<script type="text/javascript">
var nameCheck = false;          // 이름
var bdCheck = false;            // 생일
var telCheck = false;		    // 휴대폰 번호

$(document).ready(function() {
	
	// 아이디 찾기 버튼
	$("#find_button").click(function() {
		var name = $('#mem_name').val();            // 이름 입력란
		var birth = $('#mem_birthday').val();       // 생년월일 입력란
		var tel = $('#mem_tel').val();				// 휴대폰번호 입력란
		
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
        
        console.log("nameCheck -> " + nameCheck);
        console.log("bdCheck -> " + bdCheck);
        console.log("telCheck -> " + telCheck);
        
        if(nameCheck && bdCheck && telCheck) {
        	$("#findID").attr("action", "${pageContext.request.contextPath}/member/findID");
       		$("#findID").submit();
        }
        
        return false;
	})
	
});

/* 이름 형식 유효성 검사 */
function isCorrect(asValue) { // 2~4자 한글만 입력 
	var form =  /^[가-힣]{2,4}$/; ///[ㄱ-힣]{2,4}$/g;
	return form.test(asValue);
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