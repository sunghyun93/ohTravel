<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh!Travel - Main</title>
<style type="text/css">

.search_modal {
  width: 100%;
  padding: 0;
  position: relative;
  display: flex;
  justify-content: space-evenly;
}

.search_head {
  display: flex;
  justify-content: space-between;
  border-bottom: 2px solid black;
  padding: 10px 0;
  padding: 11px 20px;
}

.modal-backdrop.show {
  	width: 0;
  	height: 0;
    opacity: 0;
}

.modal {
	position: relative;
	float: left;
    width: 640px;
	margin-left: 30px;
    top: -45px;
}

.modal-footer {
    padding: 5px 10px;
}

.modal-dialog {
	max-width: none;
}

.right_contents {
	width: 250px;
}

.list_searchWord {
    margin: 0;
    padding: 20px 10px 10px 10px;
}

.list_searchWord li .num {
    display: inline-block;
    width: 25px;
    text-align: left;
    color: #111;
}

.list_searchWord li {
    width: calc(100% - 18px);
    min-height: 26px;
    padding: 0 18px 0 0;
    overflow: hidden;
}

ol.list_searchWord li:nth-child(-n+3):nth-child(n+1) .num {
    color: #5e2bb8;
}

a {
	color: black;
}

#ui-id-1 {
	background-color: white;
    width: 546px;
    border: 1px solid black;
    z-index: 100;
    margin-top: 10px;
    border-radius: 0.3rem;
    top: -6430px;
}
/* 상품 별 padding 값 */
.place-padding {
    padding-top: 50px;
    padding-bottom: 50px;
}

</style>

