<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/airport/css/reservation/memWriteForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/airport/css/reservation/userUI.css">
<style>
.all {
	width : 1400px;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin: 0 auto;
} 

.inr{
    width: 870px;
    margin-left: 50px;
}


.text_wrap.big {
    width : 870px;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin: 20px 15px 0 0;
}
.text_wrap2  {
    width : 870px;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin: 100px 15px 0 0;
}



.end{
	margin-right: 50px;
}

.state1{
 	display:inline-block;
	width: 70px;
	height: 40px;
	text-align: center;
	color:white;
    background-color: #1E9EED;
    border: 1px solid #1E9EED;
    padding: 0.5rem;
    vertical-align: middle;
    border-radius: 0.5rem;
    font-size: 13px;
    font-weight: bold;
}

.state2{
 	display:inline-block;
	width: 70px;
	height: 40px;
	text-align: center;
	color:white;
    background-color: #00CCCC;
    border: 1px solid #00CCCC;
    padding: 0.5rem;
     vertical-align: middle;
    border-radius: 0.5rem;
    font-size: 13px;
    font-weight: bold;
}

.go_airplane{
	border: 1px solid gray;
	width : 870px;
	height: 125px;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin: 20px 15px 0 10px;
}

.hour{
	margin-left: 15px;
}

.time{
 font-weight: bold;
 font-size: 22px;
 margin-left: 15px;	
}

.airline{
	margin-left:10px;
}
.airline_num{
	margin-left:30px;
}

.count{
	margin-left: 25px;
}
.step{
	color:#3399FF;
	margin-left: 15px;
}

.notice_1{
	margin-top: 100px;
	font-size: 10pt;
}

.notice_2 {
	border: 2px solid gray;
	width: 870px;
	height: 405px;
	padding: 15px;
	margin-top: 50px;
}
.notice_2_1{
	font-size:14px;
	font-weight: bold;
}
.notice_2_inner{
	font-size: 10pt;
	margin-top: 20px;
}

.text_check{
 margin-top: 50px;
}
/*btn_top*/
#btn_top{
    position:fixed;
    right:0;
    top:50%;
    display: none;
    width:125px;
    height:140px;
    cursor: pointer;
    z-index: 100;
    background-color: #ffffff;
}
#btn_top figure{
    height: 110px;
    border:1px solid black;
    position:relative;
}
#btn_top figure p{
    width: 45px;
    height: 45px;
    position: absolute;
    left:50%;
    top:40%;
    transform: translate(-50%,-40%);
}
#btn_top figure figcaption {
    position: absolute;
    left:50%;
    bottom:10px;
    transform: translate(-50%,0);
}
#btn_top div{
    height: 30px;
    border:1px solid black;
    border-top:none;
    text-align: center;
    line-height: 30px;
    background-color: #f3f3f3; 
}
.triangle {
    width: 0px;
    height: 0px;
    border-bottom: 6px solid #666666;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    position: relative;
    bottom:12px;
}

/* 내용 - 오른쪽 부분 */
.ly_wrap.pay_info > .inr.right {
    width: 306px;
    margin-bottom: 1100px;
    -webkit-transition: bottom .3s ease-out;
    -moz-transition: bottom .3s ease-out;
    transition: bottom .3s ease-out;
}
.pay_info > .inr.right > .text_wrap.mid {
    margin-bottom: -5px;
}
.js_acc.filter_wrap {
    margin-top: 0;
}
.pay_info .js_acc.filter_wrap {
    overflow: hidden;
    overflow-y: auto;
    margin-top: 25px;
    border-top: none;
}
.pay_info > .inr.right .pay_area {
    border-top: 1px solid #ddd;
    padding: 15px 20px 20px;
    background: #f7f7f7;
    border-bottom: 1px solid #ddd;
}
/* info 부분 */
.pay_info .info_area .info {
    position: relative;
    margin-top: 5px;
    text-align: right;
    color: #111;
}
.pay_info .info_area .info:first-child {
    margin-top: 0;
}
.pay_info .info_area.total .info {
    min-height: 14px;
    margin-top: 0;
    padding-bottom: 10px;
}
.pay_info .info_area .info .tit {
    position: absolute;
    left: 0;
    font-weight: 400;
    text-align: left;
}
.divider_dot {
    position: relative;
    padding-left: 9px;
    display: inline-block;
    margin-left: 5px;
    min-height: 13px;
}
.pay_info .info_area .info span {
    font-size: 14px;
}
.divider_dot:before {
    width: 3px;
    height: 3px;
    border-radius: 50%;
    background-color: #ccc;
    position: absolute;
    top: 50%;
    left: 0;
    margin-top: -2px;
}
/* price 부분 */
.pay_info .info_area.total .price {
    display: block;
    margin-top: 15px;
    font-size: 16px;
    color: #0e1c35;
    text-align: right;
}
.pay_info .info_area.total .price span {
    font-size: 15px;
    font-weight: 400;
}
/* 밑줄 부분 */
.pay_info .info_area:not(:first-child) {
    margin-top: 20px;
    padding-top: 20px;
    border-top: 1px dashed #ddd;
}

