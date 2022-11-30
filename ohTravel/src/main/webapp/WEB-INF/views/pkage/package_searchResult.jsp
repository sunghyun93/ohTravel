<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- google fonts icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/package_detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/package_searchResult.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/package_clear.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/data_no.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
<div id="pk_container">
        <div class="container">
            <div class="ly_wrap result_wrap">
                <!-- 국가 날짜 출발 부분 -->
                <div class="text_wrap big line">
                        <div class="select_area_wrap">
                            <strong class="tit"><span>${pkgSearch.country }</span></strong>
                        </div>

                        <div class="right_cont">
                            <div class="infomation">인천출발</div>

                            <div class="infomation">${pkgSearch.dates_start_check }</div>
                        </div>
                </div><!-- text_wrap big line -->

                <!-- 필터 부분 -->
                <div class="inr">
                    <div>
                        <div class="form_wrap major"></div>
                        <div class="js_acc multi filter_wrap">
                            <!-- 가격 -->
                            <div class="inr">
                                <a href="#adtAmtCdsDiv" class="header active">가격</a>
                                <div id="adtAmtCdsDiv" class="view" style="display: block;">
                                    <div class="form_wrap">
                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_adtAmtCds200000|400000" class="inpt_checkbox" value="200000|400000">
                                            <label for="chk_adtAmtCds200000|400000" class="label_checkbox">0~40만원</label>
                                        </span>

                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_adtAmtCds400000|600000" class="inpt_checkbox" value="400000|600000">
                                            <label for="chk_adtAmtCds400000|600000" class="label_checkbox">40~60만원</label>
                                        </span>

                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_adtAmtCds600000|800000" class="inpt_checkbox" value="600000|800000">
                                            <label for="chk_adtAmtCds600000|800000" class="label_checkbox">60~80만원</label>
                                        </span>

                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_adtAmtCds800000" class="inpt_checkbox" value="800000">
                                            <label for="chk_adtAmtCds800000" class="label_checkbox">80~만원</label>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- 여행기간 -->
                            <div class="inr">
                                <a href="#trvlDayCntsDiv" class="header active">여행기간</a>
                                <div id="trvlDayCntsDiv" class="view" style="display: block;">
                                    <div class="form_wrap">
                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_trvlDayCnts3" class="inpt_checkbox" value="3"> 
                                            <label for="chk_trvlDayCnts3" class="label_checkbox">3일</label>
                                        </span>

                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_trvlDayCnts4" class="inpt_checkbox" value="4"> 
                                            <label for="chk_trvlDayCnts4" class="label_checkbox">4일</label>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- 출발시간 -->
                            <div class="inr">
                                <a href="#depTmsCdsDiv" class="header active">출발시간</a>
                                <div id="depTmsCdsDiv" class="view" style="display: block;">
                                    <div class="form_wrap">
                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_depTmsCdsAM2" class="inpt_checkbox" value="AM2"> 
                                            <label for="chk_depTmsCdsAM2" class="label_checkbox">05시~12시</label>
                                        </span>
                                        <span class="form_holder text">
                                            <input type="checkbox" id="chk_depTmsCdsPM1" class="inpt_checkbox" value="PM1"> 
                                            <label for="chk_depTmsCdsPM1" class="label_checkbox">12시~18시</label>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- js_acc multi filter_wrap -->
                    </div>
                </div><!-- 필터 부분 inr -->

                <!-- 패키지 상세 상품 부분 -->
                <div class="inr right">
                    <!-- 패키지 상품 정렬 부분 -->
                    <div class="option_wrap result">
                        <span class="count">
                            	${pkgSearch.country } 패키지 ${pkgCnt }개
                        </span>
                        <div class="right_cont">
                        	<c:if test="${pkgCnt > 0 }">
	                            <ul class="list_sort">
	                                <li class="on"><a href="#none">구매순</a></li>
	                                <li class=""><a href="#none">평점순</a></li>
	                                <li class=""><a href="#none">높은 가격순</a></li>
	                                <li class=""><a href="#none">낮은 가격순</a></li>
	                            </ul>
                            </c:if>
                        </div>
                    </div><!-- option_wrap result -->

                    <!-- 상품 패키지 설명부분 및 상세 부분 -->
                  <c:if test="${pkgCnt > 0 }">
                    <div class="prod_list_wrap">
                        <ul class="type">
                        	<c:forEach var="pkageDTORm" items="${pkageDTORmlist }" varStatus="status">
	                            <li>
	                                <div class="inr img">
	                                    <img src="${pkageDTORm.pkage_imageDTOList[0].pkage_img_path }" alt="">
	                                </div>
	
	                                <div class="inr right">
	                                    <div class="tag_group">
	                                        <span class="attr">패키지</span>
	                                    </div>
	                                    <!-- 패키지이름 -->
	                                    <strong class="item_title eps3">${pkageDTORm.pkage_name }</strong>
	                                    <p class="item_text stit">${pkageDTORm.pkage_info }</p>
	                                    <p class="item_text eps2">
	                                        <span class="icn pos">${pkageDTORm.cityDTO.countryDTO.country_name }, ${pkageDTORm.cityDTO.city_name }</span>
	                                    </p>
	                                    <p class="item_text">
	                                    <!-- 패키지에 존재하는 상세 일수(최소/최대) -->
	                                        <span class="icn cal">여행기간 
	                                        <c:if test="${pkageDTORm.days[0] == pkageDTORm.days[1]}">
											${pkageDTORm.days[0] }
											</c:if>
											<c:if test="${pkageDTORm.days[0] != pkageDTORm.days[1]}">
											${pkageDTORm.days[0] }~${pkageDTORm.days[1] }
											</c:if>
	                                                                                          일</span>
	                                    </p>
	                                    <div class="item_group">
	                                        <span class="icn star">${pkageDTORm.pkage_score }</span>
	                                        <span class="icn balloon">56</span>
	                                    </div>
	                                    <div class="price_group">
	                                        <strong class="price">
	                                            ${pkageDTORm.minPrice }
	                                            <span>원~</span>
	                                        </strong>
	                                    </div>
	                                    <div class="btn_wrap">
	                                        <a href="#none" class="btn arrow">판매상품보기</a>
	                                    </div>
	                                </div> <!-- inr right -->
	
	                                <!-- 상품 상세 (실제 상품 부분) -->
	                                <div class="sub_list_wrap" style="display: none;">
	                                    <div class="cont_unit">
	                                        <div class="option_wrap result">
	                                            <span class="count">총 ${pkageDTORm.pkgDetailCnt }개</span>
	                                        </div>
	                                        <div class="prod_list_wrap">
	                                            <ul class="type">
	                                            	<c:forEach var="pkgDetail" items="${pkageDTORm.pkage_detailDTOList }">
		                                                <li data-pkgDetailId="${pkgDetail.pkage_dt_id }">
		                                                    <div class="inr">
		                                                        <div class="tag_group">
		                                                            <span class="attr">${pkgDetail.pkage_dt_thema }</span> 
		                                                        </div>
		                                                        <strong class="item_title eps3">${pkgDetail.pkage_dt_name }</strong>
		                                                        
		                                                        <p class="item_text">
		                                                        	<!-- 해외일 때만 항공정보 불러오기 -->
		                                                       		<c:if test="${not empty pkgDetail.pkage_flightScheDTOList[1]}">
			                                                            <span class="air_name">
			                                                                <span class="air_img">
			                                                                	<!-- (출발)항공 사진 불러오기 -->
			                                                                    <img src="${pkgDetail.pkage_flightScheDTOList[0].air_ScheduleDTORM.airlineDTO.air_picture }">
			                                                                </span>
			                                                                <!-- 출발 항공 불러오기 -->
			                                                                	<c:forEach var="flightScheDTO" items="${pkgDetail.pkage_flightScheDTOList }"> 
			                                                                		<c:if test="${flightScheDTO.pkage_flight_gubun == 0 }">
			                                                                			${flightScheDTO.air_ScheduleDTORM.airlineDTO.air_name }
			                                                                		</c:if>
			                                                                	</c:forEach>,
			                                                            </span>
		                                                            </c:if>
		                                                            <!-- 패키지 인원 - 패키지 예약인원 -->
		                                                            <span>잔여 ${pkgDetail.pkage_dt_cnt-pkgDetail.pkage_dt_Rcnt }석</span>
		                                                        </p>
		                                                        <p class="item_text air_info">
		                                                        	<!-- 출발 / 도착 날짜 적어주기 -->
			                                                            <span>
				                                                            <fmt:formatDate value="${pkgDetail.pkage_dt_startDay }" pattern="yyyy.MM.dd"/>
				                                                            <span>(${pkgDetail.startYoil })</span>
				                                                            &emsp;->&emsp;
			                                                            </span>
			                                                            <span>
			                                                            	<fmt:formatDate value="${pkgDetail.pkage_dt_endDay }" pattern="yyyy.MM.dd"/>
			                                                            	<span>(${pkgDetail.endYoil })</span>
			                                                            </span>
		                                                            <span class="info">${pkgDetail.day-1 }박${pkgDetail.day }일</span>
		                                                        </p>
		                                                        <p class="item_text note">
		                                                            <span class="info">호텔 숙박,</span>
		                                                            <span class="info">
		                                                            	<c:if test="${pkgDetail.pkage_dt_Gname ne null}">가이드 있음</c:if>
		                                                            	<c:if test="${pkgDetail.pkage_dt_Gname eq null}">가이드 없음</c:if>
		                                                            </span>
		                                                        </p>
		                                                    </div>
		                                                    <!-- 가격 / 상세 상품 보기 버튼 -->
		                                                    <div class="inr right">
		                                                        <div class="price_group">
		                                                            <div><strong class="price">${pkgDetail.pkage_dt_Aprice }<span>원</span></strong></div>
		                                                        </div>
		                                                        <div class="btn_wrap">
		                                                            <button type="button" class="btn pkgDetail">상세일정보기</button>
		                                                        </div>
		                                                    </div>
		                                                </li>
	                                                </c:forEach>
	                                            </ul>
	                                        </div>
	                                    </div><!-- cont_unit -->
	                                </div><!-- sub_list_wrap -->
	                            </li>
                            </c:forEach>
                        </ul> <!-- type -->
                    </div> <!-- prod_list_wrap -->

                    <!-- 페이지 네비게이션 부분 -->
                    <!-- <div class="paginate_wrap">
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
                    </div> paginate_wrap -->
				</c:if>
				
				<c:if test="${pkgCnt == 0 }">
                    <!-- 만약 상품이 아예 없을 때 (페이지 네비게이션 display none 으로 만들어라)-->
                    <div class="data_no type">
                        <div class="cont">
                            <strong>검색 결과가 없습니다.</strong> 
                            <span>필터를 변경해보거나, 다른 날짜를 검색해보세요</span>
                        </div>
                    </div>
                </c:if>
                </div><!-- inr right -->
            </div><!-- ly_wrap result_wrap -->
        </div> <!-- pk_contents -->
    </div> <!-- pk_container -->

    <script>

        /* 필터 가격 부분 화살표 및 active class 부여 */
        let daylist = $('.header'); // 각 일정의 a태그
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

        /* 정렬 li 눌렀을 때 on 클래스 부여 및 해제 */
        let liOn = $('.list_sort li');
        $(liOn).on('click', function(e) {
        	e.preventDefault();
            if(!$(this).hasClass('on')) {
                $(liOn).not(this).removeClass('on');
                $(this).addClass('on');
            } 
        })

        /* 상품상세보기 버튼 눌렀을 때 */
        let detailAtag = $('.btn.arrow');
        $(detailAtag).on('click', function(e) {
            e.preventDefault();

            // 버튼을 감싸고 있는 부모 div 의 형제인 상품 상세 박스
            let detailProdBox = $(this).parents('.inr.right').siblings('.sub_list_wrap')
            $(detailProdBox).toggle();
        });

        /* 상세일정보기 버튼 눌렀을 때 (진짜 상품으로 가는 버튼) */
        let pkgDetailBtn = $('.btn.pkgDetail');
        $(pkgDetailBtn).on('click',function() {

        })
    </script>
</body>
</html>