<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<style>

.c1_slider-wrap{
}
.c1_slick-arrow{
	position: absolute; top:50%; transform:translateY(-50%);
	width: 64px; height:64px;
	color:#fff;
	border: none;
	text-indent: -9999px;
	overflow: hidden;
	cursor: pointer;
}
.c1_slick-prev{
	z-index:100;
	left:1%;
	background: url(${pageContext.request.contextPath}/airport/img/banners/c1_prev.png) no-repeat 0 0;
}
.c1_slick-next{
	right:1%;
	background: url(${pageContext.request.contextPath}/airport/img/banners/c1_next.png) no-repeat 0 0;
}
.slick-dots {
  bottom: 2%;
  left: 50%; 
  transform:translateX(-50%);
  list-style: none;
  text-align: end;
  position: absolute;
  padding: 0;
}

.slick-dots li {
  position: relative;
  display: inline-block;
  width: 20px;
  height: 20px;
  /*margin: 1px;*/
  padding: 0;
  cursor: pointer;
}

.slick-dots li button {
  font-size: 0;
  line-height: 0;
  display: block;
  width: 20px;
  height: 20px;
  padding: 5px;
  cursor: pointer;
  color: transparent;
  border: 0;
  outline: 0;
  background: 0 0;
}

.slick-dots li button:before {
  font-size: 2.7rem;
  line-height: 20px;
  position: absolute;
  top: 0;
  left: 0;
  width: 20px;
  height: 20px;
  content: '•';
  text-align: center;
  opacity: .75;
  color: #6D6968;
}

.slick-dots li.slick-active button:before {
  opacity: .75;
  color: #ffffff;
}
#c1_bannerimg{
	width: 100%;
	height: auto;
}
</style>
<style type="text/css">
c1_banner{
	width:100%;
	
}

.c1_bannerimg1{
	border-radius: 8px;
	width:100%;
}
.c1_banner1-1{
	display: flex;
	max-width: 1280px;
	margin: 0 auto;
}
.c1_banner:hover{
	cursor: pointer;
}
.c1_banner a{
text-decoration: none;
}

.c1_banner1{
	flex:1;
	margin:0.7%;
	width: 20%;
}
.c1_text{
  text-align: center;
}
.c1_bannerimg	{
	width:1200px;
	height: 600px;
	
	
}

 #c1_bannerimg1{
	width:100%;
	height: 800px;
	
}

#c1_bannerimg2{
	width:100%;
	height: 800px;

}

#c1_bannerimg3{
	width:100%;
	height: 800px;

} 


#c1_bannerimg4{
	width:100%;
	height: 800px;

}

</style>

<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
jQuery(function(){
	 $.noConflict();
	
	 jQuery('.c1_slider-wrap').slick({
		  dots: true,
		  infinite: true,
		  speed: 500,
		  fade: true,
		  cssEase: 'linear',
		  autoplay: true,
		  prevArrow : "<button class='c1_slick-prev c1_slick-arrow'></button>",
		  nextArrow : "<button class='c1_slick-next c1_slick-arrow'></button>",
		  autoplaySpeed: 3000,
		  
	});
});
</script>
</head>
<body topmargin="0"  leftmargin="0" marginwidth="0" marginheight="0">
<div class="c1_slider-wrap" style="margin-bottom: 2%;">
    <div class="c1_banner">
    	<img class="c1_bannerimg" id="c1_bannerimg1" src="${pageContext.request.contextPath}/airport/img/banners/main_background1.jpg" alt="">
   	</div>
    <div class="c1_banner">
    	<img class="c1_bannerimg" id="c1_bannerimg2" src="${pageContext.request.contextPath}/airport/img/banners/main_background2.jpg" alt="">
    </div>
    <div class="c1_banner">
    	<img class="c1_bannerimg" id="c1_bannerimg3" src="${pageContext.request.contextPath}/airport/img/banners/main_background3.jpg" alt="">
    </div>
    <div class="c1_banner">
   		<img class="c1_bannerimg" id="c1_bannerimg4" src="${pageContext.request.contextPath}/airport/img/banners/main_background4.jpg" alt="">
   </div>
   <div class="c1_banner">
   		<img class="c1_bannerimg" id="c1_bannerimg4" src="${pageContext.request.contextPath}/airport/img/banners/japan3.jpg" alt="">
   </div>
   <div class="c1_banner">
   		<img class="c1_bannerimg" id="c1_bannerimg4" src="${pageContext.request.contextPath}/airport/img/banners/last_banner.jpg" alt="">
   </div>
</div>
</body>
</html>