.include_tax{
	float:right;
	font-size: 12px;
}
.total_price{
	font-size: 26px;
	color:red;
	padding-left: 80px;
}

.next_step{
	/*  margin: 20px 0 0 400px; */
	 margin: 0 auto;
	 text-align: center;
	 margin-top: 30px;

}

.next_step button{
	 border:1px solid #9933FF;
	 width: 160px;
	 height: 80px;
	 background-color: #9933FF;
	 font-size:24px;
	 font-weight: bold;
}
.emoji{
	
}

.air_name{
	margin-left: 10px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/airport/airplaneReserve"  id="airplaneReserve" method="post">
<input type="hidden" value="${count }" name="count">
<input type="hidden" value="${go_schedule_id }" name="go_schedule_id">
<input type="hidden" value="${come_schedule_id }" name="come_schedule_id">
<input type="hidden" value="${go.airplane_name }" name="go_airplane_name">
<input type="hidden" value="${come.airplane_name }" name="come_airplane_name">
<input type="hidden" value="${seat_position}" name="seat_position">
<input type="hidden" value="${seat_name}" name="seat_name">

<div class="all">
	<div class="inr">
		<h4>예약하기</h4><hr>
		<!--가는 항공편  -->
		<c:if test="${not empty go}">
		<div class="text_wrap big">
			<h5><strong>✈️ 가는 항공편</strong></h5>
			<span class="start"><strong class="startCity1"></strong></span> ➡️ <span class="end"><strong class="endCity1"></strong></span>
			<div class="tag_group">
				<span class="state1">예약가능</span>
			   	<span class="state2">요금확정</span>
		   </div> 
		</div>
		<div class="go_airplane">
				<div class="airline"><img class="emoji" src="${pageContext.request.contextPath}${go.air_picture}" width="15px" height="15px" ><span class="air_name">${go.air_name }</span><br>
				<span class="airline_num">${go.airplane_name }</span>
				</div>
				
				<div class="go_airplane_day">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${go.start_time}"/><br>
					<span class="time"><fmt:formatDate pattern="HH:mm" value="${go.start_time}"/></span><br>
					<span class="airport">${go.start_airport_name }</span>
				</div>
				<div>
						<span class="step">직항</span><br>
						<img class="emoji" src="${pageContext.request.contextPath}/airport/img/arro.png" width="70px" height="30px"><br>
						<span class="hour">6시간</span>
				</div>		
				<div class="depart_airplane_day">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${go.end_time}"/><br>
					<span class="time"><fmt:formatDate pattern="HH:mm" value="${go.end_time}"/></span><br>
					<span class="airport">${go.end_airport_name }</span>
				</div>
				<div>
					 성인 ${count }명<br>
					<span>일반석</span>
				</div>
				<div>
					 수화물포함<br>
					 <span class="count">1개</span>
				</div>
				
		</div>
		</c:if>
		<!--오는항공편 -->
		<c:if test="${not empty come}">
		<div class="text_wrap2 big">
			<h5><strong>✈️ 오는 항공편</strong></h5>
			<span class="start"><strong class="endCity1"></strong></span> ➡️ <span class="end"><strong class="startCity1"></strong></span>
			<div class="tag_group">
				<span class="state1">예약가능</span>
			   	<span class="state2">요금확정</span>
		   </div> 
		</div>
		<div class="go_airplane">
				<div class="airline"><img class="emoji" src="${pageContext.request.contextPath}${come.air_picture}" width="15px" height="15px"><span class="air_name">${come.air_name }</span><br>
				<span class="airline_num">${come.airplane_name}</span>
				</div>
				
				<div class="go_airplane_day">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${come.start_time }"/><br>
					<span class="time"><fmt:formatDate pattern="HH:mm" value="${come.start_time }"/></span><br>
					<span class="airport">${come.start_airport_name }</span>
				</div>
				<div>
						<span class="step">직항</span><br>
						<img class="emoji" src="${pageContext.request.contextPath}/airport/img/arro.png" width="70px" height="30px"><br>
						<span class="hour">6시간</span>
				</div>		
				<div class="depart_airplane_day">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${come.end_time }"/><br>
					<span class="time"><fmt:formatDate pattern="HH:mm" value="${come.end_time }"/></span><br>
					<span class="airport">${come.end_airport_name }</span>
				</div>
				<div>
					 성인 ${count}명<br>
					<span>일반석</span>
				</div>
				<div>
					 수화물포함<br>
					 <span class="count">1개</span>
				</div>
				
			</div>
		</c:if>
		
		<div class="notice_1">
			<ul>
				<li>📢 유류할증료/제세공과금은 항공사 사정 및 환율변동에 의해 매일 변경되며 발권 당일 환율에 따라 적용됩니다.</li>
				<li>📢 여행사 발권대행 수수료는 항공료에 포함되며, 항공권 예약,상담,발권 업무의 서비스를 탑승자에게 제공하고 서비스의 대가로 받는 취급수수료입니다.</li>
				<li>📢 신용카드 결제 시 발권대행 수수료 금액은 항공권 결제 후 하나투어로 별도 승인됩니다.</li>
				<li>📢 발권대행 수수료는 10,000원이 적용됩니다.(1인 기준, 성인/소아 적용)</li>
				<li>📢 결제된 발권대행 수수료는 환불 되지 않습니다.</li>
			</ul>
		</div>
		<div class="notice_2">
			<span class="notice_2_1">유의사항</span>
			<ul class="notice_2_inner">
				<li>🔈 국가/지역별로 입국 제한 및 자가격리, PCR 음성 확인서가 필요할 수 있습니다. 또한 일부 부정기편은 대한민국 여권 소지자만 가능하며 외국 국적에 대한 탑승 제한 및 가능 예외 사항이 있으니 자세한 사항은 외교부, 항공사, 대사관등을 통해 확인 후 문제없도록 준비하시기 바랍니다.</li>
				<li>🔈 출국 전 경유 및 목적지 국적의 비자 필요 여부를 반드시 직접 확인하여 출국 시 문제가 되지 않도록 비자를 준비하셔야 합니다. 비자 미소지로 출국 또는 해당 국적의 입국이 거절될 경우 발생하는 문제 및 그에 따른 발생 비용이나 항공권 환불수수료는 당사에서 책임지지 않습니다.</li>
				<li>🔈 편도 여정으로 항공권을 구입하실 경우, 입국 국적의 비자를 반드시 소지하셔야 합니다. 비자를 소지하지 않는 경우에는 해당국적으로의 출국이 거부될 수 있습니다. (일부 국적은 복편의 항공권을 소지하지 않으면 탑승수속이 거절될 수 있으니 유의하시기 바랍니다.)</li>
				<li>🔈 무비자 입국이 가능한 나라도 편도 항공권으로 입국은 불가하니, 해당 국적 대사관을 통해 입국 조건을 미리 확인하시기 바랍니다.<br>
					유류할증료/제세공과금은 항공사 사정 및 환율변동에 의해 매일 변경되며 발권 당일 환율에 따라 적용됩니다.
				</li>
				<li>🔈 항공권 취소수수료는 항공사마다 규정이 상이하므로, 해당운임의 요금규정을 반드시 확인하시기 바랍니다.</li>
				<li>🔈 환불소요기간은 항공사와의 확인 및 보고 절차 이외에 고객님의 결제방법(현금/카드)으로 인해 접수된 날짜로부터 30~50일정도 소요됩니다.
					(항공사, 카드사별로 상이함)
				</li>
				<li>🔈 환불이 가능한 항공권일 경우 요금규정에 기재되어 있는 항공권 취소수수료 외에 항공업무대행수수료는 별도로 부과됩니다.</li>
				<li>🔈 천재지변으로 인한 결항으로 탑승을 못하셨을 경우 환불절차는 별도로 담당자에게 요청하셔야 합니다.</li>
			</ul>
		</div>
		<!--약관 동의  -->
		<div class="contents-inner join-wrap">
                        <div class="border-line-box-header">
                            <span class="text_check">약관동의</span>
                        </div>
                        <!-- border-line-box fold-box-list-wrap 약관 동의 전체 구조 -->
                        <div class="border-line-box fold-box-list-wrap">
                            <!-- 전체 약관 동의 -->
                            <div class="term-check-all-wrap">
                                <span class="ui-chk text-medium">
                                    <input type="checkbox" id="foldCheckAll">
                                    <label for="foldCheckAll">
                                        전체 약관에 동의합니다.
                                    </label>
                                </span>
                            </div>
                            <!-- fold-box-list 필수 약관 동의 구조 -->
                            <ul class="fold-box-list" data-type="single">
                                <!--<li class="fold-box expanded"> -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck1" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck1">
                                                <span class="spot">[필수] </span>
                                                <span>사이트 이용 약관</span>
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg1" src="${pageContext.request.contextPath }/airport/img/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <div class="term-detail-wrap">
                                                <ol class="term-list">
                                                    <li>
                                                        <span class="term-head">제1조 (목적) </span>
                                                        <ul class="term-sub-list">
                                                            <li>이 약관은 (주)oh!Travel 회사(이하 "회사"라 함)가 운영하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <span class="term-head">제2조 (정의)</span>
                                                        <ul class="term-sub-list">
                                                            <li>1. "사이트"란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터, 모바일 등 정보통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일 웹, 앱 등의 서비스를 제공하는 모든 매체를 통칭하며, 아이디 및 비밀번호를 이용하여 서비스를 제공받을 수 있는 사이트를 말합니다.</li>
                                                            <li>2. "이용자"란 "사이트"에 접속하여 이 약관에 따라 "사이트"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
                                                            <li>3. ‘회원’이라 함은 "사이트"에 회원 등록을 한 자로서, "사이트"의 정보를 지속적으로 제공받으며, "사이트"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
                                                            <li>4. ‘비회원’이라 함은 회원에 가입하지 않고 "사이트"가 제공하는 서비스를 이용하는 자를 말합니다.</li>
                                                        </ul>
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 사이트 이용 약관 -->
                                <!-- <li class="fold-box expanded"> -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck2" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck2">
                                                <span class="spot">[필수]</span>
                                                전자상거래 이용 약관
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg2" src="${pageContext.request.contextPath }/airport/img/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <div class="term-detail-wrap">
                                                <ol class="term-list">
                                                    <li>
                                                        <span class="term-head">제1조 (목적) </span>
                                                        <ul class="term-sub-list">
                                                            <li>이 약관은 ㈜ oh!Travel 회사(이하 "당사"라 함)가 운영하는 사이버몰인 oh!Travel (이하 "닷컴"이라 함)을 통하여 제공하는 전자지급결제대행서비스 및 관리 서비스(이하 통칭하여 ‘전자금융거래서비스’라 합니다)를 이용자가 이용하는 경우, ‘회사’와 이용자간 전자금융거래의 법률관계를 정함에 그 목적이 있습니다.</li>
                                                        </ul>
                                                    </li> 
                                                    <li>
                                                        <span class="term-head">제2조 (정의)</span>
                                                        <ul class="term-sub-list">
                                                            <li>1. 본 약관에서 정하는 용어의 정의는 다음과 같습니다.</li>
                                                            <li>① ‘전자금융거래’라 함은 ‘회사’가 전자적 장치를 통하여 전자금융업무를 제공하고, 이용자가 ‘회사’의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.</li>
                                                            <li>② ‘전자지급거래’라 함은 자금을 주는 자(이하’지급인’이라 합니다)가 ‘회사’로 하여금 전자지급수단을 이용하여 자금을 받는 자(이하 ’수취인’이라 합니다)에게 자금을 이동하게 하는 전자금융거래를 말합니다.</li>
                                                            <li>③ ‘전자적 장치’라 함은 전자금융거래정보를 전자적 방법으로 전송하거나 처리하는데 이용되는 장치로서 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를 전송하거나 처리하는 장치를 말합니다.</li>
                                                            <li>④ ‘접근매체’라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), ‘전자서명법’ 상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.</li>
                                                            <li>⑤ ‘이용자’라 함은 ‘회사’와 본 약관에 동의하고 본 약관에 따라 사이트 전자금융거래 서비스를 이용하는 사이트 회원을 말합니다.</li>
                                                            <li>⑥ ‘이용자번호’란 이용자의 동일성 식별과 서비스 이용을 위하여 이용자가 설정하고 ‘회사’가 승인한 숫자와 문자의 조합을 말합니다.</li>
                                                            <li>⑦ ‘비밀번호’란 이용자의 동일성 식별과 회원정보의 보호를 위하여 이용자가 설정하고 ‘회사’가 승인한 숫자와 문자의 조합을 말합니다.</li>
                                                            <li>⑧ ‘거래지시’라 함은 이용자가 본 약관에 따라 ‘회사’에게 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
                                                            <li>⑨ ‘오류’라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 본 약관 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</li>
                                                            <li>2. 본 조 및 본 약관의 다른 조항에서 정의한 것을 제외하고는 전자금융거래법 등 관련법령에 정한 바에 따른다.</li>
                                                        </ul>
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 전자상거래 이용약관 -->
                                <!-- <li class="fold-box expanded"> -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck3" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck3">
                                                <span class="spot">[필수]</span>
                                                개인정보 수집 및 이용 동의
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg3" src="${pageContext.request.contextPath }/airport/img/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <p>&nbsp</p>
                                                <ul>
                                                    <li class="tbl-wrap tbl-col tbl-term">
                                                        <table>
                                                            <colgroup>
                                                                <col>
                                                                <col>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">이용 목적</th>
                                                                    <th scope="col">수집 항목</th>
                                                                    <th scope="col" style="font-weight:bold;">수집 목적</th>
                                                                    <th scope="col" style="font-weight:bold;">보유 기간</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>예약자</td>
                                                                    <td>예약자명, 휴대폰번호, 이메일</td>
                                                                    <td style="font-weight:bold;">여행상품 예약 및 상담 및 항공지연 안내</td>
                                                                    <td rowspan="2" style="font-weight:bold;">회원 탈퇴 시까지 또는 법정 의무 보유 기간까지</td>
                                                                </tr>
                                                                <tr>
                                                                	<td>이용자</td>
                                                                    <td>성명, 연락처, 생년월일, 이메일</td>
                                                                    <td>내부방침 상 반복된 악성민원 제기로 인한 이용자 본인확인 및 서비스 제한</td>
                                                                </tr>
                                                                 <tr>
                                                                	<td>여행자</td>
                                                                    <td>성명, 생년월일, 성별, 여권번호</td>
                                                                    <td>여행자보험 가입(별도 가입자에 한함)</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </li>
                                                </ul>
                                            <p>&nbsp</p>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 결제 및 발권동의  -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck4" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck4">
                                                <span class="spot">[필수]</span>
                                                결제 및 발권 동의 
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg4" src="${pageContext.request.contextPath }/airport/img/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <div class="term-detail-wrap">
                                                <ol class="term-list">
                                                    <li>
                                                        <span class="term-head">발권 동의</span>
                                                        <ul class="term-sub-list">
                                                            <li>예약일정 중 날짜/경유지/공항을 확인하셨습니까?</li>
                                                            <li>탑승객 영문이름이 여권과 일치합니까?</li>
                                                            <li>입력하신 탑승객의 생년월일이 여권정보와 일치합니까?</li>
                                                            <li>탑승객의 여권유효기간이 출국일로부터 6개월 이상 남아있습니까?</li>
                                                            <li>예약하신 항공요금의 요금규정은 확인하셨습니까?</li>
                                                            <li>구매 항공권의 스케줄 및 탑승객 정보에 대해 확인하였으며, 요금규정을 숙지하고 수용하는 조건으로 결제완료 후 순차적으로 발권되는 것에 동의합니다.</li>
                                                            <li>결제가 완료된 후에는 예약 취소가 아닌 환불 처리만 가능하며, 환불 시 수수료가 발생할 수 있습니다.</li>
                                                            <li>입력된 카드 정보는 결제 요청으로 처리 됩니다. 항공권 발권 시 실제 결제 처리되고 시간차가 발생합니다.(자동발권 제외)</li>
                                                            <li>유류할증료/제세공과금은 항공사 사정 및 환율변동에 의해 매일 변경되며 발권 당일 환율에 따라 적용됩니다.</li>
                                                        </ul>
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 결제 및 발권동의 이용약관 -->
                                <li class="fold-box">
                                    <div class="fold-box-header">
                                        <span class="ui-chk">
                                            <input type="checkbox" id="foldTermCheck5" class="foldTermCheck" name="" value="Y">
                                            <label for="foldTermCheck5">
                                                <span class="spot">[필수]</span>
                                                발권수수료
                                                
                                            </label>
                                            <!-- 화살표 버튼 -->
                                            <span class="arrow-bottom"><img class="arrowImg5" src="${pageContext.request.contextPath }/airport/img/arrow_up.svg"></span>
                                        </span>
                                    </div>
                                    <div class="fold-box-contents">
                                        <div class="text-term">
                                            <div class="term-detail-wrap">
                                                <ol class="term-list">
                                                    <li>
                                                        <ul class="term-sub-list">
                                                            <li>❗  여행사 발권수수료는 항공료에 포함되며, 항공권 예약,상담,발권업무의 서비스를 여행자에게 제공하고 서비스의 대가로 받는 취급수수료입니다.</li>
                                                            <li>❗ 신용카드 결제 시 발권수수료 금액은 항공권 결제 후 하나투어로 별도 승인됩니다.</li>
                                                            <li>❗  발권 수수료는성인 10,000원이 적용 됩니다.(1인 기준, 성인/소아 적용)</li>
                                                            <li>❗ 결제된 발권수수료는 환불 되지 않습니다.</li>
                                                        </ul>
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </li> <!-- fold-box 전자상거래 이용약관 -->
                            </ul> <!-- fold-box-list 필수 약관 동의 구조 -->
                        </div> <!-- border-line-box fold-box-list-wrap 약관 동의 전체 구조 -->
				</div>
			<div class="next_step">	
				<button class="next_stepBtn" type="submit">다음단계</button>
			</div>	
		</div>
			
    		<div class="ly_wrap pay_info">
                    <div class="inr right" style="right: auto; left: 0px;">
                        <div class="text_wrap mid">
                            <strong class="tit">결제상세내역</strong>
                        </div>

                        <div class="js_acc multi filter_wrap">
                            <div class="pay_area">
                                <div class="info_area total">
                                    <div class="info">
                                        <strong class="tit">결제예정금액</strong>
                                        <span>성인 ${count}</span>
                                    </div>
									
                                    <strong class="price">
                                    <c:if test="${seat_name == '일반석'}">
									<fmt:formatNumber value="${1*(go.schedule_price + come.schedule_price)}" pattern="#,###"/>원<br>
									 
									 </c:if>
									 <c:if test="${seat_name == '비즈니스석'}">
									<fmt:formatNumber value="${2*(go.schedule_price + come.schedule_price)}" pattern="#,###"/>원<br> 	
									 </c:if>
									 <c:if test="${seat_name == '일등석'}">
									<fmt:formatNumber value="${3*(go.schedule_price + come.schedule_price)}" pattern="#,###"/>원<br>
									 </c:if>
                                    </strong>
                                    <span class="include_tax">유류할증료/제세공과금 포함</span>
                                    
                                     <div class="info_area">
                                		<div>총 상품금액</div>
									<strong class="total_price">
									<c:if test="${seat_name == '일반석'}">
									<fmt:formatNumber value="${1*(go.schedule_price + come.schedule_price)}" pattern="#,###"/><span>원</span><br>
									 <input type="hidden" value="${count*(1*(go.schedule_price + come.schedule_price))}" name="total_price" class="price_hidden">
									 </c:if>
									 <c:if test="${seat_name == '비즈니스석'}">
									<fmt:formatNumber value="${2*(go.schedule_price + come.schedule_price)}" pattern="#,###"/><span>원</span><br> 	
									 <input type="hidden" value="${count*(2*(go.schedule_price + come.schedule_price))}" name="total_price" class="price_hidden">
									 </c:if>
									 <c:if test="${seat_name == '일등석'}">
									<fmt:formatNumber value="${3*(go.schedule_price + come.schedule_price)}" pattern="#,###"/><span>원</span><br>
									<input type="hidden" value="${count*(3*(go.schedule_price + come.schedule_price))}" name="total_price" class="price_hidden">
									 </c:if>
					
									</strong>
                                	</div>
                                </div>
					
                            </div>
                        </div>
                    </div><!-- inr right -->     
				</div>
    	</div>
    </form>		
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="${pageContext.request.contextPath }/airport/js/memWriteForm.js"></script>
<script type="text/javascript">
$(function(){
	//출발도시
    if(${start_city_id == 110}){
    	$('.startCity1').text('인천');
    	$('.endCity2').text('인천');
    }else if(${start_city_id == 140}){
    	$('.startCity1').text('제주');
    	$('.endCity2').text('제주');
    }else if(${start_city_id == 210}){
    	$('.startCity1').text('후쿠오카');
    	$('.endCity2').text('후쿠오카');
    }else if(${start_city_id == 220}){
    	$('.startCity1').text('오사카');
    	$('.endCity2').text('오사카');
    }else if(${start_city_id == 310}){
    	$('.startCity1').text('베이징');
    	$('.endCity2').text('베이징');
    }else if(${start_city_id == 320}){
    	$('.startCity1').text('상하이');
    	$('.endCity2').text('상하이');
    }else if(${start_city_id == 410}){
    	$('.startCity1').text('방콕');
    	$('.endCity2').text('방콕');
    }else if(${start_city_id == 420}){
    	$('.startCity1').text('파타야');
    	$('.endCity2').text('파타야');
    }
	
    //도착도시
    
    if(${end_city_id == 110}){
    	$('.endCity1').text('인천');
    	$('.startCity2').text('인천');
    }else if(${end_city_id == 140}){
    	$('.startCity1').text('제주');
    	$('.endCity2').text('제주');
    }else if(${end_city_id == 210}){
    	$('.endCity1').text('후쿠오카');
    	$('.startCity2').text('후쿠오카');
    }else if(${end_city_id == 220}){
    	$('.endCity1').text('오사카');
    	$('.startCity2').text('오사카');
    }else if(${end_city_id == 310}){
    	$('.endCity1').text('베이징');
    	$('.startCity2').text('베이징');
    }else if(${end_city_id == 320}){
    	$('.endCity1').text('상하이');
    	$('.startCity2').text('상하이');
    }else if(${end_city_id == 410}){
    	$('.endCity1').text('방콕');
    	$('.startCity2').text('방콕');
    }else if(${end_city_id == 420}){
    	$('.endCity1').text('파타야');
    	$('.startCity2').text('파타야');
    }
	
    
    
});	
	

</script>
</body>
</html>