<!-- 이 페이지에 참고하는 부트스트랩의 index 코드가 전부 있습니다 -->
</head>
<body>
	 <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-9 col-lg-9 col-md-9">
                                <div class="hero__caption">
                                    <h1>Find your <span>Next tour!</span> </h1>
                                    <p>Where would you like to go?</p>
                                </div>
                            </div>
                        </div>
                        <!-- Search Box -->
                        <div class="row">
                            <div class="col-xl-12">
                                <!-- form -->
                                <form action="/search/searchResult" class="search-box">
                                    <div class="input-form mb-30">
                                        <input type="text" name="search_word" placeholder="어디로 갈래?" id="input_search">
                                    </div>
                                    <!-- <div class="select-form mb-30">
                                        <div class="select-itms">
                                            <select name="select" id="select1">
                                                <option value="">When</option>
                                                <option value="">Services-1</option>
                                                <option value="">Services-2</option>
                                                <option value="">Services-3</option>
                                            </select>
                                        </div>
                                    </div> -->
                                    <div class="search-form mb-30">
                                        <button type="submit" class="inputSearch">Search</button>
                                    </div>
                                </form>	
                            </div>
                        </div>
                        	
                        	<!-- Modal -->
						<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-body">
					
										<div class="search_modal">
											<!-- <div class="wrap left_contents">
												<div class="recent_search_top search_head">
													<span>최근검색어</span> <span>전체삭제</span>
												</div>
												<div class="recent_search_word">
													<ul>
														<li><a class="tit">일</a></li>
														<li><a class="tit">오kㅅ</a></li>
													</ul>
												</div>
											</div> -->
											<div class="wrap right_contents">
												<div class="popular_search_top search_head">
													<strong>최근검색어</strong>
												</div>
												<form action="/recentSearchWord">
													<div class="recent_search_word">

													</div>
												</form>
											</div>
											<div class="wrap right_contents">
												<div class="popular_search_top search_head">
													<strong>인기검색어</strong>
												</div>
												<form action="/popSearchWord">
													<div class="popular_search_word">

													</div>
												</form>
											</div>
										</div>
										<div class="modal-footer">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
									</div>
								</div>
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
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                                <h5>8000+ Our Local<br>Guides</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-pay"></span>
                            </div>
                            <div class="services-cap">
                                <h5>100% Trusted Tour<br>Agency</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-experience"></span>
                            </div>
                            <div class="services-cap">
                                <h5>28+ Years of Travel<br>Experience</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-good"></span>
                            </div>
                            <div class="services-cap">
                                <h5>98% Our Travelers<br>are Happy</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!-- Our Services End -->
        
        <!-- 해외 패키지 3개 -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- 타이틀 -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>FEATURED ABROAD Packages</span>
                            <h2>해외 패키지</h2>
                        </div>
                    </div>
                </div>
                <!-- 해외 패키지 3개 -->
                <div class="row">
                    <c:forEach var="abroadPkage" items="${abroadPkageList }">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-place mb-30">
	                            <div class="place-img"> <%-- 날짜는 기간이 정해졌기 때문에 하드코딩함. --%>
	                                <a href="/pkage/searchResult?pkage_id=${abroadPkage.pkage_id }&pkage_gubun=${abroadGubun }&toDesti=${abroadPkage.city_id}&dates_start_check=2022-12-20">
	                                	<img src="${abroadPkage.pkage_Img_path }" alt="" width="370px" height="246.52px">
	                                </a>
	                            </div>
	                            <div class="place-cap">
	                                <div class="place-cap-top"><%-- 날짜는 기간이 정해졌기 때문에 하드코딩함. --%>
	                                    <span><i class="fas fa-star"></i><span>${abroadPkage.pkage_score }</span></span>
	                                    <h6><a href="/pkage/searchResult?pkage_id=${abroadPkage.pkage_id }&pkage_gubun=${abroadGubun }&toDesti=${abroadPkage.city_id}&dates_start_check=2022-12-20">${abroadPkage.pkage_name }</a></h6>
	                                    <h6 style="height:57.54px;">${abroadPkage.pkage_info }</h6>
	                                    <p class="dolor"><fmt:formatNumber value="${abroadPkage.pkage_dt_Aprice }" pattern="#,###"/>원~</p>
	                                </div>     
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </div>
        </div> <!-- 해외 패키지 3개 -->
        
        <!-- 국내 패키지 3개 -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- 타이틀 -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>FEATURED DOMESTIC Packages</span>
                            <h2>국내 패키지</h2>
                        </div>
                    </div>
                </div>
                <!-- 해외 패키지 3개 -->
                <div class="row">
                    <c:forEach var="domesticPkage" items="${domesticPkageList }">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-place mb-30">
	                            <div class="place-img"> <%-- 날짜는 기간이 정해졌기 때문에 하드코딩함. --%>
	                                <a href="/pkage/searchResult?pkage_id=${domesticPkage.pkage_id }&pkage_gubun=${domesticGubun }&toDesti=${domesticPkage.city_id}&dates_start_check=2022-12-20">
	                                	<img src="${domesticPkage.pkage_Img_path }" alt="" width="370px" height="246.52px">
	                                </a>
	                            </div>
	                            <div class="place-cap">
	                                <div class="place-cap-top"><%-- 날짜는 기간이 정해졌기 때문에 하드코딩함. --%>
	                                    <span><i class="fas fa-star"></i><span>${domesticPkage.pkage_score }</span></span>
	                                    <h6 style="height:38.38px;"><a href="/pkage/searchResult?pkage_id=${domesticPkage.pkage_id }&pkage_gubun=${domesticGubun }&toDesti=${domesticPkage.city_id}&dates_start_check=2022-12-20">${domesticPkage.pkage_name }</a></h6>
	                                    <h6 style="height:57.54px;">${domesticPkage.pkage_info }</h6>
	                                    <p class="dolor" style="translate: 0 55px;"><fmt:formatNumber value="${domesticPkage.pkage_dt_Aprice }" pattern="#,###"/>원~</p>
	                                </div>     
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </div>
        </div> <!-- 해외 패키지 3개 -->
        
        <!-- 호텔 3개 -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>FEATURED HOTEL</span>
                            <h2>호텔</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<c:forEach var="hotelList" items="${hotelList }" begin="0" end="2">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${hotelList.h_img_path }" alt="" style="height:213.38px;">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>${hotelList.hotel_score } </span> </span>
                                    <h6 style="height:38.38px;"><a href="${pageContext.request.contextPath }/hotel/hotelDetail?hotel_id=${hotelList.hotel_id}">${hotelList.hotel_kor }</a></h3>
                                     <fmt:formatNumber type="number" maxFractionDigits="3" value="${hotelList.room_min_price }" var="minRoomPrice"/>
                                    <p class="dolor">${minRoomPrice }원 ~ <span>/ 1박기준 최저가</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li style="height:47.96px;"><i class="fas fa-map-marker-alt"></i>${hotelList.hotel_loc }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                    <!-- 상품에 따라 반복되어야할 부분 끝 -->
                </div>
            </div>
        </div>
        <!-- 호텔 3개 -->
        
        <!-- 입장권 3개 -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>FEATURED TICKETS</span>
                            <h2>입장권</h2>
                        </div>
                    </div>
                </div>
               	<div class="row">
                	<c:forEach var="ticketList" items="${ticketList}" begin="0" end="2">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-place mb-30">
	                            <div class="place-img">
	                                <img src="${ticketList.ticket_rep_img_path }" style="height:272.6px;">
	                            </div>
	                            <div class="place-cap">
	                                <div class="place-cap-top">
	                                    <span><i class="fas fa-star"></i><span>${ticketList.ticket_score }</span> </span>
	                                    <h6 style="height:40px;"><a href="/ticket/exhibitionDetail?ticket_id=${ticketList.ticket_id}">${ticketList.ticket_name }</a></h6>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${ticketList.ticket_child_price }" var="minTicketPrice"/>
	                                    <p class="dolor">${minTicketPrice}<em style="font-size:15px;">원~</em></p>
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
                </div>
            </div>
        </div>
        <!-- 입장권 3개 -->
        
        
        <!-- Favourite Places End -->
       
        <!-- Support Company Start-->
        <div class="support-company-area support-padding fix">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img mb-50">
                            <img src="assets/img/service/support-img.jpg" alt="">
                            <div class="support-img-cap">
                                <span>Since 1992</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="right-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle section-tittle2">
                                <span>About Our Company</span>
                                <h2>We are Go Trip <br>Ravels Support Company</h2>
                            </div>
                            <div class="support-caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</p>
                                <div class="select-suport-items">
                                    <label class="single-items">Lorem ipsum dolor sit amet
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Consectetur adipisicing sed do
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Eiusmod tempor incididunt
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Ad minim veniam, quis nostrud.
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <a href="#" class="btn border-btn">About us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Support Company End-->

