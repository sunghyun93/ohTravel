<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/css/pkage/package_detail.css">
<link rel="stylesheet" href="/css/pkage/package_reservation.css">
<link rel="stylesheet" href="/css/pkage/package_clear.css">
<title>Insert title here</title>
<style>
.entire{
 width: 70%;
 margin: 0 auto;
}

.modifyBtn{
 width: 180px;
 height: 60px;
 margin-left: 900px;
 margin-top: 30px;
 margin-bottom: 30px;
 background-color: #7F00FF;
 color: white;
 font-size: 20px;
 font-weight: bold;
}
</style>
</head>
<body>
<!-- 여행자 정보 부분 -->
				<form id="info_modify">
				<input type="hidden" name="reservation_id" value="${reservation_id}">
					<div class="entire">
                        <div class="text_wrap mid">
                            <strong class="tit">탑승자 정보</strong>
                        </div>

                        <!-- 여행자 정보 부분 table -->
                        <c:forEach var="ppl"  items="${air_Reservation_PiList}">
                        <input type="hidden" value="${ppl.air_pi_id }" name="air_pi_id">
                        <div class="js_tabs type1 v-tabs alone">
                            <div class="panels personChk">
                                <div id="tabConTrvlP" class="panel selected">
                                    <div class="text_wrap type sml">
                                        <strong class="tit">성인 </strong>
                                       
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
                                                            <input type="text" id="" class="input_keyword" name="air_pi_name" value="${ppl.air_pi_name }" maxlength="4" minlength="3" placeholder="한글성명(ex. 홍길동)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>생년월일</th>
                                                        <td>
                                                            <input type="text"  id="" class="input_keyword" name="air_pi_birth" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${ppl.air_pi_birth }"/>" maxlength="10" minlength="3" placeholder="법정 생년월일(ex. 1991-12-23)" style="width: 250px;">
                                                        </td>
                                                        <th>성별</th>
                                                        <td>
                                                            <div class="genderDiv">
                                                                <select class="select_gender" name="air_pi_gen">
                                                               		<option  class="option_check" value="${ppl.air_pi_gen }">성별선택</option>
                                                                	<option value="0">남자</option>
                                                                	<option value="1">여자</option>
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>영문 성</th>
                                                        <td><input type="text" name="air_pi_lname" id="" class="input_keyword"  value="${ppl.air_pi_lname }" maxlength="30" minlength="3" placeholder="여권 상의 영문 성(ex. HONG)" style="width: 250px;"></td>
                                                        <th>영문 이름</th>
                                                        <td>
                                                            <input type="text" name="air_pi_fname" id="" class="input_keyword"  value="${ppl.air_pi_fname }" maxlength="30" minlength="3" placeholder="여권 상의 영문 이름(ex. GILDONG)" style="width: 250px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>이메일</th>
                                                        <td>
                                                            <input type="text" name="air_pi_email" id="air_pi_email" class="input_keyword"  value="${ppl.air_pi_email }" maxlength="30" minlength="3"  placeholder="이메일 주소(ex. Hong@naver.com)" style="width: 250px;">
                                                        </td>
                                                        <th>휴대폰 번호</th>
                                                        <td>
                                                            <input type="text" name="air_pi_tel" id="air_pi_tel" class="input_keyword"  value="${ppl.air_pi_tel }" maxlength="20" minlength="3" placeholder="휴대폰 번호(ex. 01012345678)" style="width: 250px;">
                                                        </td>                                                        				                                      
                                                    </tr>
                                                    <tr>
                                                    	<th>여권번호</th>
                                                    	<td>
				                                        	<input type="text" name="air_passport" id="" class="input_keyword" value="${ppl.air_passport }" maxlength="20" minlength="3" placeholder="여권번호(ex. M12341234)" style="width: 250px;">
				                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div><!-- tabConTrvlP -->
                            </div><!-- panels -->
                             <button type="button" class="modifyBtn">수정완료</button>
                        </div><!-- js_tabs type1 v-tabs alone, 여행자 정보 부분 table  -->
                        
                      </c:forEach>
                     </div>
                     </form> 
                     
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="/js/pkage/regExp.js"></script>                      
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
 			$('.select_gender').on('checked', function() {
                $(this).parents('.genderDiv').siblings().remove();
            }) 

            // 수정 단계 버튼 클릭 시
            $('.modifyBtn').on('click', function() {
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
                    // 각 div 에서 성별 select을 찾아 다시 반복
                    $(item).find('.select_gender').each(function(index, item2){
                        // 성별이 selected된 것이 있으면 0 또는 1(남자 또는 여자)면 genIpCnt 증가
                        if($(item2).find('option:selected').val() == "0" || $(item2).find('option:selected').val() == "1") {
                            genIpCnt++;
                        	console.log(genIpCnt);
                        }
                    });

                    // 체크된 것이 하나도 없으면 에러 메세지 추가 있으면 에러메세지 삭제
                    if(genIpCnt != 1) {
                        if($(item).siblings().length == 0) {
                            /* $(item).after('<p class="error_message">성별을 선택해주세요.</p>');  */
                            alert("성별을 선택해주세요.");
                        } 
                        $(item).find('.select_gender').focus();
                        lastCheck = false;
                        genIpCnt=0; // 다른 div 쪽 검사하기 위한 초기화
                        return false;
                    } else {
                        $(item).siblings().remove();
                    }
                    genIpCnt=0; // 다른 div 쪽 검사하기 위한 초기화
                });
                
            //성별 옵션체크를 위해    
  	        if(${ppl.air_pi_gen == 0}){
  	        	$('.option_check').text("남자");
  	        }else {
  	        	$('.option_check').text("여자");
  	        }
            
  	      console.log(lastCheck+"?");
     
          });
            
      }); 
        
      

       $(document).on('click','.modifyBtn' ,function() { 
        $.ajax({
    		url: '${pageContext.request.contextPath}/airport/airInfoModifyComplete',
			type: 'get',
			data: $('#info_modify').serialize(),
			dataType:'text',
			success : function(data){
			
				alert('탑승객 정보수정이 완료되었습니다.');
				location.href="${pageContext.request.contextPath}/member/myPageReservAir";
			},
			error: function(err){
				console.log(err);
			}
    	});  
    }); 
  
        
 </script>        
</body>
</html>