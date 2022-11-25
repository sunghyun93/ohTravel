function isCorrect(asValue) { // 2~5자 한글만 입력 
	var regExp =  /^[가-힣]{2,5}$/; ///[ㄱ-힣]{2,5}$/g;
	return regExp.test(asValue);
}

function isCorrectEg(asValue) { // 1~30자 영대문자만 입력 
	var regExp =  /^[A-Z]{1,30}$/; ///^[A-Z]{1,30}$/;
	return regExp.test(asValue);
}

function isLowerEg(asValue) { // 소문자인지?
	var regExp =  /^[a-z]$/; 
	return regExp.test(asValue);
}

function isEg(asValue) { // 영문자인지?
	var regExp =  /^[A-Z|a-z]+$/; 
	return regExp.test(asValue);
}

function isNum(asValue) { // 숫자인지?
	var regExp =  /^[0-9]+$/; 
	return regExp.test(asValue);
}

function isBirthday(asValue) { // 8자 숫자만 입력
    var regExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/ // 하이픈(-) 존재유무
	// var regExp =  /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regExp.test(asValue);
}

function isEmail(asValue) { // 이메일 체크 정규식
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue);
}

function isPhoneNumber(asValue) { // 휴대폰 체크 정규식
	var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
	return regExp.test(asValue);
}

// 영문자 대문자로만 이루어지도록 하는 함수
function replaceEG(eg) {
    let tmpStr = "";
    for(let i = 0; i < eg.length; i++) {
        // 해당 문자가 영문자가 아니면 삭제
        if(!isEg(eg[i])) {
            eg.splice(i,1);
            i--;
        }
        // 해당 문자가 소문자면 대문자로 변환
        if(isLowerEg(eg[i])) {
            eg[i]=eg[i].toUpperCase();
        }           
    }
    // 배열을 문자열로 바꿔서 전달
    tmpStr = eg.join('');

    return tmpStr;
}

// 숫자로만 이루어지도록 하는 함수
function replaceNum(eg) {
    let tmpStr = "";
    for(let i = 0; i < eg.length; i++) {
        // 해당 문자가 영문자가 아니면 삭제
        if(!isNum(eg[i])) {
            eg.splice(i,1);
            i--;
        }         
    }
            // 배열을 문자열로 바꿔서 전달
    tmpStr = eg.join('');

    return tmpStr;
}