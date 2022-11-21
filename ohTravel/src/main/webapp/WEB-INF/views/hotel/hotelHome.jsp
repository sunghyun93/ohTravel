<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh!Travel - 숙박업체</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/hotel/style.css">
</head>
<body>
	<div class="hotel_container">
		<div class="main_banner">
			<div class="title">
				<h2>여기에 사진이랑 검색옵션이 들어갈 예정</h2>
			</div>
		</div> <!-- hotel_banner 끝 -->
		<div class="recommend">
			<div class="item_title">
				<h3>현재 추천상품</h3>
			</div>
			<div class="items_rec">
			<div class="favourite-place">
            <div class="container">
                <!-- Section Tittle -->
               
              	 <div class="row">
              	 
                    <!-- 상품에 따라 반복되어야할 부분 -->
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath }/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
                                    <h3><a href="#">The Dark Forest Adventure</a></h3>
                                    <p class="dolor">$1870 <span>/ Per Person</span></p>
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
                    <!-- 상품에 따라 반복되어야할 부분 끝 -->
                    
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath }/assets/img/service/services2.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
                                    <h3><a href="#">The Dark Forest Adventure</a></h3>
                                    <p class="dolor">$1870 <span>/ Per Person</span></p>
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
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath }/assets/img/service/services3.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
                                    <h3><a href="#">The Dark Forest Adventure</a></h3>
                                    <p class="dolor">$1870 <span>/ Per Person</span></p>
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
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath }/assets/img/service/services4.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
                                    <h3><a href="#">The Dark Forest Adventure</a></h3>
                                    <p class="dolor">$1870 <span>/ Per Person</span></p>
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

                    
                </div> <!-- row class 끝 -->
            </div>
        </div>
        <!-- Favourite Places End -->
			</div>
		</div><!-- recommend 끝 -->
		<div class="theme_rec">
			<div class="item_title">
				<h3>여행 테마 추천</h3>
			</div>
			<div class="favourite-place">
            	<div class="container">
					<div class="row">
						<div class="col-xl-3 col-lg-3 col-md-6">
						 	<div class="single-place mb-30">
						 		<div class="circle_theme">
						 		
						 		</div>
						 	</div>
						 </div>
						 <div class="col-xl-3 col-lg-3 col-md-6">
						 	<div class="single-place mb-30">
						 		<div class="circle_theme">
						 		
						 		</div>
						 	</div>
						 </div>
						 <div class="col-xl-3 col-lg-3 col-md-6">
						 	<div class="single-place mb-30">
						 		<div class="circle_theme">
						 		
						 		</div>
						 	</div>
						 </div>
						 <div class="col-xl-3 col-lg-3 col-md-6">
							 	<div class="single-place mb-30">
							 		<div class="circle_theme">
							 		
							 		</div>
							 	</div>
						 </div>
				 	</div>
			 	</div>
			 </div>
		</div><!-- theme_rec 끝 -->
		
		<div class="conn_coupon"> <!-- 1행 4열 -->
			<div class="item_title">
				<h3>쿠폰</h3>
			</div>
			<div class="favourite-place">
            	<div class="container">
					<div class="row">
						<div class="col-12">
						 	<div class="single-place mb-30">
						 		<div class="coupon_banner">
						 			<div class="will_delete">쿠폰 정보를 알려주고 클릭 시 쿠폰 확인 페이지로 이동할 예정</div>
						 		</div>
						 	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- hotel_container 끝 -->
</body>
</html>