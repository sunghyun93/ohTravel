<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/flaticon.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/slicknav.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/animate.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/themify-icons.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/slick.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/nice-select.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
	
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<%-- <tiles:insertAttribute name="side"/> --%>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	
	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-3.5.0.min.js"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="${pageContext.request.contextPath }/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="${pageContext.request.contextPath }/assets/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath }/assets/js/wow.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/animated.headline.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/jquery.magnific-po/pup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="${pageContext.request.contextPath }/assets/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/jquery.nice-select.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="${pageContext.request.contextPath }/assets/js/contact.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/jquery.form.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/mail-script.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath }/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
</body>
</html>