<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- google fonts icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/css/pkage/package_detail.css">
<link rel="stylesheet" href="/css/pkage/package_reservation.css">
<link rel="stylesheet" href="/css/pkage/package_clear.css">
<style type="text/css">
.notice_purple{
	color: #5E2BB8;
}

.notice_info{
	border: 3px solid gray;
	padding: 20px;
	height: 350px;
	margin-bottom: 30px;
	color: #888888;
}

.notice_text{
	font-weight: bold;
	font-size: 20px;

}

.reserve{
	border: 1px solid #5E2BB8;
	background-color: #5E2BB8;
	width: 306px;
	height: 56px;
	margin-top: 20px;
	
}

.reserve:hover{
	cursor: pointer;
}

.reserve_text{
	color:white;
}
</style>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- regeXP.js -->
<script src="/js/pkage/regExp.js"></script>
</head>
<body>
<form id="completeReservation" action="/airplaneInsertReservation" method="post">
<div id="pkRv_container">
        <div class="pkRv_contents">
            <div id="" class="fontCtrl">
                <!-- 헤더 -->
                <div class="text_wrap big">
                    <strong class="tit">예약하기$</strong>
                    <input type="hidden" value="${go_schedule_id}" name="go_schedule_id">
                    <input type="hidden" value="${come_schedule_id}" name="come_schedule_id">
                    <input type="hidden" name="seat_position" value="${seat_position }">
                </div>

                <!-- 내용 -->
                <div class="ly_wrap pay_info">
                    <!-- 왼쪽 부분 -->
                    <div class="inr">
                       

                        <!-- 예약 정보 table -->
                        <div class="tbl">
                            
                        </div><!-- tbl -->

                        <!-- 예약자 정보 -->
                        <div class="text_wrap mid">
                            <strong class="tit">예약자 정보</strong>
                        </div>

                        <!-- 예약자 정보 테이블 -->
                        <div class="tbl">
                            <table class="type2">
                                <colgroup>
                                    <col style="width: 17%;">
                                    <col> 
                                    <col style="width: 17%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            <input type="text" id="" class="" name="" value="김성현" maxlength="10" minlength="3" readonly="readonly" placeholder="한글성명(ex. 홍길동)">
                                        </td>
                                        <th>생년월일</th>
                                        <td>
                                            <input type="text" id="" class="" name="" value="19911223" maxlength="8" minlength="3" readonly="readonly" placeholder="법정 생년월일(ex. 19911223)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>
                                            <input type="text" id="" class="" name="" value="Hong@naver.com" maxlength="30" minlength="3" readonly="readonly" placeholder="이메일 주소(ex. Hong@naver.com)">
                                        </td>
                                        <th>휴대폰 번호</th>
                                        <td>
                                            <input type="text" id="" class="" name="" value="01012345678" maxlength="20" minlength="3" readonly="readonly" placeholder="휴대폰 번호(ex. 01012345678)">
                                        </td>
                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- tbl -->

                        <!-- 인원정보 -->
                        <div class="text_wrap mid">
                            <strong class="tit">인원정보</strong>
                        </div>


                        <!-- 여행자 정보 부분 -->
                        <div class="text_wrap mid">
                            <strong class="tit">여행자 정보</strong>
                        </div>

                        <!-- 여행자 정보 부분 table -->
                        <c:forEach var="count" items="${count} ">
                        <div class="js_tabs type1 v-tabs alone">
                            <div class="panels personChk">
                                <div id="tabConTrvlP" class="panel selected">
                                    <div class="text_wrap type sml">
                                        <strong class="tit">성인</strong>
                                    </div>
                                    
                                    <div>
                                        <div class="tbl">
                                            <table class="type2">
                                                <colgroup>
                                                    <col style="width: 17%;"> 
                                                    <col style="width: 33%;"> 
                                                    <col style="width: 17%;"> 
                                                    <col style="width: 33%;">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>성명(한글)</th>
                                                        <td colspan="3">
                                                            <input type="text" id="" class="input_keyword" name="air_pi_name" value="" maxlength="4" minlength="3" placeholder="한글성명(ex. 홍길동)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>생년월일</th>
                                                        <td>
                                                            <input type="text" name="" id="" class="input_keyword" name="air_pi_birth" value="" maxlength="10" minlength="3" placeholder="법정 생년월일(ex. 1991-12-23)" style="width: 250px;">
                                                        </td>
                                                        <th>성별</th>
                                                        <td>
                                                            <div class="genderDiv">
                                                                <span class="genderDiv_radio">
                                                                    <input type="radio" name="air_pi_gen" id="gender1_0" class="inpt_radio" value="0">
                                                                    
                                                                    <label for="gender1_0">남성</label>
                                                                </span>
                                                                <span class="genderDiv_radio">
                                                                    <input type="radio" name="air_pi_gen" id="gender2_0" class="inpt_radio" value="1">
                                                                    <label for="gender2_0">여성</label>
                                                                </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>영문 성</th>
                                                        <td><input type="text" name="" id="" class="input_keyword"  value="" maxlength="30" minlength="3" placeholder="여권 상의 영문 성(ex. HONG)" style="width: 250px;"></td>
                                                        <th>영문 이름</th>
                                                        <td>
                                                            <input type="text" name="" id="" class="input_keyword"  value="" maxlength="30" minlength="3" placeholder="여권 상의 영문 이름(ex. GILDONG)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>이메일</th>
                                                        <td>
                                                            <input type="text" name="air_pi_email" id="air_pi_email" class="input_keyword"  value="" maxlength="30" minlength="3"  placeholder="이메일 주소(ex. Hong@naver.com)" style="width: 250px;">
                                                        </td>
                                                        <th>휴대폰 번호</th>
                                                        <td>
                                                            <input type="text" name="air_pi_tel" id="air_pi_tel" class="input_keyword"  value="" maxlength="20" minlength="3" placeholder="휴대폰 번호(ex. 01012345678)" style="width: 250px;">
                                                        </td>                                                        				                                      
                                                    </tr>
                                                    <tr>
                                                    	<th>여권번호</th>
                                                    	<td>
				                                        	<input type="text" name="air_passport" id="" class="input_keyword" value="" maxlength="20" minlength="3" placeholder="여권번호(ex. M12341234)" style="width: 680px;">
				                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div><!-- tabConTrvlP -->
                            </div><!-- panels -->
                        </div><!-- js_tabs type1 v-tabs alone, 여행자 정보 부분 table  -->
                      </c:forEach>


                        <!-- 예약 시 유의사항 -->
                        <div class="notice_wrap bg">
                            <strong class="tit line">예약 시 유의사항</strong>
                            <ul class="list_bul disc">
                                <li class="notice_purple">
									🔹 여권상 영문이름과 다른경우 탑승이 불가하며, 예약 후에는 영문이름 변경이 불가하오니 실제 탑승하실분의 여권상 동일한 영문 성/이름,성별을
									 정확히 입력해 주시기 바립니다. (영문 성/이름 입력시 띄어쓰기나 "-"표시 없이 영문스펠링만 정확히 입력해 주십시오)<br>
                                </li> 
                                <li>
					                                      🔹등록하신 여권번호/국적/생년월일/여권만료일은 변경사항이 있는 경우 출국 72시간 전까지 재등록이 가능합니다.
                                </li>   
                                <li>
                                 	🔹정확한 승객 정보 확인을 위해 탑승자별로 휴대폰 번호와 이메일을 입력해주세요.
                                </li>  
                            </ul>
                        </div><!-- notice_wrap bg , 예약 시 유의사항 -->
                        <table class="notice_info">
                        <tr><td class="notice_text">이용안내</td></tr>
                       		  <tr>
                       			<td>
	                        		<ul>
	                        			<li>
	                        				🔹연락처 오기재 시 불이익이 발생하지 않도록 즉시 연락 가능한 연락처 기재 부탁드립니다.항공사 스케줄 변동 등의 사유로 불이익이 발생될 수 있으므로 이점 유의하시기 바랍니다.
	                        			</li>
	                        			<li>
	                        				🔹동일한 승객의 이중예약, Fake Name (가짜성명) 예약 시 항공권 구매여부와 관계없이 모든 예약이 취소될 수 있으며, 항공사로부터 수수료가 부과될 수 있으니 주의 바랍니다.
	                        			</li>
	                        			<li>
	                        				🔹예약후 성명 변경은 불가하오니 실제 탑승하실 분의 여권상 영어성명을 입력하여 주십시오.
	                        			</li>
	                        			<li>
	                        				🔹영문성/영문이름은 영문스펠링만 입력해 주십시오.(여권에 띄어쓰기 및 '-'표시는 입력시 예약이 되지 않습니다.)
	                        			</li>
	                        			<li>
	                        				🔹보호자없이 혼자 여행하는 만 12~17세 미만 청소년의 경우 운송항공사에 따라 탑승이 제한될 수 있습니다.(항공권 구매전 확인 필수)
	                        			</li>
	                        			<li>
	                        				🔹결제 및 발권 시간은 항공권에 따라 상이하며 결제마감 시한 내 결제하기를 통해 확인 하시기 바랍니다. 
	                        			</li>
	                        			
	                        		</ul>
	                        	</td>	
                        	</tr>
                        </table>
                    </div><!-- inr -->

                    <!-- 오른쪽 부분 -->
                    <div class="inr right" style="right: auto; left: 0px;">
                        <div class="text_wrap mid">
                            <strong class="tit">결제상세내역</strong>
                        </div>

                        <div class="js_acc multi filter_wrap">
                            <div class="pay_area">
                                <div class="info_area total">
                                    <div class="info">
                                        <strong class="tit">최종결제금액</strong>
                                        <span>성인 ${count}</span>
                                    </div>
								 <strong class="price"><fmt:formatNumber value="${count*price}" pattern="#,###"/>원</strong><br>
								 <input type="hidden" name="reservation_price" value="${count*price }">
                                </div>
                            </div>
                            
                            <button type="submit" class="reserve"><span class="reserve_text">예약하기</span></button>
                        </div>
                    </div><!-- inr right -->
                </div><!-- ly_wrap pay_info -->
            </div><!-- fontCtrl -->
        </div><!-- pkRv_contents -->
    </div><!-- pkRv_container -->
