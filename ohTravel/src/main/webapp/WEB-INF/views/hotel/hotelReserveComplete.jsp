<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<!-- css -->
<link rel="stylesheet" href="/css/pkage/package_completeReserve.css">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
   
   <div class="order-comp">
      <h1>예약완료</h1><hr>
      <div class="buycomp">
         <img alt="buycheck" src="${pageContext.request.contextPath}/assets/img/logo/ohLogo2.png" width="80px"><br><br>
         <div class="buy_1">예약이 완료되었습니다.</div><br><br>
         <div class="buy_2">oh!Travel을 이용해주셔서 감사합니다.</div><br><br>
      </div>
         <div class="notice">
         	<span class="notice_2">- 상품명 : ${hotelRDTO.room_name }</span><br>
         	<span class="notice_2">- 예약자 명 : ${hotelRDTO.mem_name }</span><br>
            <span class="notice_2">- 예약 인원 : 성인 ${hotelRDTO.numberOfAdult } 명, 아동 ${hotelRDTO.numberOfChild } 명</span><br>
            <span class="notice_2">- 체크인 날짜 : ${hotelRDTO.startDate }</span><br>
            <span class="notice_2">- 체크아웃 날짜 : ${hotelRDTO.endDate }</span><br>      
         </div>
      
      <div class="reservation_data">
        	 예약번호:  ${hotelRDTO.h_rev_id} <br>
         	 <%-- 예약일:   <fmt:formatDate value="${hotelRDTO.pkage_rv_date}" pattern="yyyy-MM-dd"/>  <br> --%>
         	 결제금액:  <fmt:formatNumber value="${hotelRDTO.rev_tot_price }" pattern="#,###원"/><br>
      </div>
   </div>
   
   <div class="input_a">
      <a href="${pageContext.request.contextPath}/member/myPageReservHotel"><input type="button" class="black" value="구매내역 확인"></a>
   </div>
   
</body>
</html>