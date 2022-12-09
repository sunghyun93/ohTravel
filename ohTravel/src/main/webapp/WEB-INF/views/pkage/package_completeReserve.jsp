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
      <h1>예매완료</h1><hr>
      <div class="buycomp">
         <img alt="buycheck" src="${pageContext.request.contextPath}/assets/img/logo/ohLogo2.png" width="80px"><br><br>
         <div class="buy_1">예매가 완료되었습니다.</div><br><br>
         <div class="buy_2">oh!Travel을 이용해주셔서 감사합니다.</div><br><br>
      </div>
         <div class="notice">
         	<span class="notice_2">- 상품명 : ${pkage_rsDTO.pkage_detailDTO.pkage_dt_name }</span><br>
         	<span class="notice_2">- 예약자 명 : ${pkage_rsDTO.memberDTO.mem_name }</span><br>
            <span class="notice_2">- 예약 인원 : 성인 ${pkage_rsDTO.pkage_rv_Acnt } 명, 아동 ${pkage_rsDTO.pkage_rv_Ccnt } 명</span><br>
            <span class="notice_2">- 일정 시작 날짜 : <fmt:formatDate value="${pkage_rsDTO.pkage_detailDTO.pkage_dt_startDay }" pattern="yyyy-MM-dd"/></span><br>
            <span class="notice_2">- 일정 종료 날짜 : <fmt:formatDate value="${pkage_rsDTO.pkage_detailDTO.pkage_dt_endDay }" pattern="yyyy-MM-dd"/></span><br>      
            <span class="notice_2">- 미팅장소 : ${pkage_rsDTO.pkage_detailDTO.pkage_dt_meet }</span><br>
            <span class="notice_2">- 미팅시각 : <fmt:formatDate value="${pkage_rsDTO.pkage_detailDTO.pkage_dt_meetDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
         </div>
      
      <div class="reservation_data">
        	 예약번호:  ${pkage_rsDTO.pkage_rv_id} <br>
         	 예약일:  <fmt:formatDate value="${pkage_rsDTO.pkage_rv_date}" pattern="yyyy-MM-dd"/>  <br>
         	 결제금액:  <fmt:formatNumber value="${pkage_rsDTO.pkage_rv_tprice }" pattern="#,###원"/><br>
      </div>
   </div>
   
   <div class="input_a">
      <input type="button" class="black" value="구매내역 확인">
   </div>
   
</body>
</html>