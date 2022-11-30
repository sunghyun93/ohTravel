<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="nice-select.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<script src="https://www.jqueryscript.net/demo/Mobile-friendly-Custom-Scrollbar-Plugin-With-jQuery-NiceScroll/js/jquery.nicescroll.min.js"></script>
<script>
    $(document).ready(function(){
        // selectbox styling
        $('select').niceSelect();
        $('#select').css('color', 'red');
    });
</script>

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
</style>
</head>
<style>
	.single_sidebar_widget {
	    /* background: #fbf9ff; */
	    padding: 15px;
	    width: 350px;
	    margin: 0 auto;
	    margin-bottom: 30px;
	}
	
	.boxed-btn {
	    background: #fff;
	    color: #014b85 !important;
	    display: inline-block;
	    padding: 18px 44px;
	    font-family: "Barlow Condensed";
	    font-size: 14px;
	    font-weight: 400;
	    border: 0;
	    border: 1px solid #014b85;
	    letter-spacing: 3px;
	    text-align: center;
	    color: #014b85;
	    text-transform: uppercase;
	    cursor: pointer;
	}
	
	.search_widget .form-control {
	    height: 50px;
	    border-color: #f0e9ff;
	    font-size: 13px;
	    color: #999999;
	    padding-left: 20px;
	    border-radius: 0;
	    border-right: 0;
	}
	
	.search_widget .input-group button {
	    background: #014b85;
	    border-left: 0;
	    border: 1px solid #f0e9ff;
	    padding: 7px 8px;
	    border-left: 0;
	    cursor: pointer;
	}
	
/* 	.mb-30 {
	    margin-bottom: 30px;
	    translate: 300px;
	} */
	
	.container {
	    width: 85%;
	    padding-right: 15px;
	    padding-left: 15px;
	    margin-right: auto;
	    margin-left: auto;
	}
	
	input[type=text].form-control {
	    width: 84%;
	    height: 40px;
	    padding: 15px;
	    font-size: 14px;
	    color: #333;
	    border: 1px solid #ccc;
	    border-radius: 7px;
	}
	
	.app-category {
		width: 200px;
		height: 460.88px;
		margin-bottom: 5px;
	}
	
	.filter-title {
	    position: relative;
	    padding: 24px 0 5px;
	    font-size: 16px;
	    border-bottom: 1px solid #999;
	}

	.el-menu {
	    border-right: 0;
	    border-bottom: 1px solid #999;
	    list-style: none;
	    position: relative;
	    margin: 0;
	    padding-left: 0;
	}
	.el-menu-item>a {
	    display: block;
	    padding: 8px 0;
	    z-index: 10;
	    white-space: normal;
	    line-height: 1.4;
	}
	.el-menu-item * {
	    vertical-align: middle;
	    margin-left: -20px;
	}
	.el-submenu .el-menu-item--theme-grey:first-child {
    	padding-top: 15px;
	}
	.el-submenu .el-menu-item--theme-grey a, .el-submenu .el-submenu--theme-grey .el-menu .el-menu-item a {
	    position: relative;
	    display: block;
	    padding: 5px 20px 5px 33px;
	}
	
	.el-submenu .el-menu-item--theme-grey {
	    padding-right: 0;
	    background-color: #f7f7f7;
	}
	.el-submenu .el-menu-item--theme-grey, .el-submenu .el-submenu--theme-grey .el-menu .el-menu-item {
	    min-width: auto;
	    height: auto;
	    border-top: none;
	    font-weight: 400;
	    line-height: 1.4;
	}
	.el-menu-item, .el-submenu__title {
	    height: auto;
	    padding: 0;
	    font-weight: 700;
	    color: #666;
	    border-top: 1px solid #e5e5e5;
	}
	
	.app-list-header[data-v-0c945636] {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-box-align: center;
	    -ms-flex-align: center;
	    align-items: center;
	    position: relative;
	    height: 50px;
	    margin-bottom: 30px;
	    padding: 35px 0 34px;
	    border-bottom: 1px solid #999;
	    
	    
	    /* 모달창 CSS  */
	    #modal.modal-overlay {
	    	width: 100%;
	    	height: 100%;
	    	position: absolute;
	    	left: 0;
	    	top: 0;
	    	display: flex;
	    	flex-direction: column;
	    	align-items: center;
	    	justify-content: center;
	    	
	    	background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
	    }
	    
	    #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
       #modal .title h2 {
            display: inline;
        }
        
       #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }        
	}
