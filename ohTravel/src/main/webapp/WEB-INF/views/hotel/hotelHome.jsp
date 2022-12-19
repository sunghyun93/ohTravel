<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh!Travel - 숙박업체</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/hotel/style.css">
</head>
<style>
	.place-img img {
		width: 300px;
 		height: 250px;
		
	}
	.modal_wrap {
		top: 80%;
   		left: 28%;
	}
	
	.search_field{
		height: 180px;
		border: 1px solid black;
	}
	
	.start_end{
		height: 95px;
	}
	
	.forheight{
		height : 230px;
	}
	
	.mainBanner{
		height : 600px;
		background-image: url("${pageContext.request.contextPath }/img/hotel/hotelBanner3.jpg");
		background-size: 100% 600px;
	}
	
	.place-cap{
		    height: 320px;
	}
	
	.place-cap-top{
		height:180px;
	}
	
	.favourite-place{
		margin-bottom:90px;
	}
	
	.hotelItems{
		margin-bottom:25px;
	}
</style>
<body>
<div class="hotel_container">
		
	<div class="mainBanner">
		<div class="forheight"></div>
		<!-- 검색Form -->		
		<div class="search_field">
		
			<div class="trip">
				<div class="round_trip"></div>
				<div class="oneway"></div>
			</div>	
			
			<form id="hotelSearchForm" action="${pageContext.request.contextPath }/hotel/hotelSearch" method="POST">
				<div class="start_end">
					<div>
						<input style="text-align: center;" type="text" id="modal_btn" class="starting" 
						data-toggle="modal" data-target="#exampleModalCenter" 
						placeholder="지역을 선택해주세요." readonly>
						<input type="hidden" name="city_id" value="" class="starting_hidden">
						<input type="hidden" name="calDate" value="" class="calDate">
						<div class="black_bg"></div>
						 
						<div class="modal_wrap">
						    <div class="modal_close"><span>close</span></div>
						    <div class="entire">
							    <span class="select_area">지역을 선택해주세요.</span>
							    <div class="modal_close_country">
							    	<div class="modal_close_country_1">
								        <ul>
								        	<c:forEach var="country" items="${countryList }">
								        		<li><span id="${country.country_id }" class="country_li">${country.country_name }</span></li>
								        	</c:forEach>
								        </ul>
								    </div>
								    
								    <div class="modal_close_country_2">
								        <ul>
								        	<li><span></span></li>
								        	<li><span></span></li>
								        </ul>
								    </div>     
							        
							    </div> <!-- modal_close_country_1 -->
							</div>
						</div>    <!--모달끝  --> 
						
					</div>
					
					<div class="date_start">
						<input type="date" name="startDate" value="2022-12-20" id="dates_start_check" class="dates_start_check" min="2022-12-20" max="2022-12-27">
					</div>
					
					<div class="date_end">
						<input type="date" name="endDate" value="2022-12-21"  id="dates_start_end" class="dates_start_end" min="2022-12-20" max="2022-12-27">
					</div>
					
					<div class="search">
						<button type="button" id="hotelSearchBtn" class="genric-btn info radius" >호텔 검색</button>
					</div>
					
				</div><!-- start_end -->
			</form>
		</div><!-- search_field -->
	</div>	
	<!-- 검색Form -->		
		
		
		<div class="recommend">
			<div class="item_title">
				<h2><strong>현재 추천상품</strong></h2>
			</div>
			<div class="items_rec">
			<div class="favourite-place">
            <div class="container">
                <!-- Section Tittle -->
               
              	 <div class="row">
              	 
                    <!-- 상품에 따라 반복되어야할 부분 -->
                    <c:forEach var="hotelList" items="${hotelList }" begin="0" end="7">
                    <div class="hotelItems col-xl-3 col-lg-3 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${hotelList.h_img_path }" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>${hotelList.hotel_score } </span> </span>
                                    <h3><a href="${pageContext.request.contextPath }/hotel/hotelDetail?hotel_id=${hotelList.hotel_id}">${hotelList.hotel_kor }</a></h3>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${hotelList.room_min_price }" var="minRoomPrice"/>
                                    <p class="dolor">${minRoomPrice }원~ <span>/ 1박 최저가</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="fas fa-map-marker-alt"></i>${hotelList.hotel_loc }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                    <!-- 상품에 따라 반복되어야할 부분 끝 -->
                    
                   
                    <c:forEach var="hotelList" items="${hotelList }" begin="0" end="3">
                    <c:if test="${hotelList.city_id eq 210} ">
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath }/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>${hotelList.hotel_score }Superb</span> </span>
                                    <h3><a href="${pageContext.request.contextPath }/hotel/hotelDetail?hotel_id=${hotelList.hotel_id}">${hotelList.hotel_kor }</a></h3>
                                    <p class="dolor">$1870 <span>/ Per Person</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>3 Days</li>
                                        <li><i class="fas fa-map-marker-alt"></i>${hotelList.hotel_loc }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                   </c:forEach>

                    
                </div> <!-- row class 끝 -->
            </div>
        </div>
        <!-- Favourite Places End -->
			</div>
		</div><!-- recommend 끝 -->
	</div> <!-- hotel_container 끝 -->
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script type="text/javascript">
////////////////////////출발지역 또는 도착지역 모달창 클릭시 모달실행///////////////////////
function onClick() {
    document.querySelector('.modal_wrap').style.display ='block';
    document.querySelector('.black_bg').style.display ='block';
    
}


