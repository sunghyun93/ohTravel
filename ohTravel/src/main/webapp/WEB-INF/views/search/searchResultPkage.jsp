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
      <div class="ajax_here">
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
      </div> <!-- ajax_here -->
      
    </div> <!-- contents -->
  </div> <!-- inr -->
</div> <!-- container -->

</body>
</html>