<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		
<%-- 	<form id="htSearchForm" action="/hotel/searchResult" method="GET">
		<input type="hidden" name="hotel_gubun" value="s">
		<div class="start_end">
				<!--왕복 모달시작  -->
			<div>
				 <input style="text-align: center;" type="text" id="modal_btn" class="starting" data-toggle="modal" data-target="#exampleModalCenter" 
				 placeholder="" readonly>
				 <input type="hidden" name="toDesti" value="" class="starting_hidden">	
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
	
			<div>
		
		
			</div>
			
			<div class="date_start">
				<input type="date" name="dates_start_check" value="2022-12-20" id="dates_start_check" class="dates_start_check" min="2022-12-20" max="2022-12-27">
			</div>
			<div class="date_end">
				<input type="date" name="dates_start_end" value="2022-12-21"  id="dates_start_end" class="dates_start_end" min="2022-12-20" max="2022-12-27">
			</div>
			<div class="search">
				<button type="button" id="pkgSearchBtn" class="pkg_search" >패키지 검색</button>
			</div>
		</div><!-- start_end -->
	</form>
	<div class="infoDiv"> 공백 </div>
</div><!-- search_field -->
		 --%>
		
		
		
		
		
		
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
                    <c:forEach var="hotelList" items="${hotelList }" begin="0" end="3">
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
	$('#pkgSearchBtn').on('click', function() {
		let destiPoint = $('.starting_hidden').val(); // 가고싶은 지역의 id
		let startPoint = $('select[name="city_name"] option:selected').val(); // 출발지의 id
		let startDate = $('#dates_start_check').val(); // 출발 날짜
		
		console.log(destiPoint+","+startPoint+","+startDate);
		
		if(destiPoint == '') {
			alert("가고싶은 지역을 선택해주세요.");
			// 모달창 켜기
			onClick();
		} else {
			$('#pkgSearchForm').submit();
		}

	});
})
	


</script>
</body>
</html>

</script>
</body>
</html>