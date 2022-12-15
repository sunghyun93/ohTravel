<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="col-lg-4" style="min-width: 100px;">
                            <div class="header-info-right f-right">
                                <ul class="header-social">
                                	<li><a href="${pageContext.request.contextPath }/manager/managerMain">관리자페이지</a>
                                	<c:if test="${member != null }">
                                		<li><a onclick="window.open('${pageContext.request.contextPath }/manager/goCoupon','_blank','width=900px,height=850px')" href="#">쿠폰다운로드</a>
                                	</c:if>
                                	<c:if test="${member == null }">
                                		<li><a href="${pageContext.request.contextPath }/manager/goCoupon">쿠폰다운로드</a>
                                	</c:if>
                                    <c:if test="${member == null}">
                                    	<li><a href="${pageContext.request.contextPath}/member/loginForm">LOGIN</a></li>
                                    	<li><a href="${pageContext.request.contextPath}/member/memberForm">회원가입</a></li>
                                    </c:if>
                                    <c:if test="${member != null}">
                                    	<li><a href="${pageContext.request.contextPath}/member/logout">LOGOUT</a></li>
                                    	<li><a href="${pageContext.request.contextPath}/member/memberForm" style="display:none;">회원가입</a></li>
                                    	<li><a href="${pageContext.request.contextPath}/member/myPageReservPackage">마이페이지</a></li>
                                    </c:if>
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
                                            <li><a href="${pageContext.request.contextPath }/manager/goNotice">공지사항</a></li>
                                            <li><a href="${pageContext.request.contextPath }/hotel/hotelHome">숙박</a>
                                            	  <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath }/blog">블로그 구조 참고</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/element">Element</a></li>
                                                    <li><a href="${pageContext.request.contextPath }/tilesTest">이러지마 타일즈야</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath}/airport/searchTicket">항공</a>
                                            	  
                                            </li>
                                            <li><a href="#">패키지</a>
                                                <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath}/pkage/search/1">해외</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/pkage/search/0">국내</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath}/ticket/exhibitionMain">입장권</a>
                                            </li>
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