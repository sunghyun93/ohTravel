<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
</head>
<style type="text/css">
.search_field{
	border:1px;
	background: #EAEAEA;
	width: 1200px;
	height: 220px;
	margin: 0 auto;
}

.trip {
	width : 80px;
	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin: 0 0 15px 30px;
}

.round_trip {
	display: inline-block;
	width: 40px;
	height: 20px;
	text-align: center;
	font-size: 18px;
}
.round_trip:hover{
	text-decoration: underline;
    color:blue;
    cursor: pointer;
}
.oneway {
	
	display: inline-block;
	width: 40px;
	height: 20px;
	text-align: center;
	font-size: 18px;
	margin-left: 5px;
}
.oneway:hover{
	text-decoration: underline;
    color:blue;
    cursor: pointer;
}

.start_end {
	
	width : 1140px;
	height: 62px;
	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin: 0 0 15px 30px;
}

.starting {
	width:370px;
	height: 60px;
}

.ending {
	margin-right:255px;
	width:370px;
	height: 60px;
}

.date{
	width : 1140px;
	height: 62px;
	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin-left: 30px;
}

.dates_start_check{
	display:inline-block;
	width: 161px;
	height: 62px;
	text-align: center;
}
.dates_start_end {
	display:inline-block;
	width: 161px;
	height: 62px;
	text-align: center;
	margin-right: 40px;
}
.ppl_check {
	display:inline-block;
	width: 410px;
	height: 62px;
	text-align: center;
	margin-left: 50px;
	background: white;
	border: 1px solid black;
}

.dates_start_oneway{
	display:inline-block;
	width: 370px;
	height: 62px;
	text-align: center;
	margin-right: 40px;
}



.air_search{
	display:inline-block;
	width: 161px;
	height: 62px;
	text-align: center;
	color:white;
    background-color: #1E9EED;
    border: 1px solid #1E9EED;
    padding: 0.5rem;
    line-height: 1rem;
    border-radius: 0.5rem;
    font-size: 18px;
    font-weight: bold;
}
.air_search:hover{
	cursor: pointer;
}