</form>
    <script>
        $(function() {
            // 유효성 검사 통과 체크용
            let validCheck = true;

            // input 태그의 값에 이벤트 걸기
            $('.input_keyword').on({
                focus: function() {
                        // input 태그의 value 값
                    let InputValue = $(this).val();

                    // input 태그의 name 값
                    let InputName = $(this).attr('name');
                    // 해당 name 값의 길이
                    let strlength = InputName.length;
                    // 해당 input 태그의 끝부분부터 _ index 위치 
                    let underline = InputName.lastIndexOf('_',strlength);
                    // _ 다음 부터의 단어
                    let what = InputName.substring(underline+1, strlength);

                    // focus 했을 때 빈 값이면 에러 태그 추가
                    if(what == 'name') {
                        if(InputValue == '') {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">2~5자 한글성명만 입력해주세요</p>');
                            }
                        }    
                    } else if(what == 'birth') {
                        if(InputValue == '') {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">생년월일 형식에 맞게 입력해 주세요.(ex. 1999-12-31)</p>');
                            }
                        }
                    } else if(what == 'lname') {
                        if(InputValue == '') {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">여권상의 영문 성을 입력해 주세요.</p>');
                            }
                        }
                    } else if(what == 'fname') {
                        if(InputValue == '') {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">여권상의 영문 이름을 입력해 주세요.</p>');
                            }
                        }
                    } 
                }, // focus: function()
                    
                keyup: function(e) {
                    // 입력했을 때의 input 태그의 value 값
                    let InputValue = $(this).val();

                    // input 태그의 name 값
                    let InputName = $(this).attr('name');
                    // 해당 name 값의 길이
                    let strlength = InputName.length;
                    // 해당 input 태그의 끝부분부터 _ index 위치 
                    let underline = InputName.lastIndexOf('_',strlength);
                    // _ 다음 부터의 단어
                    let what = InputName.substring(underline+1, strlength);

                    console.log(what);

                    // <p class="error_message">여권상의 영문 이름을 입력해 주세요.</p>
                    if(what == 'name') {    // 이름
                        if(!isCorrect(InputValue)) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">2~5자 한글성명만 입력해주세요</p>');
                            }
                            validCheck = false;
                        } else {
                            $(this).siblings().remove();
                            validCheck = true;
                        }
                    }else if(what == 'birth') { // 생년월일
                        if(!isBirthday(InputValue)) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">생년월일 형식에 맞게 입력해 주세요.(ex. 1999-12-31)</p>');
                            }
                            validCheck = false;
                        } else {
                            $(this).siblings().remove();
                            validCheck = true;
                        }
                    }else if(what == 'lname') { // 영문 성
                        // 소문자일 때는 대문자로, 영문자가 아닐 때는 그 문자만 지워야함. ㅅㅂ
                        let strKey = e.key+"";
                        let strCode = e.keyCode

                        // 입력한 key 의 값이 영문자가 아니면 에러 태그 추가
                        if(!(strCode >= 65 && strCode <= 90)) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">여권상의 영문 성을 입력해 주세요.</p>');
                            }
                        }

                        let str = InputValue+"";

                        // 배열로 변환
                        let strArr = [...str];
                        
                        // 유효성 검사 마친 문자열 값 전달
                        $(this).val(replaceEG(strArr));
                    
                        // 최종적으로 적힌 값에 대한 유효성 검사
                        if(!isCorrectEg($(this).val())) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">여권상의 영문 성을 입력해 주세요.</p>');
                            }
                            validCheck = false;
                        } else {
                            $(this).siblings().remove();
                            validCheck = true;
                        }
                    }else if(what == 'fname') { // 영문 이름
                        // 소문자일 때는 대문자로, 영문자가 아닐 때는 그 문자만 지워야함. ㅅㅂ
                        let strKey = e.key+"";
                        let strCode = e.keyCode

                        // 입력한 key 의 값이 영문자가 아니면 에러 태그 추가
                        if(!(strCode >= 65 && strCode <= 90)) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">여권상의 영문 이름을 입력해 주세요.</p>');
                            }
                        }

                        let str = InputValue+"";

                        // 배열로 변환
                        let strArr = [...str];
                        
                        // 유효성 검사 마친 문자열 값 전달
                        $(this).val(replaceEG(strArr));
                    
                        // 최종적으로 적힌 값에 대한 유효성 검사
                        if(!isCorrectEg($(this).val())) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">여권상의 영문 이름을 입력해 주세요.</p>');
                            }
                            validCheck = false;
                        } else {
                            $(this).siblings().remove();
                            validCheck = true;
                        }

                    }else if(what == 'email') { // 이메일
                        if(!isEmail(InputValue)) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">이메일 형식에 맞게 입력해 주세요.(ex. Empty@naver.com)</p>');
                            }
                            validCheck = false;
                        } else {
                            $(this).siblings().remove();
                            validCheck = true;
                        }
                    }else if(what == 'tel') {   // 휴대폰 번호
                        let strKey = e.key+"";
                        let strCode = e.keyCode;

                        if(!(strCode >= 48 && strCode <= 57)) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">휴대폰 번호 형식에 맞게 입력해 주세요.(ex. 01012345678)</p>');
                            }
                        }

                        let str = InputValue+"";

                        let strArr = [...str];

                        $(this).val(replaceNum(strArr));

                        // 최종적으로 적힌 값에 대한 유효성 검사
                        if(!isPhoneNumber($(this).val())) {
                            if($(this).siblings().length == 0) {
                                $(this).after('<p class="error_message">휴대폰 번호 형식에 맞게 입력해 주세요.(ex. 01012345678)</p>');
                            }
                            validCheck = false;
                        } else {
                            $(this).siblings().remove();
                            validCheck = true;
                        }
                    }
                } // keyup: function(e)
            }); // $('.input_keyword').on()

            // 성별 체크란 선택 시 만약 error 메세지 있으면 없애는 부분
            $('.inpt_radio').on('click', function() {
                $(this).parents('.genderDiv').siblings().remove();
            })

            // 다음 단계 버튼 클릭 시
            $('#nextBtn').on('click', function() {
                // 유효성 검사를 통과하면 계속 true 인 상태임.
                let lastCheck = true;
            
                // input 태그들 검사
                // index : 인덱스, item : 각각의 객체
                $('.input_keyword').each(function(index, item) {
                    if($(item).val() == '') {
                        $(item).focus();
                        lastCheck = false;
                        return false;
                    }else if($(item).siblings().length != 0) {
                        $(item).focus();
                        lastCheck = false;
                        return false;
                    }
                });

                if(!lastCheck) return false;

                // 성별 input 태그들 검사
                let totalGenIpCnt = 0;
                let genIpCnt = 0;

                // 성별 input 태그를 품고 있는 div
                $('.genderDiv').each(function(index, item) {
                    // 각 div 에서 성별 input 찾아 다시 반복
                    $(item).find('.inpt_radio').each(function(index, item2){
                        // 성별 체크된 것이 있으면 +1
                        if($(item2).is(':checked')) {
                            genIpCnt++;
                        }
                    });

                    // 체크된 것이 하나도 없으면 에러 메세지 추가 있으면 에러메세지 삭제
                    if(genIpCnt != 1) {
                        if($(item).siblings().length == 0) {
                            $(item).after('<p class="error_message">성별을 선택해주세요.</p>'); 
                        } 
                        $(item).find('.inpt_radio').focus();
                        lastCheck = false;
                        genIpCnt=0; // 다른 div 쪽 검사하기 위한 초기화
                        return false;
                    } else {
                        $(item).siblings().remove();
                    }
                    genIpCnt=0; // 다른 div 쪽 검사하기 위한 초기화
                });

                console.log(lastCheck+"?");
            });
            
            //예약하기 버튼
            $(document).on('click','.reserve' ,function() {
            	 $.ajax({
            		url: '${pageContext.request.contextPath}/airport/airplaneInsertReservation',
    				type: 'post',
    				data: ('#completeReservation').serealize(),
    				dataType:'json',
    				success : function(data){
    					console.log(data);
    					alert(data);
    				},
    				error: function(err){
    					alert('예약이 실패하였습니다');
    					history.go(-1);
    					console.log(err);
    				}
            	});  
            });
            
            
        }); // $(function() {});
    </script>
</body>
</html>