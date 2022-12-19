<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script>
let msg = '${msg}'
if(msg == 'WRT_OK') alert("패키지 여행 일정 추가에 성공했습니다.\n여행일정_관광지를 추가해주세요.");
if(msg == 'WRT_ERR') alert("패키지 여행 일정_관광지 추가에 실패했습니다.\n다시 시도해주세요.")
</script>
</head>
<body>
	<form action="/manager/insertPkgScheDetail" method="post" id="insertPkgScheDetailForm">
	<input type="hidden" name="pkage_dt_id" value="${pkage_dt_id }"> <!-- 상세 ID -->
	<input type="hidden" name="scheDays" value="${scheDays }"> <!-- 일 수 -->
	<div class="container" style="min-height: 700px;">
	
	<h1>패키지 여행 일정_관광지 추가</h1>
	<hr>
		<%-- 여행일차 --%>
		<c:forEach begin="1" end="${scheDays }" varStatus="status">
			<%-- 여행 일차 --%>
			<div class="mb-3">
				<%-- <input type="text" class="form-control-plaintext" name="pkage_sche_day" value="${status.count }" readonly="readonly">일차 --%>
				<span>${status.count }일차</span>
				<button type="button" class="genric-btn primary small createAttrBtn">관광지 추가 버튼</button>
				<div class="AttrDiv" data-count="${status.count }">
					
				</div>
			</div>
		</c:forEach>

		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="window.history.go(-1)" value="돌아가기">
		<button type="button" id="insertPkgScheDetailBtn" class="btn btn-primary">추가하기</button>
	</div>
	</form>
