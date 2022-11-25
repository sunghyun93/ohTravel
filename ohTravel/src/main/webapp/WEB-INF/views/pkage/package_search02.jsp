<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.search_field{
	border:1px;
	background: #EAEAEA;
	width: 1200px;
	height: 140px;
	margin: 0 auto;
	margin-top:30px;
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
	border-radius: 5px;
    border: solid 1px #e8e8e8;
}
.dates_start_check{
	display:inline-block;
	width: 161px;
	height: 62px;
	text-align: center;
	border-radius: 5px;
    border: solid 1px #e8e8e8;
}
.pkg_search{
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
.pkg_search:hover{
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
        top: 75%;
        left: 25%;
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
    .modal_close> span{
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
/* 부트스트랩 select 부분 */
/*     border-radius: 5px;
    border: solid 1px #e8e8e8; */
.nice-select {
	width: 300px;
	height: 60px;
	vertical-align: middle;
}
.nice-select .current {
	line-height: 4;
}
.nice-select .list {
	width: inherit;
}

/* 버튼 */
button {
    background-color: #fff;
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
/* 패키지 상품 부분 */
.place-wrap {
	margin-bottom: 150px;
}
.place-padding {
    padding-top: 130px;
    padding-bottom: 30px;
}
   
</style>
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
			 <input type="text" id="modal_btn" class="starting" data-toggle="modal" data-target="#exampleModalCenter" placeholder="인천" readonly>
			 <input type="hidden" value="" class="starting_hidden">	
				<div class="black_bg"></div>
					<div class="modal_wrap">
					    <div class="modal_close"><span>close</span></div>
					    <div class="entire">
						    <span class="select_area">지역을 선택해주세요.</span>
						    <div class="modal_close_country">
						    	<div class="modal_close_country_1">
							        <ul>
							        	<li id="korea"><span id="a">국내</span></li>
							        	<li id="thailand"><span id="a">태국</span></li>
							        	<li id="japan"><span id="a">일본</span></li>
							        	<li id="china"><span id="a">중국</span></li>
							        </ul>
							    </div>
							    <div class="modal_close_country_2">
							        <ul>
							        	<%-- <c:forEach var="city" items="${city}"> DB에 있는 도시를 가져와서 돌리세요--%>
							        	<li id="jeju" value="제주"><span id="a">제주</span></li>
							        	<li id="busan" value="부산"><span id="a">부산</span></li>
							        	<li id="yeosu" value="여수"><span id="a">여수</span></li>
							        	<li id="incheon" value="인천"><span id="a">인천</span></li>
							        	<%-- </c:forEach> --%>
							        </ul>
							    </div>     
						        
						    </div> <!-- modal_close_country_1 -->
						</div>
		    		</div>    <!--모달끝  --> 
		</div>
			<%-- <div>
				<img class="change" src="${pageContext.request.contextPath}/airport/img/change.png" width="15px" height="15px">
			</div> --%>
		<div>
			<select name="city_name">
				<option value="110">인천 출발</option>
				<option value="120">여수 출발</option>
				<option value="130">부산 출발</option>
				<option value="140">제주도 출발</option>
			</select>
		</div>
		
		<div class="date_start">
			<input type="date" name="dates_start_check" value="2022-12-20" id="dates_start_check" class="dates_start_check" min="2022-12-20" max="2022-12-27">
		</div>
		<div class="search">
			<button type="button" class="pkg_search" >패키지 검색</button>
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
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                    <h6><a href="#">서유럽 3국 (프랑스/스위스/이탈리아) 8~12일 #베스트셀러</a></h6>
                                    <h6>프랑스, 스위스, 이탈리아 핵심관광</h6>
                                    <p class="dolor">18700원</p>
                                </div>     
                            </div>
                        </div>
                    </div>
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
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                            	<img src="${pageContext.request.contextPath}/assets/img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>4.5점</span> </span>
                                    <h6><a href="#">서유럽 3국 (프랑스/스위스/이탈리아) 8~12일 #베스트셀러</a></h6>
                                    <h6>프랑스, 스위스, 이탈리아 핵심관광</h6>
                                    <p class="dolor">18700원</p>
                                </div>
                            </div>
                        </div>
                    </div>
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
	
//////////////////////////출발지 선택시 값들어가게하는 함수////////////////////
	$(function(){
		  $("#jeju").click(function(){
		    	$(".starting").val("제주");
		    });
		  $("#busan").click(function(){
		    	$(".starting").val("부산");
		    });
		  $("#yeosu").click(function(){
		    	$(".starting").val("여수");
		    });
		  $("#incheon").click(function(){
		    	$(".starting").val("인천");
		    });
		  
	});

///////////////////////////////날짜 /////////////////////////////
$('.pkg_search').click(function(){
  var dateFrom = document.getElementById('dates_start_check');	//시작일
  var today = new Date();				//오늘 날짜

  dateFrom = new Date(dateFrom.value);
  var fromYear = dateFrom.getFullYear();
  var fromMonth = dateFrom.getMonth() + 1;
  var fromDay = dateFrom.getDate();

  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
  if (isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)){
    fromYear  = 0;
    fromMonth = 0;
    fromDay   = 0;
  }

	dateFrom = fromYear +'/'+ fromMonth +'/'+fromDay; 


  //오늘날짜 날짜 형식으로 지정
  var todayYear  = today.getFullYear(); 	//2020
  var todayMonth = today.getMonth() + 1;    	//06
  var todayDay   = today.getDate();  		//11
  today = todayYear +'/'+ todayMonth +'/'+todayDay;  // 2020/06/11 (형식 지정은 본인 자유)

  //날짜 조회 시, 시작일이 오늘 날짜보다는 크고, 종료일이 시작일보다는 커야하기 때문에 조건을 걸어줌
  if(dateFrom >= today && dateTo >= dateFrom){
  	return true;
  } else {
 	 alert("올바른 날짜를 선택하세요.");
  }
});//click() end





</script>
</body>
</html>