/*모달  */

	.entire {
		margin-top: 60px;
	}
	.modal_wrap {
        display: none;
        width: 500px;
        height: 450px;
        position: absolute;
        top: 135%;
        left: 25%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 999;
    }
    .modal_wrap2{
        display: none;
        width: 500px;
        height: 450px;
        position: absolute;
        top: 135%;
        left: 60%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 999;
    }
    
    .modal_wrap3{
        display: none;
        width: 500px;
        height: 550px;
        position: absolute;
        top: 145%;
        left: 60%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 999;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 30000px;
        background-color:rgba(0, 0,0, 0.2);
        top:0;
        left: 0;
        z-index: 1;
    }
    .black_bg2{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 30000px;
        background-color:rgba(0, 0,0, 0.2);
        top:0;
        left: 0;
        z-index: 1;
    }
    .black_bg3{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 30000px;
        background-color:rgba(0, 0,0, 0.2);
        top:0;
        left: 0;
        z-index: 1;
    }
    
    .select_area{
    	margin-left: 30px;
    }
    
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close2{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    
    .modal_close3 {
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    
    .modal_close> span{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    
    .modal_close2> span{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    
    .modal_close3> span{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    .modal_close_country{
    	border: 1px solid black;
    	width : 400px;
		display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-left: 30px;
	    margin-top: 10px;
    }
    .modal_close_country_1{
    	border-right: 1px solid black;
    }
    
    .modal_close_country_1 > ul > li  {
    	/* border: 1px solid gray; */
    	border-collapse:collapse;
     	width:200px;
     	height: 60px;
     	list-style: none;
     	display:inline-block;
     	margin-left: 10px;
     	
  
    }
    ul {
    	padding-left: 0px;
    	list-style: none;
    }
    
    .modal_close_country_2{
    	width:200px;
    }
    .modal_close_country_2 > ul > li {
    	border-collapse:collapse;
    	display:inline-block;
     	width:200px;
     	height: 53px;
     	list-style: none;
     	text-align: center;
     	margin-right: 10px;
     	
    }
    
     #a {
    	cursor: pointer;
		
    }
    
     #a:hover {
    	color:red;
    }
    
	/* 인원 선택 버튼 부분 */
	.member_count {
	    min-height: 50px;
	}
	
	.member_count_entire {
		margin-top: 40px;
		margin-left: 20px;
	}
	
	.ppl_select{
		margin-left: 7px;
		font-size: 20px;
		
	}
	
	.seat_select{
		margin-left: 7px;
		font-size: 20px;
	}
	.member_count ul {
	    margin: 0;
	}
	.member_count ul li {
	    height: 39px;
	}
	.member_count li:not(:first-child) {
	    margin-top: 30px;
	}
	p {
	    line-height: 1.5;
	}
	.member_count .tit {
	    float: left;
	    width: 55%;
	    margin: 0;
	    color: #111;
	    margin-top: 10px;
	}
	.member_count p.tit {
	    text-align: left;
	    font-size: 14px;
	    color: #333;
	}
	span.txt {
	    position: relative;
	}
	.member_count .tit .txt {
	    margin: 0;
	    font-size: 13px;
	    line-height: 1;
	    top: -3px;
	}
	.member_count p.tit .txt {
	    text-align: left;
	    font-size: 13px;
	    color: #888;
	    top: 0;
	    left: 10px;
	}
	.member_count .price {
	    display: block;
	    font-size: 17px;
	    font-weight: 600;
	    line-height: 1;
	}
	
	/* 버튼 */
	button {
	    background-color: #fff;
	    font-family: Noto Sans KR,sans-serif;
	}
	.num_count_group {
	    display: inline-block;
	    width: 114px;
	    height: 38px;
	    border: 1px solid #c3c3c3;
	    border-radius: 2px;
	    margin-top: 10px;
	}
	.num_count_group button:after {
	    width: 26px;
	    height: 27px;
	}
	.num_count_group .btn_decrement:after {
	    display: inline-block;
	    content: '';
	    background-image: url(icon_minus.png);
	    background-repeat: no-repeat;
	    background-position: 0px 0px;
	}
	.num_count_group .btn_increment:after {
	    display: inline-block;
	    content: '';
	    background-image: url(icon_plus.png);
	    background-repeat: no-repeat;
	    background-position: 0px 0px;
	}
	
	/* 다운 버튼 */
	.num_count_group button {
	    float: left;
	    width: 35px;
	    height: 36px;
	    padding: 5px 5px 4px;
	}
	.num_count_group .btn_decrement {
	    border: none;
	    border-right: 1px solid #ddd;
	}
	.num_count_group .btn_decrement:hover {
	    cursor: pointer;
	}
	
	/* 인원 카운트 */
	.num_count_group .inpt_counter {
	    float: left;
	    display: block;
	    font-size: 15px;
	    color: #111;
	    width: 33px;
	    height: 36px;
	    line-height: 34px;
	    text-align: center;
	    margin: 0 4px;
	}
	
	/* 업 버튼 */
	.num_count_group .btn_increment {
	    float: right !important;
	    border: none;
	    border-left: 1px solid #ddd;
	}
	.num_count_group .btn_increment:hover {
	    cursor: pointer;
	}
	
	
	/* member_count float 해제부분 */
	.member_count:after {
	    display: block;
	    clear: both;
	    content: '';
	}
	
	
	.select_complete{
		border: 1px solid #5E2BB8;
		background: #5E2BB8;
		width: 130px;
		height: 36px;
		color: white;
		text-align: center;
		line-height: center;
		margin-left: 300px;
		font-size: 20px;
	}
	.select_complete_text:hover {
		cursor: pointer;
		color:red;
	}

	/* 상세 정보 제목 */
	.product-detail-view .product-top .info-flex .product-info {
	    position: relative;
	    padding: 88px 90px 60px;
	}
	



	
	/* 별점,,, (숫자로 할지... 별을 채워야할지) */
	.rate-wrap {
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    height: 60px;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-box-align: center;
	    -ms-flex-align: center;
	    align-items: center;
	    color: #666;
	    translate: 0 20px;
	}
	
	/* features 상세 정보(?) */
	.features {
		padding: 18px 0;
	    border-bottom: 1px solid #ccc;
	    margin: 0 0 52px -4px;
	}
	
	.features ul li {
	    position: relative;
	    display: inline-block;
	    width: 48%;
	    font-size: 13px;
	    font-weight: 700;
	    color: #666;
	    padding: 10px 7px 13px 10px;
	    box-sizing: border-box;
	    vertical-align: top;
	    line-height: 18px;
	}
	
	.features .icon[data-v-4c0980f3] {
	    position: absolute;
	    left: 0;
	    top: 12px;
	    width: 35px;
	    font-size: 24px;
	    color: #999;
	}
	
	/* 상품 패키지와 상세옵션 선택 */
	.selected-default {
	    padding: 45px 0;
	    text-align: center;
	}
	
	.selected-default p {
	    line-height: 1.6;
	    color: #666;
	    margin-bottom: 15px;
	}
	.selected-default button {
	    font-weight: 400;
	}		
	.el-button--info, .el-button--info:active {
	    background-color: #666;
	}
	.el-button--info {
	    color: #fff;
	}
	.el-button--medium, .el-button--small {
	    min-width: 80px;
	    height: 35px;
	    line-height: 35px;
	    padding: 0 18px;
	    font-size: 13px;
	    font-weight: 700;
	    border-top-left-radius: 7px;
	    border-top-right-radius: 7px;
	    border-bottom-right-radius: 7px;
	    border-bottom-left-radius: 7px;
	}
	
	.product-detail-view .floating-selected-result .amount {
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    flex-flow: wrap;
	    padding: 0 30px;
	    height: 82px;
	    border-top: 2px solid #999;
	    background-color: #fff;
	}
	
	/* 총 결제 금액 */
	.product-detail-view .floating-selected-result .amount p {
	    -webkit-box-flex: 1;
	    -ms-flex: 1;
	    flex: 1;
	    text-align: right;
	    font-size: 24px;
	    font-weight: 700;
	    color: #f06c5e;
	}
	
	.product-detail-view .btn-order-group {
	    opacity: 1;
	    position: absolute;
	    bottom: 0;
	    right: -20px;
	    width: 340px;
	    margin-left: -1px;
	    height: 70px;
	    background-color: #f06c5e;
	    overflow: hidden;
	    transition: opacity .3s;
	}
	
	/* 카트 css */
	.product-detail-view .btn-order-group button.btn-cart {
	    width: 70px;
	    border-right: 1px solid #f28478;
	    outline: none;
	}	
</style>
<body>
	<div class="container" style="height:auto;">
		<!--티켓 검색부분  -->
		<div class="search_field">
				<div class="date">
					<div class="date_oneway">
						<input type="date" name="dates_start_oneway" value=""  id="dates_start_oneway" class="dates_start_oneway">
					</div>
					<div class="ppl">
						<button type="button" id="modal_btn3" class="ppl_check" data-toggle="modal" data-target="#exampleModalCenter"><span class="ppl_check_text">성인 1명 / 일반석</span></button>
						<div class="black_bg3"></div>
						<div class="member_count modal_wrap3">
							<div class="modal_close3"><span>close</span></div>
							<div class="member_count_entire">
							<span class="ppl_select">인원</span><hr width="460px">
								<ul>
									<li>
										<p class="tit">
		                                            <span class="txt">성인</span><br>
		                                        </p>
		                                        <span class="num_count_group">
		                                            <button class="btn_decrement down"><img src="${pageContext.request.contextPath}/airport/img/minus.png"></button>
		                                            <span class="inpt_counter adultCnt"></span>
		                                            <button class="btn_increment up"><img src="${pageContext.request.contextPath}/airport/img/plus.png"></button>
		                                        </span>
									</li>
									<!--  아동
										<li>
		                                     <p class="tit">
		                                            <span class="txt">아동</span>
		                                     </p>
		                                        <span class="num_count_group">
		                                            <button class="btn_decrement down"><img src="../upload/minus.png"></button>
		                                            <span class="inpt_counter childCnt"></span>
		                                            <button class="btn_increment up"><img src="../upload/plus.png"></button>
		                                       </span>
		                             </li> -->
								</ul>
								<br><br>
								<p class="seat_select">좌석등급</p><hr width="460px">
								<label><input type="radio" value="일반석" name="radio_seat" class="radio_seat">  일반석</label><p>
								<label><input type="radio" value="비즈니스석" name="radio_seat" class="radio_seat">  비즈니스석</label><p>
								<label><input type="radio" value="일등석" name="radio_seat" class="radio_seat">  일등석</label>
								<input type="hidden" value="">
								<p><img src="${pageContext.request.contextPath}/airport/img/caution.png" width="20px" height="15px">  예약 가능 최대 인원은 9명입니다.</p>
								<div class="select_complete"><span class="select_complete_text">선택완료</span></div>
							</div>	
						</div>
						
					</div>
					<div class="search">
						<input type="text" class="air_search" value="항공권 검색">
					</div>
				</div>
		</div>
		
		<!-- 티켓 아래 상세 정보 부분 -->
		<div class="info" style="width: 1250px; height: 770px;">
			<!-- 왼쪽 티켓 이미지 -->
			<div class="ticketImg" style="width: 750px; height: 770px; border: 1px solid black; float:left; translate: 0px;">
				<h2><img src="https://static.hanatour.com/product/2022/03/15/23436zw98i/default.png" style="width: 735px; height: 500px; margin: 0 auto; position: relative; transform: translate(4px, 5px);"> ${ticket_rep_img_path}</h2>
			</div>
			
			<!-- 오른쪽 제목 -->
			<div class="infoFlex" style="width: 450px; height: 770px; border: 1px solid black; float:right; translate: -55px;">
				<div id="productInfoWrap">
					<div class="product-info" style="padding: 40px 40px 60px; height: 770px;">
						<div class="product-title" style="width: 350px;">
							<p class="city" style="font-size: 18px; color: #666; font-weight: 700;">제주시 ${city_name}</p>
							<h2>[제주] 카멜리아힐ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</h2>
							<div class="price-wrap">
								<div class="price" style="margin: 18px 0 0; font-size: 16px;">
									<span class="dc" style="font-size: 32px; color: #f06c5e; font-weight: 700; margin-right: 15px;">10,000원</span>
								</div>
							</div>
							<!-- 찜 버튼 -->
							<div class="btn-group" style="position: absolute; transform: translate(300px, -45px);">
								<i class="bi-heart" style="font-size:2.5rem; color: red; cursor: pointer;"></i>
							</div>
							
							<!-- 별점 -->
							<div class="rate-wrap">
								<h4 style="translate: 15px; font-style: italic;">4.5${ticket_score }</h4>
							</div>
							
							<div class="features">
								<ul style="vertical-align: baseline; translate: 10px 10px;">
									<li>
										<i class="bi bi-check"></i>
										<span>협력사 자체 취소규정</span>
									</li>
									<li>
										<i class="bi bi-check"></i>
										<span>즉시 사용 불가</span>
									</li>
									<li>
										<i class="bi bi-check"></i>
										<span>유효기간 내 사용</span>
									</li>
									<li>
										<i class="bi bi-check"></i>
										<span>e-티켓</span>
									</li>
								</ul>
							</div>
							
							<div class="notice" style="margin: 0 0 65px;">
								<div class="read" style="margin-top: 60px;">
									<div class="title" style="font-weight: 700; font-size: 24px; margin:0 0 27px;">꼭 읽어보세요!</div>
									<div class="dot-list" style="margin: 9px 0; line-height: 1.6;">
										<ul>
											<li style="position: relative; margin: 0; color: #666; padding-left: 10px;"><i class="bi bi-check"></i> 판매기간 : ~2022.12.31 ${ticket_due_date}</li>
											<li style="position: relative; margin: 0; color: #666; padding-left: 10px;"><i class="bi bi-check"></i> 판매기간 : ~2022.12.31 ${ticket_due_date}</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 간단한 유효기간 / 유의사항 -->
					<div class="inner-section" style="max-width: 450px; padding: 50px 70px;">
					</div>
				</div>
			</div>
		</div>
		
		<!-- 캘린더 들어가고 기타 등등... -->
		<div class="product-detail-container" style="width: 1195px; height: 100vh; border: 1px solid black;">
			<div class="detail-wrap" style="position: relative; overflow: visible;">
				<!-- 옆에 뜨는 가격이랑 예약 옵션 -->
				<section class="floating-selected-result" style="position: sticky; top: 0px;"></section>
					<div class="wrap" style="height: 327px;">
						<div class="product-info" style="padding: 45px 30px; border-bottom: 1px solid #ccc;">
							<div class="product-title">
								<p class="city" style="font-size: 16px; color: #666; font-weight: 700;">여수(전남)</p>
								<h1 class="title" style="font-size: 24px; margin: 10px 0 0; font-weight: 700; line-height: 1.4;">[여수] 아르떼뮤지엄 ${ticket_name}</h1>
								<div class="price-wrap" style="margin-top: 0;">
									<div class="price" style="margin-top: 15px; margin: 18px 0 0; font-size: 16px;">
										<span class="dc" style="font-size: 24px; margin-right: 10px; color: #f06c5e; font-weight: 700;">10,000원</span>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 상품패키지, 상세옵션 보여주기 -->
						<div class="selected-products-wrap">
							<div class="selected-default" style="padding: 45px 0; text-align: center;">
								<p> 상품 패키지와 상세 옵션을 <br> 선택해주세요 </p>
								<button type="button" class="el-button el-button--info el-button--small"><span style="position: relative; display: inline-block; vertical-align: top;">선택하기</span></button>
							</div>
						</div>
					</div>
					
					<div style="width:337.87px; height:152px;">
						<div class="amount">
							<strong style="font-size: 15px;">총 결제 금액</strong>
							<p>0${ticket_total_price}원</p>
						</div>
					
						<div class="btn-order-group" style="position: static;">
							<div class="inner" style="width: 340px; height: 70px;">
								<button id="cartBtn" class="btn-cart">
								
								</button>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	</body>
	
<script type="text/javascript">
	
////////////////찜 버튼 하트 아이콘 클릭 (근데 왜 안 먹히는지 모르겠음,,,,ㅎ) ///////////////////
	$(function() {
	   	$('.bi-heart').click(function(){
		    var i = 0;

		    if(i==0){
	            $(this).attr('class','bi-heart-fill');
	            i++;
	        }else if(i==1){
	            $(this).attr('class','bi-heart');
	            i--;
	        }
	
	    });
	});

	
	
////////////////////////출발지역 또는 도착지역 모달창 클릭시 모달실행///////////////////////
	function onClick() {
	    document.querySelector('.modal_wrap').style.display ='block';
	    document.querySelector('.black_bg').style.display ='block';
	    
	}
	function onClick2() {
	    document.querySelector('.modal_wrap2').style.display ='block';
	    document.querySelector('.black_bg2').style.display ='block';
	    
	}
	
	
	function offClick() {
	    document.querySelector('.modal_wrap').style.display ='none';
	    document.querySelector('.black_bg').style.display ='none';
	    
	}
	
	function offClick2() {
	    document.querySelector('.modal_wrap2').style.display ='none';
	    document.querySelector('.black_bg2').style.display ='none';
	    
	}
	
	document.getElementById('modal_btn').addEventListener('click', onClick);
	document.getElementById('modal_btn2').addEventListener('click', onClick2);
	document.querySelector('.modal_close').addEventListener('click', offClick);
	document.querySelector('.modal_close2').addEventListener('click', offClick2);
	//////////////////////////////////////////////////////////////////////////
	
/////////////////////////인원수와 좌석선택 모달/////////////////////////////////
	function pplOnClick() {
	    document.querySelector('.modal_wrap3').style.display ='block';
	    document.querySelector('.black_bg3').style.display ='block';
	    
	}
	
	function pplOffClick() {
	    document.querySelector('.modal_wrap3').style.display ='none';
	    document.querySelector('.black_bg3').style.display ='none';
	    
	}
	
	document.getElementById('modal_btn3').addEventListener('click', pplOnClick);
	document.querySelector('.modal_close3').addEventListener('click', pplOffClick);
///////////////////////////////////////////////////////////////////////////////

////////////////////////인원수 선택 모달///////////////////////////////////////
$(function() {
            // 인원 수 버튼 증감 및 총 금액 부분의 합계 script 부분
            let adultCnt = $('.adultCnt');
            let childCnt = $('.childCnt');

                // 업 버튼 / 다운 버튼
            let up = $('.up');
            let down = $('.down');

                // 성인 가격 / 아동 가격 (서버에서 받아와야 함 - 우선 하드코딩)
            let adultPrice;
            let childPrice;
                // 총 금액 
            let totalPay = $('.con');

                // 인원 수 기본 설정
            adultCnt.text("1");
            childCnt.text("0");

                // 총 금액 기본 설정 (서버에서 받아와야 함 - 우선 하드코딩)
            //totalPay.html('789,000<em>원</em>');

            up.on('click', function() {
                // 누른 버튼 구분 (up / down)
                let isUp = $(this).hasClass('up');

                // 클릭 했을 때의 인원 수
                let cnt = Number($(this).siblings('span').text());
                console.log(cnt);

                // 클릭 했을 때의 전체 인원 수 (패키지 상세 인원 제한을 위한 변수)
                let totalCnt = Number(adultCnt.text()) + Number(childCnt.text());

                // 클릭 했을 때 성인 / 아동 구분
                let isAdult = $(this).siblings('span').hasClass('adultCnt');
                console.log(isAdult);

                // 성인 / 아동 , up / down 구분
                if(isAdult && !isUp) {
                    console.log('성인 down');
                } else if(isAdult && isUp) {
                    console.log('성인 up');
                    // 개수 제한 거는 부분.. (패키지 상세의 인원제한)
                    if(totalCnt >= 9) {
                        return;
                    } else {
                        cnt += 1;
                        adultCnt.text(cnt);
                    }
                } else if(!isAdult && !isUp) {
                    console.log("아동 down");
                } else if(!isAdult && isUp){
                    console.log('아동 up');
                    // 개수 제한 거는 부분.. (패키지 상세의 인원제한)
                    if(totalCnt >= 9) {
                        return;
                    } else {
                        cnt += 1;
                        childCnt.text(cnt);
                    }
                }
            });

            down.on('click', function() {
                // 누른 버튼 구분 (up / down)
                let isUp = $(this).hasClass('up');

                // 클릭 했을 때의 인원 수
                let cnt = $(this).siblings('span').text();
                console.log(cnt);

                // 클릭 했을 때 성인 / 아동 구분
                let isAdult = $(this).siblings('span').hasClass('adultCnt');
                console.log(isAdult);

                // 성인 / 아동 , up / down 구분
                if(isAdult && !isUp) {
                    console.log('성인 down');
                    if(cnt <= 1) {
                        return;
                    }
                    else {
                        cnt -= 1;
                        adultCnt.text(cnt);
                    }
                } else if(isAdult && isUp) {
                    console.log('성인 up');
                } else if(!isAdult && !isUp) {
                    console.log("아동 down");
                    if(cnt <= 0) {
                        return;
                    }
                    else {
                        cnt -= 1;
                        childCnt.text(cnt);
                    }
                } else if(!isAdult && isUp){
                    console.log('아동 up');
                }
            });
        });
///////////////////////////////////////////////////////////////////////////////////

/////////////////////////////성인과 좌석 선택시 값이 들어아게하는 함수///////////////////////////////
$(function(){
	 $(".select_complete").click(function(){
	    	var count = $(".inpt_counter").text();
	    	var seat = $(".radio_seat:checked").val();
	    	
	    	$(".ppl_check_text").text("");
	    	$(".ppl_check_text").text("성인"+ count+"명 / "+seat);
	    	
	    });
});
//////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////날짜 /////////////////////////////
$('.air_search').click(function(){

  var dateFrom = document.getElementById('dates_start_check');	//시작일
  var dateTo = document.getElementById('dates_start_end');	//종료일
  var today = new Date();				//오늘 날짜

  dateFrom = new Date(dateFrom.value);
  var fromYear = dateFrom.getFullYear();
  var fromMonth = dateFrom.getMonth() + 1;
  var fromDay = dateFrom.getDate();

  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
  if (isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)){
    fromYear  = 0;
    fromMonth = 0;
    fromDay   = 0;
  }

	dateFrom = fromYear +'/'+ fromMonth +'/'+fromDay; 

  dateTo = new Date(dateTo.value);
  var toYear  = dateTo.getFullYear();
  var toMonth = dateTo.getMonth() + 1;
  var toDay   = dateTo.getDate();

  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
  if (isNaN(toYear) || isNaN(toMonth) || isNaN(toDay)){
  toYear  = 0;
  toMonth = 0;
  toDay   = 0;
  }

    dateTo = toYear +'/'+ toMonth +'/'+toDay;

  //오늘날짜 날짜 형식으로 지정
  var todayYear  = today.getFullYear(); 	//2020
  var todayMonth = today.getMonth() + 1;    	//06
  var todayDay   = today.getDate();  		//11
  today = todayYear +'/'+ todayMonth +'/'+todayDay;  // 2020/06/11 (형식 지정은 본인 자유)

  //날짜 조회 시, 시작일이 오늘 날짜보다는 크고, 종료일이 시작일보다는 커야하기 때문에 조건을 걸어줌
  if(dateFrom >= today && dateTo >= dateFrom){
  	return true;
  } else {
 	 alert("올바른 날짜를 선택하세요.");
  }
});//click() end

////////////////////////////////편도클릭할때 편도날짜만 선택가능////////////////////////////
$(function(){
	$('.date_oneway').hide();
	
	$('.oneway').click(function(){
		$('.date_start, .date_end').hide();
		$('.date_oneway').show();
	});
	
	$('.round_trip').click(function(){
		$('.date_start, .date_end').show();
		$('.date_oneway').hide();
	});
});

</script>
</html>