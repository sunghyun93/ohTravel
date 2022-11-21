<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.container {
  min-width: 1200px;
  min-height: 3000px;
  border: 5px solid red;
}

li {
  list-style: none;
  display: inline-block;
}

.search-result {
  
}

.result-letter-wrap {
  border-bottom: 1px solid;
  height: 60px;
}

.result-letter {
  font-size: 24px;
  font-weight: normal;
}

ul {
  display: inline-block;
}

.search-nav-contents li {
  display: inline-block;
  margin-left: 10px;
}

a {
  text-decoration: none;
  color: black;
  display: table-cell;
}

.search-nav-contents {
  width: 120px;
  border: 1px solid #dcdcdc;
  border-bottom-color: black;
  margin-left: 0;
}

.search-nav li {
  height: 62px;
  display: table;
  float: left;
  text-align: center;
}

.search-nav-contents a {
  vertical-align: middle;
}

.result-contents-wrap {
  height:5300px;
  border: 2px solid blue;
}

.filter {
  width: 240px;
  border: 1px solid orange;
  float: left;
}

.filter-category {
  margin-top: 20px;
  border-top: 1px solid #eaeaea;
}

.filter-category-contents {
  border-bottom: 1px solid #eaeaea;
  padding-bottom: 9px;
}

.filter-category-contents a {
  padding: 25px 25px 16px 0;
  font-weight: 600;
}

.filter-contents {
  border: 1px solid green;
  float: right;
  height: 3000px;
  width: 900px;
}

.filter-tag-wrap {
  height: 100px;
  border: 1px solid black;
  margin-bottom: 30px;
}

.title {
  
}

.filter-icon {
  background-image: url(https://image.hanatour.com/usr/static/img2/pc/com/spr_com.png);
  background-position: -58px -52px;
  background-repeat: no-repeat;
}

.filtered-count {
  
}

.selected-category {
  float: left;
}

.selected-category span {
  background-color: #eef0f3;
  border-radius: 3px;
}

.reset-filter {
  background-image: url(https://image.hanatour.com/usr/static/img2/pc/com/spr_com.png) no-repeat
  background-position: -150px -30px;
}

.result-category {
  border-bottom: 2px solid purple;
}

.count {
  float: left;
}

.order {
  float: right;
}

.result-contents {
  height: 200px;
  border: 3px solid pink;
}

.product-wrap {
  
}

.product-img-wrap {
  
}

.img-box {
  height: 200px;
  width: 200px;
  object-fit: cover;
}

.product-context strong {
  float: left;
}

</style>
</head>
<body>
	<div class="container">
  <div class="search-result">
    <div class="result-letter-wrap">
      <span class="result-letter">항목 검색결과</span>
   </div>
  <div class="relation-word">
    <span>연관검색어</span>
    <ul>
      <li>
        <a href="#" class="relative-search">항목1</a>
      </li>
      <li>
        <a href="#">항목2</a>
      </li>
     </ul>
  </div>
    <div class="search-nav">
      <ul>
        <li class="search-nav-contents">
          <a href="#">전체</a>
        </li>
        <li class="search-nav-contents">
          <a href="#">해외여행</a>
        </li>
        <li class="search-nav-contents">
          <a href="#">숙박</a>
        </li>
        <li class="search-nav-contents">
          <a href="#">패키지</a>
        </li>
        <li class="search-nav-contents">
          <a href="#">입장권</a>
        </li>
      </ul>
    </div>
  </div>
  <div class="result-contents-wrap">
    <div class="filter">
      <div class="filter-category">
        <div class="filter-category-contents">
          <a href="#">가격</a>
        </div>
        <div class="filter-category-contents">
            <a href="#">숙소 평점</a>
        </div>
        <div class="filter-category-contents">
            <a href="#">숙소 등급</a>
        </div>
        <div class="filter-category-contents">
            <a href="#">지역</a>
        </div>
      </div>
    </div>
    <div class="filter-contents">
      <div class="filter-tag-wrap">
        <p class="title">
          <img class="filter-icon">필터<span class="filtered-count"></span>
        </p>
        <div class="selected-category">
          <span>항공포함</span>
          <button class="reset-filter">필터 초기화</button>
        </div>
      </div>
      <div class="result-category">
        <span class="count">패키지</span>
        <em>8</em>
        <div class="order">
          <ul>
            <li>구매순</li>
            <li>평점순</li>
            <li>높은 가격순</li>
            <li>낮은 가격순</li>
          </ul>
        </div>
      </div>
      <div class="product-list">
        <ul>
          <li>
            <div class="product-wrap">
              <div class="product-img-wrap">
                <img class="img-box" src="https://image.hanatour.com/usr/cms/resize/400_0/2020/01/23/10000/9a28c458-ee80-4890-bc49-8ebb3bf96383.jpg">
              </div>
              <div class="product-context">
                <strong>북유럽 3~4국(덴마크/노르웨이/스웨덴/핀란드) 8~9일 #베스트셀러</strong>
              </div>
              <div class="product-detail">
                <span>북유럽 4개국(덴마크,노르웨이, 스웨덴, 핀란드) 또는 북유럽 3개국(노르웨이, 스웨덴, 핀란드)를 알차게 관광하는 북유럽 베스트셀러 상품입니다.</span>
              </div>
            </div>
          </li>
        </ul>

      </div> <!-- product-list -->
    </div> <!-- filter-contents -->
    
    
    
  </div> <!-- result-contents-wrap -->
    
  
</div> <!--container -->
</body>
</html>