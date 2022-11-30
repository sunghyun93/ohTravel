<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.product-list{
	    width: 735px;
	    margin-left: auto;
	    margin-right: auto;
	}
	.products h3{
	    font-size: 24px;
	    color: #545454;
	    margin-top:60px;
	    margin-bottom: 60px;
	    text-align: center;
	}
	
	.product{
	    display: block;
	    width: 225px;
	    text-align: center;
	    text-decoration:none;
	    color: black;
	    float:left;
	    margin-left: 10px;
	    margin-right: 10px;
	    margin-bottom: 30px;
	}
	
	.product-name{
	    margin-top: 20px;
	    margin-bottom: 4px;
	}
	
	.clearfix{
	    clear: both;
	}
	
	section .section-title {
	    white-space: pre;
	    font-size: 34px;
	    font-weight: 700;
	    line-height: 44px;
	}
	
	.use-guide__inner {
	    margin-top: 30px;
	    padding: 27px 40px;
	    border: 1px solid #e7e7e7;
	    background-color: #f8f8f8;
	    font-size: 18px;
	    line-height: 1.5;
	}
	
	.use-guide__board ul {
	    display: inline-block;
	}
	
	ol, ul {
	    list-style: none;
	}
	.use-guide__board ul li+li {
	    margin-top: 5px;
	}
	.use-guide__board .text-link {
	    text-decoration: underline;
	    color: #715fc7;
	}
	/* 검색창 css */
	.container {
		width: 85%;
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
		margin-left: auto;
	}
	
	.single_sidebar_widget {
		background: #fbf9ff;
		padding: 15px;
		width: 350px;
		margin: 0 auto;
		margin-bottom: 30px;
	}
	
	
	/* ------------------------------------------ */
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
	
	.place-cap {
		height: 250px;
	}
	
	h6 {
		height: 40px;
	}
</style>
</head>
<body>
	<!-- 상품 목록 -->
	          <!-- 테마 추천 Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span style="margin-bottom: 20px;">WEEKLY BEST DEALS</span>
                            <h2 style="margin-bottom: 10px;">이번 주에 가장 </h2>
                            <h2>사랑받은 여행이에요</h2>
                        </div>
                    </div>
                </div>
                <!-- 상품 반복문 실행중,,,, -->
                <div class="row">
                	<c:forEach var="ticketList" items="${ticketList}" begin="0" end="3">
						<div class="col-xl-4 col-lg-4 col-md-6" style="height: 500px;">
							<div class="single-place mb-30">
								<div class="place-img">
									<img src="${ticketList.ticket_rep_img_path }">
								</div>
								<div class="place-cap">
									<div class="place-cap-top">
										<span><span><i class="fas fa-map-marker-alt"></i>${ticketList.city_name}</span></span>
										<h6>
											<a href="/ticket/exhibitionDetail" style="height: 40px;"> ${ticketList.ticket_name }</a>
										</h6>
										<p class="dolor" style="margin-top: 25px;">${ticketList.ticket_adult_price}<em style="font-size:15px;">원</em></p>
										<span><i class="fas fa-star"></i><span>${ticketList.ticket_score }</span> </span>
									</div>
									<div class="place-cap-bottom">
										<ul style="translate: 0 -15px;">
											<li style="width: 200px;"><i class="far fa-clock"></i>~ ${ticketList.ticket_due_date}까지</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>



<%--                 	<!-- 상품 하나...  -->
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><span><i class="fas fa-map-marker-alt"></i>파리</span></span>
                                    <h6><a href="#">[파리] 루브르박물관 패스트트랙 입장권 ${ticket_name }</a></h6>
                                    <p class="dolor">52250원</p>
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>~${ticket_due_date}까지 사용 가능</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> <!-- 상품 하나 끝 --> --%>
                    
                    
                    
                    <!-- 상품 둘,,,  -->
<%--                     <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><span><i class="fas fa-map-marker-alt"></i>파리</span></span>
                                    <h6><a href="#">[파리] 루브르박물관 패스트트랙 입장권 ${ticket_name }</a></h6>
                                    <p class="dolor">52250원</p>
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>~${ticket_due_date}까지 사용 가능</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 상품 셋,,,  -->
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><span><i class="fas fa-map-marker-alt"></i>파리</span></span>
                                    <h6><a href="#">[파리] 루브르박물관 패스트트랙 입장권 ${ticket_name }</a></h6>
                                    <p class="dolor">52250원</p>
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>~${ticket_due_date}까지 사용 가능</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 상품 넷,,,  -->
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><span><i class="fas fa-map-marker-alt"></i>파리</span></span>
                                    <h6><a href="#">[파리] 루브르박물관 패스트트랙 입장권 ${ticket_name }</a></h6>
                                    <p class="dolor">52250원</p>
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>~${ticket_due_date}까지 사용 가능</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 상품 다섯,,,  -->
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><span><i class="fas fa-map-marker-alt"></i>파리</span></span>
                                    <h6><a href="#">[파리] 루브르박물관 패스트트랙 입장권 ${ticket_name }</a></h6>
                                    <p class="dolor">52250원</p>
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>~${ticket_due_date}까지 사용 가능</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 상품 여섯,,,  -->
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><span><i class="fas fa-map-marker-alt"></i>파리</span></span>
                                    <h6><a href="#">[파리] 루브르박물관 패스트트랙 입장권 ${ticket_name }</a></h6>
                                    <p class="dolor">52250원</p>
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>~${ticket_due_date}까지 사용 가능</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> --%>
                </div> <!-- row div 끝 -->
            </div>
        </div> 
        <!-- 테마 추천 End -->
	  
	  
	  
	  <!-- 입장권 예약상담 -->
	  <section class="use-guide" style="text-align:left; margin-bottom: 40px;">
	  	<div class="container" style="max-width: 1200px; padding: 0; margin:0 auto;">
	  		<h2 class="section-title">입장권 예약상담</h2>
	  		<div class="use-guide__inner">
	  			<div class="use-guide__board">
	  				<ul>
	  					<li>입장권 상품 문의는입장권 상품페이지 내 "상품문의" 게시판을 이용 부탁합니다.</li>
	  					<li>입장권 일반 문의는 <a href="href="https://www.hanatour.com/com/cuc/CHPC0CUC0002M200" class="text-link">고객문의</a> 게시판을 이용 부탁합니다. </li>
	  					<li>입장권 예약, 취소, 결제, 환불은  <a href="https://www.hanatour.com/com/cuc/CHPC0CUC0001M200" class="text-link">자주 찾는 질문</a> 게시판에서 확인 부탁합니다.</li>
	  				</ul>
	  			</div>
	  		
	  		</div>
	  	</div>
	  </section>
</body>
</html>