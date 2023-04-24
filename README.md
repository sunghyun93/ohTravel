# 여행 상품 통합 프로젝트(항공,호텔,입장권,패키지)
흩어져 있는 여행 관련 상품들(숙박, 항공, 패키지, 입장권)을 한데 모아 사용자로 하여금 한 사이트에서 상품들을 찾고 예약할 수 있도록 편리함을 제공하는 프로젝트

GitHub 링크: [GitHub](https://github.com/LWHyun/ohTravel/pulls?q=is%3Apr+author%3A%40me+is%3Aclosed)


## 목차
* 프로젝트 개요
    * 팀원 소개
    * [팀원 소개 및 역할](#팀원소개-및-역할)
    * 개발 환경
        * FrontEnd
        * BackEnd     
* 프로젝트 분석(cloc)
    * [시스템 프로세스](#시스템-프로세스)
    * [프로젝트 제공기능](#프로젝트-제공기능)
    * [ERD](#erd)
* [Rest API 명세서](#rest-api-명세서)
* [구현한 페이지](#구현한-페이지)
* [어려웠던코드](#어려웠던코드)    
* [프로젝트후기](#프로젝트-후기)
* [아쉬웠던점](#아쉬웠던점)
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
        <img src="https://user-images.githubusercontent.com/107449729/233977814-ea61b82d-5013-40d4-bca1-2a53c6faccf6.png">    
</div>
</details>
<details>
<summary> 회원 관련 테이블 / 국가 도시 테이블 </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/233978284-aabc1e19-9499-4fbf-aeff-f0d15226555c.png">
">
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

## Rest API 명세서
![image](https://user-images.githubusercontent.com/107449729/220298658-11ab96b2-bdde-427a-bd5e-1ea59ec446f9.png)


## 구현한 페이지

### 항공권 검색 및 예약
<details>
<summary> 항공권 검색 </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220312249-6640f54d-1e4c-447e-a438-57315ef721b8.png"><br>
         
         1. 항공권이 왕복인지 편도인지 선택할수 있게 구현했고 왕복을 클릭시 가는 날짜, 오는 날짜를 입력할수 있게 구현/편도를 클릭시 가는 날짜만 나오게 구현
         
         2. 지역선택시 현재 갈수 있는 나라와 도시에 대해 선택할 수 있는 별도의 모달창 제공
     
             
</div>
</details>
<details>
<summary> 검색(가는 항공편) </summary>
<div markdown="1"><br>
    <img src="https://user-images.githubusercontent.com/107449729/220639294-7457c11c-2e06-46b7-8326-de4feea47f43.png"><br>

    1. 출발 날짜에 맞는 항공편 여러가지가 나오며 필터와 정렬을 함께 적용한 결과를 조회 

    2. 정렬은 정렬 종류중 1가지만 선택 가능

    3. 필터는 각 필터 종류별 1가지 씩 선택가능하고, 적용된 필터에 적합한 항공 결과를 조회

    4. 적용한 필터에 적합한 상품이 없을 경우 상품이 나오지 않음
       
</div>
</details>
<details>
<summary>  검색(오는 항공편) </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220640393-ff269570-36f5-44eb-a87c-4046fbf71b17.png"><br>
        
        1. 해당 일자에 맞는 오는 항공편 여러가지가  나오며 가는 항공편과 마찬가지로 여러가지 정렬과 필터가 적용가능

        2. 가는 항공편과 오는 항공편을 클릭했을시 다른 항공편들은 모두 사라지고 예약하기 버튼 생성

        3. 예약하기 버튼 클릭시 로그인 여부 확인

</div>
</details>
<details>
<summary> 검색(로그인 여부) </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220640933-eb17d5c3-7c67-403d-95eb-41a28166df55.png"><br>

        1. 예약하기 버튼 클릭시 로그인이 안되어 있으면 로그인 페이지로 이동

        2. 로그인이 되면 다시 예약하기 페이지로 이동

</div>
</details>
<details>
<summary> 예약하기 </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220641522-91512227-f5f8-4447-b2b3-8585fc7a42a7.png"><br>

        1. 선택한 가는 항공편 과 오는 항공편의 일정들의 정보가 나온다.

        2. 가는 항공편의 금액과 오는 항공편의 금액과 인원수와 합산된 결제예정금액이 나온다.


</div>
</details>
<details>
<summary> 예약(약관동의) </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220641987-68ca3ef0-eefb-4efb-b902-7e45803376fb.png"><br>

        1. 해당 약관의 모든 동의를 해야지 다음단계로 넘어간다.

        2. 모든 동의를 하지 않을시 전체약관에 동의를 해달라는 경고창을 띄워 유효성 검사를 진행한다.

</div>
</details>
<details>
<summary> 예약페이지(정보제공 및 유효성검사) </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220642737-21063603-1645-4b21-86b9-ac10f10d4123.png"><br>

        1. 로그인한 회원의 정보를 불러온다(예약자 정보는 수정 불가)

        2. 선택한 인원 수 만큼 여행자 정보를 입력하는 창이 있으며
        각각의 창들은 유효성 검사를 진행함


        2-1. 2-1. 유효성 검사가 통과될 경우에만 경고메세지가 삭제됨

</div>
</details>
<details>
<summary> 예약페이지(쿠폰 적용 클릭) </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220643750-46086c90-ad30-46bb-b9f2-ce374e73cf55.png"><br>

        1. 선택한 인원수와 결제 금액이 나오고 만약 쿠폰이 있을경우에는 해당 쿠폰이 있다고 나오며 쿠폰 적용가능

        2. 쿠폰이 없을경우 페이지 상단에 쿠폰다운로드 창에서 즉시 다운받아서 사용가능

</div>
</details>
<details>
<summary> 예약페이지(쿠폰 적용) </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220644320-901a4da2-f88b-4410-a959-d2b8c0cb8c72.png"><br>

        1. 쿠폰적용 버튼 클릭시 모달창으로 현재 사용할수 있는 쿠폰이 나온다

        2. 사용할수 있는 쿠폰을 클릭시 결제예정금액에서 쿠폰금액을 뺀 총 결제금액 제공

        3. 쿠폰 해제를 클릭시에는 쿠폰 적용시키 전 금액이나오게된다
</div>
</details>
<details>
<summary> 예약페이지(결제) </summary>
<div markdown="1"><br>
        <img src="https://user-images.githubusercontent.com/107449729/220646641-b93b4e06-4dc7-4e5c-9c74-61e6d5682f89.png"><br>

        1. 결제 버튼 클릭시 결제API가 실행되며 임의로 넣어놓은 상품 가격을 결제시 항공 예약완료

</div>
</details>


---

## 어려웠던 코드

<details>
<summary><span style="color:pink">검색할때 편도(가는비행기or오는비행기) / 왕복 </span> </summary>
<div markdown="1"><br>
      * 검색시 편도비행기중에서 가는비행기인지 오는비행기인지 아니면 왕복비행기인지 구분을 해줘야하기때문에 AirSearch안에 getGubun_check라는 컬럼을 만들어서 해결 

      * 코드링크
      https://github.com/sunghyun93/ohTravel/blob/dbfd34f3e9f4934e6920195a5b4ff099ac701396/ohTravel/src/main/java/com/oracle/ohTravel/airport/controller/AirportController.java#L85
        

</div>
</details>

<details>
<summary><span style="color:pink">결제 Transaction 처리 </span> </summary>
<div markdown="1"><br>
        * insert 시에 연관된 4개의 테이블을 모두 다 한번에 insert 시켜주고 만약에 예외가 발생했을시에 transaction을 걸어 4개 테이블에 insert가 안되게 구현 

        * 코드링크
        https://github.com/sunghyun93/ohTravel/blob/8bed2aa5ed7c04cd2d748c92a4074ae5c2bd86e0/ohTravel/src/main/java/com/oracle/ohTravel/airport/service/ScheduleServiceImpl.java#L95

</div>
</details>


---


## 프로젝트 후기



#### <span style="color:#0000FF">SQL의 중요성 </span> 
* 기획했던것보다 프로젝트 규모가 커지게 되면서 SQL도 복잡해 졌습니다. 예를 들어 항공권을 예매하게 되면 그에따른 여러개의 테이블에 동시에 모두 insert해주어야 하는 경우가 있었고 때로는 여러개의 테이블을 함께 조회해야 했습니다.
이를 통해 초기에 테이블 설계과정이 매우 중요함을 깨닫게 되었고 Java 언어뿐만이 아니라 SQL 작성능력의 중요성을 깨달았습니다.

#### <span style="color:#0000FF">협업의 중요성</span> 
* 프로젝트 규모가 큰 만큼 팀원들간의 소통도 중요하고 서로 연관되어 있는 데이터들을 처리하기 위해서 팀원들끼리 서로 소통이 필요하고 버전관리툴인 Git(Fork,Pull Request)을 사용해서 명확한 commit 메세지를 작성하고, 더 좋은 변수명과 코드의 가독성을 위해 고민했고 내가 쓴 로직들에 대한 주석을 달아 설명또한 덧붙여야한다는 점을 깨닫게 되었습니다.

---

## 아쉬웠던점

#### <span style="color:#ffd33d">주석,문서화의 중요성을 늦게 깨달은점 </span> 

* 프로젝트를 시작하기전에 주석,문서화가 중요하다는 점을 알고 있었지만 프로젝트 진행기간이 한달이라는 점에서 기능 구현 위주로 프로젝트를 진행하였다. 하지만 프로젝트 규모가 크고 구현해야할 기능이 복잡해 짐에 따라서 팀원들과 연관되어 있는 데이터를 처리할때 작성한 코드를 한참을 들여다보고 내부 코드를 이해하면서 시간을 쓰게되는 경우가 있었다.
그렇기때문에 프로젝트 설계 초기부터 팀원들과 조율해서 기초를 탄탄히 쌓아야 놔야 편리함을 알게 되었다.
또한 프로젝트 진행중 겪은 문제들을 문서화 시켜두지 않았던 점이 아쉽다. 단지 해결했을시에 해결방안만 작성해 놓았기때문에 그 당시 어려웠던 점, 문제 해결을 통한 깨달음과 같은 감정이 제대로 남아있지 않아서 아쉬웠다.

#### <span style="color:#ffd33d">테스트주도개발(TDD)을 하지 못한점  </span> 

* 테스트 코드를 작성하지 않고 서버를 실행시켜 UI를 직접 보면서 기능이 원하는대로 잘 구현되어 있는지 문제는 없는지 직접 일일이 보고 확인을 하였는데 규모가 크다보니 실행속도가 느려지기 시작했다. 이를 적 자원(html, css, js) 수정 시 새로고침 없이 바로 적용할 수 있는 devtools 기능인 live reload로 어느정도는 해결하였지만 테스트를 해볼수 있는 테스트 코드릐 중요성을 깨닫게 되었다.

#### <span style="color:#ffd33d">프로젝트 배포  </span> 

* 팀원들과 한달간의 시간과 노력을 투자한 프로젝트를 완성을 시켜놨지만 
이 프로젝트가 내 컴퓨터에서만 동작할수 있다는 점이 아쉬웠다. 다음에 프로젝트를 한다면 Ec2(Elastic Compute Cloud)를 사용해서 배포를 해보고 싶다.


