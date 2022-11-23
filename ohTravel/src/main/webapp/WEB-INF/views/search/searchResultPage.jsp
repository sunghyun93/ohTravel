<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search/searchResult.css">
</head>
<body>
<div class="container">
  <div class="inr">
    <div class="contents">
      <div class="text_wrap big line type top">
        <strong class="tit">
          <em>"${search_word}"</em> 검색결과
        </strong>
      </div>
      <div class="related_search">
        <strong class="tit">연관검색어</strong>
        <ul>
          <li>
            <a href="#">도쿄</a>
          </li>
          <li>
            <a href="#">오사카</a>
          </li>
        </ul>
      </div>
      <div class="js_tabs type1 no_division">
        <ul class="tabs sort">
          <li class="item01">
            <a href="#none">전체</a>
          </li>
          <li class="item02">
            <a href="#none">해외여행</a>
          </li>
          <li class="item03">
            <a href="#none">호텔/팬션</a>
          </li>
          <li class="item04">
            <a href="#none">투어/입장권</a>
          </li>
          <li class="item05">
            <a href="#none">항공</a>
          </li>
        </ul>
      </div>
      <div>
        <div class="cont_unit search_result">
          <div class="text_wrap big result mt40">
            <strong class="tit">패키지<em>(${pkageListCount})</em></strong>
            <span class="right_cont">
            <a href="#" class="txt arrow_r">해외여행 더보기</a>
            </span>
          </div>
          <div class="prod_list_wrap mtm30">
            <ul class="type">
            <c:forEach var="pkageList" items="${pkageList }" begin="0" end="3">
              <li>
                <div>
                  <div class="inr img">
                    <img src="${pkageList.pkage_Img_path }">
                  </div>
                  <div class="inr right route_type">
                    <strong class="item_title eps2">${pkageList.pkage_name}</strong>
                    <p class="item_text stit"><p>
                    <div class="info_bottom">
                      <div class="item_group">
                        <span class="icn star">
                          ${pkageList.pkage_score}
                        </span>
                        <span class="icn balloon">
                          25
                        </span>
                        <span class="hash_group">
                          <span>#도쿄</span>
                          <span>#자유여행</span>
                          <span>#에어텔</span>
                        </span>
                      </div>
                    </div>
                    <div class="price_group">
                      <strong class="price now">${pkageList.pkage_dt_Aprice}<span>원~</span></strong>
                    </div>
                    <div class="btn_wrap">
                      <a href="#none" class="btn arrow">판매상품보기</a>
                    </div>
                  </div>
                  <div class="sub_list_wrap">
                    
                  </div>
                </div>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div> <!-- div -->
      <div>
        <div class="cont_unit search_result">
          <div class="text_wrap big result mt40">
            <strong class="tit">호텔/펜션<em>(17,472)</em></strong>
            <span class="right_cont">
            <a href="#" class="txt arrow_r">호텔/펜션 더보기</a>
            </span>
          </div>
          <div class="prod_list_wrap mtm30">
            <ul class="type">
              <li>
                <div>
                  <div class="inr img">
                    <img src="https://image.hanatour.com/usr/cms/resize/400_0/2022/03/21/10000/dd97d0a7-aa20-420c-8322-9268a30e88e4.jpg">
                  </div>
                  <div class="inr right route_type">
                    <strong class="item_title eps2">이비스 스타일스 오사카 남바</strong>
                    <p class="item_text stit"><p>
                    <div class="info_bottom">
                      <div class="item_group">
                        <span class="icn star">
                          4.0
                        </span>
                        <span class="icn balloon">
                          25
                        </span>
                        <span class="hash_group">
                          <span>#도쿄</span>
                          <span>#자유여행</span>
                          <span>#에어텔</span>
                        </span>
                      </div>
                    </div>
                    <div class="price_group">
                      <strong class="price now">599,900<span>원~</span></strong>
                    </div>
                    <div class="btn_wrap">
                      <a href="#none" class="btn arrow">판매상품보기</a>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div> <!-- div -->
      <div>
        <div class="cont_unit search_result">
          <div class="text_wrap big result mt40">
            <strong class="tit">투어/입장권<em>()</em></strong>
            <span class="right_cont">
            <a href="#" class="txt arrow_r">투어/입장권 더보기</a>
            </span>
          </div>
          <div class="prod_list_wrap mtm">
            <ul class="type">
              <li>
                <div>
                  <div class="inr img">
                    <img src="https://static.hanatour.com/product/2022/09/30/0204juo3q4/medium.jpg">
                  </div>
                  <div class="inr right route_type">
                    <strong class="item_title eps2">[무료배송][간사이] 라피트 특급열차 편도/왕복권</strong>
                    <p class="item_text stit"><p>
                    <div class="price_group">
                      <strong class="price now">10,00<span>원</span></strong>
                    </div>
                    <div class="btn_wrap">
                      <a href="#none" class="btn arrow">상세보기</a>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div> <!-- div -->
      
    </div> <!-- contents -->
  </div> <!-- inr -->
</div> <!-- container -->

</body>
</html>