</style>
<body>
	<!-- 다 담는 -->
	<section class="container filter-area">
		<!-- 검색창 -->
		<div class="search">
			<aside class="single_sidebar_widget search_widget">
				<form action="#">
					<div class="form-group">
						<div class="input-group mb-3">
							<input type="text" id="modal_btn" class="form-control"
								placeholder='여행지, 상품, 장소를 검색해 보세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '여행지, 상품, 장소를 검색해 보세요'"
								data-toggle="modal" data-target="#exampleModalCenter"
								>
							<div class="input-group-append">
								<button class="btns" type="button" onclick="location.href='exhSearchResult'"><i class="ti-search"></i>.</button>
							</div>
						</div>
					</div>
				</form>
			</aside>
		</div>
		
		<!-- 검색창 아래 (카테고리 & 검색 결과) -->
		<div style="height: 190vh;">
			<!-- 왼쪽 : 카테고리 -->
			<div class="app-category" style="float:left;">
				<div class="filter-title">
					<p style="margin-bottom: 10px;">CATEGORY</p>
				</div>
				
				<!-- 메뉴바 -->
				<div>
					<ul role="menubar" class="el-menu">
						<li role="menuitem" data-title="전체">
							<a href="hotelmain" style="text-decoration: none; color: inherit"></a>
						</li>
						
						<li data-title="입장권">
							
							<ul role="menu" class="el-menu el-menu--inline"">
								
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black;">전체</a>
								</li>
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black; font-weight: 500; font-size: 14px;">테마파크</a>
								</li>
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black; font-weight: 500; font-size: 14px;">워터파크</a>
								</li>
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black; font-weight: 500; font-size: 14px;">박물관 & 미술관</a>
								</li>
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black; font-weight: 500; font-size: 14px;">동물원,식물원 & 수족관</a>
								</li>
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black; font-weight: 500; font-size: 14px;">액티비티</a>
								</li>
						</ul>
					</ul>
				</div>
			</div>
		
			<!-- 오른쪽 -->
			<div class="right" style="position:absolute; float: right; width:850px; height:100vh; /* border: 1px solid black; */ translate: 300px;">
				<!-- 오1) 상품 목록 위 전체 갯수, 필터 -->
				<div class="rightSpace" style="width:850px; float:right;">
					<!-- 전체 상품 개수 -->
					<div class="app-list-header" style="float:left; margin-left: -15px; translate: 0 5px;">
						<div class="title" style="font-size: 12px; flex:1; color:#666; translate: 0 10px; margin-left: 76px;">
							<span style="color:#333;">전체</span>
							<span>( $(totalCnt) )</span>
						</div>
					</div>
					
					<!-- 필터 (인기순, 가격 낮은 순, 가격 높은 순) -->
					<div class="filter" style="float:right; translate:-180px;">
						<select style="translate: 150px;">
							<option value="popular">인기순</option>
							<option value="highPrice">가격 높은 순</option>
							<option value="lowPrice">가격 낮은 순</option>
						</select>
					</div>
					<hr style="margin-top: 50px;">
				</div>
				
						
				<!-- 오2) 상품 목록 -->
				<div class="rightProduct" style="width:850px; float:right;">
					<div style="float:left; width:850px; height: 170px; border: 1px solid grey;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					<div style="float:left; width:850px; height: 170px; background-color: #f5d682; border: 1px solid red;">
						<div class="repImg" style="float:left; width:265px; height:170px;  border: 1px solid green; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h4>대표 이미지 넣을 예정</h4>
							${ticket_rep_img_path }
						</div>
						
						<div style="float:left; width: 43%; height: 170px; border: 1px solid purple; text-align: center; padding: 83px 0; margin-right: 15px;">
							<h3>제목 넣을 예정~~</h3>
							${ticket_name }
						</div>
						
						<div style="float:left; width: 22%; height: 170px; border: 1px solid yellow; top:50%; left:50%; text-align: center; padding: 83px 0;">
							<h4>가격 넣을 예정</h4>
							${ticket_adult_price}
						</div>
					</div>
					
					</div>
				</div>
			</div>
		</div>
		<!-- 상품 목록. 나중에 수정하기 -->
<!-- 		<div class="container">
			<div class="row">
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<img src="assets/img/service/services1.jpg" alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<img src="assets/img/service/services2.jpg" alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<img src="assets/img/service/services3.jpg" alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<img src="assets/img/service/services4.jpg" alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<img src="assets/img/service/services5.jpg" alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6">
					<div class="single-place mb-30">
						<div class="place-img">
							<img src="assets/img/service/services6.jpg" alt="">
						</div>
						<div class="place-cap">
							<div class="place-cap-top">
								<span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
								<h3>
									<a href="#">The Dark Forest Adventure</a>
								</h3>
								<p class="dolor">
									$1870 <span>/ Per Person</span>
								</p>
							</div>
							<div class="place-cap-bottom">
								<ul>
									<li><i class="far fa-clock"></i>3 Days</li>
									<li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->
	
	</section>
</body>



  <script type="text/javascript" src="https://fnd.hanatour.com/src/js/vendor.27dbb7.js"></script><script type="text/javascript" src="https://fnd.hanatour.com/src/js/app.97e5b7.js"></script></body>
</html>