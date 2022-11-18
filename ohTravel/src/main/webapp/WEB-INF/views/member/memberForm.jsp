<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/member/css/memberForm.css">
</head>
<body>
	<div class="container" id="container">
		<div class="inner">
			<form action="">
				<div class="certify_wrap">
					<div class="text_wrap pTit">
						<strong class="tit">Oh! Travel 회원가입을 위한 고객님의 소중한 정보를 입력해 주세요.</strong>
					</div>	<!-- text_wrap pTit -->
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
											<input type="text" title="이름" placeholder="이름을 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<span class="form_holder">
											<input type="text" title="아이디" placeholder="아이디를 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<span class="form_holder">
											<input type="text" title="이메일" placeholder="이메일을 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>휴대폰번호</th>
									<td>
										<span class="form_holder">
											<input type="text" title="휴대폰 번호" placeholder="휴대폰 번호를 입력해 주세요." class="inpt_text v-placeholder" style="width: 360px">
										</span>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<span class="form_holder">
											<input type="text" title="생년월일" placeholder="생년월일을 입력해 주세요." class="inpt_text" style="width: 270px;">
										</span>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td class="passwd">
										<div class="form_holder">
											<input type="password" title="비밀번호" placeholder="비밀번호" maxlength="16" class="inpt_text v-placeholdder" style="width: 360px">
										</div>
										<div class="form_holder">
											<input type="password" title="비밀번호" placeholder="비밀번호를 확인하기 위해 다시 입력해 주세요." maxlength="16" class="inpt_text v-placeholdder" style="width: 360px">
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
					<div class="terms_wrap">
					
					</div>	<!-- terms_wrap -->
				</div>	<!-- certify_wrap -->
			</form>			
		</div>	<!-- inner -->
	</div>	<!-- container -->
</body>
</html>