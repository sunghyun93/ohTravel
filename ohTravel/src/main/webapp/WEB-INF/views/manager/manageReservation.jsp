<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.ela{
	width: 20%;
}
.button-wrap{
	text-align: center;
}
.big{
	width: 100%;
}
</style>
</head>
<body>
	<div class="container" style="min-height: 700px;">
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a onclick="reservationPackage()" href="#" class="genric-btn primary ela">패키지 예약 관리</a>
				<a onclick="reservationAir()" href="#" class="genric-btn primary ela">항공권 예약 관리</a>
				<a onclick="reservationHotel()" href="#" class="genric-btn primary ela">숙박 예약 관리</a>
				<a onclick="reservationTicket()" href="#" class="genric-btn primary ela">입장권 예약 관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">예약 관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<input type="button" class="btn btn-primary mb-3" onclick="location.href='managerMain'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover" id="listTable"></table>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
				</ul>
			</nav>
		</div>
	</div>
	
	<!-- 모달모달임모달~~ -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
		
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">예약 인원 확인</h4>
					<button type="button" class="close" data-dismiss="modal">X</button>
				</div>
				<div class="modal-body">
					<table id="modal_table" class="table table-hover">
					
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달모달임모달끝~~ -->
<script type="text/javascript">
	function reservationPackage(){
		$.ajax({
			url : 'getPackageResList',
			method : 'POST',
			success : function(data){
				console.log(data);
				for(var i=0; i<data.length; i++){
					var datePer =  data[i].pkage_rv_date;
					datePer = datePer.substring(0,5)+datePer.substring(5,8)+datePer.substring(8,10)+" "+datePer.substring(11,14)+datePer.substring(14,17)+datePer.substring(17,19);
					
					data[i].pkage_rv_date = datePer;
				}
					let str ="";
					str = "<thead><tr><th>주문번호</th><th>패키지명</th><th>아이디</th><th>성인인원</th><th>아동인원</th><th>예약일자</th><th>결제금액</th></tr></thead>";
				$.each(data, function(index,item){
					str += "<tr><td><a href='#myModal'data-toggle='modal' onclick='mem_rev("+item.pkage_rv_id+")' style='color:pink'>"+item.pkage_rv_id+"</a></td><td>"+item.pkage_dt_name+"</td>";
					str += "<td>"+item.mem_id+"</td><td>"+item.pkage_rv_acnt+"</td>";
					str += "<td>"+item.pkage_rv_ccnt+"</td><td>"+item.pkage_rv_date+"</td>";
					str += "<td>"+item.pkage_rv_tprice+"</td></tr>"
				});
				document.getElementById('listTable').innerHTML = str;
			}
		})
	}
	
	function mem_rev(str){
		$.ajax({
			url : 'getPackageResPiList',
			data : {'pkage_rv_id' : str},
			method : 'POST',
			success : function(data){
				console.log(data);
				str = "<thead><tr><th>한글성명</th><th>생년월일</th><th>성별</th><th>영문성</th><th>영문이름</th><th>휴대폰번호</th><th>이메일</th></tr></thead>";
				$.each(data, function(index,item){
					str += "<tr><td>"+item.pkage_pi_name+"</td><td>"+item.pkage_pi_birth+"</td>";
					str += "<td>"+item.pkage_pi_gen+"</td><td>"+item.pkage_pi_lname+"</td>";
					str += "<td>"+item.pkage_pi_fname+"</td><td>"+item.pkage_pi_tel+"</td>";
					str += "<td>"+item.pkage_pi_email+"</td></tr>"
				});
				document.getElementById('modal_table').innerHTML = str;
			}
		})
	}
	
	
	
	function reservationAir(){
		$.ajax({
			url : 'getAirResList',
			success : function(data){
				console.log(data);
					let str ="";
					str = "<thead><tr><th>예약번호</th><th>아이디</th><th>좌석등급</th><th>출발도착구분</th><th>예약일자</th><th>결제금액</th></tr></thead>";
				$.each(data, function(index,item){
					str += "<tr><td>"+item.h_rev_id+"</td><td>"+item.mem_id+"</td>";
					str += "<td>"+item.rev_per+"</td><td>"+item.rev_date+"</td>";
					str += "<td>"+item.rev_tot_price+"</td><td>"+item.room_name+"</td>";
					str += "<td><a href='/../hotel/hotelDetail?hotel_id="+item.hotel_id+"' style='color:pink'>"+item.hotel_kor+"</a></td></tr>"
				});
				document.getElementById('listTable').innerHTML = str;
			}
		})
	}
	function reservationHotel(){
		$.ajax({
			url : 'getHotelResList',
			method : 'POST',
			success : function(data){
				console.log(data);
					let str ="";
					str = "<thead><tr><th>주문번호</th><th>아이디</th><th>인원</th><th>구매날짜</th><th>결제금액</th><th>객실명</th><th>호텔명</th></tr></thead>";
				$.each(data, function(index,item){
					str += "<tr><td>"+item.h_rev_id+"</td><td>"+item.mem_id+"</td>";
					str += "<td>"+item.rev_per+"</td><td>"+item.rev_date+"</td>";
					str += "<td>"+item.rev_tot_price+"</td><td>"+item.room_name+"</td>";
					str += "<td><a href='/../hotel/hotelDetail?hotel_id="+item.hotel_id+"' style='color:pink'>"+item.hotel_kor+"</a></td></tr>"
				});
				document.getElementById('listTable').innerHTML = str;
			}
		})
	}
	function reservationTicket(){
		$.ajax({
			url : 'getTicketResList',
			method : 'POST',
			success : function(data){
				console.log(data);
				for(var i=0; i<data.length; i++){
					var datePer =  data[i].ticket_puchase_date;
					datePer = datePer.substring(0,5)+datePer.substring(5,8)+datePer.substring(8,10)+" "+datePer.substring(11,14)+datePer.substring(14,17)+datePer.substring(17,19);
					
					data[i].ticket_puchase_date = datePer;
				}
					let str ="";
					str = "<thead><tr><th>주문번호</th><th>티켓코드</th><th>아이디</th><th>입장권명</th><th>주문일자</th><th>사용일</th><th>성인인원</th><th>아동인원</th><th>결제금액</th></tr></thead>";
				$.each(data, function(index,item){
					str += "<tr><td>"+item.ticket_order_id+"</td><td><a href='/../ticket/exhibitionDetail?ticket_id="+item.ticket_id+"' style='color:pink'>"+item.ticket_id+"</a></td><td>"+item.mem_id+"</td>";
					str += "<td>"+item.ticket_name+"</td><td>"+item.ticket_puchase_date+"</td>";
					str += "<td>"+item.ticket_admission_date+"</td><td>"+item.ticket_adult_per+"</td>";
					str += "<td>"+item.titicket_idcket_child_per+"</td><td>"+item.ticket_total_price+"</td></tr>"
				});
				document.getElementById('listTable').innerHTML = str;
			}
		});
	}
	
	
</script>
</body>
</html>