<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
</head>
<body>
	<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${pageContext.request.contextPath }/assets/img/logo/ohLogo2.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
                <div class="header-top top-bg d-none d-lg-block">
                   <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="header-info-left">
                                <ul>                          
                                    <li>needhelp@gotrip.com</li>
                                    <li>666 569 025077</li>
                                    <li>broklyn street new york</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="header-info-right f-right">
                                <ul class="header-social">    
<<<<<<< HEAD
                                	<li><a href=${pageContext.request.contextPath }/manager/managerMain>관리자페이지</a>
=======
                                	<li><a href="/managerMain">관리자페이지</a>
>>>>>>> branch 'main' of https://github.com/zest20/ohTravel.git
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                   <li> <a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                </ul>
                            </div>
                        </div>
                       </div>
                   </div>
                </div>
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="/"><img src="${pageContext.request.contextPath }/assets/img/logo/ohLogo.png" alt=""></a>
                                 <!--  <a href="/"><img src="assets/img/logo/Logo.png" alt=""></a> -->
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>               
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="#">공지사항</a></li>
                                            <li><a href="${pageContext.request.contextPath }/hotel/hotelmain">숙박</a>
                                            	  <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath }/justTest">해외</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/cssTest">국내</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/blog">블로그 구조 참고</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/element">Element</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/hotel/hotelHome">호텔메인확인용</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/hotel/hotelDetail">호텔상세확인용</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath}/airport/searchTicket">항공</a>
                                            	  <ul class="submenu">
                                                    <li><a href="/airport/air_reservation">항공예약 페이지</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">패키지</a>
                                                <ul class="submenu">
                                                    <li><a href="">해외</a></li>
                                                    <li><a href="#">국내</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath}/ticket/ticketmain">입장권</a>
                                                <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath}/ticket/ticketOverseas">해외</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/ticket/ticketDomestic">국내</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">예약내역 확인</a></li>
                                            <li><a href="${pageContext.request.contextPath}/member/loginForm">LOGIN</a></li>
                                            <li><a href="${pageContext.request.contextPath}/member/memberForm">회원가입</a></li>
                                        	<li><a href="${pageContext.request.contextPath}/member/myPageMain">마이페이지</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
</body>
</html>