</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	// 검색 모달창
	$(document).ready(function() {
	    $('.input-form').click(function() {
	        $("#exampleModal").modal("show");
	        sli = "<ol class='list_searchWord type'>";
	        rli = "<ul class='list_searchWord type'>";
	        $.ajax({
	        	url: '/recentSearchWord',
	        	dataType: 'json',
	        	success: function(datas) {
					$('.recent_search_word').empty();
					$(datas).each(function(index) {
						if (index < 10) {
							rli += "<li><a href='/search/searchResult?search_word="+this.search_word+"' class='tit'>"+this.search_word+"</li>";
						} else return false;
					});
					rli += "</ul>";
					$('.recent_search_word').append(rli);
					$(this).focus();
	        	}
	        });
	        
	        $.ajax({
	        	url: '/popSearchWord',
	        	dataType: 'json',
	        	success: function(data) {
					$('.popular_search_word').empty();
					$(data).each(function(index) {
						if (index < 10) {
							index = index + 1;
							sli += "<li><span class='num'>"+index+"</span><a href='/search/searchResult?search_word="+this.search_word+"' class='tit'>"+this.search_word+"</li>";
						} else return false;
					});
					sli += "</ol>";
					$('.popular_search_word').append(sli);
					$(this).focus();
	        	}
	        });
	        
	    });
	
	    $("#close_modal").click(function() {
	        $("#exampleModal").modal("hide");
	    });
	});
	
	// 검색 자동완성
	$('#input_search').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "/autoComplete"   
		         , type : "POST"
		         , dataType: "JSON"
		         , data : {"search_word": request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		        	 console.log('data -> ' + data);
		             response(
		                 $.map(data.resultList, function(item) {
		                     console.log('item.search_word -> ' + item.search_word);
		                	 console.log('city_name -> ' + item.city_name);
		                     return {
		                    	     label : item.city_name    	// 목록에 표시되는 값
		                           , "search_word" : item.SEARCH_WORD 		// 선택 시 input창에 표시되는 값
		                     };
		                 })
		             );    //response
		         }
		         ,error : function(){ //실패
		             alert("오류가 발생했습니다.");
		         }
		     });
		}
		,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
		}
		,minLength: 1// 최소 글자수
		,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
		,delay: 100	//autocomplete 딜레이 시간(ms)
		,select : function(evt, ui) { 
	      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
				console.log(ui.item.label);
				console.log(ui.item.idx);
		 }
	});
</script>
</html>