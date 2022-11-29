<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

ul, li {
	list-style: none;
}

a {
	color: #333;
	text-decoration: none;
}

.js_tabs {
	position: relative;
	margin-bottom: 40px;
}

.tabs {
	overflow: hidden;
	padding-left: 0;
}

.js_tabs.no_division>.tabs.sort>li.item01 {
	width: 120px;
}

.js_tabs.no_division>.tabs.sort>li.item02 {
	width: 120px;
}

.js_tabs.no_division>.tabs.sort>li.item03 {
	width: 120px;
}

.js_tabs.no_division>.tabs.sort>li.item04 {
	width: 120px;
}

.js_tabs.no_division>.tabs.sort>li.item05 {
	width: 120px;
}

.js_tabs.no_division>.tabs.sort>li.item06 {
	width: 120px;
}

.type1 .tabs>li {
	height: 62px;
	line-height: 62px;
}

.type1 .tabs>li {
	display: table;
	height: 52px;
	line-height: 52px;
	border-width: 1px 0 0 1px;
	border-color: #ddd;
	border-style: solid;
	background-color: #fff;
	border-bottom: 1px solid black;
}

.tabs>li {
	float: left;
	position: relative;
	text-align: center;
	z-index: 1;
}

.type1 .tabs>li.selected {
	border-color: #111;
	border-right: 1px solid #111;
	border-bottom: none;
	color: #5e2bb8;
}

.type1 .tabs>li.selected:after {
	background-color: #fff;
	left: 0;
	right: 0;
}

.type1 .tabs>li:after {
	height: 1px;
	background-color: #111;
}

.tabs>li:after {
	content: '';
	position: absolute;
	bottom: 0;
}

.tabs>li.selected {
	border-color: #5e2bb8;
	border-left: 1px solid #5e2bb8;
	z-index: 2;
}

.tabs>li+li {
	border-left: none;
}

.type1 .tabs>li:last-child {
	border-right: 1px solid black;
}

.item02 {
	color: #333;
	border: none;
	background: white;
}

#airplane {
	color: #5e2bb8;
}

.flight_srch.type {
    background-color: #f3f4f8;
    border: none;
    border-top: 1px solid #ddd;
    box-shadow: none;
    margin-bottom: 30px;
}

.flight_srch {
    background: #fff;
    display: block;
    border: 1px solid #ddd;
    box-shadow: 3px 4px 4px 0px rgb(105 105 105 / 15%);
    padding: 26px 30px 26px;
}

.flight_srch.type .text_wrap.mid {
    margin: 0 0 18px;
}
.text_wrap.mid {
    margin-top: 40px;
    margin-bottom: 24px;
}
.text_wrap {
    position: relative;
    margin: 40px 0 0;
    padding: 0;
}

.text_wrap.mid strong.tit {
    font-size: 17px;
    color: #111;
    font-weight: 200;
}
.text_wrap strong.tit {
    display: inline-block;
    font-size: 15px;
    line-height: 1;
    font-weight: 400;
    color: #111;
}

.flight_srch .row {
    width: 1140px;
    text-align: left;
    position: relative;
}
.row {
    display: table;
    width: 100%;
}
.row {
    display: table-row;
}
.row, .column, .flex {
    display: flex;
    flex-wrap: wrap;
}

.flight_srch .row .bowl {
    float: left;
}

.flight_srch .set, .flight_srch .btn {
    background: #fff;
    float: none;
    height: 46px;
    line-height: 46px;
    border: 1px solid #c2c2c2;
    display: inline-block;
    vertical-align: middle;
    padding: 0 20px;
    border-radius: 3px;
    font-size: 15px;
    color: #888;
    text-align: left;
    margin: 0;
}

.icn.pos {
    position: relative;
    padding-left: 17px;
}

.flight_srch .set + .select_area, .flight_srch .bowl + .select_area, .flight_change .set + .select_area, .flight_change .bowl + .select_area {
    display: none;
    position: absolute;
    top: 0;
    left: 0;
}
.js_show_wrap {
    z-index: 19;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('.item02').click(function() {
			let gubun = $(this).attr('id');
			console.log(gubun);
			$.ajax({
				url: '/searchCategoryAjax',
				data: {'search_word' : $('#search_word').val(),
						'gubun' : gubun},
				dataType: 'html',
				success: function(data) {
					$('.no_division').empty();
					$('.empty_here').empty();
					$('.no_division').html(data)
				}
			})
		});
	})

