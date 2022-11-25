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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('.item02').click(function() {
			let gubun = $(this).attr('id');
			$.ajax({
				url: '/searchCategoryAjax',
				data: {'search_word' : $('#search_word').val(),
						'gubun' : gubun},
				dataType: 'html',
				success: function(data) {
					$('.no_division').empty();
					$('.empty_here').empty();
					$('.no_division').html(data)
				}
			})
		});
	})

</script>
</head>
<body>
<div class="container">
  <div class="inr">
    <div class="contents">
      <div class="js_tabs type1 no_division"> <!-- 여기 Empty 각 -->
        <ul class="tabs sort">
			<li class="item01 selected"><button id="all" class="item02">전체</button></li>
	        <li class="item"><button id="pkage" class="item02">패키지</button></li>
	        <li class="item03"><button id="hotel" class="item02">호텔/펜션</button></li>
	        <li class="item04"><button id="ticket" class="item02">투어/입장권</button></li>
			<li class="item05"><button id="airplane" class="item02">항공</button></li>
		</ul>
      </div>
      
      
      <!-- 패키지 리스트 -->
      <div class="empty_here">
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
      </div> <!-- ajax_here --> <!-- 패키지 리스트 -->
      
      <!-- 호텔 리스트 -->
      <div class="empty_here">
        <div class="cont_unit search_result">
          <div class="text_wrap big result mt40">
            <strong class="tit">호텔/펜션<em>(${hotelListCount})</em></strong>
            <span class="right_cont">
            <a href="#" class="txt arrow_r">호텔/펜션 더보기</a>
            </span>
          </div>
          <div class="prod_list_wrap mtm30">
            <ul class="type">
            <c:forEach var="hotelList" items="${hotelList}" begin="0" end="3">
              <li>
                <div>
                  <div class="inr img">
                    <img src="${hotelList.h_l_img_path}">
                  </div>
                  <div class="inr right route_type">
                    <strong class="item_title eps2">${hotelList.hotel_kor}</strong>
                    <p class="item_text stit"><p>
                    <div class="info_bottom">
                      <div class="item_group">
                        <span class="icn star">
                          ${hotelList.hotel_score}
                        </span>
                        <span class="icn balloon">
                          25
                        </span>
                      </div>
                    </div>
                    <div class="price_group">
                      <strong class="price now">조장님 가격 어떻게 할까요<span>원~</span></strong>
                    </div>
                    <div class="btn_wrap">
                      <a href="#none" class="btn arrow">판매상품보기</a>
                    </div>
                  </div>
                </div>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div> <!-- 호텔 리스트 -->
      
      <!-- 티켓 리스트 -->
      <div class="empty_here">
        <div class="cont_unit search_result">
          <div class="text_wrap big result mt40">
            <strong class="tit">투어/입장권<em>(${ticketListCount})</em></strong>
            <span class="right_cont">
            <a href="#" class="txt arrow_r">투어/입장권 더보기</a>
            </span>
          </div>
          <div class="prod_list_wrap mtm">
            <ul class="type">
            <c:forEach var="ticketList" items="${ticketList}" begin="0" end="4">
              <li>
                <div>
                  <div class="inr img">
                    <img src="${ticketList.ticket_detail_img_path }">
                  </div>
                  <div class="inr right route_type">
                    <strong class="item_title eps2">${ticketList.ticket_name }</strong>
                    <p class="item_text stit"><p>
                    <div class="price_group">
                      <strong class="price now">${ticketList.ticket_adult_price}<span>원</span></strong>
                    </div>
                    <div class="btn_wrap">
                      <a href="/ticket/exhibitionDetail" class="btn arrow">상세보기</a>
                    </div>
                  </div>
                </div>
              </li>
             </c:forEach>
            </ul>
          </div>
        </div>
      </div> <!-- 티켓 리스트 -->
      
      </div> <!-- sick_finger -->
      
    </div> <!-- contents -->
  </div> <!-- inr -->
</div> <!-- container -->

</body>
</html>