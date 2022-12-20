<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	function rep(event) {
		var reader = new FileReader();
		$("#image_rep_container").empty();
		reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		document.querySelector("div#image_rep_container").appendChild(img);
		};
	reader.readAsDataURL(event.target.files[0]);
	}

	function insertRoom(){
		let fileCheck = document.getElementById("r_img_path").value;
		let room_type = $('#room_type').val();
		let room_name = $('#room_name').val();
		let room_per = $('#room_per').val();
		let hotel_id = '${hotel_id}';
		let currentPage = '${currentPage}';
		let room_date = $('#room_date').val();
		let room_price = $('#room_price').val();
		let room_rev = $('#room_rev').val();
		
		let min = 1;
		let max = 20;
		if(room_per ==''||room_per==null){
			room_per = 1;
		}
		if(room_per >20||room_per <1){
			alert("수용인원이 잘못입력되어있습니다 1~20명 사이를 입력하세요");
			return false;
		}
		if(room_price==null||room_price==""){
			room_price = 0;
		}
		if(room_price <0){
			alert("가격은 0원보다 작을수없습니다");
			return false;
		}
		console.log(hotel_id);
		console.log(currentPage);
		if(room_type == null||room_type==''){
			alert(" 객실 타입명을 입력해주세요");
			$('#room_type').focus();
			return false;
		}
	    if(!fileCheck){
	        alert("파일을 첨부해 주세요");
	        return false;
	    }
		var form = new FormData();
		form.append( "file1", $("#r_img_path")[0].files[0]);
        form.append("room_type",room_type);
        form.append("room_name",room_name);
        form.append("room_per",room_per);
        form.append('hotel_id',hotel_id);
        form.append('room_date',room_date);
        form.append('room_price',room_price);
        form.append('room_rev',room_rev);
        $.ajax({
        	url : "insertRoom",
        	method : 'POST',
        	processData : false,
            contentType : false,
            data : form,
            success:function(data) {
            	if(data>0){
            		alert("성공하였습니다.");
                    console.log(data);
                    location.href='manageRoom?hotel_id='+hotel_id+'&currentPage='+currentPage;
            	}else{
            		alert("실패하였습니다");
            	}
                
            }
        });
	}
	$(document).ready(function(){
		let room_date = $('#room_date');
		room_date.attr("min",new Date().toISOString().substring(0, 10));
		room_date.val(new Date().toISOString().substring(0, 10));
	})
	
</script>
</head>
<body>
	<form action="insertRoom" method="post" enctype="multipart/form-data">
	<div class="container" style="min-height: 700px;">
	<h1>객실 추가</h1>
	<hr>
		<div class="mb-3">
			<label for="room_type" class="form-label">객실 타입명</label>
			<input type="text" class="form-control" name="room_type" id="room_type" required="required" placeholder="객실 타입명 입력">
		</div>
		<div class="mb-3">
			<label for="room_name" class="form-label">객실 명</label>
			<input type="text" class="form-control" name="room_name" id="room_name" placeholder="객실명 입력">
		</div>
		<div class="mb-3">
			<label for="room_per" class="form-label">객실 수용인원</label>
			<input type="number" min="1" max="20" class="form-control" name="room_per" id="room_per" required="required" placeholder="객실 수용인원입력">
		</div>
		<div class="mb-3">
			<label for="room_date" class="form-label">객실 날짜 1개 기본추가</label>
			<input type="date" min="" class="form-control" name="room_date" id="room_date" required="required">
		</div>
		<div class="mb-3">
			<label for="room_price" class="form-label">객실 가격</label>
			<input type="number" min="0" class="form-control" name="room_price" id="room_price" required="required">
		</div>
		<input type="hidden" id="room_rev" name="room_rev" value="Y">

		<div class="mb-3">
			<label for="r_img_path" class="form-label">이미지</label>
			<input type="file" class="form-control" id="r_img_path" name="file1" onchange="rep(event)" accept="image/*" required="required">
			<div id="image_rep_container"></div>
		</div>
		<input type="button" class="btn btn-primary mb-2" style="float: right;" onclick="location.href='manageAir'" value="돌아가기">
		<input type="button" class="btn btn-primary" onclick="insertRoom()" value="추가하기">
	</div>
	</form>
</body>
</html>