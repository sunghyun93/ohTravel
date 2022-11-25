<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/package_detail.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	    border-bottom: 1px solid #ddd;
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
	    border-bottom: 1px solid #ddd;
	    translate: 0 -35px;
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
	    margin: 0 0 26px -4px;
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
	
	.product-detail-view .floating-selected-result {
	    bottom: 0;
	    width: 340px;
	    float: right;
	    padding-top: 70px;
	    margin-right: calc(50% - 620px);
	    border-left: 1px solid #ccc;
	    border-right: 1px solid #ccc;
	    z-index: 7;
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
	
	.product-detail-view .btn-order-group button, .product-detail-view .btn-order-group button .icon {
	    color: #fff;
	}
	
	.blind {
	    overflow: hidden;
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 1px;
	    height: 1px;
	    font-size: 0px;
	    line-height: 0;
	}
	
	.product-detail-view .btn-order-group button.btn-cart .icon {
	    display: inline-block;
	}	
	
	.product-detail-view .btn-order-group button .icon.cart {
	    font-size: 26px;
	    margin-top: 4px;
	}		
	
	.product-detail-view .btn-order-group button[class*=reservation] {
	    font-weight: 700;
	    font-size: 15px;
	    height: 70px;
	    vertical-align: top;
	}
	
	.product-detail-view .product-detail-menu-wrap {
	    position: static;
	    width: 1280px;
	    height: 70px;
	    bottom: 0;
	    left: 0;
	    right: 0;
	    z-index: 8;
	}	
	
	.product-detail-view .product-detail-menu {
	    width: 100%;
	    height: 70px;
	    line-height: 70px;
	    background-color: #fff;
	    border-top: 1px solid #ccc;
	    position: absolute;
	    box-shadow: 0 10px 15px rgb(0 0 0 / 3%);
	    z-index: 10;
	}
	
	.el-tabs__item {
	    position: relative;
	    height: 70px;
	    line-height: 70px;
	    color: #666;
	    font-weight: 600;
	    font-size: 15px;
	}
	
	.el-tabs__active-bar {
	    background-color: #f06c5e;
	}
	
	.resize-triggers, .resize-triggers > div, .contract-trigger:before {
	    content: " ";
	    display: block;
	    position: absolute;
	    top: 0;
	    left: 0;
	    height: 100%;
	    width: 100%;
	    overflow: hidden;
	    z-index: -1;
	}
	
	.resize-triggers {
	    animation: 1ms resizeanim;
	    visibility: hidden;
	    opacity: 0;
	}
	
	/* 예약하기 (빨간 배경) 부분 */
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
	    -webkit-transition: opacity .3s;
	    transition: opacity .3s;
	}
	
	.product-detail-view .product-detail-wrap .point-background .left-content {
	    margin-top: 0;
	    padding-top: 80px;
	    padding-bottom: 80px;
	}	
	
	.product-detail-view .product-detail-wrap .left-content {
	    position: relative;
	    width: 860px;
	    padding-right: 90px;
	    padding-top: 30px;
	    box-sizing: border-box;
	}
	
	/* 상품타입 css */
	.product-detail-view .section-title {
	    font-size: 24px;
	    font-weight: 700;
	    margin: 0 0 24px;
	    position: relative;
	}	
	
	/* 인원 정보 부분 */
	.pay_info .member_count.type ul {
	    width: 100%;
	    border: 1px solid #ddd;
	}
	.pay_info .member_count.type li {
	    float: left;
	    width: 50%;
	    margin: 0;
	    padding: 30px 0;
	    border-left: 1px solid #ddd;
	    text-align: center;
	    vertical-align: top;
	}
	.pay_info .member_count.type li:first-child {
	    width: 50%;
	    border-left: none;
	}
	
	.pay_info .member_count.type li .tit {
	    display: block;
	    width: 100%;
	    font-size: 15px;
	    font-weight: 600;
	    color: #111;
	}
	.pay_info .member_count.type li .tit {
	    text-align: center;
	}
	.pay_info .member_count.type li .txt {
	    margin-top: 5px;
	    font-size: 13px;
	    font-weight: 400;
	    color: #666;
	}
	.pay_info .member_count.type li .tit .txt {
	    top: 0;
	    margin: 0 0 0 5px;
	}
	/* 명수 부분 */
	.num_count_group {
	    display: inline-block;
	    width: 114px;
	    height: 38px;
	    border: 1px solid #c3c3c3;
	    border-radius: 2px;
	}
	.pay_info .member_count.type li .num_count_group {
	    margin-top: 25px;
	}
	.num_count_group .inpt_counter {
	    float: left;
	    display: block;
	    font-size: 15px;
	    color: #111;
	    width: 34px;
	    height: 36px;
	    line-height: 34px;
	    text-align: center;
	    margin: 0 4px;
	}
	/* 가격 부분 */
	.pay_info .member_count.type li .price_group {
	    margin-top: 25px;
	}
	.pay_info .member_count.type li .price {
	    color: #111;
	}
	
	/* 찜 버튼  */
	.btn_wrap .btn-like {
	    width: 60px;
	    height: 56px;
	    border-radius: 5px;
	    border-color: #c3c3c3;
	    box-shadow: none;
	    color: #0e1c35;
	}
	
	.material-symbols-outlined-empty {
	    font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 10;
	    font-family: 'Material Symbols Outlined';
	    line-height: normal;
	    font-size: 19px;
	}	
	
	
