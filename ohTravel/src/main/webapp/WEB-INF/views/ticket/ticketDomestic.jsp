<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<body>
	<h1>잘 먹히나. . .</h1>
	
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

	<!-- 카테고리 -->
	<section class="container filter-area" data-v-77b3389f>
		<h2 class="sr-only" data-v-77b3389f>상품 목록</h2>
		<div class="conditions" data-v-77b3389f>
			<div class="app-category" data-v-21fb462e data-v-77b3389f>
				<div class="filter-title" data-v-21fb462e>
					<p data-v-21fb462e>CATEGORY</p>
				</div>
				<div data-v-21fb462e>
					<ul role="menubar" class="el-menu" style="background-color:;"
						data-v-21fb462e>
						<li role="menuitem" tabindex="-1" data-title="전체"
							class="el-menu-item"
							style="padding-left: 20px; color:; background-color:;"
							data-v-21fb462e><a href="#" data-v-21fb462e>전체</a></li>
						<li role="menuitem" aria-haspopup="true" data-title="입장권/교통패스/시즌권"
							class="el-submenu" data-v-21fb462e><div
								class="el-submenu__title"
								style="padding-left: 20px; color:; background-color:;">
								입장권/교통패스/시즌권 <i
									class="el-submenu__icon-arrow el-icon-arrow-down"></i>
							</div>
							<ul role="menu" class="el-menu el-menu--inline"
								style="background-color:; display: none;">
								<li role="menuitem" tabindex="-1" data-title="전체"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										전체 </a></li>
								<li role="menuitem" tabindex="-1" data-title="테마파크"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										테마파크 </a></li>
								<li role="menuitem" tabindex="-1" data-title="워터파크"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										워터파크 </a></li>
								<li role="menuitem" tabindex="-1" data-title="익스프레스&amp;패스트트랙"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										익스프레스&amp;패스트트랙 </a></li>
								<li role="menuitem" tabindex="-1" data-title="박물관&amp;미술관"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										박물관&amp;미술관 </a></li>
								<li role="menuitem" tabindex="-1" data-title="동물원,식물원&amp;수족관"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										동물원,식물원&amp;수족관 </a></li>
								<li role="menuitem" tabindex="-1" data-title="액티비티"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										액티비티 </a></li>
								<li role="menuitem" tabindex="-1" data-title="랜드마크"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										랜드마크 </a></li>
								<li role="menuitem" tabindex="-1" data-title="공연&amp;축제"
									class="el-menu-item el-menu-item--theme-grey"
									style="padding-left: 40px; color:; background-color:;"
									data-v-21fb462e><a href="#" keepScroll="" data-v-21fb462e>
										공연&amp;축제 </a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="list" data-v-77b3389f>
			<div class="app-list-header" data-v-0c945636 data-v-77b3389f>
				<div class="title" data-v-0c945636>
					<span data-v-0c945636> 전체 </span> <span data-v-0c945636>( )</span>
				</div>
				<div class="el-select el-select--small" data-v-655e9302
					data-v-0c945636>
					<!---->
					<div class="el-input el-input--suffix">
						<!---->
						<input type="text" autocomplete="off" placeholder="검색"
							readonly="readonly" value="" class="el-input__inner">
						<!---->
						<!---->
					</div>
					<div class="el-select-dropdown el-popper"
						style="min-width:; display: none;">
						<div class="el-scrollbar" style="display: none;">
							<div
								class="el-select-dropdown__wrap el-scrollbar__wrap el-scrollbar__wrap--hidden-default">
								<ul class="el-scrollbar__view el-select-dropdown__list">
									<!---->
									<li class="el-select-dropdown__item selected" data-v-655e9302><span>추천순</span></li>
									<li class="el-select-dropdown__item" data-v-655e9302><span>인기순</span></li>
									<li class="el-select-dropdown__item" data-v-655e9302><span>신규
											상품순</span></li>
									<li class="el-select-dropdown__item" data-v-655e9302><span>가격
											낮은 순</span></li>
									<li class="el-select-dropdown__item" data-v-655e9302><span>가격
											높은 순</span></li>
								</ul>
							</div>
							<div class="el-scrollbar__bar is-horizontal">
								<div class="el-scrollbar__thumb"
									style="width: 0; transform: translateX(0%); ms-transform: translateX(0%); webkit-transform: translateX(0%);"></div>
							</div>
							<div class="el-scrollbar__bar is-vertical">
								<div class="el-scrollbar__thumb"
									style="height: 0; transform: translateY(0%); ms-transform: translateY(0%); webkit-transform: translateY(0%);"></div>
							</div>
						</div>
						<p class="el-select-dropdown__empty"></p>
					</div>
				</div>
<!-- 				<div class="toggle-list-type" data-v-0d15d86e data-v-0c945636>
					<button aria-selected="false" aria-label="바둑판 형태로 보기"
						data-v-0d15d86e>
						<i aria-hidden="true" class="icon view-tile" data-v-0d15d86e></i>
					</button>
					<button aria-selected="true" aria-label="목록 형태로 보기"
						class="is-active" data-v-0d15d86e>
						<i aria-hidden="true" class="icon view-list" data-v-0d15d86e></i>
					</button>
				</div> -->
			</div>
			<div class="pagination" data-v-77b3389f>
				<div pager-count="5" class="el-pagination" data-v-77b3389f>
					<button type="button" class="btn-prev disabled">
						<i class="el-icon el-icon-arrow-left"></i>
					</button>
					<ul class="el-pager">
						<!---->
						<!---->
						<!---->
						<!---->
					</ul>
					<button type="button" class="btn-next">
						<i class="el-icon el-icon-arrow-right"></i>
					</button>
				</div>
			</div>
		</div>
	</section>

	<!-- 상품 목록. 나중에 수정하기 -->
	<div class="container">
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
	</div>
</body>



  <script type="text/javascript" src="https://fnd.hanatour.com/src/js/manifest.4c9068.js"></script><script type="text/javascript" src="https://fnd.hanatour.com/src/js/vendor.27dbb7.js"></script><script type="text/javascript" src="https://fnd.hanatour.com/src/js/app.97e5b7.js"></script></body>
</html>