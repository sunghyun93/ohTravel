# 여행 상품 통합 프로젝트(항공,호텔,입장권,패키지)
흩어져 있는 여행 관련 상품들(숙박, 항공, 패키지, 입장권)을 한데 모아 사용자로 하여금 한 사이트에서 상품들을 찾고 예약할 수 있도록 편리함을 제공하는 프로젝트

GitHub 링크: [GitHub](https://github.com/LWHyun/ohTravel/pulls?q=is%3Apr+author%3A%40me+is%3Aclosed)


## 목차
* 프로젝트 개요
    * 팀원 소개
    * 팀원 소개 및 역할
    * 개발 환경
        * FrontEnd
        * BackEnd
    * 프로젝트 분석        
* 프로젝트 분석(cloc)
    * 시스템 프로세스
    * 프로젝트 제공기능
    * ERD
* RestAPI 
* 구현기능    
* 부족했던점
* 프로젝트 후기
---

## 프로젝트 개요
### 프로젝트 소개 
#### 개요<br>
 * 흩어져 있는 여행 관련 상품들(숙박, 항공, 패키지, 입장권)을 한데 모아 사용자로 하여금 한 사이트에서 상품들을 찾고 예약할 수 있도록 편리함을 제공하는 프로젝트

#### 개발기간 및 인원
 * 개발기간 : 2022. 11. 17 ~ 2022. 12. 19(약 5주)
 * 개발인원 : 7명

#### 팀원소개 및 역할
<img src="https://user-images.githubusercontent.com/107449729/220266607-03df29a4-f4e4-4cad-b999-b0604c7b002b.png" width="500px" height="200px"></img>

<details>
<summary>개발환경 이미지</summary>
<div markdown="1">
   <img src="https://user-images.githubusercontent.com/107449729/220267571-54564520-62c1-4481-90dc-b6ef686e13ff.png" width="500px" height="200px"></img>
</div>
</details>

* FrontEnd
    * HTML5 / CSS
    * Javascript
    * jQuery
    * Bootstrap5

* BackEnd
    * 주요 프레임워크, 라이브러리
        * Java 11
        * SpringBoot 2.5.7
        * MyBatis
        * JSP
        * Lombok
    * DB
        * MySQL
    * Build Tool
        * Gradel
    * WAS
        * Apache Tomcat 9.0
    * Tool
        * STS
        * WorkBench
    * etc
        * Git
        * GitHub    

#### 프로젝트 분석(cloc)
 <img src="https://user-images.githubusercontent.com/107449729/220270220-ef0d303f-3c7f-4948-96fe-dbd30143a55a.png" width="500px" height="200px"></img>

## 시스템 프로세스
![image](https://user-images.githubusercontent.com/107449729/220270717-1d417166-3b4e-46ba-bbb0-c24d893669be.png)

## 프로젝트 제공기능
<details>
<summary> 프로젝트 기능 분류 </summary>
<div markdown="1"><br>
    <img src="https://user-images.githubusercontent.com/107449729/220273240-b25026d8-8e9c-4d52-9d7c-b3ab617f5d26.png">
    </img>
    <img src="https://user-images.githubusercontent.com/107449729/220274035-f0d1bc84-a727-40cf-b6eb-de8ddd5e45df.png">
    </img>
    <img src="https://user-images.githubusercontent.com/107449729/220274313-b509a2dd-f56c-423d-965f-67f8637f7ef0.png">
    </img>
    
</div>
</details>


* 항공예약 담당<br>
<img src="https://user-images.githubusercontent.com/107449729/220273054-09229d3c-b20b-4800-9d60-d66d1ecc0b7d.png">


## ERD
![image](https://user-images.githubusercontent.com/107449729/220274767-7c5c64ab-1d52-4e5f-94f1-8b58429324d6.png)
<details>
<summary> <span style="color:red"> 항공 ERD(맡은 부분)<span>  
</summary>
<div markdown="1"><br>
        <img src="//user-images.githubusercontent.com/107449729/220275328-4e1436f6-7a9b-4c65-ba6c-758491d0a3a1.png">
        
</div>
</details>
<details>
<summary> 회원 관련 테이블 / 국가 도시 테이블 </summary>
<div markdown="1"><br>
        <img src="//user-images.githubusercontent.com/107449729/220275872-cdd520b1-1b61-4590-8655-c075372e5550.png">
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220276857-d4218bf7-32ab-4afe-bae3-fdc0629c7b7d.png">
</div>
</details>
<details>
<summary> 패키지 관련 테이블 </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220276857-d4218bf7-32ab-4afe-bae3-fdc0629c7b7d.png">
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220277153-e8c4bc2f-db60-4bd2-9cfa-a91164485f8f.png">
</div>
</details>

## RESTAPI 명세서
![image](https://user-images.githubusercontent.com/107449729/220298658-11ab96b2-bdde-427a-bd5e-1ea59ec446f9.png)


## 구현 기능

### 항공권 검색 및 예약
<details>
<summary> 항공권 검색 </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220312249-6640f54d-1e4c-447e-a438-57315ef721b8.png"><br>
        <span>1. 항공권이 왕복인지 편도인지 선택할수 있게 구현했고 왕복을 클릭시<br>
         가는 날짜, 오는 날짜를 입력할수 있게 구현/편도를 클릭시 가는 날짜만 나오게 구현
         </span><br><br> 
         <span>
         2. 지역선택시 현재 갈수 있는 나라와 도시에 대해 선택할 수 있는 별도의 모달창 제공
        </span>
             
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        
</div>
</details>
<details>
<summary> 숙박 관련 테이블 </summary>
<div markdown="1"><br>
        
</div>
</details>



[바로가기]()   
[링크](#링-크)

<details>
<summary> 취업</summary>
<div markdown="1">
    김성현
</div>
</details>

## 링 크
