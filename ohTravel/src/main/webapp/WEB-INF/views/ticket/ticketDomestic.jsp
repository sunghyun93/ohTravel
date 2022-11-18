<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="nice-select.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<script src="https://www.jqueryscript.net/demo/Mobile-friendly-Custom-Scrollbar-Plugin-With-jQuery-NiceScroll/js/jquery.nicescroll.min.js"></script>
<script>
    $(document).ready(function(){
        // selectbox styling
        $('select').niceSelect();
        $('#select').css('color', 'red');
    });
    
    
</script>
</head>
<style>
	.single_sidebar_widget {
	    background: #fbf9ff;
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
	    padding: 4px 8px;
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
	}
</style>
<body>
	<h1>잘 먹히나. . .</h1>
	
	<!-- 다 담는 -->
	<section class="container filter-area">
	
		<!-- 검색창 -->
		<div>
			<aside class="single_sidebar_widget search_widget">
				<form action="#">
					<div class="form-group">
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder='여행지, 상품, 장소를 검색해 보세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '여행지, 상품, 장소를 검색해 보세요'">
							<div class="input-group-append">
								<button class="btns" type="button" onclick="location.href='hotelmain'"><i class="ti-search"></i>.</button>
							</div>
						</div>
					</div>
				</form>
			</aside>
		</div>
		
		<div>
			<!-- 왼쪽 : 카테고리 -->
			<div class="app-category">
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
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black; font-weight: 500; font-size: 14px;">랜드마크</a>
								</li>
								<li role="menuitem" data-title="전체" class="el-menu-item el-menu-item--theme-grey" style="padding-left:40px;">
									<a href="#" class="router-link-active" style="color:black; font-weight: 500; font-size: 14px;">공연 & 축제</a>
								</li>
								
						</ul>
					</ul>
				</div>
			</div>
		</div>
		
		
		<!-- 오른쪽 -->
		
		<!-- 오1) 상품 목록 위 전체 갯수, 필터 -->
		<div class="rightSpace" style="width:850px; float:right; translate: 270px -420px; position:absolute;">
			<!-- 전체 상품 개수 -->
			<div class="app-list-header" style="float:left; margin-right: 250px;">
				<div class="title" style="font-size: 12px; flex:1; color:#666; translate: 0 10px; margin-left: 76px;">
					<span style="color:#333;">전체</span>
					<span>( $(totalCnt) )</span>
				</div>
			</div>
			
			<!-- 필터 (인기순, 가격 낮은 순, 가격 높은 순) -->
			<div class="filter" style="float:right; translate:-180px;">
				<select>
					<option value="popular">인기순</option>
					<option value="highPrice">가격 높은 순</option>
					<option value="lowPrice">가격 낮은 순</option>
				</select>
			</div>
			<hr>
		</div>
		
				
		<!-- 오2) 상품 목록 -->
		<div class="list">
			
		
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