</style>
<body>
	<div class="container" style="height:auto;">
		<div class="info" style="width: 1250px; height: 770px;">
			<!-- 왼쪽 티켓 이미지 -->
			<div class="ticketImg" style="width: 750px; height: 770px; border: 1px solid black; float:left; translate: 0px;">
				<h2><img src="https://static.hanatour.com/product/2022/03/15/23436zw98i/default.png" style="width: 735px; height: 500px; margin: 0 auto; position: relative; transform: translate(4px, 139px);"> ${ticket_rep_img_path}</h2>
			</div>
			
			<!-- 오른쪽 제목 -->
			<div class="infoFlex" style="width: 450px; height: 770px; border: 1px solid black; float:right; translate: -55px;">
				<div id="productInfoWrap">
					<div class="product-info" style="padding: 40px 40px 60px; height: 770px;">
						<div class="product-title" style="width: 350px; float: right; translate: -30px 90px;">
							<p class="city" style="font-size: 18px; color: #666; font-weight: 700;">여수(전남) ${city_name}</p>
							<h2 style="font-weight: 700">[여수] 아르떼뮤지엄</h2>
							<div class="price-wrap">
								<div class="price" style="margin: 18px 0 0; font-size: 16px;">
									<span class="dc" style="font-size: 32px; color: #f06c5e; font-weight: 700; margin-right: 15px;">10,000원</span>
								</div>
							</div>
							<!-- 찜 버튼 -->
							<div class="btn-group" style="position: absolute; transform: translate(300px, -55px);">
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
								<div class="read" style="margin-top: 30px;">
									<div class="title" style="font-weight: 700; font-size: 24px; margin:0 0 27px;">꼭 읽어보세요!</div>
									<div class="dot-list" style="margin: 9px 0; line-height: 1.6;">
										<ul>
											<li style="position: relative; margin: 0; color: #666; padding-left: 10px;"><i class="bi bi-check"></i> 판매기간 : ~2022.12.31 ${ticket_due_date}</li>
											<li style="position: relative; margin: 0; color: #666; padding-left: 10px;"><i class="bi bi-check"></i> 유효기간 : ~2022.12.31 ${ticket_due_date}</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="ly_wrap prod_detail">
                    <!-- 상세 정보 왼쪽 부분 -->
                    <div class="inr">
                        <!-- 상품일정 -->
                        <div class="cont_unit summary">
                            <div class="text_wrap big top">
                                <strong class="tit">상품일정</strong>
                                <div class="ticket_admission_date" style="translate: 0 20px;">
									<input type="date" name="dates_start_oneway" value=""  id="dates_start_oneway" class="dates_start_oneway">
								</div>
                            </div>
                        </div>

                        <hr class="pkg">

                        <!-- 상품정보 (사진)-->
                        <div class="cont_unit pic">
                            <div class="text_wrap big">
                                <strong class="tit">상품정보</strong>
                            </div>
                            <img src="https://image6.yanolja.com/leisure/ZUgATmFmGlcFVcTC">
                            <div class="option_wrap"></div>
                        </div>

                        <hr class="pkg">
                        
                        <div class="cont_unit">
                        
                        </div>
                    </div><!-- inr -->

                    <!-- 상세 정보 오른쪽 부분 -->
                    <div class="inr right">
                        <div class="text_wrap big">
                            <strong class="tit">인원선택</strong>
                        </div>

                        <div class="cont_unit js_sticky" style="right: auto; left: 0px;">
                            <div class="member_count">
                                <ul>
                                    <li>
                                        <p class="tit">
                                            <span class="txt">성인</span>
                                            <span class="price">17,000 ${ticket_adult_price}원</span>
                                        </p>
                                        <span class="num_count_group">
                                        	<input type="button" onclick='count("minus")'  value="-"/>
                                        	<span id="result1" class="adultCnt">1</span>
                                        	<input type="button" onclick='count("plus")' value="+"/>
                                        </span>
                                    </li>
                                    <li>
                                        <p class="tit">
                                            <span class="txt">아동</span>
                                            <span class="price">10,000 ${ticket_adult_price}원</span>
                                        </p>
                                        <span class="num_count_group">
                                        	<input type="button" onclick='count("minus")'  value="-"/>
                                        	<span id="result2" class="childCnt">0</span>
                                        	<input type="button" onclick='count("plus")' value="+"/>
                                        </span>
                                    </li>
                                </ul>
                            </div>

                            <div class="cont_wrap">
                                <hr class="pkg">
                                <div class="total_pay_price">
                                    <div class="row final">
                                        <p class="tit">총 금액</p>
                                        <p class="con"></p>
                                    </div>
                                </div>
                                <hr class="pkg">
                                <div class="cont_unit foot">
                                    <div class="btn_wrap">
                                        <button class="btn-rv" style="width: 250px;">예약</button>
