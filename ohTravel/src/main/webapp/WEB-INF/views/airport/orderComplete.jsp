<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<style type="text/css">

.buycomp {

	text-align: center;
}

.order-comp {	
						margin-top: 40px;
						padding-left: 150px;
						padding-right: 150px;
		
			}
			
.order-comp h1 {
	font-size: 32px;
	font-weight: bold;
}		
			
.buy_1	{
	font-size: 32px;
	font-weight: bold;
}

.buy_2{
	font-size: 18px;
	font-weight:  500;
}


.pricechk {
	width: 300px;
	margin: 0 auto;
	margin-top: 30px;
	font-size: 20px;
	
}

	
.price	{
	
}

.price_won{
	color:red;
	
}
.input_a{
	width: 420px;
 	margin: 0 auto;
 	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin-top: 50px;
    margin-bottom: 50px;
}

.white{
	border: 1px solid black;
	width: 200px;
	height: 60px;
	color: black;
	background-color: white;
	font-size: 18px;
	font-weight: bold;
}

.black{
	border: 1px solid black;
	width: 200px;
	height: 60px;
	color: white;
	background-color: black;
	font-size: 18px;
	font-weight: bold;
	
}

.notice{

	width: 900px;
	height: 200px;
	margin: 0 auto;
	
}	

.notice_1{
	color: red;
	margin-left: 220px;
}
.notice_2{
	margin-left: 220px;
}

.reservation_data{
	border: 1px solid #999999;
	background-color: #999999;
	width: 400px;
	height: 90px;
	margin: 0 auto;
	font-size: 20px;
	color:white;
	font-family: sans-serif ;
}		
					
</style>
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
				<span class="notice_1">- 탑승수속은 해당 항공편 출발 2시간 전부터 60분 전까지 입니다.</span><br>
				<span class="notice_2">- 탑승객 본인의 신분증을 제시하시고, 탑승권을 발급 받으신 후 탑승하여 주시기 바랍니다.</span>
			</div>
		
		<div class="reservation_data">
			예약번호:  ${air_ReservationDTO.reservation_id} <br>
		 	예약자아이디: ${mem_id} <br>
		    예약일:   ${air_ReservationDTO.reservation_date}
		</div>
	</div>
	
	<div class="input_a">
		<input type="button" class="white" value="항공 검색" onclick="location.href='${pageContext.request.contextPath}/airport/searchTicket'">
		<input type="button" class="black" value="항공 구매내역 확인">
	</div>
	
</body>
</html>