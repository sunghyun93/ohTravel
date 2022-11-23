<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- regeXP.js -->
<script src="/js/pkage/regExp.js"></script>
</head>
<body>
<div id="pkRv_container">
        <div class="pkRv_contents">
            <div id="" class="fontCtrl">
                <!-- 헤더 -->
                <div class="text_wrap big">
                    <strong class="tit">예약하기</strong>
                </div>

                <!-- 내용 -->
                <div class="ly_wrap pay_info">
                    <!-- 왼쪽 부분 -->
                    <div class="inr">
                        <div class="text_wrap mid">
                            <strong class="tit">방콕/파타야 5일 #가볍게떠나는여행 #4명이상출발확정 #무앙보란 #산호섬 #농눅빌리지</strong>
                        </div>

                        <!-- 예약 정보 table -->
                        <div class="tbl">
                            <table class="type2">
                                <colgroup>
                                    <col style="width: 17%;"><col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>여행기간</th>
                                        <td><strong>2022.12.01~2022.12.05 / 3박 5일</strong></td>
                                    </tr>
                                    <tr>
                                        <th>항공편</th>
                                        <td>
                                            <div class="item_course">
                                                <p>
                                                    <strong class="air_name">서울</strong>
                                                    <span class="move_arrow round">출발도착</span>
                                                    <strong class="air_name">방콕</strong>

                                                    <span class="air_info">
                                                        <span class="air_name">
                                                            <span class="air_img">
                                                                <img src="https://image.hanatour.com/usr/static/img/airline/BX.png" title="에어부산" data-src="" alt="에어부산">
                                                            </span>
                                                            	에어부산
                                                        </span>
                                                    </span>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이용호텔</th>
                                        <td><em>호텔예정</em></td>
                                    </tr>
                                </tbody>
                            </table>
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

                        <!-- 인원 정보 부분 -->
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
                                        <th>성인</th>
                                        <td class="inpt_counter_adult">1<span>명</span></td>
                                        <th>가격</th>
                                        <td class="price_adult">789000<span>원</span></td>
                                    </tr>
                                    <tr>
                                        <th>아동</th>
                                        <td class="inpt_counter_child">0<span>명</span></td>
                                        <th>가격</th>
                                        <td class="price_child">789000<span>원</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- tbl -->

                        <!-- 여행자 정보 부분 -->
                        <div class="text_wrap mid">
                            <strong class="tit">여행자 정보</strong>
                        </div>

                        <!-- 여행자 정보 부분 table -->
                        <div class="js_tabs type1 v-tabs alone">
                            <div class="panels personChk">
                                <div id="tabConTrvlP" class="panel selected">
                                    <div class="text_wrap type sml">
                                        <strong class="tit">성인 1</strong>
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
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_name" value="" maxlength="4" minlength="3" placeholder="한글성명(ex. 홍길동)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>생년월일</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_birth" value="" maxlength="10" minlength="3" placeholder="법정 생년월일(ex. 1991-12-23)" style="width: 250px;">
                                                        </td>
                                                        <th>성별</th>
                                                        <td>
                                                            <div class="genderDiv">
                                                                <span class="genderDiv_radio">
                                                                    <input type="radio" name="gender_0" id="gender1_0" class="inpt_radio" value="0">
                                                                    <label for="gender1_0">남성</label>
                                                                </span>
                                                                <span class="genderDiv_radio">
                                                                    <input type="radio" name="gender_0" id="gender2_0" class="inpt_radio" value="1">
                                                                    <label for="gender2_0">여성</label>
                                                                </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>영문 성</th>
                                                        <td><input type="text" id="" class="input_keyword" name="pkage_pi_lname" value="" maxlength="30" minlength="3" placeholder="여권 상의 영문 성(ex. HONG)" style="width: 250px;"></td>
                                                        <th>영문 이름</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_fname" value="" maxlength="30" minlength="3" placeholder="여권 상의 영문 이름(ex. GILDONG)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>이메일</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_email" value="" maxlength="30" minlength="3"  placeholder="이메일 주소(ex. Hong@naver.com)" style="width: 250px;">
                                                        </td>
                                                        <th>휴대폰 번호</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_tel" value="" maxlength="20" minlength="3" placeholder="휴대폰 번호(ex. 01012345678)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="tbl">
                                            <div class="text_wrap type sml">
                                                <strong class="tit">성인 2</strong>
                                            </div>

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
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_name" value="" maxlength="4" minlength="3" placeholder="한글성명(ex. 홍길동)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>생년월일</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_birth" value="" maxlength="10" minlength="3" placeholder="법정 생년월일(ex. 1991-12-23)" style="width: 250px;">
                                                        </td>
                                                        <th>성별</th>
                                                        <td>
                                                            <div class="genderDiv">
                                                                <span class="genderDiv_radio">
                                                                    <input type="radio" name="gender_1" id="gender1_1" class="inpt_radio" value="0">
                                                                    <label for="gender1_1">남성</label>
                                                                </span>
                                                                <span class="genderDiv_radio">
                                                                    <input type="radio" name="gender_1" id="gender2_1" class="inpt_radio" value="1">
                                                                    <label for="gender2_1">여성</label>
                                                                </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>영문 성</th>
                                                        <td><input type="text" id="" class="input_keyword" name="pkage_pi_lname" value="" maxlength="30" minlength="3" placeholder="여권 상의 영문 성(ex. HONG)" style="width: 250px;"></td>
                                                        <th>영문 이름</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_fname" value="" maxlength="30" minlength="3" placeholder="여권 상의 영문 이름(ex. GILDONG)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>이메일</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_email" value="" maxlength="30" minlength="3"  placeholder="이메일 주소(ex. Hong@naver.com)" style="width: 250px;">
                                                        </td>
                                                        <th>휴대폰 번호</th>
                                                        <td>
                                                            <input type="text" id="" class="input_keyword" name="pkage_pi_tel" value="" maxlength="20" minlength="3" placeholder="휴대폰 번호(ex. 01012345678)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div><!-- tabConTrvlP -->
                            </div><!-- panels -->
                        </div><!-- js_tabs type1 v-tabs alone, 여행자 정보 부분 table  -->

                        <!-- 예약 시 유의사항 -->
                        <div class="notice_wrap bg">
                            <strong class="tit line">예약 시 유의사항</strong>
                            <ul class="list_bul disc">
                                <li>
					                                    여행 관련 변경사항 발생 시 안내 드리고자 만 19세 이상의 모든 여행자는 휴대폰번호를
					                                    필수로 입력하셔야 합니다.
                                </li> 
                                <li>
					                                    휴대폰이 없으실 경우 연락 가능한 보호자의 휴대폰번호를 입력해 주시기 바랍니다.<br>(단,
					                                    동일 예약번호 내 동일한 이메일 및 휴대폰번호 입력 불가)
                                </li>   
                                <li>
                                 	여행자 정보 영문이름/법정생년월일은 여권과 동일하게 입력해 주십시오.
                                </li> 
                                <li>
                                                                                 여행자 정보는 예약/결제 후 예약내역에서 모두 입력해 주셔야 합니다
                                </li> 
                                <li>
                                                                                 현지합류 인원추가 시 추가 된 인원의 인원 정보를 등록해주셔야 합니다.
                                </li> 
                                <li>
                                    1인 객실 사용시 추가요금 발생
                                </li> 
                            </ul>
                        </div><!-- notice_wrap bg , 예약 시 유의사항 -->
                        
                        <!-- 다음 단계 버튼 -->
                        <div class="btn_wrap">
                            <button id="nextBtn" class="btn big pink">다음단계</button>
                        </div>
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
                                        <span>성인 1</span>
                                        <span class="divider_dot">아동 0</span>
                                    </div>

                                    <strong class="price">270000<span>원</span></strong>
                                </div>

                                <div class="info_area">
                                </div>
                            </div>
                        </div>
                    </div><!-- inr right -->
                </div><!-- ly_wrap pay_info -->
            </div><!-- fontCtrl -->
        </div><!-- pkRv_contents -->
    </div><!-- pkRv_container -->

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
        }); // $(function() {});
    </script>
</body>
</html>