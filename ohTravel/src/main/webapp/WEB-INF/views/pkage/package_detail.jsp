<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                        <%-- 패키지 이미지 --%>
                            <img class="inr_img" src="${pkageDTORM.pkage_imageDTOList[0].pkage_img_path }">
                        </div>
                    </div>

                    <!-- 간단 정보 -->
                    <div class="inr right">
                        <div class="tag_group">
                        <%-- 테마 --%>
                            <span class="tag_thema t_green">${pkageDTORM.pkage_detailDTO.pkage_dt_thema }</span>
                        </div>
                        
                        <div class="text_wrap">
                        <%-- 제목 --%>
                            <strong class="item_title">${pkageDTORM.pkage_detailDTO.pkage_dt_name }</strong>
                        </div>

                        <div class="option_wrap">
                            <div class="dummyDiv"></div>
                            <div class="right_cont">
                            <%-- 패키지 평점 --%>
                                <span class="icn star" style="cursor: pointer;"></span>
                            <%-- 패키지 리뷰 수 --%>
                                <span class="icn balloon" style="cursor: pointer;">${pkageDTORM.reviewCnt }</span>
                            </div>
                        </div>

                        <div class="price_group">
                            <p class="tag">성인 1인</p><%-- 패키지 상세 성인가격 --%>
                            <strong class="price"><fmt:formatNumber value="${pkageDTORM.pkage_detailDTO.pkage_dt_Aprice }" pattern="#,###"/></strong> 
                            <strong class="price">
                                <span>원</span>
                            </strong>

                            <p class="tag child">아동 1인</p><%-- 패키지 상세 아동가격 --%>
                            <strong class="price"><fmt:formatNumber value="${pkageDTORM.pkage_detailDTO.pkage_dt_Cprice }" pattern="#,###"/></strong> 
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
                                	 <%-- 비행 일정(비행기 있는 상세상품) 혹은 일정(비행기 없는 상세상품)--%>
                                    <c:if test="${pkageDTORM.pkage_detailDTO.flightExist == '1' }">
	                                    <p class="item_text">
	                                    	<%-- 상세의 일 수 --%>
	                                        <span class="night_days">${pkageDTORM.pkage_detailDTO.day-1 }박 ${pkageDTORM.pkage_detailDTO.day }일</span>
	                                        <span class="air_name">
	                                            <span class="air_img big">
	                                            	<%-- 항공사 사진 --%>
	                                                <img src="${pkageDTORM.pkage_detailDTO.pkage_flightScheDTOList[0].air_ScheduleDTORM.airlineDTO.air_picture }">
	                                            </span>
	                                            <%-- 항공사 이름 --%>
	                                           	 ${pkageDTORM.pkage_detailDTO.pkage_flightScheDTOList[0].air_ScheduleDTORM.airlineDTO.air_name }
	                                        </span>
	                                    </p>
                                    
	                                    <c:forEach var="pkage_flightScheDTO" items="${pkageDTORM.pkage_detailDTO.pkage_flightScheDTOList}">
	                                    		<c:set var="SorC" value="${pkage_flightScheDTO.pkage_flight_gubun == '0' ? '출발' : '도착' }"/>
	                          		             <p class="item_text air_info">
	                          		             	<%-- 출발 --%>
			                                        <span>${SorC }: 
				                                        <fmt:formatDate value="${pkage_flightScheDTO.air_ScheduleDTORM.start_time }" pattern="yyyy-MM-dd"/>
				                                        (${pkageDTORM.pkage_detailDTO.startYoil }) 
				                                        <fmt:formatDate value="${pkage_flightScheDTO.air_ScheduleDTORM.start_time }" pattern="HH:mm"/>
				                                        &emsp;->&emsp;
			                                        </span>
			                                        <%-- 도착 --%>
			                                        <span>${SorC }: 
			                                        	<fmt:formatDate value="${pkage_flightScheDTO.air_ScheduleDTORM.end_time }" pattern="yyyy-MM-dd"/>
				                                        (${pkageDTORM.pkage_detailDTO.startYoil })  
				                                        <fmt:formatDate value="${pkage_flightScheDTO.air_ScheduleDTORM.end_time }" pattern="HH:mm"/>
			                                        </span>
			                                        <span class="air_serial">${pkage_flightScheDTO.air_ScheduleDTORM.airplane_name }</span>
			                                        <span class="air_timeTaken">총 ${pkage_flightScheDTO.flightHour }시간 ${pkage_flightScheDTO.flightMinute }분 소요</span>
		                                   		 </p>
	                                    </c:forEach>
                                    </c:if>
                                    <%-- 비행 일정 없는 상품들의 일정 --%>
                                    <c:if test="${pkageDTORM.pkage_detailDTO.flightExist == '0' }">
                                    	<p class="item_text">
	                                    	<%-- 상세의 일 수 --%>
	                                        <span class="night_days">${pkageDTORM.pkage_detailDTO.day-1 }박 ${pkageDTORM.pkage_detailDTO.day }일</span>
	                                    </p>

                       		             <p class="item_text air_info">
                       		             	<%-- 출발 --%>
	                                        <span>일정시작: 
		                                        <fmt:formatDate value="${pkageDTORM.pkage_detailDTO.pkage_dt_startDay }" pattern="yyyy-MM-dd"/>
		                                        (${pkageDTORM.pkage_detailDTO.startYoil }) 
	                                        </span><br>
	                                        <%-- 도착 --%>
	                                        <span>일정종료: 
	                                        	<fmt:formatDate value="${pkageDTORM.pkage_detailDTO.pkage_dt_endDay }" pattern="yyyy-MM-dd"/>
		                                        (${pkageDTORM.pkage_detailDTO.endYoil })                                  
	                                        </span>          
                                  		 </p>
                                    </c:if>
                                </dd>
                                <dt>여행도시</dt>
                                <dd>${pkageDTORM.cityDTO.city_name }</dd>
                                <dt>예약현황</dt>
                                <dd class="state"><%-- 패키지 인원 / 예약 인원 / 최소 인원 --%>
                                    <span class="info">예약 : ${pkageDTORM.pkage_detailDTO.pkage_dt_Rcnt }명</span>
                                    <span class="info" id="possibleCnt" data-possibleCnt="${pkageDTORM.pkage_detailDTO.pkage_dt_cnt - pkageDTORM.pkage_detailDTO.pkage_dt_Rcnt }">
                                                                                 잔여좌석 : ${pkageDTORM.pkage_detailDTO.pkage_dt_cnt - pkageDTORM.pkage_detailDTO.pkage_dt_Rcnt }석 (최소출발 : ${pkageDTORM.pkage_detailDTO.pkage_dt_Mcnt }명)
                                    </span>
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
                                            <td><%-- 성인 가격 --%>
                                                <span class="price"><fmt:formatNumber value="${pkageDTORM.pkage_detailDTO.pkage_dt_Aprice }" pattern="#,###"/></span> 
                                                <span>원</span>
                                            </td>
                                            <td><%-- 아동 가격 --%>
                                                <span class="price"><fmt:formatNumber value="${pkageDTORM.pkage_detailDTO.pkage_dt_Cprice }" pattern="#,###"/></span> 
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
                                    <dd><%-- 패키지 상세 가이드 --%>
                                    ${pkageDTORM.pkage_detailDTO.pkage_dt_Gname } 가이드님
                                    </dd>
                                </dl>
                                <div class="meeting_detail">
                                    <div class="text_wrap mid type">
                                        <strong class="tit">미팅정보</strong>
                                    </div>
                                    <dl>
                                        <dt>일시 :</dt><%-- 미팅 일시 --%>
                                        <dd><fmt:formatDate value="${pkageDTORM.pkage_detailDTO.pkage_dt_meetDate }" type="both" dateStyle="full"/></dd>
                                        <dt>장소 :</dt><%-- 미팅 장소 --%>
                                        <dd>${pkageDTORM.pkage_detailDTO.pkage_dt_meet }</dd>
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
                                        	<%-- 여행일정 부분 --%>
                                        	<c:forEach var="pkage_schedulDTO" items="${pkageDTORM.pkage_detailDTO.pkage_schedulDTOList }">
	                                            <div class="inr">
	                                                <a href="#acc_con0" class="nojq header daylist">
	                                                <%-- 여행일정 일차 --%>
	                                                    <span class="tit_left">
	                                                        <strong>${pkage_schedulDTO.pkage_sche_day }일차</strong>
	                                                    </span>
	                                                    <strong>${pkageDTORM.cityDTO.city_name }</strong>
	                                                    <p><%-- 여행 일정의 관광지 부분 --%>
	                                                    	<c:forEach var="pkage_s_dDTO" items="${pkage_schedulDTO.pkage_s_dDTOList }" varStatus="status">
	                                                    		<c:if test="${status.index != 0}">,</c:if>${pkage_s_dDTO.attractionDTO.attr_name }
	                                                    	</c:forEach>
	                                                    </p>
	                                                </a>
	                                                <div id="acc_con0" class="view" style="display: none;">
	                                                    <div class="schedule_detail">
	                                                        <div class="detail_wrap">
	                                                            <div class="detail type">
	                                                                <div class="detail_area">
	                                                                <%-- 여행일정 일차별 내용 부분 --%>
	                                                                	<c:forEach var="pkage_s_dDTO" items="${pkage_schedulDTO.pkage_s_dDTOList }">
		                                                                    <div class="card_mngr">
		                                                                        <div class="card_unit type3">
		                                                                        	<%-- 관광지 이름 --%>
		                                                                            <div class="_tit title">
		                                                                                <strong class="eps" id="cntntNm">${pkage_s_dDTO.attractionDTO.attr_name }</strong>
		                                                                            </div>
		                                                                            <%-- 관광지 영어이름 --%>
		                                                                            <div class="tit_comt sub">
		                                                                                <p class="eps" id="intcCont">${pkage_s_dDTO.attractionDTO.attr_ename }</p>
		                                                                            </div>
		                                                                            <div class="_info_section cont_box">
		                                                                                <div class="_thumb thumb">
		                                                                                    <div class="img_list">
		                                                                                    	<%-- 관광지 사진  --%>
		                                                                                    	<c:forEach var="attr_img_DTO" items="${pkage_s_dDTO.attractionDTO.attr_img_DTOList }">
		                                                                                        	<img src="${attr_img_DTO.attr_img_path }" alt="">                                                                             
		                                                                                        </c:forEach>
		                                                                                    </div>
		                                                                                </div>
		                                                                                <%-- 관광지 정보 --%>
		                                                                                <div class="_txt_cont txt_conts">
		                                                                                    <div>${pkage_s_dDTO.attractionDTO.attr_info }</div>
		                                                                                </div>
		                                                                                <hr class="line_white">
		                                                                            </div>
		                                                                        </div>
		                                                                    </div><!-- card_mngr -->
	                                                                    </c:forEach>
	                                                                    
	                                                                    
	                                                                </div><!-- detail_area -->
	                                                            </div><!-- detail type -->
	                                                        </div><!-- detail_wrap -->
	                                                    </div><!-- schedule_detail -->
	                                                    <div class="detail_area">
	                                                        <div class="js_acc"></div>
	                                                        <div class="additional_area">
	                                                            <span class="tit food">식사</span>
	                                                            <%-- 일차별 식사 --%>
	                                                            <div class="list_txt">
	                                                                <span>[조식]<span> ${pkage_schedulDTO.pkage_sche_b }</span></span>
	                                                                <span>[중식]<span> ${pkage_schedulDTO.pkage_sche_l }</span></span>
	                                                                <span>[석식]<span> ${pkage_schedulDTO.pkage_sche_d }</span></span>
	                                                            </div>
	                                                        </div>
	                                                    </div><!-- detail_area" -->
	                                                </div><!-- acc_con -->
	                                            </div><!-- inr -->
											</c:forEach>
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
                                                    <%-- 호텔부분 --%>
                                                    	<c:forEach var="pkage_hotelDTO" items="${pkageDTORM.pkage_detailDTO.pkage_hotelDTOList }">
	                                                        <div class="panels">
	                                                            <div id="hotel01" class="panelh selected">
	                                                                <div class="hotel_detail_wrap">
	                                                                    <div class="hotel_info">
	                                                                        <div class="img_box">
	                                                                        <%-- 호텔 이미지 해야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --%>     	
	                                                                            <img src="${pkage_hotelDTO.hotelDTO.hotel_imageDTO.h_img_path }">
	                                                                        </div>
	                                                                        <div class="info">
	                                                                            <div class="text_wrap">
	                                                                            <%-- 호텔 이름 / 영어 이름 --%>
	                                                                                <strong class="tit">${pkage_hotelDTO.hotelDTO.hotel_kor }</strong>
	                                                                                <span>${pkage_hotelDTO.hotelDTO.hotel_eng }</span>
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
	                                                                                    <th>주소</th>
	                                                                                    <td>${pkage_hotelDTO.hotelDTO.hotel_loc }</td>
	                                                                                    <th>타입</th>
	                                                                                    <td>${pkage_hotelDTO.hotelDTO.hotel_loc }</td>
	                                                                                </tr>
	                                                                                <tr>
	                                                                                    <th>연락처</th>
	                                                                                    <td>${pkage_hotelDTO.hotelDTO.hotel_tel }</td>
	                                                                                    <th>유형</th>
	                                                                                    <td>${pkage_hotelDTO.hotelDTO.hotel_type }</td>
	                                                                                </tr>
	                                                                            </tbody>
	                                                                        </table>
	                                                                    </div><!-- tbl -->
	                                                                    <%-- 호텔 부대시설 해야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --%>
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
	                                                                                    <th>부대시설 & 편의시설</th>
	                                                                                    <td class="vtop" colspan="3">
	                                                                                        <ul class="service_list">
	                                                                                            <li style="white-space: pre-line;">
	                                                                                            <%-- 부대시설 --%>
	                                                                                            	<c:forEach var="hotel_optionDTO" items="${pkage_hotelDTO.hotelDTO.hotel_optionDTOList }">
	                                                                                            		-${hotel_optionDTO.hotel_option }
	                                                                                            	</c:forEach>
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
														</c:forEach>
                                                        
                                                    </div><!-- js_tabs hotel v-tabs -->
                                                </div><!-- panelh selected -->
                                            </div><!-- panels -->
                                        </div><!-- js_tabs type1 v-tabs -->
                                    </div><!-- cont_unit tour -->
                                </div><!-- sticky02 -->
                                
                                <!-- 리뷰 모달 (있어야할 위치는 상관없습니다..)-->
								<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="modalLongTitle">리뷰 작성</h5>
								        <button type="button" class="close" data-dismiss="modal" onclick="closeModal()" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      
								      <div class="modal-body">
								      	<span class="star">
									      	 ★★★★★
									      	 <span>★★★★★</span>
						 					 <input type="range" oninput="drawStar()" id="starRate" value="1" step="1" min="0" max="10">
										</span>
								      	
							        	<div class="form-group">
								            <label for="message-text" class="col-form-label">내용:</label>
								            <textarea class="form-control" id="review-text"></textarea>
							         	</div>
								      </div>
								      
								      <div class="modal-footer">
								        <button type="button" class="btn btn-primary" onclick="registerReview()">리뷰 등록</button>
								        <button type="button" class="btn btn-secondary" onclick="closeModal()" data-dismiss="modal">취소</button>
								      </div>
								    </div>
								  </div>
								</div> <!-- 리뷰 모달 끝 -->

                                <!-- 상품평 -->
                                <div id="sticky03" class="panel">
	                                <div class="rv_btn">
	                                <c:if test="${sessionScope.res eq null }">
	                                	<span style="font-size : 9pt;">로그인 후 리뷰를 등록할 수 있습니다.</span><br>
	                                	<a href="/member/loginForm" style="color:black; text-decoration:underline;">
	                                		<button type="button" class="genric-btn info radius small">로그인 하러 가기</button>
                                		</a>
	                                </c:if>
	                                <c:if test="${sessionScope.res ne null }">
										<button class="genric-btn primary ela" data-toggle="modal" onclick="openModal()" data-target="#reviewModal">리뷰 등록</button>
									</c:if>
									</div>
                                    <div class="cont_unit review">
                                        <div class="review_wrap">
                                            <div class="js_tabs type1 v-tabs">
                                                <div class="panels">
                                                    <div id="review01" class="panelh selected">
                                                        <ul class="list_review" data-pkgDetailId="${pkageDTORM.pkage_id }">
                                                            
                                                        </ul><!-- list_review -->

                                                        <!-- 페이지 네비게이션 -->
                                                        <nav class="review-pagination blog-pagination justify-content-center d-flex">
													    	<!-- 페이징 처리 들어갈 위치 -->
								                           <ul class="pagination" id="reviewPaginationUl">
								                               
								                           </ul>
								                       </nav>
                                                        
                                                    </div> <!-- review01 -->
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
                                            <span class="price Aprice" data-Aprice="${pkageDTORM.pkage_detailDTO.pkage_dt_Aprice }"><fmt:formatNumber value="${pkageDTORM.pkage_detailDTO.pkage_dt_Aprice }" pattern="#,###"/>원</span>
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
                                            <span class="price Cprice" data-Cprice="${pkageDTORM.pkage_detailDTO.pkage_dt_Cprice }"><fmt:formatNumber value="${pkageDTORM.pkage_detailDTO.pkage_dt_Cprice }" pattern="#,###"/>원</span>
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
                                        <button id="reservBtn" class="btn-rv">예약</button>
                                        <!-- <button class="btn-like">
                                            <span class="btn-like-span">favorite</span>
                                        </button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- inr right -->
                </div> <!-- prod_detail -->
            </div> <!-- pk_inr wide -->
        </div> <!-- pk_contents -->
    </div> <!-- pk_container -->
	
	<div style="">
	    <form id="pkgReserveForm" name="pkgReserveForm">
	    </form>
    </div>
        
    <script>
    	let possibleCnt = Number($('#possibleCnt').attr('data-possibleCnt')); /* 예약 가능 인원  */
    	alert("${sessionScope.res.mem_id}")
        $(function() {
        	/* 페이지 읽고 바로 리뷰 리스트 뿌려주기 */
        	getReviewList();

            /* 인원 수 버튼 증감 및 총 금액 부분의 합계 script 부분 */

                // 어른 / 아동 인원수
            let adultCnt = $('.adultCnt');
            let childCnt = $('.childCnt');

                // 업 버튼 / 다운 버튼
            let up = $('.up');
            let down = $('.down');

                // 성인 가격 / 아동 가격 (서버에서 받아와야 함 - 우선 하드코딩)
            let adultPrice = Number($('.Aprice').attr("data-Aprice"));
            let childPrice = Number($('.Cprice').attr("data-Cprice"));

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
                    if(totalCnt >= possibleCnt) {
                    	alert("예약 가능 인원을 초과하여 예약할 수 없습니다.");
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
                    if(totalCnt >= possibleCnt) {
                    	alert("예약 가능 인원을 초과하여 예약할 수 없습니다.");
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
            
            /* 예약 버튼 부분 */
            $('#reservBtn').on('click', function() {
            	// 로그인 확인
            	$.ajax({
            		url : '/pkageRest/loginCheck',
            		type : 'get',
            		dataType : 'text',
            		success : function(data) {
            			console.log(data);
            			let aCnt = adultCnt.text();
        				let cCnt = childCnt.text();
        				
            			if(data == 'LOGIN_OK') {
            				/* form 에 보낼 데이터와 함께 input 태그 추가해주고 서버로 전송 */
            				makeForm($('#pkgReserveForm'), aCnt, cCnt)
            				$('#pkgReserveForm').attr('action', '/pkage/reservation');
            				$('#pkgReserveForm').attr('method', 'get');
            				$('#pkgReserveForm').submit();
            			}
            			else {
            				alert("로그인 하고 예약해주세요.");
            			}
            		}, 
            		error : function(err) {
            			console.log(err)
            		}
            	})
            	
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
        });
        
        /* 리뷰 */
        // 선택한 리뷰 아이디에 대한 전역변수 설정
		let selectedRvId; // 리뷰의 ID (각 상품의 번호(rv_real_id)가 아님)

        //리뷰 등록과 수정이 같은 [리뷰 등록] 버튼을 사용하기 때문에,
		//rv_id 값의 유무에 따라 작동해야하는 함수가 달라져야함
		//rv_id 값이 이미 있으면 : 수정 / 없다면 : 새로 등록
		function registerReview() {
			
			if(!selectedRvId) {
				writeReview()
			} else {
				updateReview()
			}
			
		}
        
		//[수정] 버튼을 클릭한 해당 행의 review 정보를 모두 가져와야함
		function openUpdateModal(target){
			
			let targetTr =  $(target).closest('li')
			// 수정할 리뷰가 있다면, 해당 행의 hidden값 rv_id값을 가져옴
			selectedRvId = targetTr.find('.rv_id').val();
			
			// 별점이 작성자가 등록한 별점대로 보여야함 (DB에는 5가 max값이므로 별 표시가 제대로 되려면 *2)
			let currentValue = Number(targetTr.find('.rv_rating').text()) * 2
			$('#starRate').val(currentValue)
			drawStar();
			
			// 내용도 작성자가 등록한 내용으로 불러와야한다.
			let currentContents = targetTr.find('.rv_contents').text()
			$('#review-text').val(currentContents)
			
			// 모달창을 open
			$('#reviewModal').modal('show')
		}
		
		// 리뷰 조회 ajax
		// 처음 Detail 페이지에 들어왔을 때 DB review테이블의 데이터를 가져와서 뿌림
		// 가져올 데이터는 해당 Detail 페이지의 []_id에 해당하는 값들
		function getReviewList(){
			
			// 각자의 상품 Id값 변수 선언을 이쪽에서
			let pkageId = '${pkageDTORM.pkage_id}'
			console.log(pkageId);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/review/reviewList",
				data:{
					// 리뷰 테이블의 해당 상품id값을 읽어오는 부분
					rv_real_id : pkageId,
					currentPage : currentPage
				},
				type:"get",
				dataType:"json",
				success: function(result) {
					
					// 가지고온 리뷰 데이터들을 포함해 화면 랜더링 함수 호출
					makeReviewTable(result.reviewList);
					console.log(result.avgScore);
					$('.right_cont .icn.star').text(result.avgScore);
					//페이징 처리
					makePaginationLi(result.page);
				},
				error: function(err) {
					console.log(err);
				}
			});
		}

		// 리뷰 조회 -- 랜더링 함수1 (append)
		function makeReviewTable(data) {
			
			let targetDiv = $('.list_review');
			
			targetDiv.html('')
			
			let innerHtml = '';
			
			for(let datum of data) {
				innerHtml += makeRow(datum)
			}
			
			targetDiv.append(innerHtml);
		}

		// 리뷰 조회 -- 랜더링 함수2 (진짜 구조 그려줌)
		function makeRow(datum) {
			let mem_id = datum.mem_id

			let innerHtml = '<li>'
				innerHtml += '<input type="hidden" class="rv_id" value="'+datum.rv_id +'">'
				innerHtml += '<div class="inr review_area">'
				innerHtml +=    '<div class="option_wrap">'
				innerHtml +=        '<span class="wrap_star pink">'
				innerHtml +=            '<span class="star_value" style="width: '+datum.rv_percent+'%;"></span>'
				innerHtml +=        '</span>'
				innerHtml +=        '<strong class="grade"><em class="num"><span class="rv_rating">'+datum.rv_rating+'</span></em></strong>'
				innerHtml +=        '<div class="right_cont list_txt">'
				innerHtml +=            '<span>'+datum.mem_id+'</span>'
				innerHtml +=            '<span>'+datum.rv_date+'</span>'
										if(mem_id == "${sessionScope.res.mem_id}") {
				innerHtml +=            '<button type="button" class="rv_modify genric-btn info radius" onclick="openUpdateModal(this)">수정</button>'
				innerHtml +=        	'<button type="button" class="rv_delete genric-btn info radius" onclick="deleteReview(this)">삭제</button>'					
										}
				innerHtml +=        '</div>'
				innerHtml +=    '</div>'
				innerHtml +=    '<div class="item_group">'
				innerHtml +=        '<p class="item_text">'
				innerHtml +=            '<strong>상품명</strong>'
				innerHtml +=            '<span>${pkageDTORM.pkage_name}</span>'
				innerHtml +=        '</p>'
				innerHtml +=    '</div>'
				innerHtml +=    '<div class="review_cont">'
				innerHtml +=        '<div class="content rv_contents" stype="white-space:pre-line;">'+datum.rv_contents+'</div>' 
				innerHtml +=   	'</div>'
				innerHtml += '</div>'
				innerHtml +='</li>'
			return innerHtml;
		}

		// 리뷰 등록 ajax
		function writeReview(){
			
			// 유효성 검사
			if(!valid_chk()){
				return false;
			}
			
			// 가져가야할 data : 작성자 mem_id, rv_rating(별점), rv_contents(리뷰 내용), 
			//				  rv_date (작성시점 : ReviewServiceImpl에서 해결), rv_real_id(상품id값)
			
			let sendData = {
				//TODO:나중에 세션?에 있는 정보로 읽어와야함
				mem_id: '${sessionScope.sessionId}',
				rv_rating: ($('#starRate').val())/2, // starRate에서 10에 해당하는 값이 별점 5점이기 때문에 /2
				rv_contents: $('#review-text').val(),
				// 상품마다 rv_real_id값을 바꿔줘야함
				rv_real_id: '${pkageDTORM.pkage_id }'
			}
			
			
			$.ajax({
				url:"${pageContext.request.contextPath }/review/writeReview",
				data: sendData,
				type:'post',
				success: function(result) {
					// insert 성공시, 성공 알림
					if(result == "SUCCESS"){
						alert("리뷰가 등록되었습니다.")
					} else {
					// insert 실패하면 실패 alert
						alert("등록이 실패하였습니다.")
					}
					
					//모달창 닫기
					$('#reviewModal').modal('hide');
					//랜더링 함수 호출
					getReviewList();
					
				}
			});
		}


		// 리뷰 수정 ajax
		function updateReview(){
			
			// 유효성 검사
			if(!valid_chk()){
				return false;
			}
			
			let sendData = {
				rv_id : selectedRvId,
				mem_id : '${sessionScope.sessionId}',
				rv_rating : ($('#starRate').val())/2,
				rv_contents : $('#review-text').val(),
				// 상품마다 rv_real_id값을 바꿔줘야함
				rv_real_id : '${pkageDTORM.pkage_id}'
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath }/review/updateReview",
				data: sendData,
				type:'post',
				success: function(result){
					// update 성공하면 성공 alert
					if(result == "SUCCESS"){
						alert("리뷰가 수정되었습니다.")
					} else {
					// update 실패하면 실패 alert
						alert("수정에 실패하였습니다.")
					}
					
					//모달창 닫기
					$('#reviewModal').modal('hide');
					//랜더링 함수 호출
					getReviewList();
				}
			});
		}


		// [삭제] 버튼을 클릭한 해당 행의 review 정보를 가져와서 삭제
		function deleteReview(target){
			let targetTr =  $(target).closest('li')
			// 삭제할 리뷰 행의 hidden값 rv_id값을 가져옴
			selectedRvId = targetTr.find('.rv_id').val();
			
			if(!confirm("해당 리뷰를 삭제하시겠습니까?")){
				alert("삭제가 취소되었습니다.")
			} else {
				$.ajax({
					
					url:"${pageContext.request.contextPath }/review/deleteReview",
					data:{	
						rv_id : selectedRvId,
						rv_real_id : '${pkageDTORM.pkage_id}'				
					},
					type: 'post',
					success: function(result){
						alert("리뷰가 삭제되었습니다.")
						//랜더링 함수 호출
						getReviewList();
					},
					error : function (err) {
						console.error(err)
					}	
				});
			}
		}
		
		/* 예약 버튼 클릭 시 예약 form 안에 요소들 만드는 함수 */
		function makeForm(reserveform, adultCnt, childCnt) {
			
			form = reserveform;

			tmp = '';	
			tmp += "<input type='text' name='pkage_id' value='${pkageDTORM.pkage_id}'>"
			tmp += '<input type="text" name="pkage_dt_id" value="${pkageDTORM.pkage_detailDTO.pkage_dt_id}">'
			tmp += '<input type="text" name="adultCnt" value="'+adultCnt+'">'
			tmp += '<input type="text" name="childCnt" value="'+childCnt+'">'
			
			form.html(tmp);
		}
     	
    </script>
    <script src="/js/pkage/review.js"></script>
</body>
</html>