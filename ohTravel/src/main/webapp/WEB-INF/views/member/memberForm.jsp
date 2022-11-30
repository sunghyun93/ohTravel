<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/memberForm.css">
</head>
<body>
	<div class="container" id="container">
		<div class="inner">
			<form name="register" action="register" method="post">
				<input type="hidden" id="mem_role" name="mem_role" value="ROLE_USER">
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
											<input id="mem_id" name="mem_id" type="text" title="이름" placeholder="이름을 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<span class="form_holder">
											<input id="mem_name" name="mem_name" type="text" title="아이디" placeholder="아이디를 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<span class="form_holder">
											<input id="mem_email" name="mem_email" type="text" title="이메일" placeholder="이메일을 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>휴대폰번호</th>
									<td>
										<span class="form_holder">
											<input id="mem_tel" name="mem_tel" type="text" title="휴대폰 번호" placeholder="휴대폰 번호를 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<span class="form_holder">
											<input id="mem_birthday" name="mem_birthday" type="text" title="생년월일" placeholder="생년월일을 입력해 주세요." class="inpt_text" style="width: 270px;">
										</span>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td class="passwd">
										<div class="form_holder">
											<input id="mem_password" name="mem_password" type="password" title="비밀번호" placeholder="비밀번호" maxlength="16" class="inpt_text v-placeholdder" style="width: 360px">
										</div>
										<div class="form_holder">
											<input id="mem_password2" name="mem_password2" type="password" title="비밀번호" placeholder="비밀번호를 확인하기 위해 다시 입력해 주세요." maxlength="16" class="inpt_text v-placeholdder" style="width: 360px">
										</div>
										<p class="txt billiard">
											8~16자리의 영문 대/소문자, 숫자, 특수문자 중 2개 이상을 조합해서 비밀번호를 설정해 주세요.<br>
											(아이디, 생년월일, 동일한 연속 문자/숫자 사용 불가능)
										</p>
									</td>
								</tr>
							</tbody>
						</table>	<!-- type2 -->
					</div>	<!-- tbl -->
					<div class="cont_unit"></div>	<!-- cont_unit -->
					<!-- 약관 -->
					<div class="terms_wrap">
						<!-- 전체 동의 버튼-->
						<div class="form_holder check mt20">
							<input type="checkbox" id="chkDefault00" class="inpt_checkbox"> 
							<label for="chkDefault00" class="label_checkbox">전체동의</label>
						</div>
						<!-- Oh!Travel 이용 약관 동의  -->
						<div class="form_holder check mt20">
							<input type="checkbox" id="FT05" class="inpt_checkbox">
							<label for="FT05" class="label_checkbox">
								하나투어 이용약관 동의<span class="opt"><em>(필수)</em></span>
							</label>
							<div class="terms_box">
								<div class="terms_wrap">
									<strong class="big_tit">제 1장 총 칙</strong>
									<strong class="tit mt0">제1조 (목적) </strong>
									<p>본 약관은 주식회사 하나투어(이하 “회사”라 한다)가 운영하는 사이버몰과 하나투어 마일리지클럽(이하 “몰”이라 한다)에서 제공하는 서비스(이하 "서비스"라 한다)를 통합 운영하고 제공함에 있어 이용자(이하 “이용자”)와의 이용조건 및 권리 의무와 절차 및 책임사항을 규정함을 목적으로 합니다.</p>
									<strong class="tit">제2조(정의) </strong>
									<ol class="decimal">
										<li>"몰"이란 ”회사”가 이용자에게 재화 또는 용역(이하 "재화"이라 함)과 서비스를 컴퓨터 등 정보통신 설비를 이용하여 사용하고 거래할 수 있도록 설정한 가상의 영업장과 웹사이트를 말하며, 아울러 인터넷쇼핑몰을 운영하는 사업자의 의미로도 사용합니다. “몰”의 웹사이트는 www.hanatour.com, www.hanaticket.com, hc.hanatour.com 이 있으며, “회사”와 “하나투어 마일리지클럽 제휴사 및 가맹점(이하 “제휴가맹점”)”의 정책에 따라 추가/변동될 수 있습니다.</li>
										<li>"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 재화 및 서비스를 이용하는 회원 및 비회원을 말합니다.</li>
										<li>“회원”이라 함은 "몰"에 본 약관과 개인정보 제공에 동의하여 회원등록을 한 자로서, "몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 재화와 서비스를 계속적으로 이용할 수 있는 개인 및 법인을 말합니다.</li>
										<li>“비회원”이라 함은 회원에 가입하지 않고 "몰"이 제공하는 재화와 서비스를 이용하는 자를 말합니다.</li>
										<li>"이용자아이디(이하 “ID”)"라 함은 “몰”의 이용을 위하여 등록한 이메일주소 체계로 표기된 인식문자를 말합니다.</li>
										<li>"비밀번호"라 함은 “ID”회원임을 확인하고, 서비스 보안을 위해 회원이 설정하여 “몰”에 통보한 8자리 이상 16자리 이하의 영문과 숫자, 특수문자를 혼용하여 표기한 암호문자를 말합니다. 회원의 안전한 서비스를 이용을 위해 비밀번호 구성 중 유출이 쉬운 비밀번호의 이용에 관해서는 “몰”에서 일부 제한 할 수 있습니다.</li>
										<li>"본인인증수단"이라 함은 휴대폰 본인인증, 실명인증+휴대폰인증, 실명인증+이메일인증 등 “몰”에서 회원 가입, 로그인, 아이디 찾기, 비밀번호 등 변경에 필요한 서비스 보안을 위하여 “몰”이 정한 인증수단을 말합니다.</li>
										<li>"인증정보"란 “ID”, 비밀번호 설정에 필요한 정보를 말합니다.</li>
										<li>"생체정보"란 지문, 홍채, 정맥, 안면, 음성 등 개인을 식별할 수 있는 신체적 또는 행동적 특징에 관한 정보를 의미 합니다.</li>
										<li>“영업일”이란 회사가 정상적으로 서비스를 제공한 날로서 대한민국 기준, 토요일, 일요일 및 법정 공휴일을 제외한 날을 말합니다.</li>
										<li>“구매안전서비스”란 회사가 구매자가 결제한 결제대금을 보호하기 위하여 일정기간 결제대금을 예치하는 서비스를 말합니다.</li>
										<li>“안전거래센터”란 서비스 이용 중 거래의 안전과 관련하여 발생할 수 있는 문제를 조정하기 위한 기구를 말합니다.</li>
										<li>“분쟁조정센터”란 “몰”을 통한 거래에서 분쟁이 발생하면 판매자와 구매자가 자율적으로 해결하는 것이 원칙이지만, 분쟁의 합리적이고 원활한 조정을 위하여 예외적으로 회사가 설치 운영하는 분쟁조정기구를 말합니다.</li>
										<li>“전자결제대행수수료”란 구매자가 신용카드, 실시간계좌이체를 통해 상품을 구매 시 PG사에 지불해야 하는 수수료를 말합니다.</li>
										<li>“하나투어 마일리지클럽”(이하 “하나투어클럽”)은 “몰”이 회원에게 제공하는 멤버십서비스로 서비스의 개요는 본 약관 제3조와 같습니다.</li>
										<li>"제휴가맹점"은 “회사”와 제휴 계약을 체결하여 “하나투어클럽” 서비스를 운영하기로 합의한 개인 또는 법인 등을 말합니다.</li>
										<li>“하나투어마일리지” (이하 “마일리지”)란 회원이 “몰”과 “제휴가맹점”에서 재화 및 서비스 구매 시 제공되는 것으로써 회원이 본 약관에 따라 하나투어클럽 서비스를 이용하기 위하여 취득하는 것으로 세부사항은 본 약관 제8조와 같습니다.</li>
										<li>“하나투어마일리지 비밀번호”란 “하나투어클럽”을 이용하기 위해 이용자가 설정한 4자리 이상의 숫자를 사용하여 표기한 암호문자를 말합니다. 회원의 안전한 서비스의 이용을 위해 비밀번호 구성 중 유출이 쉬운 비밀번호의 이용에 관해서는 회사에서 일부 제한 할 수 있습니다.</li>
										<li>“접근매체”라 함은 전자금융거래에 있어서 거래 지시를 하거나 회원 및 거래 내용의 진실성과 정확성을 확보하기 위하여 사용되는 “회원번호”, “ID”, “비밀번호”, “전자식카드”, “인증서” 등을 말합니다.</li>
										<li>“하나투어클럽 제휴카드”(이하 “제휴카드”)는 하나투어클럽의 기본적인 멤버십, 마일리지 서비스와 카드사 혹은 제휴사의 추가 서비스가 탑재된 신용카드, 체크카드, 선불카드 및 멤버십카드등을 말합니다.</li>
										<li>회원의 회원가입신청이 승낙되지 않으면 가입대기중 (이하 “신청중 회원”) 상태로 분류하고 개인정보처리방침에 따라 보관/운영합니다.</li>
									</ol>	<!-- 일단 2조까지만,, -->
								</div>	<!-- terms_wrap -->
								<div class="terms_wrap">
								    <strong class="tit">부칙</strong>
								
								    <ol class="decimal">
								        <li>이 약관은 2020년 9월 5일부터 적용됩니다.</li>
								        <li>2020년 4월 20일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.</li>
								    </ol>
								    <p><br /></p>
								</div>	<!-- terms_wrap -->
							</div>	<!-- terms_box -->
						</div>	<!-- form_holder check mt20 -->
						<!-- 개인정보 수집 및 이용에 대한 동의 -->		
						<div class="form_holder check mt20">
							<input type="checkbox" id="MJ05" class="inpt_checkbox">
							<label for="MJ05" class="label_checkbox">
								개인정보 수집 및 이용에 대한 동의<span class="opt"><em>(필수)</em></span>
							</label>
							<div class="terms_box">
								<div class="hnt_terms">
									<strong class="tit mt0">1. 개인정보 수집 및 이용목적</strong>
									<p>회사는 여행상품의 예약 및 여행관련 서비스, 마일리지 적립/사용/정산 등의 업무처리를 위하여 고객으로부터 최소한의 필수정보를 수집하며, 제공한 모든 개인정보는 별도의 동의가 없는 한 해당목적 이외의 다른 목적으로 사용하지 않습니다.</p>
									<ol class="list_normal">
									    <li class="mt10">회사는 수집한 개인정보를 다음의 목적을 위하여 사용합니다.</li>
									    <li class="mt10">
									        가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 <br />
									        여행상품 예약, 여행자보험 가입, 항공권/호텔 등의 예약 및 출입국 정보확인, 예약내역의 확인 및 상담, 컨텐츠 제공, 여행서비스 이용 시 회원의 우대 구매 및 요금결제, 하나투어 마일리지 적립/사용, 물품배송 또는 청구서 등 발송, 금융서비스,
									        이벤트 참여, 상품/서비스/채널 이용실적 통계/분석 및 상품/서비스 추천 등
									    </li>
									    <li class="mt10">
									        나. 회원관리 <br />
									        회원제 서비스 이용을 위한 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 이용 및 이용횟수 제한, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 분쟁조정을 위한 기록보존, 불만처리 등
									        민원처리, 고지사항 전달 등
									    </li>
									</ol>	
								</div>	<!-- hnt_terms -->
							</div>	<!-- terms_box -->
						</div>	<!-- form_holder check mt20 -->	
						<div class="form_holder check mt20">
							<input type="checkbox" id="MJ01" class="inpt_checkbox">
							<label for="MJ01" class="label_checkbox">
								개인정보 제3자 제공에 대한 동의<span class="opt"><em>(필수)</em></span>
							</label>
							<div class="terms_box">
								<div class="hnt_terms">
									<ol class="list_normal">
									    <li>
									        ① 당사는 법령에 근거가 있거나 정부의 관련 지침, 지시 등 예외적인 경우를 제외하고는 이용자의 사전 동의 없이 이용자의 개인정보를 본 지침상의 정보 이용 목적의 범위를 넘어 사용하거나 제3자에게(다른 개인이나 기업)에 제공하지 않습니다.
									    </li>
									    <li>② 마일리지 적립, 전환, 사용 및 회원 할인 및 기타 편의서비스 등을 제공하는 하나투어 마일리지클럽® 제휴사에는 해당 제휴서비스를 위한 최소한의 회원 개인정보가 제공됩니다.</li>
									</ol>
									<p>(아래 업체의 경우는 회원가입시 제3자 제공에 동의한 경우 별도의 추가 동의 없이 개인정보를 제공할 수 있습니다.)</p>
									<ol class="list_normal mt10">
									    <li>
									        ③ 동의거부 권리 <br />
									        고객님은 ‘개인정보 제3자 제공에 대한 동의’를 거부할 수 있는 권리가 있습니다. 동의 거부 시 서비스 제공이 불가합니다.
									    </li>
									</ol>
								</div>	<!-- hnt_terms -->
							</div>	<!-- terms_box -->
						</div>	<!-- form_holder check mt20 -->	
						<div class="form_holder check mt20">
							<input type="checkbox" id="MJ02" class="inpt_checkbox">
							<label for="MJ02" class="label_checkbox">
								위치기반서비스 이용약관 동의<span class="opt">(선택)</span>
							</label>
							<div class="terms_box">
								<div class="terms_wrap">
									<strong class="tit mt0">제 1 조 (목적)</strong>
									<p>본 약관은 주식회사 하나투어(이하 “회사”)가 제공하는 위치기반서비스 약관에 부합하여 관련서비스 제공하는 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다..</p>
									<strong class="tit">제 2 조 (이용약관의 효력 및 변경)</strong>
									<ol class="decimal">
									    <li>본 약관은 서비스를 이용하는 고객 또는 개인위치정보주체가 본 약관에서 정의하는 회사의 서비스에 절차에 따라 동의함으로써 효력이 발생합니다.</li>
									    <li>이용자는 서비스의 동의 요청에 따라서 지정한 “동의” 선택 및 위치정보 조회에 대한 문자를 수신하였을 경우 이용자가 위치 정보와 관련된 내용을 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다.</li>
									    <li>회사는 위치정보의 보호 및 이용 등에 관한 법률, 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자기본법 약관의 규제에 관한 법률 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</li>
									    <li>
									        회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 10일 전부터 적용일 이후 상당한 기간 동안 공지만을 하고, 개정 내용이 이용자에게 불리한 경우에는 그 적용일자
									        30일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 게시하거나 이용자에게 음성 또는 전자적 형태(SMS 등)로 약관 개정 사실을 발송하여 고지합니다.
									    </li>
									    <li>회사가 전항에 따라 이용자에게 통지하면서 공지 또는 공지 ㆍ 고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 이용약관에 승인한 것으로 봅니다.</li>
									</ol>
									<strong class="tit">제 3 조 (관계법령의 적용)</strong>
									<p>본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 또는 상관례에 따릅니다.</p>
									<ol class="decimal">
										<li>상 호 : ㈜하나투어</li>
										<li>대 표 자 : 김진국, 송미선</li>
										<li>주 소 : 서울특별시 종로구 인사동5일 41 (공평동)</li>
										<li>대표전화 : 02-1577-1233</li>
									</ol>
								</div>	<!-- terms_wrap -->
							</div>	<!-- terms_box -->
						</div>	<!-- form_holder check mt20 -->
						<div class="form_holder check mt20">
							<input type="checkbox" id="MJ03" class="inpt_checkbox">
							<label for="MJ03" class="label_checkbox">
								마케팅 활용 동의<span class="opt">(선택)</span>
							</label>
							<div class="terms_box">
							    <div class="hnt_terms">
							        <p>하나투어 서비스 이용 고객님께 광고성 정보 전송 시 아래와 같은 기준으로 진행되오니, 하기 내용을 참조해 주시고 수신동의를 선택해 주시기 바랍니다.</p>
							        <table class="mt15">
							            <colgroup>
							                <col style="width: 40%;" />
							                <col style="width: 30%;" />
							                <col />
							            </colgroup>
							            <thead>
							                <tr>
							                    <th>개인정보 수집 및 이용 항목</th>
							                    <th>개인정보 수집 및 이용 목적</th>
							                    <th>개인정보 보유 및 이용 기간</th>
							                </tr>
							            </thead>
							            <tbody>
							                <tr>
							                    <td><span class="txtblock">휴대전화번호, 이메일 </span>주소</td>
							                    <td>하나투어, 하나투어클럽, 자회사, 제휴사 상품 혜택 각종 이벤트 및 행사 관련 정보 안내</td>
							                    <td>서비스 제공 종료 또는 별도 거부의 요청 시 까지</td>
							                </tr>
							            </tbody>
							        </table>
							        <p class="mt20">
							            고객님께서는 마케팅 활용 동의를 거부할 권리가 있습니다.<br />
							            이 경우, 여행 맞춤 서비스 및 정보제공이 일부 제한 될 수 있으며 여행서비스 이용에는 영향이 없습니다.
							        </p>
							    </div>	<!-- hnt_terms -->
							</div>	<!-- terms_box -->
						</div>	<!-- form_holder check mt20 -->	
						<div class="form_holder check mt20">
							<input type="checkbox" id="MJ04" class="inpt_checkbox">
							<label for="MJ04" class="label_checkbox">
								마케팅목적 제3자 제공에 대한 동의<span class="opt">(선택)</span>
							</label>
							<div class="terms_box">
							    <!-- [마케팅목적 제3자 제공 안내] [선택약관] -->
							    <div class="terms_wrap">
							        <strong class="tit"><span class="num">1. </span> 당사는 회원으로부터 수집한 개인정보를 명시된 목적 범위 내에서만 이용하여 회원의 동의 없이는 목적 이외로 사용하지 않습니다.</strong>
							
							        <strong class="tit"><span class="num">2. </span> 당사는 다양한 서비스 제공을 위해 회원 가입 시 '마케팅활용목적을 위한 개인정보 제3자 제공'에 동의한 회원의 경우 별도의 부가적인 서비스 정보와 혜택을 안내 드릴 수 있습니다.</strong>
							
							        <div class="tbl">
							            <table class="type2 txl">
							                <colgroup>
							                    <col style="width: 20%;" />
							
							                    <col />
							                </colgroup>
							
							                <tbody>
							                    <tr>
							                        <th>제공받는자</th>
							
							                        <td>
							                            KB국민카드(소속 모집인 포함) 및 대행업체 <br />
							                            신한카드(소속 모집인 포함) 및 대행업체
							                        </td>
							                    </tr>
							
							                    <tr>
							                        <th>이용목적</th>
							
							                        <td>하나투어클럽 제휴 신용카드의 안내 및 발급 권유, 카드 발급 신청등의 텔레마케팅 이용 목적</td>
							                    </tr>
							
							                    <tr>
							                        <th>제공되는 개인정보 항목</th>
							
							                        <td>회원번호, 이름, CI, 생년월일, 성별, 휴대폰번호, 잔여마일리지</td>
							                    </tr>
							
							                    <tr>
							                        <th>제공방법</th>
							
							                        <td>개인정보 보유 및 이용기간 내의 본인의 추가 동의 없이 필요 시 마다 제공</td>
							                    </tr>
							
							                    <tr>
							                        <th>보유기간</th>
							
							                        <td>제공받은 날부터 6개월 이내</td>
							                    </tr>
							                </tbody>
							            </table>
							        </div>
							
							        <strong class="tit">동의거부 권리</strong>
							
							        <p>고객님은 마케팅 목적 제3자 제공에 대한 동의를 거부할 수 있는 권리가 있습니다. 이 경우 해당 서비스안내는 제한됩니다.</p>
							    </div>	<!-- terms_wrap -->
							</div>	<!-- terms_box -->
						</div>	<!-- form_holder check mt20 -->
					</div>	<!-- terms_wrap -->
					<div class="btn_wrap">
						<input type="submit" class="btn big pink" value="회원가입">
					</div>	<!-- btn_wrap -->
					<div class="cont_unit"></div>
				</div>	<!-- certify_wrap -->
			</form>			
		</div>	<!-- inner -->
	</div>	<!-- container -->
</body>
</html>