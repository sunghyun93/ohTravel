<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container>.inr {
	width: 1200px;
	margin: 50px auto 0;
}

.contents {
	min-height: 5400px;
}

.text_wrap.line.top {
	padding-bottom: 18px;
	margin-bottom: 18px;
}

.text_wrap.type.top {
	margin: 0 0 20px;
}

.text_wrap.big {
	margin-top: 60px;
	margin-bottom: 30px;
}

.text_wrap.line {
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

.text_wrap.type {
	display: table;
	width: 100%;
}

.text_wrap {
	position: relative;
	margin: 40px 0 0;
	padding: 0;
}

.text_wrap.line.top strong.tit {
	font-size: 24px;
	font-weight: normal;
	margin-bottom: 20px;
}

strong.tit {
	display: table-cell;
	vertical-align: middle;
}

.related_search {
	font-size: 13px;
	color: #666;
	margin: 0 0 35px;
}

.related_search .tit {
	color: #333;
	display: inline-block;
}

ul, li {
	list-style: none;
}

a {
	color: #333;
	text-decoration: none;
}

.related_search ul {
	margin-left: 5px;
}

.related_search ul, .related_search li {
	display: inline-block;
	margin-left: 18px;
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
	border-right: 1px solid #ddd;
}

.ly_wrap {
	width: 100%;
}

.result_wrap>.inr {
	width: 240px;
}

.ly_wrap .inr {
	width: 240px;
	float: left;
}

.js_acc.filter_wrap {
	margin-top: 0;
}

.js_acc {
	border-top: 1px solid #eaeaea;
}

.js_acc.filter_wrap .inr {
	float: none;
	width: 100%;
	padding-bottom: 9px;
	border-bottom: 1px solid #eaeaea;
}

.js_acc.filter_wrap .header {
	padding: 25px 25px 16px 0;
	border-bottom: none;
	font-size: 15px;
	font-weight: 600;
}

.js_acc .header {
	display: block;
	position: relative;
	border-bottom: 1px solid #eaeaea;
	padding: 20px;
	color: #111;
}

.js_acc.filter_wrap .header:after {
	top: 26px;
	right: 0;
	width: 14px;
	height: 10px;
	background-position: -178px -30px;
}

.js_acc .header:after {
	width: 20px;
	height: 20px;
	background-position: -143px -52px;
	position: absolute;
	top: 20px;
	right: 20px;
}

.js_acc.filter_wrap .view {
	border: none;
	padding: 0 0 12px;
}

.js_acc .view {
	display: none;
	padding: 20px;
	border-bottom: 1px solid #eaeaea;
	line-height: 24px;
}

.form_holder.text {
	margin: 4px 4px 4px 0;
}

span.form_holder {
	display: inline-block;
	margin-right: 20px;
}

.form_holder {
	position: relative;
	vertical-align: top;
}

.form_holder input[type='checkbox'], .form_holder input[type='radio'] {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0 !important;
}

button, input, textarea {
	-webkit-border-radius: 0;
	border-radius: 0;
}

.form_holder.text label {
	z-index: 1;
}

.form_holder.text label {
	padding: 5px 10px;
	border: 1px solid #c2c2c2;
	border-radius: 3px;
	background-color: #fff;
	font-size: 13px;
	cursor: pointer;
}

.label_checkbox, .label_radio {
	position: relative;
	display: block;
	line-height: 20px;
	color: #333;
	padding-left: 34px;
	min-height: 24px;
}

.js_acc.filter_wrap .view .btn.gray {
	margin: 4px 0;
	height: 32px;
	line-height: 30px;
	font-size: 13px;
}

.btn.gray {
	color: #fff !important;
	border: solid 1px #5b606e;
	background-color: #5b606e;
}

.result_wrap>.inr.right {
	width: 900px;
}

.ly_wrap .inr.right {
	float: right;
}

.filter_top {
	margin-bottom: 30px;
}

.mt0 {
	display: inline-block;
	margin-top: 0px !important;
}

.filter_top .tit {
	float: left;
	width: 110px;
	padding-top: 3px;
	font-size: 17px;
}

p {
	line-height: 1.5;
}

.spr.filter {
	width: 17px;
	height: 17px;
	background-position: -58px -52px;
}

.spr, .paginate a.next, .paginate a.prev, .paginate a.prevend .paginate a.nextend {
	display: inline-block;
	content: '';
	background-repeat: no-repeat;
	background-image:
		url(https://image.hanatour.com/usr/static/img2/pc/com/spr_com.png);
}

.filter_top .tit .notice_count {
	margin-left: 4px;
	font-size: 13px;
	line-height: 24px;
	vertical-align: middle;
	width: 24px;
	height: 24px;
	background: #5e2bb8;
}

.notice_count {
	display: inline-block;
	text-align: center;
	border-radius: 50%;
	color: #fff;
}

.filter_sticky .filter_top .inr, .result_wrap .right .filter_top .inr {
	width: 790px;
	min-height: 40px;
}

.filter_top .inr {
	width: 1090px;
	float: left;
	margin-top: 20px;
}

.option_wrap.result {
	padding-bottom: 20px;
	border-bottom: 1px solid #ddd;
	color: #111;
}

.option_wrap {
	position: relative;
	padding: 0;
}

.its .option_wrap .count {
	font-size: 17px;
	color: #111;
	font-weight: normal;
}

.option_wrap .count {
	display: inline-block;
	margin-right: 20px;
	font-weight: 600;
	font-size: 15px;
	color: #111;
}

.its .option_wrap .count em {
	font-size: 15px;
}

.right_cont {
	float: right;
}

.list_sort li {
	margin-left: 20px;
}

.list_sort>li {
	float: left;
}

.prod_list_wrap {
	width: 100%;
}

.prod_list_wrap ul {
	padding-left: 0;
}

.prod_list_wrap>ul>li:first-child {
	margin-left: 0;
}

.prod_list_wrap .type>li {
	width: 100%;
	margin-left: 0;
	padding: 30px 0 0;
	border-bottom: 1px solid #ddd;
}

.prod_list_wrap>ul>li {
	position: relative;
	float: left;
	width: 320px;
}

.prod_list_wrap .type .inr {
	width: 200px;
	min-height: 200px;
	overflow: hidden;
	position: absolute;
	top: 30px;
	left: 0;
}

.prod_list_wrap .type .img {
	height: 200px;
}

.prod_list_wrap .img {
	width: 100%;
	height: 210px;
}

.img {
	display: inline-block;
}

.prod_list_wrap .img .group_area {
	position: absolute;
	left: 0;
	bottom: 0;
	right: 0;
	text-align: right;
	z-index: 10;
}

.prod_list_wrap .img img, .prod_thum_list .img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.img img {
	display: block;
}

img {
	max-width: 100%;
	height: 100%;
	vertical-align: top;
}

.inr.right .prod_list_wrap .type .inr.htl {
	width: 676px;
}

.prod_list_wrap .type .inr.htl {
	position: relative;
	float: right;
	width: 976px;
	height: 230px;
	margin-right: 0;
	padding: 0 221px 0 0;
	top: 0;
}

.tag_group>span.attr {
	border: 1px solid #5b699c;
	color: #5b699c;
}

.tag_group>span+span {
	margin-left: 5px;
}

.tag_group>span {
	background: #fff;
}

.tag, .tag_group>span, .badge {
	display: inline-block;
	padding: 0 6px;
	height: 19px;
	line-height: 17px;
	font-size: 12px;
}

.prod_list_wrap .htl .item_text {
	margin-top: 2px;
}

.prod_list_wrap .item_text {
	max-height: 45px;
}

.prod_list_wrap .tag_group+.item_title, .prod_list_wrap .tag_group+.item_title2
	{
	margin-top: 8px;
}

.prod_list_wrap .item_title {
	font-size: 20px;
	color: #111;
	font-weight: 600;
	display: block;
	line-height: 30px;
}

.tag_group+.item_title {
	margin-top: 5px;
	display: block;
}

.item_title {
	font-size: 17px;
	line-height: 27px;
	color: #111;
}



.prod_list_wrap .item_title.sub {
	font-size: 13px;
	color: #888;
	margin-top: 9px;
	font-weight: normal;
	line-height: 1;
}

.prod_list_wrap .info_group {
    margin-top: 15px;
}

.prod_list_wrap .htl .item_text {
    margin-top: 2px;
}
.prod_list_wrap .info_group p {
    color: #333;
}
.prod_list_wrap .item_text {
    max-height: 45px;
    margin-top: 5px;
    color: #333;
}
.item_text {
    font-size: 14px;
    color: #333;
    line-height: 21px;
}

.item_text .icn {
    padding-left: 27px;
}
.icn.pos {
    position: relative;
    padding-left: 17px;
}
.icn {
    display: inline-block;
    position: relative;
}

.item_text .icn:before {
    position: absolute;
    left: 3px;
    top: 3px;
    width: 14px;
    height: 14px;
}
.icn.pos:before {
    position: absolute;
    left: 0;
    top: 1px;
    width: 13px;
    height: 14px;
    margin-right: 9px;
    background-position: -135px 0;
    vertical-align: middle;
}

.icn:before {
    display: inline-block;
    content: '';
    background-repeat: no-repeat;
    background-image: url(https://image.hanatour.com/usr/static/img2/pc/com/spr_icn.png);
}

.prod_list_wrap .htl .info_bottom {
    left: 0;
}
.prod_list_wrap .info_bottom {
    position: absolute;
    bottom: 30px;
    left: 224px;
    right: 0;
}

.prod_list_wrap .htl .item_group {
    margin-top: 0px;
}

.score_htl_wrap {
    position: relative;
    padding: 14px 0 0;
    line-height: 21px;
}

.score_htl_wrap .icn.star {
    color: #111;
    font-size: 14px;
    font-weight: bold;
    line-height: 16px;
    vertical-align: middle;
}

.score_htl_wrap .icn.star+.txt {
    margin-left: 5px;
}
.score_htl_wrap .txt {
    display: inline-block;
    color: #111;
    font-size: 14px;
    font-weight: normal;
    line-height: 16px;
    vertical-align: middle;
}

.txt {
	margin-bottom: 0;
}

.prod_list_wrap .htl .price_group {
    top: 30px;
}
.prod_list_wrap .type .price_group {
    position: absolute;
    top: 2px;
    right: 0;
    text-align: right;
}

.prod_list_wrap .htl .login_guide {
    display: inline-block;
    width: 140px;
    text-align: center;
    word-break: keep-all;
    padding-left: 15px;
}

.prod_list_wrap .htl .btn_wrap {
    width: auto;
}
.prod_list_wrap .htl .btn_wrap {
    position: absolute;
    right: 0;
    bottom: 30px;
    width: 170px;
    text-align: right;
}

prod_list_wrap .htl .btn.line {
    width: auto;
}

/* 페이징 */
.paginate_wrap {
    text-align: center;
    position: relative;
    margin-top: 15px;
}
.paginate_wrap .paginate {
    display: inline-block;
    margin: 0 auto;
    padding: 15px 0;
}
.paginate_wrap .paginate.type2 a, .paginate_wrap .paginate.type2 strong {
    padding: 0 7px;
}
.paginate a.prevend {
    background-position: -30px 0;
}
.paginate a.prev {
    margin: 0 15px 0 5px;
    background-position: -61px 0;
}
.paginate_wrap .paginate.type2 a, .paginate_wrap .paginate.type2 strong {
    padding: 0 7px;
}
.paginate strong {
    /* width: 37px; */
    height: 26px;
    /* padding: 0; */
    padding: 0 14px;
    color: #5e2bb8;
    text-align: center;
}
.paginate a, .paginate strong {
    display: inline-block;
    z-index: 2;
    padding: 0 14px;
    font-size: 14px;
    color: #111;
    vertical-align: middle;
    line-height: 26px;
}
.paginate a.next {
    margin: 0 5px 0 15px;
    background-position: -92px 0;
}
.paginate .direction {
    display: inline-block;
    width: 26px;
    height: 26px;
    position: relative;
    font-size: 0;
    line-height: 0;
    vertical-align: top;
    padding: 0 !important;
}
.paginate a.nextend {
    background-position: -123px 0;
}


</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('.item02').click(function() {
			let gubun = $(this).attr('id');
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
	        <li class="item03 selected"><button id="hotel" class="item02">호텔/펜션</button></li>
	        <li class="item04"><button id="ticket" class="item02">투어/입장권</button></li>
			<li class="item05"><button id="airplane" class="item02">항공</button></li>
		</ul>
	</div>
	<div>
		<div class="ly_wrap result_wrap" style="">
			<div class="inr">
				<div class="js_acc multi filter_wrap">
					<div class="inr">
						<a href="#filter_con1" class="header">가격</a>
						<div id="filter_con1" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="fprice_0" class="inpt_checkbox"> <label
									for="fprice_0" class="label_checkbox">0~44만원</label></span><span
									class="form_holder text"><input type="checkbox"
									id="fprice_1" class="inpt_checkbox"> <label
									for="fprice_1" class="label_checkbox">44~90만원</label></span><span
									class="form_holder text"><input type="checkbox"
									id="fprice_2" class="inpt_checkbox"> <label
									for="fprice_2" class="label_checkbox">90~141만원</label></span><span
									class="form_holder text"><input type="checkbox"
									id="fprice_3" class="inpt_checkbox"> <label
									for="fprice_3" class="label_checkbox">141~1175만원</label></span>
							</div>
							<a href="#none" class="btn gray">직접입력</a>
							<div class="form_wrap price" style="display: none;">
								<div class="form_holder">
									<input type="text" id="iptMinPrice" title="검색시작가격" value="0"
										class="inpt_text txr" style="width: 103px;"> <span
										class="divider">~</span> <input type="text"
										id="iptMaxnPrice" title="검색끝가격" value="0"
										class="inpt_text txr" style="width: 104px;">
								</div>
								<div class="btn_wrap">
									<a href="#none" class="btn line full">검색</a>
								</div>
							</div>
						</div>
					</div>
					<div class="inr">
						<a href="#filter_con3" class="header">숙소 평점</a>
						<div id="filter_con3" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="score_0" class="inpt_checkbox"> <!----> <!---->
									<!----> <label for="score_0" class="label_checkbox">최고(4.5+)</label></span><span
									class="form_holder text"><input type="checkbox"
									id="score_1" class="inpt_checkbox"> <!----> <!---->
									<label for="score_1" class="label_checkbox">우수(4+)</label> <!----></span><span
									class="form_holder text"><input type="checkbox"
									id="score_2" class="inpt_checkbox"> <!----> <label
									for="score_2" class="label_checkbox">좋음(3.5+)</label> <!---->
									<!----></span><span class="form_holder text"><input
									type="checkbox" id="score_3" class="inpt_checkbox">
									<label for="score_3" class="label_checkbox">양호(3+)</label> <!---->
									<!----> <!----></span>
							</div>
						</div>
					</div>
					<div class="inr">
						<a href="#filter_con4" class="header">숙소 종류</a>
						<div id="filter_con4" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="kind_0" class="inpt_checkbox"> <label
									for="kind_0" class="label_checkbox">호텔</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_1" class="inpt_checkbox"> <label
									for="kind_1" class="label_checkbox">레지던스</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_2" class="inpt_checkbox"> <label
									for="kind_2" class="label_checkbox">료칸</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_3" class="inpt_checkbox"> <label
									for="kind_3" class="label_checkbox">호스텔/백팩커스</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_4" class="inpt_checkbox"> <label
									for="kind_4" class="label_checkbox">기타</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_5" class="inpt_checkbox"> <label
									for="kind_5" class="label_checkbox">온천호텔</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_6" class="inpt_checkbox"> <label
									for="kind_6" class="label_checkbox">펜션</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_7" class="inpt_checkbox"> <label
									for="kind_7" class="label_checkbox">리조트</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_8" class="inpt_checkbox"> <label
									for="kind_8" class="label_checkbox">산장/롯지</label></span><span
									class="form_holder text"><input type="checkbox"
									id="kind_9" class="inpt_checkbox"> <label
									for="kind_9" class="label_checkbox">inn</label></span>
							</div>
							<a href="#" class="more" style="display: none;">더보기</a>
						</div>
					</div>
					<div class="inr">
						<a href="#filter_con5" class="header">숙소 특징</a>
						<div id="filter_con5" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="feat_0" class="inpt_checkbox"> <label
									for="feat_0" class="label_checkbox">h-컬렉션</label></span><span
									class="form_holder text"><input type="checkbox"
									id="feat_1" class="inpt_checkbox"> <label
									for="feat_1" class="label_checkbox">럭셔리호텔</label></span>
							</div>
							<a href="#" class="more" style="display: none;">더보기</a>
						</div>
					</div>
					<div class="inr">
						<a href="#filter_con6" class="header">숙소 등급</a>
						<div id="filter_con6" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="cls_0" class="inpt_checkbox"> <label for="cls_0"
									class="label_checkbox">5성급</label></span><span
									class="form_holder text"><input type="checkbox"
									id="cls_1" class="inpt_checkbox"> <label for="cls_1"
									class="label_checkbox">4성급</label></span><span
									class="form_holder text"><input type="checkbox"
									id="cls_2" class="inpt_checkbox"> <label for="cls_2"
									class="label_checkbox">3성급</label></span><span
									class="form_holder text"><input type="checkbox"
									id="cls_3" class="inpt_checkbox"> <label for="cls_3"
									class="label_checkbox">2성급</label></span><span
									class="form_holder text"><input type="checkbox"
									id="cls_4" class="inpt_checkbox"> <label for="cls_4"
									class="label_checkbox">1성급</label></span><span
									class="form_holder text"><input type="checkbox"
									id="cls_5" class="inpt_checkbox"> <label for="cls_5"
									class="label_checkbox">성급없음</label></span>
							</div>
						</div>
					</div>
					<div class="inr">
						<a href="#filter_con8" class="header">숙소 부대시설</a>
						<div id="filter_con8" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="facility_0" class="inpt_checkbox"> <label
									for="facility_0" class="label_checkbox">wi-fi(무료)</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_1" class="inpt_checkbox"> <label
									for="facility_1" class="label_checkbox">러기지/가방 보관
										서비스</label></span><span class="form_holder text"><input
									type="checkbox" id="facility_2" class="inpt_checkbox">
									<label for="facility_2" class="label_checkbox">세탁시설</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_3" class="inpt_checkbox"> <label
									for="facility_3" class="label_checkbox">24시간 프런트 데스크</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_4" class="inpt_checkbox"> <label
									for="facility_4" class="label_checkbox">주차장(무료)</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_5" class="inpt_checkbox"> <label
									for="facility_5" class="label_checkbox">아침식사가능(유료)</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_6" class="inpt_checkbox"> <label
									for="facility_6" class="label_checkbox">흡연구역(지정)</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_7" class="inpt_checkbox"> <label
									for="facility_7" class="label_checkbox">프런트 데스크</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_8" class="inpt_checkbox"> <label
									for="facility_8" class="label_checkbox">레스토랑</label></span><span
									class="form_holder text"><input type="checkbox"
									id="facility_9" class="inpt_checkbox"> <label
									for="facility_9" class="label_checkbox">세탁서비스</label></span>
							</div>
							<a href="#" class="more">더보기</a>
						</div>
					</div>
					<div class="inr">
						<a href="#filter_con9" class="header">객실 편의시설</a>
						<div id="filter_con9" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="conveni_0" class="inpt_checkbox"> <label
									for="conveni_0" class="label_checkbox">wi-fi(무료)</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_1" class="inpt_checkbox"> <label
									for="conveni_1" class="label_checkbox">세면용품</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_2" class="inpt_checkbox"> <label
									for="conveni_2" class="label_checkbox">헤어드라이어</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_3" class="inpt_checkbox"> <label
									for="conveni_3" class="label_checkbox">슬리퍼</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_4" class="inpt_checkbox"> <label
									for="conveni_4" class="label_checkbox">에어컨</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_5" class="inpt_checkbox"> <label
									for="conveni_5" class="label_checkbox">개별온도조절</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_6" class="inpt_checkbox"> <label
									for="conveni_6" class="label_checkbox">비데 화장실</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_7" class="inpt_checkbox"> <label
									for="conveni_7" class="label_checkbox">타월 제공</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_8" class="inpt_checkbox"> <label
									for="conveni_8" class="label_checkbox">책상</label></span><span
									class="form_holder text"><input type="checkbox"
									id="conveni_9" class="inpt_checkbox"> <label
									for="conveni_9" class="label_checkbox">안전금고</label></span>
							</div>
							<a href="#" class="more">더보기</a>
						</div>
					</div>
					<div class="inr">
						<a href="#filter_con10" class="header">지역</a>
						<div id="filter_con10" class="view">
							<div class="form_wrap">
								<span class="form_holder text"><input type="checkbox"
									id="city_0" class="inpt_checkbox"> <label
									for="city_0" class="label_checkbox">교토</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_1" class="inpt_checkbox"> <label
									for="city_1" class="label_checkbox">오사카</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_2" class="inpt_checkbox"> <label
									for="city_2" class="label_checkbox">도쿄</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_3" class="inpt_checkbox"> <label
									for="city_3" class="label_checkbox">오키나와</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_4" class="inpt_checkbox"> <label
									for="city_4" class="label_checkbox">나가노</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_5" class="inpt_checkbox"> <label
									for="city_5" class="label_checkbox">후쿠오카</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_6" class="inpt_checkbox"> <label
									for="city_6" class="label_checkbox">삿포로</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_7" class="inpt_checkbox"> <label
									for="city_7" class="label_checkbox">하코네</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_8" class="inpt_checkbox"> <label
									for="city_8" class="label_checkbox">나고야</label></span><span
									class="form_holder text"><input type="checkbox"
									id="city_9" class="inpt_checkbox"> <label
									for="city_9" class="label_checkbox">구마모토</label></span>
							</div>
							<a href="#" class="more" style="display: none;">더보기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="inr right">
				<div class="filter_top mt0">
					<p class="tit">
						<span class="spr filter"></span>필터 <span class="notice_count">0</span>
					</p>
					<div class="inr">
						<a href="#" class="btn"><span class="spr refresh10"></span>필터초기화
						</a>
					</div>
				</div>
				<div class="option_wrap result">
					<span class="count"> 호텔 <em>(${hotelListCount})</em></span>
					<div class="right_cont">
						<ul class="list_sort">
							<li><a href="#">가격높은순</a></li>
							<li><a href="#">가격낮은순</a></li>
							<li><a href="#">성급 높은순</a></li>
							<li><a href="#">성급 낮은순</a></li>
							<li><a href="#">상품평 높은순</a></li>
						</ul>
					</div>
				</div>
				<div class="prod_list_wrap">
					<ul class="type">
						<c:forEach var="hotelList" items="${hotelList}" begin="0" end="19">
						<li>
							<div>
								<div class="inr img">
									<!---->
									<div class="group_area">
										<div></div>
									</div>
									<img src="${hotelList.h_img_path}">
								</div>
								<div class="inr htl">
									<div class="tag_group">
										<!---->
										<span class="attr">호텔</span> <span
											class="attr star_value item_text"> ${hotelList.hotel_grade}성급</span>
									</div>
									<div class="item_title eps2">
										<strong>${hotelList.hotel_kor}</strong>
									</div>
									<p class="item_title sub">${hotelList.hotel_eng}</p>
									<div class="info_group">
										<p class="item_text">
											<span class="icn pos">${hotelList.city_name}</span>
										</p>
									</div>
									<div class="info_bottom">
										<div class="item_group">
											<div class="score_htl_wrap">
												<span class="icn star">${hotelList.hotel_score}</span>
												<p class="txt">우수</p>
												<p class="txt">
													<em>931개의 후기</em>
												</p>
											</div>
										</div>
									</div>
									<div class="price_group">
										<p class="state"></p>
										<strong class="price"> (가격 넣어야됨) <span>원~</span></strong>
									</div>
									<div class="btn_wrap">
										<a href="#" class="btn line">상세보기</a>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="paginate_wrap">
					<div class="paginate type2">
						<div>
							<a href="#none" class="direction prevend"
								style="display: none;">처음</a> <a href="#none"
								class="direction prev" style="display: none;">이전</a> <span><strong>1</strong><a
								href="#none">2</a><a href="#none">3</a><a href="#none">4</a><a
								href="#none">5</a><a href="#none">6</a><a href="#none">7</a><a
								href="#none">8</a><a href="#none">9</a><a href="#none">10</a></span>
							<a href="#none" class="direction next" style="">다음</a> <a
								href="#none" class="direction nextend" style="">끝</a>
						</div>
					</div>
					<!---->
				</div>
				<!---->
			</div>
		</div>
	</div>
</body>
</html>