<script>
$(function() {
	let attrSelect = {}; // 관광지 객체를 담을 변수
	// 시작하자 마자 관광지 목록(패키지 상세에 맞는) 가져오기
	$.ajax({
		url:'/manager/getAttrConnectedDetail',
		type:'get',
		data: { 'pkage_dt_id' : '${pkage_dt_id}'},
		dataType:'json',
		success: function(data) {
			// 관광지 객체를 변수에다 넣어주기
			attrSelect = data;
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	// 관광지 추가 버튼 클릭 시
	let order = 1; // 관광지 순서	
	let count = 0; // 관광지 순서 초기화를 위한 변수 (몇일 차인지 구분)
	$(document).on("click", '.createAttrBtn', function() {
		// console.log(attrSelect) // 관광지
		
		// 관광지 개수 보다 추가할 select문을 더 많이 추가못하게 막기
		// attrSelect : 관광지를 담고있는 배열, $('.attrSelect') : 관광지 select 태그
		if(attrSelect.length == $('.attrSelect').length) {
			alert("더 이상 관광지를 추가할 수 없습니다.");
			return false;
		}

		// 관광지 버튼 아래 div (추가할 곳)
		let div = $(this).siblings('.AttrDiv');
		
		let data_count = div.attr("data-count"); // 몇일차인지
		
		// 처음 클릭한 것이 아니고(count!=0) 일차가 달라지면 order 초기화
		if(count != 0 && count != data_count) {
			console.log("눌렀었던 일차(count)="+count+", 방금 누른 일차(data_count)="+data_count);
			
			// 달라졌는데  select 가 하나도 없으면 1로 초기화 (이유 : 1번쨰부터 시작하기 위해)
			// console.log(div.children('.selectWrap').length); 가 0이면 처음
			if(div.children('.sendWrap').length == 0) {
				order = 1; 
			} else {
				// select 문이 1개 이상이면
				// 선택한 쪽의 제일 마지막 order 숫자 + 1을 넣어줌
				// console.log("data-order="+div.children('.selectWrap').last().attr("data-order"));
				order = Number(div.children('.sendWrap').last().attr("data-order"))+1;
			}
		}
		// 방금 누른 쪽의 일차 값 넣어주기(비교하기위함)
		count = data_count;
		
		tmp = "";
		tmp += "<div class='sendWrap' data-order='"+order+"'>"
		tmp += "<input type='hidden' name='pkage_dt_idL' value='${pkage_dt_id}'>"
		tmp += "<input type='hidden' name='pkage_sche_dayL' value='"+data_count+"'>"
		tmp += "<input type='hidden' name='pkage_s_d_orderL' value='"+(order)+"'>"
		tmp += "<div class='selectWrap' data-order='"+order+"'><span>"+order+"번째</span>"
		tmp += "<select name='attr_idL' class='attrSelect'>"
		tmp += "<option value=''>관광지</option>"
		$.each(attrSelect, function(index, item) {
			tmp += "<option value="+item.attr_id+">"+item.attr_name+"</option>";
		});
		tmp += "</select>"
		tmp += "<button type='button' class='genric-btn primary small deleteAttrBtn'>X</button>"
		tmp += "</div>"
		 tmp += "</div>"
		// 관광지 버튼 아래 div 에 넘길 요소들 추가
		div.append(tmp);
		
		// 순서 증가
		order++;
		
	});
	
	// 관광지 삭제 버튼 클릭 시
	$(document).on('click', '.deleteAttrBtn', function() {
		// 클릭한 버튼과 input tag 들을 감싸고 있는 Div (지워져야할 div)
		let sendDiv = $(this).parents('.sendWrap');
		
		// 관광지 추가 버튼 아래 div
		let div = $(this).closest('.AttrDiv');
		
		// 클릭한 버튼과 select문을 감싸고 있는 selectDiv 
		let selectDiv = $(this).parents('.selectWrap')
		console.log("지워질 data-order = " + sendDiv.attr("data-order"));
		
		// 선택된 div 다음 형제들의 order -1 해주기
		sendDiv.nextAll().each(function(index, item) {
			let dataVal = Number($(item).attr('data-order')) - 1
			$(item).attr('data-order', dataVal)
			$(item).find('input[name="pkage_s_d_orderL"]').val(dataVal);
			$(item).find('.selectWrap').attr('data-order', dataVal)
			$(item).find('.selectWrap span').text(dataVal+"번째")
		});

		// 제거
		sendDiv.remove();
		
		// 변수 order 도 현재 있는 것들중 제일 마지막 order 로 변경해주기
		// 추가될 번째로 만들어줘야하기 때문에 +1
		order = Number(div.children('.sendWrap').last().attr("data-order"))+1;
		
		// 1번째를 지웠을 때는 1으로 초기화 (위에서 undefined 가 되기 때문에)
		if(div.children('.sendWrap').last().attr("data-order") == undefined) {
			order = 1;
		}
		console.log("지우고 난 후 order = "+order);
		
		// 방금 누른 쪽의 일차 값 넣어주기(다른 일차인지 비교하기위함)
		count = div.attr('data-count');
		console.log("지운쪽의 일차 = " + count + "일차");
		
	});
	
	// select 박스(관광지) 중복 체크
	$(document).on('change', '.attrSelect', function() {
		console.log("지금 선택한 val = "+$(this).find('option:selected').val()); // 선택한 option 의 value 값
		
		let currSelect = $(this); // 선택한 select
		let currSelectVal = $(this).find('option:selected').val(); // 선택한 option 의 value 값
		
		// 현재 선택한 select 제외하고 반복문 돌면서 같은 값이 있는지 확인
		$('.attrSelect').not(this).each(function(index, item) {
			// 선택한 select 를 제외한 나머지 select 들의 value들
			console.log($(item).find('option:selected').val());
			
			// 현재 선택한 value 와 나머지 select 들의 value 를 비교하여 같은 것이 있으면 멈춤
			if(currSelectVal == $(item).find('option:selected').val()) {
				alert("다른 관광지를 선택해주세요.");
				
				// 겹치는 값 초기화
				currSelect.val('');
				currSelect.focus(); 
				return false;
			}
		});
	});
	
	// select 박스 빈 값 유효성 검사 
	$(document).on('click', '#insertPkgScheDetailBtn', function() {
		let flag = true;
		
		// 일차 별로 관광지 선택이 1개 이상은 반드시 있는 검사
		$('.AttrDiv').each(function(index, item) {
			if($(item).children().length == 0) {
				// 돌면서 관광지 선택이 하나라도 없는 곳이 있으면 멈추기
				alert("일차별로 관광지는 1개 이상 존재해야 합니다.")
				flag = false;
				return false;
			}
		})
		
		// select 박스 돌면서 빈 값 검사
		if(flag) {
			$('.attrSelect').each(function(index, item) {
				if($(item).val() == '') {
					alert("관광지를 선택해주세요.")
					$(item).focus();
					flag = false;
					return false;
				}
			});
		}
		
		// 유효성 검사 통과 시 submit
		if(flag) {
			$('#insertPkgScheDetailForm').submit();
		}
	});
})
</script>

</body>
</html>