</script>
</head>
<body>
	<div class="js_tabs type1 no_division">
		<ul class="tabs sort">
			<li class="item01"><button id="all" class="item02">전체</button></li>
	        <li class="item"><button id="pkage" class="item02">패키지</button></li>
	        <li class="item03"><button id="hotel" class="item02">호텔/펜션</button></li>
	        <li class="item04"><button id="ticket" class="item02">투어/입장권</button></li>
			<li class="item05 selected"><button id="airplane" class="item02">항공</button></li>
		</ul>
	</div>
	<div tab="air"><div class="flight_srch type"><div class="text_wrap mid"><strong class="tit">항공권 검색은 빠르게 </strong></div> <div class="row"><div class="bowl"><a href="#select_area" title="인천/김포" class="set js_show" style="overflow: hidden;"><span class="icn pos">SEL 인천/김포</span></a> <!----></div> <div class="js_show_wrap select_area dep"><input type="text" title="출발지" id="input_RT_dep" autocomplete="off" placeholder="인천/김포" data-target="#select_part" class="input_keyword"></div> <div class="mid_cell"><span class="move_arrow"></span></div> <div class="bowl"><a href="#select_area1" title="하네다 공항" class="set js_show" style="overflow: hidden;"><span class="icn pos">HND 하네다 공항</span></a> <!----></div> <div class="js_show_wrap select_area arr"><input type="text" title="도착지" id="input_RT_arr" autocomplete="off" placeholder="하네다 공항" data-target="#select_part" class="input_keyword"></div> <div><span class="form_holder text"><input type="checkbox" id="chk_01" class="inpt_checkbox"> <label for="chk_01" class="label_checkbox" style="margin-left: 8px;">직항</label></span></div> <div id="select_part" class="lypop_seach_local"><!----> <div class="btn_full_go" style="display: none;"><a href="#" class="txt arrow_r">전체지역 <em>전세계 항공권 쉽게 찾아보기</em> <span>예산에 맞는 항공권을 찾아보세요!</span></a></div> <p class="txt"><span class="exclam">지역이나 공항명으로 검색 가능합니다.</span></p> <div class="area_point"><div class="js_tabs place_list"><ul class="tabs"><li class="selected"><a href="#">국내</a></li><li class=""><a href="#">동남아</a></li><li class=""><a href="#">일본</a></li><li class=""><a href="#">중국</a></li><li class=""><a href="#">유럽</a></li><li class=""><a href="#">미주</a></li><li class=""><a href="#">대양주</a></li><li class=""><a href="#">캐나다</a></li><li class=""><a href="#">서남아</a></li><li class=""><a href="#">중남미</a></li><li class=""><a href="#">중동</a></li><li class=""><a href="#">아프리카</a></li></ul> <div class="panels place_scroll"><div id="place01" class="panel selected"><ul class="place_items"><li><a href="#"><span>제주
                  <!----></span></a></li><li><a href="#"><span>부산
                  <!----></span></a></li><li><a href="#"><span>김포
                  <!----></span></a></li><li><a href="#"><span>인천
                  <!----></span></a></li><li><a href="#"><span>광주
                  <!----></span></a></li><li><a href="#"><span>양양
                  <!----></span></a></li><li><a href="#"><span>여수
                  <!----></span></a></li><li><a href="#"><span>포항
                  <!----></span></a></li><li><a href="#"><span>울산
                  <!----></span></a></li><li><a href="#"><span>군산
                  <!----></span></a></li><li><a href="#"><span>원주
                  <!----></span></a></li><li><a href="#"><span>대구
                  <!----></span></a></li><li><a href="#"><span>청주
                  <!----></span></a></li><li><a href="#"><span>무안
                  <!----></span></a></li><li><a href="#"><span>진주
                  <!----></span></a></li></ul></div></div></div></div> <div class="popup_footer_wrap"><div class="popup_btn_box"><a href="#" class="txt">닫기</a></div></div></div></div> <div class="row"><div class="bowl"><a href="#none" class="set ok"><span class="icn cal">11.29(화)</span></a></div> <span class="dash">~</span> <div class="bowl"><a href="#none" class="set ok"><span class="icn cal">11.29(화)</span></a></div> <div class="mid_cell"></div> <div class="bowl"><a href="#select_person" title="일반석" class="btn person js_show" style="overflow: hidden;"><span class="icn member">성인 1명</span> <span class="divider_dot"></span>일반석
      </a></div> <a href="#none" class="btn big em">실시간 항공권 검색</a> <!----> <div id="select_tripstartdate" class="js_show_wrap lypop_calendar"><div class="ly_wrap"><div class="calendar_wrap"><a href="#none " class="prev off"><span class="blind">이전달</span></a> <a href="#" class="next"><span class="blind">다음달</span></a> <div class="inr"><div class="header"><span></span></div> <div class="calendar_area"><div class="week"><p class="sun">일</p> <p>월</p> <p>화</p> <p>수</p> <p>목</p> <p>금</p> <p class="sat">토</p></div> <div class="calendar"></div></div></div> <div class="inr right"><div class="header"><span></span></div> <div class="calendar_area"><div class="week"><p class="sun">일</p> <p>월</p> <p>화</p> <p>수</p> <p>목</p> <p>금</p> <p class="sat">토</p></div> <div class="calendar"></div></div></div></div> <!----></div> <div class="option_wrap"><input type="text" title="가는 날" placeholder="가는 날" readonly="readonly" class="inpt_text2 w130"> <!----> <!----> <button class="btn pink date_on">
      
      
      <span class="divider_dot"> 선택완료</span></button></div></div> <div id="select_autocomplete" class="lypop_seach_local airpop" style="width: 410px;"><div class="city_search_list"><div class="notice"><strong>검색조건에 해당하는 결과가 없습니다.</strong> <p>다시 검색해주세요.</p></div></div> <div class="popup_footer_wrap"><div class="popup_btn_box"><a href="#" class="txt">닫기</a></div></div></div></div></div> <div class="related_search">원하는 도시의 실시간 항공권을 검색해보세요 !</div></div>
</body>
</html>