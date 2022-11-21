<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- google fonts icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/package_detail.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<title>Package</title>
</head>
<body>
<div id="pk_container">
        <div class="container">
            <div class="inr wide">
                <!-- 패키지 상세 간단 정보 start -->
                <div class="ly_wrap prod_brief">
                    <!-- 사진 -->
                    <div class="inr">
                        <div class="inr_img_container">
                            <img class="inr_img" src="package_beijing31001_1.jpg">
                        </div>
                    </div>

                    <!-- 간단 정보 -->
                    <div class="inr right">
                        <div class="tag_group">
                            <span class="tag_thema t_green">힐링</span>
                        </div>
                        
                        <div class="text_wrap">
                            <strong class="item_title">방콕/파타야 5일 #가볍게떠나는여행 #4명이상출발확정 #무앙보란 #산호섬 #농눅빌리지</strong>
                        </div>

                        <div class="option_wrap">
                            <div class="dummyDiv"></div>
                            <div class="right_cont">
                                <span class="icn star" style="cursor: pointer;">4.3</span>
                                <span class="icn balloon" style="cursor: pointer;">791</span>
                            </div>
                        </div>

                        <div class="price_group">
                            <p class="tag">성인 1인</p>
                            <strong class="price">789,000</strong>
                            <strong class="price">
                                <span>원</span>
                            </strong>

                            <p class="tag child">아동 1인</p>
                            <strong class="price">700,000</strong>
                            <strong class="price">
                                <span>원</span>
                            </strong>
                        </div>
                    </div>
                </div> <!-- ly_wrap prod_brief -->

                <!-- 패키지 상세 상세 정보 start -->
                <div class="ly_wrap prod_detail">
                    <!-- 상세 정보 왼쪽 부분 -->
                    <div class="inr">
                        <!-- 여행 주요일정 -->
                        <div class="cont_unit summary">
                            <div class="text_wrap big top">
                                <strong class="tit">여행 주요일정</strong>
                            </div>
                            <dl>
                                <dt>일정</dt>
                                <dd>
                                    <p class="item_text">
                                        <span class="night_days">3박 5일</span>
                                        <span class="air_name">
                                            <span class="air_img big">
                                                <img src="icn_star.png">
                                            </span>
                                           	 대한항공
                                        </span>
                                    </p>
                                    <p class="item_text air_info">
                                        <span>출발 : 2022.12.16(금) 17:20 &emsp;->&emsp;</span>
                                        <span>2022.12.16(금) 21:20</span>
                                        <span class="air_serial">KEO061</span>
                                        <span class="air_timeTaken">총 6시간 50분 소요</span>
                                    </p>
                                    <p class="item_text air_info">
                                        <span>도착 : 2022.12.16(금) 17:20 &emsp;->&emsp;</span>
                                        <span>2022.12.16(금) 21:20</span>
                                        <span class="air_serial">KEO061</span>
                                        <span class="air_timeTaken">총 6시간 50분 소요</span>
                                    </p>
                                </dd>
                                <dt>여행도시</dt>
                                <dd>방콕</dd>
                                <dt>예약현황</dt>
                                <dd class="state">
                                    <span class="info">예약 : 9명</span>
                                    <span class="info">좌석 : 9석 (최소출발 : 4명)</span>
                                </dd>
                            </dl>
                        </div>

                        <hr class="pkg">

                        <!-- 가격 정보 -->
                        <div class="cont_unit price">
                            <div class="text_wrap big">
                                <strong class="tit">상품가격</strong>
                            </div>
                            <div class="tbl">
                                <table class="type1">
                                    <colgroup>
                                        <col>
                                        <col style="width:35%">
                                        <col style="width:35%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>구분</th>
                                            <th>성인<p class="txt">만 12세 이상</p></th>
                                            <th>아동<p class="txt">만 12세 미만</p></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>기본상품</td>
                                            <td>
                                                <span class="price">789,000</span>
                                                <span>원</span>
                                            </td>
                                            <td>
                                                <span class="price">700,000</span>
                                                <span>원</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="option_wrap"></div>
                        </div>

                        <hr class="pkg">

                        <!-- 가이드 및 미팅 정보 -->
                        <div class="cont_unit">
                            <div class="text_wrap big top">
                                <strong class="tit">가이드 및 미팅정보</strong>
                            </div>
                            <div class="prod_meetinginfo">
                                <dl>
                                    <dt>가이드</dt>
                                    <dd>
                                                                                 김성현 가이드님
                                    </dd>
                                </dl>
                                <div class="meeting_detail">
                                    <div class="text_wrap mid type">
                                        <strong class="tit">미팅정보</strong>
                                    </div>
                                    <dl>
                                        <dt>일시 :</dt>
                                        <dd>12월 16일 오후 14:50</dd>
                                        <dt>장소 :</dt>
                                        <dd>인천공항 제2여객터미널 3층 출국장</dd>
                                    </dl>
                                    <ul class="list_bul billiard">
                                        <li class="em">미팅장소를 꼭 확인하세요!</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- 여행일정 / 호텔 / 상품평 부분 -->
                        <div class="js_tabs js_sticky v-tabs">
                            <!-- 탭 부분 -->
                            <ul id="ulTag" class="tabs">
                                <li id="schedule" style="width:33.3%" class="selected">
                                    <a href="#sticky01" title="현재 페이지">여행일정</a>
                                </li>
                                <li style="width:33.3%">
                                    <a href="#sticky02">호텔</a>
                                </li>
                                <li style="width:33.3%">
                                    <a href="#sticky03">상품평</a>
                                </li>
                            </ul>

                            <!-- 내용 부분 -->
                            <div class="panels prod_info_wrap">
                                <!-- 여행일정 -->
                                <div id="sticky01" class="panel selected">
                                    <div class="cont_unit schedule">
                                        <div class="text_wrap">
                                            <p class="tit exclam em">
                                                <em>여행일정 변경에 관한 사전 동의안내</em>
                                            </p>
                                            <p class="txt">여행일정은 계약체결 시 예상하지 못한 부득이한 사정 등이 발생하는 경우 여행자의 사전동의를 거쳐 변경될 수 있음을 양지하시기 바랍니다.</p>
                                        </div>

                                        <div class="js_acc">
                                            <div class="inr">
                                                <a href="#acc_con0" class="nojq header daylist">
                                                    <span class="tit_left">
                                                        <strong>1일차</strong>12/16(금)
                                                    </span>
                                                    <strong>인천, 방콕</strong>
                                                    <p>태국 입국 절차</p>
                                                </a>
                                                <div id="acc_con0" class="view" style="display: none;">
                                                    <div class="schedule_detail">
                                                        <div class="detail_wrap">
                                                            <div class="detail type">
                                                                <div class="detail_area">
                                                                    <div class="card_mngr">
                                                                        <div class="card_unit type3">
                                                                            <div class="_tit title">
                                                                                <strong class="eps" id="cntntNm">무앙 보란</strong>
                                                                            </div>
                                                                            <div class="tit_comt sub">
                                                                                <p class="eps" id="intcCont">태국의 명소</p>
                                                                            </div>
                                                                            <div class="_info_section cont_box">
                                                                                <div class="_thumb thumb">
                                                                                    <div class="img_list">
                                                                                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/01/22/10000/135cbf56-99fc-4ec3-b6dd-25d4fb717a33.jpg" alt="">
                                                                                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/01/22/10000/135cbf56-99fc-4ec3-b6dd-25d4fb717a33.jpg" alt="">
                                                                                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/01/22/10000/135cbf56-99fc-4ec3-b6dd-25d4fb717a33.jpg" alt="">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="_txt_cont txt_conts">
                                                                                    <div>파타야에 위치한 유람에서는 정갈하고 맛있는 음식과 친절한 서비스가 제공됩니다.

												                                                                                        닭볶음 정식 : 오이, 당근, 고추, 마늘 등의 채소와 샐러드, 나물을 비롯한 각종 반찬과 매콤달콤 닭볶음으로 든든하게 즐기는 한식
												                                                                                        
												                                                                                        ※ 아이들을 위한 키즈밀(돈까스, 생선까스, 떡갈비 정식 메뉴) 준비 가능합니다. 단, 키즈밀을 원하실 경우 하루 전날까지 담당 가이드에게 말씀해주시기 바랍니다.</div>
                                                                                </div>
                                                                                <hr class="line_white">
                                                                            </div>
                                                                        </div>
                                                                    </div><!-- card_mngr -->
                                                                </div><!-- detail_area -->
                                                            </div><!-- detail type -->
                                                        </div><!-- detail_wrap -->
                                                    </div><!-- schedule_detail -->
                                                    <div class="detail_area">
                                                        <div class="js_acc"></div>
                                                        <div class="additional_area">
                                                            <span class="tit food">식사</span>
                                                            <div class="list_txt">
                                                                <span>[조식]<span> 호텔식</span></span>
                                                                <span>[중식]<span> 호텔식</span></span>
                                                                <span>[석식]<span> 호텔식</span></span>
                                                            </div>
                                                        </div>
                                                    </div><!-- detail_area" -->
                                                </div><!-- acc_con -->
                                            </div><!-- inr -->

                                            <div class="inr">
                                                <a href="#acc_con1" class="nojq header daylist">
                                                    <span class="tit_left">
                                                        <strong>2일차</strong>12/17(금)
                                                    </span>
                                                    <strong>인천, 방콕</strong>
                                                    <p>태국 입국 절차</p>
                                                </a>
                                                <div id="acc_con1" class="view" style="display: none;">
                                                    <div class="schedule_detail">
                                                        <div class="detail_wrap">
                                                            <div class="detail type">
                                                                <div class="detail_area">
                                                                    <div class="card_mngr">
                                                                        <div class="card_unit type3">
                                                                            <div class="_tit title">
                                                                                <strong class="eps" id="cntntNm">무앙 보란</strong>
                                                                            </div>
                                                                            <div class="tit_comt sub">
                                                                                <p class="eps" id="intcCont">태국의 명소</p>
                                                                            </div>
                                                                            <div class="_info_section cont_box">
                                                                                <div class="_thumb thumb">
                                                                                    <div class="img_list">
                                                                                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/01/22/10000/135cbf56-99fc-4ec3-b6dd-25d4fb717a33.jpg" alt="">
                                                                                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/01/22/10000/135cbf56-99fc-4ec3-b6dd-25d4fb717a33.jpg" alt="">
                                                                                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/01/22/10000/135cbf56-99fc-4ec3-b6dd-25d4fb717a33.jpg" alt="">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="_txt_cont txt_conts">
                                                                                    <div>파타야에 위치한 유람에서는 정갈하고 맛있는 음식과 친절한 서비스가 제공됩니다.

												                                                                                        닭볶음 정식 : 오이, 당근, 고추, 마늘 등의 채소와 샐러드, 나물을 비롯한 각종 반찬과 매콤달콤 닭볶음으로 든든하게 즐기는 한식
												                                                                                        
												                                                                                        ※ 아이들을 위한 키즈밀(돈까스, 생선까스, 떡갈비 정식 메뉴) 준비 가능합니다. 단, 키즈밀을 원하실 경우 하루 전날까지 담당 가이드에게 말씀해주시기 바랍니다.</div>
                                                                                </div>
                                                                                <hr class="line_white">
                                                                            </div>
                                                                        </div>
                                                                    </div><!-- card_mngr -->
                                                                </div><!-- detail_area -->
                                                            </div><!-- detail type -->
                                                        </div><!-- detail_wrap -->
                                                    </div><!-- schedule_detail -->
                                                    <div class="detail_area">
                                                        <div class="js_acc"></div>
                                                        <div class="additional_area">
                                                            <span class="tit food">식사</span>
                                                            <div class="list_txt">
                                                                <span>[조식]<span> 호텔식</span></span>
                                                                <span>[중식]<span> 호텔식</span></span>
                                                                <span>[석식]<span> 호텔식</span></span>
                                                            </div>
                                                        </div>
                                                    </div><!-- detail_area" -->
                                                </div><!-- acc_con -->
                                            </div><!-- inr -->
                                        </div><!-- js_acc -->
                                    </div><!-- cont_unit schedule -->
                                </div><!-- sticky01 -->

                                <!-- 호텔 -->
                                <div id="sticky02" class="panel">
                                    <div class="cont_unit tour">
                                        <div class="js_tabs type1 v-tabs">
                                            <div class="panels">
                                                <div id="tour01" class="panelh selected">
                                                    <div class="js_tabs hotel v-tabs">
                                                        <div class="panels">
                                                            <div id="hotel01" class="panelh selected">
                                                                <div class="hotel_detail_wrap">
                                                                    <div class="hotel_info">
                                                                        <div class="img_box">
                                                                            <img src="package_beijing31001_1.jpg">
                                                                        </div>
                                                                        <div class="info">
                                                                            <div class="text_wrap">
                                                                                <strong class="tit">호텔 이름</strong>
                                                                                <span>호텔 영어이름</span>
                                                                            </div>
                                                                            <p class="txt"></p>
                                                                        </div>
                                                                    </div><!-- hotel_info -->
                                                                    <div class="tbl">
                                                                        <div class="text_wrap mid">
                                                                            <strong class="tit">기본정보</strong>
                                                                        </div>
                                                                        <table class="type2">
                                                                            <colgroup>
                                                                                <col style="width: 15%">
                                                                                <col style="width: 32%">
                                                                                <col style="width: 15%">
                                                                                <col>
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th>도시</th>
                                                                                    <td>태국, 파타야</td>
                                                                                    <th>주소</th>
                                                                                    <td>우리집</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>연락처</th>
                                                                                    <td>010-1111-1111</td>
                                                                                    <th>등급</th>
                                                                                    <td>5성급</td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div><!-- tbl -->
                                                                    <div class="tbl">
                                                                        <div class="text_wrap mid">
                                                                            <strong class="tit">부대시설</strong>
                                                                        </div>
                                                                        <table class="type2">
                                                                            <colgroup>
                                                                                <col style="width: 15%">
                                                                                <col style="width: 32%">
                                                                                <col style="width: 15%">
                                                                                <col>
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th>부대시설</th>
                                                                                    <td class="vtop" colspan="3">
                                                                                        <ul class="service_list">
                                                                                            <li style="white-space: pre-line;">- 레스토랑
                                                                                                - 야외수영장
                                                                                                - 피트니스시설
                                                                                                - 세탁서비스
                                                                                                - 엘리베이터
                                                                                                - 테라스
                                                                                                - 와이파이
                                                                                            </li>
                                                                                        </ul>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div><!-- hotel_detail_wrap -->
                                                            </div>
                                                        </div><!-- panels -->

                                                        <div class="panels">
                                                            <div id="hotel01" class="panelh selected">
                                                                <div class="hotel_detail_wrap">
                                                                    <div class="hotel_info">
                                                                        <div class="img_box">
                                                                            <img src="package_beijing31001_1.jpg">
                                                                        </div>
                                                                        <div class="info">
                                                                            <div class="text_wrap">
                                                                                <strong class="tit">호텔 이름</strong>
                                                                                <span>호텔 영어이름</span>
                                                                            </div>
                                                                            <p class="txt"></p>
                                                                        </div>
                                                                    </div><!-- hotel_info -->
                                                                    <div class="tbl">
                                                                        <div class="text_wrap mid">
                                                                            <strong class="tit">기본정보</strong>
                                                                        </div>
                                                                        <table class="type2">
                                                                            <colgroup>
                                                                                <col style="width: 15%">
                                                                                <col style="width: 32%">
                                                                                <col style="width: 15%">
                                                                                <col>
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th>도시</th>
                                                                                    <td>태국, 파타야</td>
                                                                                    <th>주소</th>
                                                                                    <td>우리집</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>연락처</th>
                                                                                    <td>010-1111-1111</td>
                                                                                    <th>등급</th>
                                                                                    <td>5성급</td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div><!-- tbl -->
                                                                    <div class="tbl">
                                                                        <div class="text_wrap mid">
                                                                            <strong class="tit">부대시설</strong>
                                                                        </div>
                                                                        <table class="type2">
                                                                            <colgroup>
                                                                                <col style="width: 15%">
                                                                                <col style="width: 32%">
                                                                                <col style="width: 15%">
                                                                                <col>
                                                                            </colgroup>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th>부대시설</th>
                                                                                    <td class="vtop" colspan="3">
                                                                                        <ul class="service_list">
                                                                                            <li style="white-space: pre-line;">- 레스토랑
                                                                                                - 야외수영장
                                                                                                - 피트니스시설
                                                                                                - 세탁서비스
                                                                                                - 엘리베이터
                                                                                                - 테라스
                                                                                                - 와이파이
                                                                                            </li>
                                                                                        </ul>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div><!-- hotel_detail_wrap -->
                                                            </div>
                                                        </div><!-- panels -->
                                                    </div><!-- js_tabs hotel v-tabs -->
                                                </div><!-- panelh selected -->
                                            </div><!-- panels -->
                                        </div><!-- js_tabs type1 v-tabs -->
                                    </div><!-- cont_unit tour -->
                                </div><!-- sticky02 -->

                                <!-- 상품평 -->
                                <div id="sticky03" class="panel">
                                    <div class="cont_unit review">
                                        <div class="review_wrap">
                                            <div class="js_tabs type1 v-tabs">
                                                <div class="panels">
                                                    <div id="review01" class="panelh selected">
                                                        <ul class="list_review">
                                                            <li>
                                                                <div class="inr review_area">
                                                                    <div class="option_wrap">
                                                                        <span class="wrap_star pink">
                                                                            <span class="star_value" style="width: 50%;"></span>
                                                                        </span>
                                                                        <strong class="grade"><em class="num">4.6</em></strong>
                                                                        <div class="right_cont list_txt">
                                                                            <span>김철수</span>
                                                                            <span>2022.11.13</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="item_group">
                                                                        <p class="item_text">
                                                                            <strong>상품명</strong>
                                                                            <span>[출발확정] 방콕/파타야 5일 #가볍게떠나는여행 #4명이상출발확정 #무앙보란 #산호섬 #농눅빌리지</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="review_cont">
                                                                        <div class="content" stype="white-space:pre-line;">
											                                                                            저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>

                                                            <li>
                                                                <div class="inr review_area">
                                                                    <div class="option_wrap">
                                                                        <span class="wrap_star pink">
                                                                            <span class="star_value" style="width: 50%;"></span>
                                                                        </span>
                                                                        <strong class="grade"><em class="num">4.6</em></strong>
                                                                        <div class="right_cont list_txt">
                                                                            <span>김철수</span>
                                                                            <span>2022.11.13</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="item_group">
                                                                        <p class="item_text">
                                                                            <strong>상품명</strong>
                                                                            <span>[출발확정] 방콕/파타야 5일 #가볍게떠나는여행 #4명이상출발확정 #무앙보란 #산호섬 #농눅빌리지</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="review_cont">
                                                                        <div class="content" stype="white-space:pre-line;">
											                                                                            저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요저렴한 비용으로 재미있게 잘 다녀왔어요.
											                                                                            다음에 또 가고 싶어요
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul><!-- list_review -->

                                                        <!-- 페이지 네비게이션 -->
                                                        <div class="paginate_wrap">
                                                            <div class="paginate">
                                                                <div>
                                                                    <a href="#none" class="direction prev">이전</a>
                                                                    <span>
                                                                        <strong>11</strong>
                                                                        <a href="#none">12</a>
                                                                        <a href="#none">13</a>
                                                                        <a href="#none">14</a>
                                                                        <a href="#none">15</a>
                                                                        <a href="#none">16</a>
                                                                        <a href="#none">17</a>
                                                                        <a href="#none">18</a>
                                                                        <a href="#none">19</a>
                                                                        <a href="#none">20</a>
                                                                    </span>
                                                                    <a href="#none" class="direction next">다음</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- js_tabs type1 v-tabs -->
                                        </div><!-- review_wrap -->
                                    </div><!-- cont_unit review -->
                                </div><!-- sticky03 -->
                            </div><!-- panels prod_info_wrap -->
                        </div><!-- js_tabs js_sticky v-tabs -->
                    </div><!-- inr -->

                    <!-- 상세 정보 오른쪽 부분 -->
                    <div class="inr right">
                        <div class="text_wrap big">
                            <strong class="tit">인원선택</strong>
                        </div>

                        <div class="cont_unit js_sticky" style="right: auto; left: 0px;">
                            <div class="member_count">
                                <ul>
                                    <li>
                                        <p class="tit">
                                            <span class="txt">성인</span>
                                            <span class="price">200,000원</span>
                                        </p>
                                        <span class="num_count_group">
                                            <button class="btn_decrement down"></button>
                                            <span class="inpt_counter adultCnt"></span>
                                            <button class="btn_increment up"></button>
                                        </span>
                                    </li>
                                    <li>
                                        <p class="tit">
                                            <span class="txt">아동</span>
                                            <span class="price">100,000원</span>
                                        </p>
                                        <span class="num_count_group">
                                            <button class="btn_decrement down"></button>
                                            <span class="inpt_counter childCnt"></span>
                                            <button class="btn_increment up"></button>
                                        </span>
                                    </li>
                                </ul>
                            </div>

                            <div class="cont_wrap">
                                <hr class="pkg">
                                <div class="total_pay_price">
                                    <div class="row final">
                                        <p class="tit">총 금액</p>
                                        <p class="con"></p>
                                    </div>
                                </div>
                                <hr class="pkg">
                                <div class="cont_unit foot">
                                    <div class="btn_wrap">
                                        <button class="btn-rv">예약</button>
                                        <button class="btn-like">
                                            <span class="btn-like-span">favorite</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- inr right -->
                </div> <!-- prod_detail -->
            </div> <!-- pk_inr wide -->
        </div> <!-- pk_contents -->
    </div> <!-- pk_container -->
        
    <script>
        $(function() {

            /* 인원 수 버튼 증감 및 총 금액 부분의 합계 script 부분 */

                // 어른 / 아동 인원수
            let adultCnt = $('.adultCnt');
            let childCnt = $('.childCnt');

                // 업 버튼 / 다운 버튼
            let up = $('.up');
            let down = $('.down');

                // 성인 가격 / 아동 가격 (서버에서 받아와야 함 - 우선 하드코딩)
            let adultPrice = 200000;
            let childPrice = 100000;

                // 총 금액 (기본적으로 성인이 1명 선택되어있기 때문에 시작하자마자 성인 가격을 대입함)
            let totalPrice = adultPrice;
                // 총 금액 객체
            let totalPay = $('.con');

                // 인원 수 기본 설정
            adultCnt.text("1");
            childCnt.text("0");

                // 총 금액 기본 설정 (서버에서 받아와야 함 - 우선 하드코딩)
            totalPay.html(adultPrice+'<em>원</em>');
			
       
            up.on('click', function() {
                // 누른 버튼 구분 (up / down)
                let isUp = $(this).hasClass('up');

                // 클릭 했을 때의 클릭한 부분의 인원 수 (siblings() 를 사용해봄)
                let cnt = Number($(this).siblings('span').text());
                console.log(cnt);

                // 클릭 했을 때의 전체 인원 수 (패키지 상세 인원 제한을 위한 변수)
                let totalCnt = Number(adultCnt.text()) + Number(childCnt.text());

                // 클릭 했을 때 성인 / 아동 구분
                let isAdult = $(this).siblings('span').hasClass('adultCnt');
                console.log(isAdult);

                // 성인 / 아동 , up / down 구분
                if(isAdult && !isUp) {
                    console.log('성인 down');
                } else if(isAdult && isUp) {
                    console.log('성인 up');
                    // 개수 제한 거는 부분.. (패키지 상세의 인원제한)
                    if(totalCnt >= 10) {
                        return;
                    } else {
                        cnt += 1;
                        adultCnt.text(cnt);

                        // 총 금액 설정
                        totalPrice += adultPrice;
                    }
                } else if(!isAdult && !isUp) {
                    console.log("아동 down");
                } else if(!isAdult && isUp){
                    console.log('아동 up');
                    // 개수 제한 거는 부분.. (패키지 상세의 인원제한)
                    if(totalCnt >= 10) {
                        return;
                    } else {
                        cnt += 1;
                        childCnt.text(cnt);

                        // 총 금액 설정
                        totalPrice += childPrice;
                    }
                }

                // 총 금액 부분에 내용 삽입
                totalPay.html(totalPrice+'<em>원</em>');
            });

            down.on('click', function() {
                // 누른 버튼 구분 (up / down)
                let isUp = $(this).hasClass('up');

                // 클릭 했을 때의 인원 수
                let cnt = $(this).siblings('span').text();
                console.log(cnt);

                // 클릭 했을 때 성인 / 아동 구분
                let isAdult = $(this).siblings('span').hasClass('adultCnt');
                console.log(isAdult);

                // 성인 / 아동 , up / down 구분
                if(isAdult && !isUp) {
                    console.log('성인 down');
                    if(cnt <= 1) {
                        return;
                    }
                    else {
                        cnt -= 1;
                        adultCnt.text(cnt);

                        // 총 금액 설정
                        totalPrice -= adultPrice;
                    }
                } else if(isAdult && isUp) {
                    console.log('성인 up');
                } else if(!isAdult && !isUp) {
                    console.log("아동 down");
                    if(cnt <= 0) {
                        return;
                    }
                    else {
                        cnt -= 1;
                        childCnt.text(cnt);

                        // 총 금액 설정
                        totalPrice -= childPrice;
                    }
                } else if(!isAdult && isUp){
                    console.log('아동 up');
                }

                totalPay.html(totalPrice+'<em>원</em>');
            });

            /* 여행일정 / 호텔 / 상품평 tab 및 내용 class 부여 부분 */
            let ulTagLi = $('#ulTag>li'); // li 태그
            let panelDiv = $('div.panels>div.panel'); // div 태그
            ulTagLi.on('click', function(e) {
                e.preventDefault(); // 이벤트를 취소할 때 사용하는 메서드, 클릭 이벤트를 취소하여 페이지 이동을 막을 수 있습니다.
                // li 클랙했을 때 내부 a 태그의 href 속성 값 (sticky들 중 클릭된 부분)
                let stickyId = $(this).children('a').attr('href');
                console.log(stickyId);

                // tab 에 class 부여
                $(ulTagLi).not(this).removeClass('selected');
                $(this).addClass('selected');

                // 내용 에 class 부여
                $(panelDiv).removeClass('selected');
                $(stickyId).addClass('selected');
            });

            /* 여행일정 부분 화살표 및 active class 부여 */
            let daylist = $('.daylist'); // 각 일정의 a태그
            $(daylist).on('click', function(e) {
                e.preventDefault(); // 이벤트를 취소할 때 사용하는 메서드, 클릭 이벤트를 취소하여 페이지 이동을 막을 수 있습니다.
                let viewDiv = $(this).siblings('div.view'); // 안에 있는 내용 div
                
                if(!$(this).hasClass('active')) {
                    $(this).addClass('active');
                    viewDiv.css('display', 'block');
                } else {
                    $(this).removeClass('active');
                    viewDiv.css('display', 'none');
                }
            });

            /* 찜 하트 변경 script 부분 (구글 font-icons 활용) */
            let tmp = false;
            if(!tmp) {
                    $('.btn-like-span').addClass("material-symbols-outlined-empty");
                    tmp = true;
                }

            $('.btn-like').on('click', function() {
                if(!tmp) {
                    $('.btn-like-span').removeClass("material-symbols-outlined-filled");
                    $('.btn-like-span').addClass("material-symbols-outlined-empty");

                    tmp = true;
                } else {
                    $('.btn-like-span').removeClass("material-symbols-outlined-empty");
                    $('.btn-like-span').addClass("material-symbols-outlined-filled");

                    tmp = false;
                }
            }); 
        });
    </script>
</body>
</html>