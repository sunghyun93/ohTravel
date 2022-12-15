<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- google fonts icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/package_detail.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/css/hotel/style.css">
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
	    background-image: url(http://localhost:8399/img/pkage/icon/icon_minus.png);
	    background-repeat: no-repeat;
	    background-position: 0px 0px;
	}
	.num_count_group .btn_increment:after {
	    display: inline-block;
	    content: '';
	    background-image: url(http://localhost:8399/img/pkage/icon/icon_plus.png);
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
	
	/* 예약하기 부분 */
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
	.count-wrap {position: relative;padding: 0 38px;border: 1px solid #ddd;overflow: hidden;width: 60px;}
	.count-wrap > button {border: 0;background: #ddd;color: #000;width: 38px;height: 38px;position: absolute;top: 0;font-size: 12px;}
	.count-wrap > button.minus {left: 0;}
	.count-wrap > button.plus {right: 0;}
	.count-wrap .inp {border: 0;height: 38px;text-align: center;display: block;width: 100%;}
	
	.dot-list li {
	    position: relative;
	    margin: 0;
	    color: #666;
	    padding-left: 10px;
	}	
	
	.dot-list>p, .dot-list li {
	    line-height: 1.6;
	}
	
	.ticket_name {
		min-height: 5rem;
		overflow-y: hidden;
		resize: non;
	}
	
</style>
<body>
<input type="hidden" id="rv_real_id" value="${rv_real_id}">
	<div class="container" style="height:auto;">
		<div class="info" style="width: 1250px; height: 770px;">
			<!-- 왼쪽 티켓 이미지 -->
			<div class="ticketImg" style="width: 750px; height: 770px; border: 1px solid #808080; float:left; translate: 0px;">
				<h2><img src="${ticketDetail.ticket_rep_img_path}" style="width: 735px; height: 500px; margin: 0 auto; position: relative; transform: translate(4px, 139px);"></h2>
			</div>
			
			<!-- 오른쪽 제목 -->
			<div class="infoFlex" style="width: 450px; height: 770px; border: 1px solid #808080; float:right; translate: -55px;">
				<div id="productInfoWrap">
					<div class="product-info" style="padding: 40px 40px 60px; height: 770px;">
						<div class="product-title" style="width: 350px; height:660px; float: right; translate: -30px 20px;">
							<p class="city" style="font-size: 18px; color: #666; font-weight: 700;">${ticketDetail.city_name}</p>
							<!-- 제목 -->
							<textarea class="ticket_name" style="font-weight: 700; font-size:24px; border:none; width: 370px; height:110px; word-break:normal; resize:none;" cols="5" name="ticket_name" placeholder="${ticketDetail.ticket_name }" readonly></textarea>
							<div class="price-wrap">
								<div class="price" style="margin: 18px 0 0; font-size: 16px;">
									<input type="text" class="dc" style="font-size: 32px; color: #f06c5e; font-weight: 700; width: 99px; border:none;" name="ticket_child_price" value="${ticketDetail.ticket_child_price}" readonly>
									<span type="text" class="dc" style="font-size: 32px; color: #f06c5e; font-weight: 700; margin-right: 15px; width: 160px; border:none; translate:-20px;" >원~</span>
								</div>
							</div>
							<!-- 찜 버튼 -->
							<div class="btn-group" style="position: absolute; transform: translate(300px, -55px);">
								<i class="bi-heart" style="font-size:2.5rem; color: red; cursor: pointer;"></i>
							</div>
							
							<!-- 별점 -->
							<div class="rate-wrap">
								<h4 style="translate: 15px; font-style: italic;" class="star_scr" id="star_scr">${ticketDetail.ticket_score }</h4>
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
											<li style="position: relative; margin: 0; color: #666; padding-left: 10px;"><i class="bi bi-check"></i> 판매기간 : ~<fmt:formatDate value="${ticketDetail.ticket_due_date}" pattern="yyyy-MM-dd"/></li>
											<li style="position: relative; margin: 0; color: #666; padding-left: 10px;"><i class="bi bi-check"></i> 유효기간 : ~<fmt:formatDate value="${ticketDetail.ticket_due_date}" pattern="yyyy-MM-dd"/></li>
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
                                	<!-- ticket_admission_date -->
                               		<div class="date">
										<div class="date_start" style="translate: 0 20px;">
											<input type="date" name="adDate" id="adDate" class="adDate" onchange="getDate()" value='2022-12-20' min="2022-12-20" max="2022-12-31">
											<!-- <input type="date" name="adDate" id="adDate" class="adDate" onchange="input()"> -->
										</div>
									</div>
                            </div>
                        </div>

                        <hr class="pkg">

                        <!-- 상품정보 (사진)-->
                        <div class="cont_unit pic">
                            <div class="text_wrap big">
                                <strong class="tit">상품정보</strong>
                            </div>
                            
                            <img src="${ticketDetail.ticket_detail_img_path }">
                            <div class="option_wrap"></div>
                        </div>

                        <hr class="pkg">
                        
                        <!-- 사용방법 -->
                        <div class="cont_unit pic">
                            <div class="text_wrap big">
                                <strong class="tit">사용방법</strong>
                            </div>
                            <div class="how-to-use" style="color: #666;">
                            	<div class="dot-list" style="margin: 9px 0; line-height: 1.6;">
                            		<ul style="margin: 17px 0; list-style-type:disc;">
                            			<li><i class="bi bi-check"></i> 당일 구매 당일 사용 가능 (당일 구매 1시간 후 사용가능)</li>
                            			<li><i class="bi bi-check"></i> 현장 매표소에서 구매자 성함 확인 및 휴대폰 번호 뒷자리 제시!</li>
                            			<li><i class="bi bi-check"></i> 입장 후 신나게 즐기기!</li>
                            		</ul>
                            	</div>
                            </div>
                            
                            <div class="option_wrap"></div>
                        </div>

                        <hr class="pkg">
                        
                        <!-- 유의사항 -->
                        <div class="cont_unit pic">
                            <div class="text_wrap big">
                                <strong class="tit">유의사항</strong>
                            </div>
                            <div class="how-to-use" style="color: #666;">
                            	<div class="dot-list" style="margin: 9px 0; line-height: 1.6;">
                            		<ul style="margin: 17px 0; list-style-type:disc;">
                            			<li><i class="bi bi-check"></i> 업체주소 : <b>${ticketDetail.ticket_location }</b></li>
                            			<li><i class="bi bi-check"></i> 운영시간 : 매일 11:00 ~ 22:00 [입장마감 21:00]</li>
                            			<li><i class="bi bi-check"></i> 마감 1시간 전에 방문하셔야 입장이 가능합니다.</li>
                            			<li><i class="bi bi-check"></i> 휴무일 : 연중무휴</li>
                            			<li><i class="bi bi-check"></i> 무료입장 : 24개월 미만 (증빙서류 필수 지참)</li>
                            		</ul>
                            	</div>
                            </div>
                            
                            <div class="option_wrap"></div>
                        </div>
                        
                        <hr class="pkg">
                        
                        <!-- 취소 및 환불규정 -->
                        <div class="cont_unit pic">
                            <div class="text_wrap big">
                                <strong class="tit">유의사항</strong>
                            </div>
                            <div class="how-to-use" style="color: #666;">
                            	<div class="dot-list" style="margin: 9px 0; line-height: 1.6;">
                            		<ul style="margin: 17px 0; list-style-type:disc;">
                            			<li><i class="bi bi-check"></i> 유효기간 내 취소/환불 가능</li>
                            			<li><i class="bi bi-check"></i> 미사용 티켓 100% 환불가능</li>
                            			<li><i class="bi bi-check"></i> 사용한 티켓 환불 불가</li>
                            			<li><i class="bi bi-check"></i> 중복 할인 적용 불가</li>
                            		</ul>
                            	</div>
                            </div>
                            
                            <div class="option_wrap"></div>
                        </div>

                        <hr class="pkg">
                        
                        <!-- 리뷰 시작 -->
                        <div class="cont_unit">
							<div class="all_review">
								리뷰
								<div class="rv_stats">
									별점 통계가 들어가요
								</div>
								
								<div class="rv_btn">
									<button class="genric-btn primary ela" data-toggle="modal" onclick="openModal()" data-target="#reviewModal">리뷰 등록</button>
								</div>
									
								<div class="show_review"> <!-- 리뷰 테이블에서 저장된 값 불러오기 -->
									<!-- 리뷰 들어갈 위치에 table생성 -->
									<table id="reviewTable" class="reviewTable"> <!-- id값 변경 X -->
										
									</table>
								</div> <!-- show_review -->
								
								<nav class="review-pagination blog-pagination justify-content-center d-flex">
									<!-- 페이징 처리 들어갈 위치 -->
									 <ul class="pagination" id="reviewPaginationUl">
									     
									 </ul>
								</nav>
							</div> <!-- all_review (리뷰 끝)-->
							
							<!-- 리뷰 모달 (있어야할 위치는 상관없습니다..)-->
							<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="modalLongTitle">리뷰 작성</h5>
									        <button type="button" class="close" data-dismiss="modal" onclick="closeModal()" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
						      </div>
						      <div class="modal-body">
						      	<span class="star">
							      	 ★★★★★
							      	 <span>★★★★★</span>
				 					 <input type="range" oninput="drawStar()" id="starRate" value="1" step="1" min="0" max="10">
								</span>
						      	
					        	<div class="form-group">
						            <label for="message-text" class="col-form-label">내용:</label>
						            <textarea class="form-control" id="review-text"></textarea>
					         	</div>
					         	
					       		<!-- registerReview() -->
					         	
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" onclick="registerReview()">리뷰 등록</button>
						        <button type="button" class="btn btn-secondary" onclick="closeModal()" data-dismiss="modal">취소</button>
						      </div>
						    </div>
						  </div>
						</div>
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
                                            <span class="price">${ticketDetail.ticket_adult_price }원</span>
                                        </p>
                                        <span class="num_count_group">
                                            <button type="button" class="btn_decrement down"></button>
                                            <span class="inpt_counter adultCnt">0</span>
                                            <button type="button" class="btn_increment up"></button>
                                        </span>
                                    </li>
                                    <li>
                                        <p class="tit">
                                            <span class="txt">아동</span>
                                            <span class="price">${ticketDetail.ticket_child_price }원</span>
                                        </p>
                                        <span class="num_count_group">
                                            <button type="button" class="btn_decrement down"></button>
                                            <span class="inpt_counter childCnt"></span>
                                            <button type="button" class="btn_increment up"></button>
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
                                        <button type="button" class="btn-rv" style="width: 250px;" value="예약하기" onclick="goReserve('${ticketDetail.ticket_id}')">예약하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- inr right -->
                </div> <!-- prod_detail -->
	</div>
	
	
	<!-- 리뷰 모달 (있어야할 위치는 상관없습니다..)-->
	<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
	    
				<div class="modal-header">
					<h5 class="modal-title" id="modalLongTitle">리뷰 작성</h5>
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal()" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			      
				<div class="modal-body">
					<span class="star">
						★★★★★
						<span>★★★★★</span>
						<input type="range" oninput="drawStar()" id="starRate" value="1" step="1" min="0" max="10">
					</span>
					<div class="form-group">
						<label for="message-text" class="col-form-label">내용:</label>
						<textarea class="form-control" id="review-text"></textarea>
					</div>
				</div>
			      
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="registerReview()">리뷰 등록</button>
					<button type="button" class="btn btn-secondary" onclick="closeModal()" data-dismiss="modal">취소</button>
				</div>
				
			</div> <!-- modal-content -->
		</div> <!-- modal-dialog-centered -->
	</div> <!-- 리뷰 모달 끝 -->
	
	
	<!-- 예약 -->
	<form action="/ticket/exhPayment" name="ReserveForm" method="post">
		<input type="hidden" name="ticket_id"   value="">
		<input type="hidden" name="ticket_name" value="">
		<input type="hidden" name="totalPay"    value="">
		<input type="hidden" name="adultCnt"    value="">
		<input type="hidden" name="childCnt"    value="">
		<input type="hidden" name="adDate"      value="">
	</form>

	
	<script>
	$(function() {
	    /* 인원 수 버튼 증감 및 총 금액 부분의 합계 script 부분 */

	    // 어른 / 아동 인원수
	    let adultCnt = $(".adultCnt");
	    let childCnt = $(".childCnt");

	    // 업 버튼 / 다운 버튼
	    let up = $(".up");
	    let down = $(".down");

	    // 성인 가격 / 아동 가격 (서버에서 받아와야 함)
	    let adultPrice = ${ticketDetail.ticket_adult_price};
	    let childPrice = ${ticketDetail.ticket_child_price};

	    // 총 금액 (기본적으로 성인이 1명 선택되어있기 때문에 시작하자마자 성인 가격을 대입함)
	    let totalPrice = adultPrice;
	    // 총 금액 객체
	    let totalPay = $(".con");

	    // 인원 수 기본 설정
	    adultCnt.text("1");
	    childCnt.text("0");

	    // 총 금액 기본 설정 (서버에서 받아와야 함 - 우선 하드코딩)
	    totalPay.html(adultPrice + "<em>원</em>");

	    up.on("click", function () {
	        // 누른 버튼 구분 (up / down)
	        let isUp = $(this).hasClass("up");

	        // 클릭 했을 때의 클릭한 부분의 인원 수 (siblings() 를 사용해봄)
	        let cnt = Number($(this).siblings("span").text());
	        console.log(cnt);

	        // 클릭 했을 때의 전체 인원 수 (패키지 상세 인원 제한을 위한 변수)
	        let totalCnt = Number(adultCnt.text()) + Number(childCnt.text());

	        // 클릭 했을 때 성인 / 아동 구분
	        let isAdult = $(this).siblings("span").hasClass("adultCnt");
	        console.log(isAdult);

	        // 성인 / 아동 , up / down 구분
	        if (isAdult && !isUp) {
	            console.log("성인 down");
	        } else if (isAdult && isUp) {
	            console.log("성인 up");
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
	            console.log("아동 up");
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
	        totalPay.html(totalPrice + "<em>원</em>");
	    });

	    down.on("click", function () {
	        // 누른 버튼 구분 (up / down)
	        let isUp = $(this).hasClass("up");

	        // 클릭 했을 때의 인원 수
	        let cnt = $(this).siblings("span").text();
	        console.log(cnt);

	        // 클릭 했을 때 성인 / 아동 구분
	        let isAdult = $(this).siblings("span").hasClass("adultCnt");
	        console.log(isAdult);

	        // 성인 / 아동 , up / down 구분
	        if (isAdult && !isUp) {
	            console.log("성인 down");
	            if (cnt <= 1) {
	                return;
	            } else {
	                cnt -= 1;
	                adultCnt.text(cnt);

	                // 총 금액 설정
	                totalPrice -= adultPrice;
	            }
	        } else if (isAdult && isUp) {
	            console.log("성인 up");
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
	            console.log("아동 up");
	        }

	        totalPay.html(totalPrice + "<em>원</em>");
	    });
		    
		/* 찜 버튼 하트 아이콘 클릭  */
		var i = 0;
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
	
	/* 값(입장권명, 성인 인원, 아동 인원, 총 금액, 사용일) 들고 예약 페이지로 이동 */
	function goReserve(ticket_id) {
		
			let adultCnt = $(".adultCnt").html();
			let childCnt = $(".childCnt").html();
		    let adDate = $("#adDate").val();
	
		    // 성인 가격 / 아동 가격
		    let adultPrice = ${ticketDetail.ticket_adult_price};
		    let childPrice = ${ticketDetail.ticket_child_price};
	
		    let totalPay =  parseInt((adultPrice * parseInt(adultCnt)) + (childPrice * parseInt(childCnt)));
		    
			let ticket_name = "${ticketDetail.ticket_name }"

			console.log("ticket_id : " + ticket_id)
		    console.log("totalPay : " + totalPay)
			console.log("adultCnt->"+adultCnt);
			
			$('input[name=ticket_name]').attr('value', ticket_name);
			$('input[name=totalPay]').attr('value', totalPay);
			$('input[name=adultCnt]').attr('value', adultCnt);
			$('input[name=childCnt]').attr('value', childCnt);
			$('input[name=adDate]').attr('value', adDate);
			$('input[name=ticket_id]').attr('value', ticket_id);
			
			ReserveForm.submit();
	} 	
    </script>
    <script src="${pageContext.request.contextPath }/js/review/review.js"></script>
</body>
</html>