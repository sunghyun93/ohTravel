<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.0/chart.min.js" integrity="sha512-R60W3LgKdvvfwbGbqKusRu/434Snuvr9/Flhtoq9cj1LQ9P4HFKParULqOCAisHk/J4zyaEWWjiWIMuP13vXEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
				<a onclick="salesPackage()" href="#" class="genric-btn primary ela">패키지 매출 관리</a>
				<a onclick="salesAir()" href="#" class="genric-btn primary ela">항공권 매출 관리</a>
				<a onclick="salesHotel()" href="#" class="genric-btn primary ela">숙박 매출 관리</a>
				<a onclick="salesTicket()" href="#" class="genric-btn primary ela">입장권 매출 관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">매출 관리</h1>
			
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center canv">
			<canvas id="myChart" width="700" height="500"></canvas>
			<div class='mt-4 mb-4 button-wrap' id="button-sale">
			</div>
			<div id="optionMonth">
			</div>
			</div>
				<table border="1" class="table table-hover" id="listTable"></table>
			</div>
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<input type="button" class="btn btn-primary mb-3" onclick="location.href='managerMain'" value="돌아가기">
			</div>
		</div>
	</div>
<script>

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////패키지 매출 관련///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function salesPackage(){
		$.ajax({
			url : 'getPackageTotalSale',
			method : 'POST',
			success : function(data){
				console.log(data);
				data = data.toLocaleString('ko-KR');
				let str = "";
				str = "<thead><tr><th>비고</th><th>총 매출액</th></tr></thead>";
				str += "<tr><td>패키지 전체 매출</td><td>"+data+" 원</td></tr>";
				
				let button = "";
				button += "<a onclick='salesPackage()' href='#' class='genric-btn primary ela'>총 매출보기</a>";
				button += "<a onclick='monthPackageSale()' href='#' class='genric-btn primary ela'>월별 매출보기</a>";
				button += "<a onclick='dayPackageSale()' href='#' class='genric-btn primary ela'>일별 매출보기</a>";
				
				document.getElementById('listTable').innerHTML = str;
				document.getElementById('button-sale').innerHTML = button;
				$('#optionMonth').empty();
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
			}
		})
	}

	function monthPackageSale(){
		$.ajax({
			url : 'changePackageChart',
			method : 'POST',
			data : {'str' : 'packageMonth'},
			success : function(data){
				console.log(data);
				console.log(data.date);
				$('#optionMonth').empty();
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 2
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}


	function dayPackageSale(){
		let str = "";
		str += "<select class='form-control' onchange='changePackageMonth(this.value)' name='month'><option value='01'>1</option><option value='02'>2</option><option value='03'>3</option>";
		str += "<option value='04'>4</option><option value='05'>5</option><option value='06'>6</option><option value='07'>7</option>";
		str += "<option value='08'>8</option><option value='09'>9</option><option value='10'>10</option>";
		str += "<option value='11'>11</option><option value='12'>12</option></select>"
		
		$('#myChart').remove();
		$('iframe.chartjs-hidden-iframe').remove();
		$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
		document.getElementById('optionMonth').innerHTML = str;
	}
	
	
	function changePackageMonth(value){
		console.log(value);
		$.ajax({
			url : 'changePackageChart',
			method : 'POST',
			data : {'str' : 'packageDay',
					'month' : value},
			success : function(data){
				console.log(data);
				console.log(data.date);
				
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 2
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////항공권 매출 관련///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function salesAir(){
			$.ajax({
				url : 'getAirTotalSale',
				method : 'POST',
				success : function(data){
					console.log(data);
					data = data.toLocaleString('ko-KR');
					let str = "";
					str = "<thead><tr><th>비고</th><th>총 매출액</th></tr></thead>";
					str += "<tr><td>항공권 전체 매출</td><td>"+data+" 원</td></tr>";
					
					let button = "";
					button += "<a onclick='salesAir()' href='#' class='genric-btn primary ela'>항공권 총 매출보기</a>";
					button += "<a onclick='monthAirSale()' href='#' class='genric-btn primary ela'>항공권 월별 매출보기</a>";
					button += "<a onclick='dayAirSale()' href='#' class='genric-btn primary ela'>항공권 일별 매출보기</a>";
					
					document.getElementById('listTable').innerHTML = str;
					document.getElementById('button-sale').innerHTML = button;
					$('#optionMonth').empty();
					$('#myChart').remove();
					$('iframe.chartjs-hidden-iframe').remove();
				}
			})
		}
		
	function monthAirSale(){
		$.ajax({
			url : 'changeAirChart',
			method : 'POST',
			data : {'str' : 'airMonth'},
			success : function(data){
				console.log(data);
				console.log(data.date);
				$('#optionMonth').empty();
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>");
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 2
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}
	
	
	function dayAirSale(){
		let str = "";
		str += "<select class='form-control' onchange='changeAirMonth(this.value)' name='month'><option value='01'>1</option><option value='02'>2</option><option value='03'>3</option>";
		str += "<option value='04'>4</option><option value='05'>5</option><option value='06'>6</option><option value='07'>7</option>";
		str += "<option value='08'>8</option><option value='09'>9</option><option value='10'>10</option>";
		str += "<option value='11'>11</option><option value='12'>12</option></select>"
		
		$('#myChart').remove();
		$('iframe.chartjs-hidden-iframe').remove();
		$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
		document.getElementById('optionMonth').innerHTML = str;
	}
	
	
	function changeAirMonth(value){
		console.log(value);
		$.ajax({
			url : 'changeAirChart',
			method : 'POST',
			data : {'str' : 'airDay',
					'month' : value},
			success : function(data){
				console.log(data);
				console.log(data.date);
				
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 2
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}
	


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////숙박 매출 관련////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function salesHotel(){
		$.ajax({
			url : 'getHotelTotalSale',
			method : 'POST',
			success : function(data){
				console.log(data);
				data = data.toLocaleString('ko-KR');
				let str = "";
				str = "<thead><tr><th>비고</th><th>총 매출액</th></tr></thead>";
				str += "<tr><td>숙박 전체 매출</td><td>"+data+" 원</td></tr>";
				
				let button = "";
				button += "<a onclick='salesHotel()' href='#' class='genric-btn primary ela'>숙박 총 매출보기</a>";
				button += "<a onclick='monthHotelSale()' href='#' class='genric-btn primary ela'>숙박 월별 매출보기</a>";
				button += "<a onclick='dayHotelSale()' href='#' class='genric-btn primary ela'>숙박 일별 매출보기</a>";
				
				document.getElementById('listTable').innerHTML = str;
				document.getElementById('button-sale').innerHTML = button;
				$('#optionMonth').empty();
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
			}
		})
	}
	
	function monthHotelSale(){
		$.ajax({
			url : 'changeHotelChart',
			method : 'POST',
			data : {'str' : 'hotelMonth'},
			success : function(data){
				console.log(data);
				console.log(data.date);
				$('#optionMonth').empty();
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 3
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}
	
	
	function dayHotelSale(){
		let str = "";
		str += "<select class='form-control' onchange='changeHotelMonth(this.value)' name='month'><option value='01'>1</option><option value='02'>2</option><option value='03'>3</option>";
		str += "<option value='04'>4</option><option value='05'>5</option><option value='06'>6</option><option value='07'>7</option>";
		str += "<option value='08'>8</option><option value='09'>9</option><option value='10'>10</option>";
		str += "<option value='11'>11</option><option value='12'>12</option></select>"
		
		$('#myChart').remove();
		$('iframe.chartjs-hidden-iframe').remove();
		$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
		document.getElementById('optionMonth').innerHTML = str;
	}
	
	
	function changeHotelMonth(value){
		console.log(value);
		$.ajax({
			url : 'changeHotelChart',
			method : 'POST',
			data : {'str' : 'hotelDay',
					'month' : value},
			success : function(data){
				console.log(data);
				console.log(data.date);
				
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 3
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////입장권 매출 관련///////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function salesTicket(){
		$.ajax({
			url : 'getTicketTotalSale',
			method : 'POST',
			success : function(data){
				console.log(data);
				data = data.toLocaleString('ko-KR');
				let str = "";
				str = "<thead><tr><th>비고</th><th>총 매출액</th></tr></thead>";
				str += "<tr><td>입장권 전체 매출</td><td>"+data+" 원</td></tr>";
				
				let button = "";
				button += "<a onclick='salesTicket()' href='#' class='genric-btn primary ela'>입장권 총 매출보기</a>";
				button += "<a onclick='monthTicketSale()' href='#' class='genric-btn primary ela'>입장권 월별 매출보기</a>";
				button += "<a onclick='dayTicketSale()' href='#' class='genric-btn primary ela'>입장권 일별 매출보기</a>";
				
				document.getElementById('listTable').innerHTML = str;
				document.getElementById('button-sale').innerHTML = button;
				$('#optionMonth').empty();
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
			}
		})
	}
	
	function monthTicketSale(){
		$.ajax({
			url : 'changeTicketChart',
			method : 'POST',
			data : {'str' : 'ticketMonth'},
			success : function(data){
				console.log(data);
				console.log(data.date);
				$('#optionMonth').empty();
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 3
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}
	
	
	function dayTicketSale(){
		let str = "";
		str += "<select class='form-control' onchange='changeTicketMonth(this.value)' name='month'><option value='01'>1</option><option value='02'>2</option><option value='03'>3</option>";
		str += "<option value='04'>4</option><option value='05'>5</option><option value='06'>6</option><option value='07'>7</option>";
		str += "<option value='08'>8</option><option value='09'>9</option><option value='10'>10</option>";
		str += "<option value='11'>11</option><option value='12'>12</option></select>"
		
		$('#myChart').remove();
		$('iframe.chartjs-hidden-iframe').remove();
		$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
		document.getElementById('optionMonth').innerHTML = str;
	}
	
	
	function changeTicketMonth(value){
		console.log(value);
		$.ajax({
			url : 'changeTicketChart',
			method : 'POST',
			data : {'str' : 'ticketDay',
					'month' : value},
			success : function(data){
				console.log(data);
				console.log(data.date);
				
				$('#myChart').remove();
				$('iframe.chartjs-hidden-iframe').remove();
				$('.canv').append("<canvas id='myChart' width='700' height='500'></canvas>")
				const ctx = document.getElementById('myChart');
				new Chart(ctx, {
					type: 'line',
					data: {
					labels: data.date,
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(255, 99, 132,.5)',
						pointBorderColor: 'rgba(153, 102, 255, 1)',
						pointRadius: 10,
						pointStyle: 'star',
						fill:true,
						data: data.tprice,
						borderWidth: 3
					}]
				},
				options: {
					scales: {
				        y: {
							beginAtZero: true
							}
						}
					}
				});
			}
		})
	}
	
	
</script>	
</body>
</html>