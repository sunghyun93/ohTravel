<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<meta charset="UTF-8">
<title>해외 패키지 여행</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pkage/package_search.css">
</head>
<body>
<!--티켓 검색부분  -->
<div class="search_field">
	<div class="trip">
		<div class="round_trip"></div>
		<div class="oneway"></div>
	</div>	
	<div class="start_end">
			<!--왕복 모달시작  -->
		<div>
			 <input type="text" id="modal_btn" class="starting" data-toggle="modal" data-target="#exampleModalCenter" placeholder="가고싶은 나라를 선택해주세요" readonly>
			 <input type="hidden" value="" class="starting_hidden">	
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
			<select name="city_name">
				<c:forEach var="city" items="${cityList }">
					<option value="${city.city_id }">${city.city_name } 출발</option>
				</c:forEach>
			</select>
		</div>
		
		<div class="date_start">
			<input type="date" name="dates_start_check" value="2022-12-20" id="dates_start_check" class="dates_start_check" min="2022-12-20" max="2022-12-27">
		</div>
		<div class="search">
			<input type="button" id="pkgSearchBtn" class="pkg_search" value="패키지 검색">
		</div>
	</div><!-- start_end -->

</div><!-- search_field -->



<!-- 바디부분 -->
	<div class="place-wrap">
<!-- 이번주 베스트 Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>FEATURED TOURS Packages</span>
                            <h2>판매 베스트</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
	                <c:forEach var="pkage" items="${pkageList }">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-place mb-30">
	                            <div class="place-img">
	                                <img src="${pkage.pkage_Img_path }" alt="" height="246.52px">
	                            </div>
	                            <div class="place-cap">
	                                <div class="place-cap-top">
	                                    <span><i class="fas fa-star"></i><span>${pkage.pkage_score }</span></span>
	                                    <h6><a href="#">${pkage.pkage_name }</a></h6>
	                                    <h6>${pkage.pkage_info }</h6>
	                                    <p class="dolor"><fmt:formatNumber value="${pkage.pkage_dt_Aprice }" pattern="#,###"/>원~</p>
	                                </div>     
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div> <!-- row -->
            </div><!-- container -->
        </div><!-- favourite-place place-padding -->
        <!-- 이번주 베스트 End  -->
        
        <!-- 테마 추천 Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>FEATURED TOURS Packages</span>
                            <h2>힐링 패키지 추천</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<c:forEach var="pkageThema" items="${pkageListThema }">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-place mb-30">
	                            <div class="place-img">
	                                <img src="${pkageThema.pkage_Img_path }" alt="" height="246.52px">
	                            </div>
	                            <div class="place-cap">
	                                <div class="place-cap-top">
	                                    <span><i class="fas fa-star"></i><span>${pkageThema.pkage_score }</span></span>
	                                    <h6><a href="#">${pkageThema.pkage_name }</a></h6>
	                                    <h6>${pkageThema.pkage_info }</h6>
	                                    <p class="dolor"><fmt:formatNumber value="${pkageThema.pkage_dt_Aprice }" pattern="#,###"/>원~</p>
	                                </div>     
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- favourite-place place-padding -->
        <!-- 테마 추천 End -->
	</div>

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
		}

	});
})
	


</script>
</body>
</html>