function offClick() {
    document.querySelector('.modal_wrap').style.display ='none';
    document.querySelector('.black_bg').style.display ='none';
    
}

document.getElementById('modal_btn').addEventListener('click', onClick);
document.querySelector('.modal_close').addEventListener('click', offClick);
//////////////////////////////////////////////////////////////////////////

$(function() {
	// 국가를 눌렀을 때 해당 국가에 대한 도시들 가져오는 ajax
	$('.country_li').on('click', function() {
		// 클릭했을 때의 국가 ID
		let country_id = $(this).attr('id');
		
		$.ajax({
			url : '/pkageRest/selectCity',
			type : 'post',
			data : {'country_id' : country_id},
			dataType : 'json',
			success : function(data) {
				let cityUl = $('.modal_close_country_2 ul'); // city 넣을 ul태그
				
				cityUl.children('li').remove(); // 이미 있는 li 지우기
				
				// li 태그 만들어 주기
				$.each(data, function(index, item) {
					cityUl.append("<li><span id="+item.city_id+" class='city_id'>"+item.city_name+"</span></li>")
				});
				
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
	
	// 국가 선택 후 도시 클릭했을 때 처리
	$(document).on("click",".city_id",function(){
		// input 과 hidden 에 값 넣어주기
		// starting, starting_hidden
		$('.starting').val($(this).text());
		$('.starting_hidden').val($(this).attr('id'));
		
		// 모달창 끄기
		offClick();
	});

	
	// 패키지 검색 눌렀을 때 유효성 검사 및 검색으로 넘어가기
	$('#hotelSearchBtn').on('click', function() {
		let destiPoint = $('.starting_hidden').val(); // 가고싶은 지역의 id
		
		if(destiPoint == '') {
			alert("가고싶은 지역을 선택해주세요.");
			// 모달창 켜기
			onClick();
		} else {
			let startDate = $('#dates_start_check').val()
			let endDate = $('#dates_start_end').val()
			
			let startDate_arr = startDate.split("-");
			let endDate_arr = endDate.split("-");
			
			let stDate = new Date(startDate_arr[0], startDate_arr[1], startDate_arr[2]);
			let edDate = new Date(endDate_arr[0], endDate_arr[1], endDate_arr[2]);
			
			let cal = edDate.getTime() - stDate.getTime();
			let calDate = cal / (1000*60*60*24);
			
			$('.calDate').val(calDate);
			$('#hotelSearchForm').submit();
		}

	});
	
})
	


</script>
</body>
</html>