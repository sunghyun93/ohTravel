<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/find.css">

</head>
<body>
	<div class="container" id="container">
		<div class="inr">
			<div class="contents" id="contents">
				<form action="">
					<div class="certify_wrap">
						<div class="text_wrap pTit">
						    <strong class="tit">아이디/비밀번호를 잊어버리셨나요?</strong>
						</div>	<!-- text_wrap -->
						<div class="js_tabs link type1 v-tabs">
							<!-- 아이디/비밀번호 찾기 선택 -->
							<ul class="tabs">
								<li style="width: 50%;"><a href="${pageContext.request.contextPath}/member/findID" class="">아이디찾기</a></li>
							    <li class="selected" style="width: 50%;"><a href="${pageContext.request.contextPath}/member/findPassword" aria-current="page" class="nuxt-link-exact-active nuxt-link-active">비밀번호찾기</a></li>
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
											                            <input type="text" title="이름" style="width: 100%;" placeholder="이름을 입력해 주세요." class="inpt_text v-placeholder" />
											                        </div>	<!-- form_holder gender -->
											                        <p class="error_message" style="display: none;">
											                        	이름을 입력해 주세요.
											                        </p>
											                    </td>
											                </tr>
											                <tr>
											                    <th>생년월일</th>
											                    <td>
											                        <div class="form_holder">
											                            <input type="text" title="생년월일" maxlength="8" placeholder="생년월일을 입력해 주세요. (ex: 19900101)" style="width: 100%;" class="inpt_text v-placeholder" />
											                        </div>	<!-- form_holder -->
											                        <p class="error_message" style="display: none;">
											                        	생년월일 형식에 맞게 입력해 주세요.(ex. 19991231)
											                        </p>
											                    </td>
											                </tr>
											                <tr>
											                    <th>휴대폰번호</th>
											                    <td>
											                        <div class="form_holder">
											                            <input type="text" title="이메일" placeholder="이메일 주소를 입력해 주세요. (ex: sample@sample.com)" class="inpt_text v-placeholder" style="width: 100%;"/>
											                        </div>	<!-- form_holder -->
											                        <p class="error_message" style="display: none;">
											                        	휴대폰번호 형식에 맞게 입력해 주세요.(ex. 01012345678)
											                        </p>
											                    </td>
											                </tr>
											                <tr>
															    <th>아이디</th>
															    <td>
															        <div class="form_holder"><input type="text" title="아이디" placeholder="아이디를 입력해 주세요." class="inpt_text v-placeholder" style="width: 100%;" /></div>
															        <p class="error_message" style="display: none;">
															        	아이디를 입력해 주세요.
															        </p>
															    </td>
															</tr>
											            </tbody>
											        </table>	<!-- type2 -->
											    </div>	<!-- tbl -->
											    <div class="btn_wrap">
											    	<a href="#" class="btn big gray">이전</a> 
											    	<button type="submit" class="btn big pink">다음</button>
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
</html>