<!--                                         <button class="btn-like">
                                            <span class="btn-like-span material-symbols-outlined-empty">favorite</span>
                                        </button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- inr right -->
                </div> <!-- prod_detail -->
	</div>

	<script>
		////////////////찜 버튼 하트 아이콘 클릭 (근데 왜 안 먹히는지 모르겠음,,,,ㅎ) ///////////////////
		var i = 0;
		$(function() {
			$('.bi-heart').click(function() {

				if (i == 0) {
					$(this).attr('class', 'bi-heart-fill');
					i++;
				} else if (i == 1) {
					$(this).attr('class', 'bi-heart');
					i--;
				}

			});
		});

		////////////////////////출발지역 또는 도착지역 모달창 클릭시 모달실행///////////////////////
		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';

		}
		function onClick2() {
			document.querySelector('.modal_wrap2').style.display = 'block';
			document.querySelector('.black_bg2').style.display = 'block';

		}

		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';

		}

		function offClick2() {
			document.querySelector('.modal_wrap2').style.display = 'none';
			document.querySelector('.black_bg2').style.display = 'none';

		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.getElementById('modal_btn2').addEventListener('click',
				onClick2);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);
		document.querySelector('.modal_close2').addEventListener('click',
				offClick2);
		//////////////////////////////////////////////////////////////////////////


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
				let totalCnt = Number(adultCnt.text())
						+ Number(childCnt.text());

				// 클릭 했을 때 성인 / 아동 구분
				let isAdult = $(this).siblings('span').hasClass('adultCnt');
				console.log(isAdult);

				// 성인 / 아동 , up / down 구분
				if (isAdult && !isUp) {
					console.log('성인 down');
				} else if (isAdult && isUp) {
					console.log('성인 up');
					// 개수 제한 거는 부분.. (패키지 상세의 인원제한)
					if (totalCnt >= 9) {
						return;
					} else {
						cnt += 1;
						adultCnt.text(cnt);
					}
				} else if (!isAdult && !isUp) {
					console.log("아동 down");
				} else if (!isAdult && isUp) {
					console.log('아동 up');
					// 개수 제한 거는 부분.. (패키지 상세의 인원제한)
					if (totalCnt >= 9) {
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
				if (isAdult && !isUp) {
					console.log('성인 down');
					if (cnt <= 1) {
						return;
					} else {
						cnt -= 1;
						adultCnt.text(cnt);
					}
				} else if (isAdult && isUp) {
					console.log('성인 up');
				} else if (!isAdult && !isUp) {
					console.log("아동 down");
					if (cnt <= 0) {
						return;
					} else {
						cnt -= 1;
						childCnt.text(cnt);
					}
				} else if (!isAdult && isUp) {
					console.log('아동 up');
				}
			});
		});
		///////////////////////////////////////////////////////////////////////////////////

		////////////// 상품 사용일자 선택 ////////////////////////////
		$(function() {
			$('.ticket_admission_date').hide();

			$('.oneway').click(function() {
				$('.date_start, .date_end').hide();
				$('.ticket_admission_date').show();
			});

			$('.round_trip').click(function() {
				$('.date_start, .date_end').show();
				$('.ticket_admission_date').hide();
			});
		});

		$(function() {
			/* 인원 수 버튼 증감 및 총 금액 부분의 합계 script 부분 */

			// 어른 / 아동 인원수
			let adultCnt = $('.adultCnt');
			let childCnt = $('.childCnt');

			// 업 버튼 / 다운 버튼
			let up = $('.up');
			let down = $('.down');

			// 성인 가격 / 아동 가격 (서버에서 받아와야 함 - 우선 하드코딩)
			let adultPrice = 200000;
			let childPrice = 100000;

			// 총 금액 (기본적으로 성인이 1명 선택되어있기 때문에 시작하자마자 성인 가격을 대입함)
			let totalPrice = adultPrice;
			// 총 금액 객체
			let totalPay = $('.con');

			// 인원 수 기본 설정
			adultCnt.text("1");
			childCnt.text("0");

			// 총 금액 기본 설정 (서버에서 받아와야 함 - 우선 하드코딩)
			totalPay.html(adultPrice + '<em>원</em>');

			up.on('click', function() {
				// 누른 버튼 구분 (up / down)
				let isUp = $(this).hasClass('up');

				// 클릭 했을 때의 클릭한 부분의 인원 수 (siblings() 를 사용해봄)
				let cnt = Number($(this).siblings('span').text());
				console.log(cnt);

				// 클릭 했을 때의 전체 인원 수 (패키지 상세 인원 제한을 위한 변수)
				let totalCnt = Number(adultCnt.text())
						+ Number(childCnt.text());

				// 클릭 했을 때 성인 / 아동 구분
				let isAdult = $(this).siblings('span').hasClass('adultCnt');
				console.log(isAdult);

				// 성인 / 아동 , up / down 구분
				if (isAdult && !isUp) {
					console.log('성인 down');
				} else if (isAdult && isUp) {
					console.log('성인 up');
					// 개수 제한 거는 부분.. (패키지 상세의 인원제한)
					if (totalCnt >= 10) {
						return;
					} else {
						cnt += 1;
						adultCnt.text(cnt);

						// 총 금액 설정
						totalPrice += adultPrice;
					}
				} else if (!isAdult && !isUp) {
					console.log("아동 down");
				} else if (!isAdult && isUp) {
					console.log('아동 up');
					// 개수 제한 거는 부분.. (패키지 상세의 인원제한)
					if (totalCnt >= 10) {
						return;
					} else {
						cnt += 1;
						childCnt.text(cnt);

						// 총 금액 설정
						totalPrice += childPrice;
					}
				}

				// 총 금액 부분에 내용 삽입
				totalPay.html(totalPrice + '<em>원</em>');
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
				if (isAdult && !isUp) {
					console.log('성인 down');
					if (cnt <= 1) {
						return;
					} else {
						cnt -= 1;
						adultCnt.text(cnt);

						// 총 금액 설정
						totalPrice -= adultPrice;
					}
				} else if (isAdult && isUp) {
					console.log('성인 up');
				} else if (!isAdult && !isUp) {
					console.log("아동 down");
					if (cnt <= 0) {
						return;
					} else {
						cnt -= 1;
						childCnt.text(cnt);

						// 총 금액 설정
						totalPrice -= childPrice;
					}
				} else if (!isAdult && isUp) {
					console.log('아동 up');
				}

				totalPay.html(totalPrice + '<em>원</em>');
			});

			/* 여행일정 부분 화살표 및 active class 부여 */
			let daylist = $('.daylist'); // 각 일정의 a태그
			$(daylist).on('click', function(e) {
				e.preventDefault(); // 이벤트를 취소할 때 사용하는 메서드, 클릭 이벤트를 취소하여 페이지 이동을 막을 수 있습니다.
				let viewDiv = $(this).siblings('div.view'); // 안에 있는 내용 div

				if (!$(this).hasClass('active')) {
					$(this).addClass('active');
					viewDiv.css('display', 'block');
				} else {
					$(this).removeClass('active');
					viewDiv.css('display', 'none');
				}
			});
			
			
			/* 인원 증감 함수,,, */
			function count(type) {
				const resultElement = document.getElementById('result');
				
				// 현재 화면에 표시된 값
				let number = resultElement.innerText;
				
				// 더하기 / 빼기
				if(type === 'plus') {
					number = parseInt(number) + 1;
				} else if(type === 'minus') {
			    	if( parseInt(number) > 1) {
			            number = parseInt(number) - 1;
			          }
			          else {
			            number = 1;
			          }
				}
				
				// 결과 출력
				resultElement.innerText = number;
			}

		});
	</script>
</body>
</html>