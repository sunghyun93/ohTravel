<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="${pageContext.request.contextPath }/assets/img/hero/contact_hero.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Admin Page</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- slider Area End-->

	 <!-- Our Services Start -->
        <div class="our-services servic-padding">
            <div class="container">
                <div class="row d-flex justify-contnet-center">
                												<!-- onclick="location.href='이동할 컨트롤러 value'" cursor : 마우스 올렸을때 커서 모양 (손가락)-->
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30" onclick="location.href='manageUser'" style="cursor:pointer">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                                <h5>회원관리<br>ManageUser</h5>
                                <!-- 두 줄이 아니면 칸 크기가 안맞아요..! <h5>한글표기<br>영문표기</h5> 이렇게 표기해주시면 될거같음 -->
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30" onclick="location.href='managePackage'" style="cursor: pointer">
                            <div class="services-ion">
                                <span class="flaticon-pay"></span>
                            </div>
                            <div class="services-cap">
                                <h5>상품관리<br>ManageProduct</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30" onclick="location.href='manageBoard'" style="cursor: pointer">
                            <div class="services-ion">
                                <span class="flaticon-experience"></span>
                            </div>
                            <div class="services-cap">
                                <h5>게시판/공지관리<br>ManageBoard</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30" onclick="location.href='manageSales'" style="cursor: pointer">
                            <div class="services-ion">
                                <span class="flaticon-good"></span>
                            </div>
                            <div class="services-cap">
                                <h5>매출관리<br>ManageSales</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30" onclick="location.href='manageCoupon'" style="cursor: pointer">
                            <div class="services-ion">
                                <span class="flaticon-experience"></span>
                            </div>
                            <div class="services-cap">
                                <h5>쿠폰관리<br>ManageCoupon</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30" onclick="location.href='manageReservation'" style="cursor: pointer">
                            <div class="services-ion">
                                <span class="flaticon-good"></span>
                            </div>
                            <div class="services-cap">
                                <h5>예약관리<br>ManageReservation</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!-- Our Services End -->
</body>
</html>