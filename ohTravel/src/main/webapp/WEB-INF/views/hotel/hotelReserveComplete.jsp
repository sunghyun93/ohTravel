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
         	
         </div>
      
      <div class="reservation_data">
        	
      </div>
   </div>
   
   <div class="input_a">
      <a href="${pageContext.request.contextPath}/member/myPageReservHotel"><input type="button" class="black" value="구매내역 확인"></a>
   </div>
   
</body>
</html>