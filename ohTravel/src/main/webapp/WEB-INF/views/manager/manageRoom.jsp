<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.ela{
	width: 20%;
}
.button-wrap{
	text-align: center;
}
.big{
	width: 100%;
}
</style>

</head>
<body>
	<div class="container" style="min-height: 700px;">
	
		<div class="wrapper big">
			<div class="mt-4 button-wrap">
				<a href="managePackage" class="genric-btn primary ela">패키지 상품 관리</a>
				<a href="manageAir" class="genric-btn primary ela">항공권 상품 관리</a>
				<a href="manageHotel" class="genric-btn primary ela">숙박 상품 관리</a>
				<a href="manageTicket" class="genric-btn primary ela">입장권 상품 관리</a>
			</div>
			<h1 style="text-align: center; margin-bottom: 50px; margin-top: 50px;">객실 관리</h1>
			<div class="row">
			<div class="col-lg-12 col-sm-12 text-lg-end text-center">
				<button class="btn btn-primary mb-3 mr-2" onclick="location.href='insertRoomForm?hotel_id=${hotel_id}&currentPage=${currentPage }'">객실 추가</button>
				<input type="button" class="btn btn-primary mb-3" onclick="location.href='manageHotelDetail?hotel_id=${hotel_id}&currentPage=${currentPage}'" value="돌아가기">
			</div>
				<table border="1" class="table table-hover">
					<thead>
					<tr>
						<th>숙박업체명</th>
						<th>객실ID</th>
						<th>객실타입</th>
						<th>객실명</th>
						<th>수용인원</th>
						<th>비고</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="roomList" items="${roomList }" varStatus="status">
					<tr onclick="detail(${roomList.room_id})">
						<td>${roomList.hotel_kor }</td>
						<td>${roomList.room_id }</td>
						<td>${roomList.room_type }</td>
						<td>${roomList.room_name }</td>
						<td>${roomList.room_per }</td>
						<td><input class='genric-btn danger radius elb mr-3' type='button' onclick="deleteRoom(${roomList.room_id})" value='삭제하기'></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<table class="table table-striped mt-3 big room_detail_img"></table>
				<div id="image_rep_container"></div>
				<div class="col-lg-12 col-sm-12 text-lg-end text-center insertDetail"></div>
				<div class="col-lg-12 col-sm-12 text-lg-end text-center insertDetailForm"></div>
				<table class="table table-striped mt-3 room_detail"></table>
			</div>
			
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center pagingnav">
				
				</ul>
			</nav>
		</div>
	</div>
	
<script type="text/javascript">
	function detail(str){
		let room_id = str;
		console.log(room_id);
		$.ajax({
			url : 'getRoomDetail',
			data : {'room_id' : room_id},
			method : 'POST',
			success : function(data){
				alert(data);
				console.log(data);
				
				$('.room_detail_img').empty();
				$('.room_detail_img').append("<table border='1' class='table table-striped'>")
									.append("<thead><tr><th>객실 이미지경로</th></tr><thead><tbody><tr><td><span>현재 경로 : "+data.roomDetail[0].r_img_path+"</span><br>")
									.append("<input type='file' id='r_img_path' class='form-control' name='file1' onchange='rep(event)' accept='image/*'>")
									.append("<input type='hidden' name='r_img_path' value='"+data.roomDetail[0].r_img_path+"'>")
									.append("</td></tr><tr><td><img src='"+data.roomDetail[0].r_img_path+"'>")
									.append("</td></tr><tbody></table>")
									.append("<button class='genric-btn info mt-3' id=btn_img_update' onclick='update_img("+data.roomDetail[0].room_id+","+data.roomDetail[0].r_img_id+")'>객실이미지 수정</button>");
				$('.insertDetail').empty();
				$('.insertDetail').append("<button class='btn btn-primary mb-3 mr-2' onclick='moveDetailInsert("+data.roomDetail[0].room_id+",\""+data.roomDetail[0].room_type+"\")'>객실상세 추가</button>");
				$('.room_detail').empty();
				$('.room_detail').append("<thead><tr><th>룸타입</th><th>객실상세ID</th><th>날짜</th><th>가격</th><th>예약현황</th><th>비고</th></tr></thead>");
				$.each(data.roomDetail, function(index,item){
					console.log(index);
					$('.room_detail').append("<tr><td><input type='text' readonly='readonly' name='room_type' class='form-control-plaintext' value='"+item.room_type+"'></td>"+
											"<td><input type='text' readonly='readonly' name='room_detail_id' class='form-control-plaintext' value='"+item.room_detail_id+"'></td>"+
											"<td><input type='date' readonly='readonly' name='room_date' class='form-control-plaintext' value='"+item.room_date+"'></td>"+
											"<td><input type='number' name='room_price' id='room_price"+index+"' value='"+item.room_price+"'></td>"+
											"<td><span id='sp_room_rev"+index+"'>"+item.room_rev+"</span><select name='room_rev' id='room_rev"+index+"'><option value='Y'>Y</option><option value='N'>N</option></select></td>"+
											"<td><input class='genric-btn danger radius elb mr-3' type='button' onclick='deleteDetailRoom("+index+","+item.room_detail_id+")' value='삭제하기'><input class='genric-btn info radius elb' type='button' onclick='updateDetailRoom("+index+","+item.room_detail_id+")' value='수정하기'></td></tr>"+
											"<input type='hidden' id='room_id"+index+"' value='"+item.room_id+"'>"+
											"<input type='hidden' id='room_total' value='"+data.total+"'");
											
				});
				$('.pagingnav').empty();
				if(data.page.startPage>data.page.pageBlock){
					$('.pagingnav').append("<li class='page-item'><a class='page-link' onclick='page("+data.page.startPage-data.page.pageBlock,str+")'>[이전]</a></li>");
				}
				for(var i=data.page.startPage; i<data.page.endPage+1;i++){
					$('.pagingnav').append("<li class='page-item'><a class='page-link'  onclick='page("+i+","+str+")'>"+i+"</a></li>");
				}
				if(data.page.endPage<data.page.totalPage){
					$('.pagingnav').append("<li class='page-item'><a class='page-link' onclick='page("+data.page.startPage+data.page.pageBlock,str+")'>[다음]</a></li>");
				}
				
				
				
			}
		})
	}
	
	function page(curr,str){
		let currentPage = curr;
		let room_id = str;
		console.log(currentPage);
		console.log(room_id);
		
		$.ajax({
			url : 'pagingDetail',
			data : {'room_id' : room_id,
					'currentPage' : currentPage},
			method : 'GET',
			success : function(data){
				alert(data);
				console.log(data);

				$('.room_detail').empty();
				$('.room_detail').append("<thead><tr><th>룸타입</th><th>객실상세ID</th><th>날짜</th><th>가격</th><th>예약현황</th><th>비고</th></tr></thead>");
				$.each(data.roomDetail, function(index,item){
					$('.room_detail').append("<tr><td><input type='text' readonly='readonly' name='room_type' class='form-control-plaintext' value='"+item.room_type+"'></td>"+
											"<td><input type='text' readonly='readonly' name='room_detail_id' class='form-control-plaintext' value='"+item.room_detail_id+"'></td>"+
											"<td><input type='date' readonly='readonly' name='room_date' class='form-control-plaintext' value='"+item.room_date+"'></td>"+
											"<td><input type='number' name='room_price' id='room_price"+index+"' value='"+item.room_price+"'></td>"+
											"<td><span id='sp_room_rev"+index+"'>"+item.room_rev+"</span><select name='room_rev' id='room_rev"+index+"'><option value='Y'>Y</option><option value='N'>N</option></select></td>"+
											"<td><input class='genric-btn danger radius elb mr-3' type='button' onclick='deleteDetailRoom("+index+","+item.room_detail_id+")' value='삭제하기'><input class='genric-btn info radius elb' type='button' onclick='updateDetailRoom("+index+","+item.room_detail_id+")' value='수정하기'></td>"+
											"<input type='hidden' id='room_id"+index+"' value='"+item.room_id+"'></tr>"+
											"<input type='hidden' id='room_total' value='"+data.total+"'");
											
				});
			}
		})
	}
	
	function deleteDetailRoom(index,dt_id){
		let room_id = $('#room_id'+index+'').val();
		let room_detail_id = dt_id;
		let room_price = $('#room_price'+index+'').val();
		let room_rev = $('#room_rev'+index+'').val();
		let room_total = $('#room_total').val();
		console.log(room_id);
		console.log(room_detail_id);
		console.log(room_price);
		console.log(room_rev);
		console.log(room_total);
		console.log(index);
		if(room_total == 1){
			alert("상세내역은 1개이상 있어야합니다 삭제할수없습니다");
			return false;
		}
		if(isNaN(room_price)||room_price ==null||room_price ==""){
			alert("입력된 값이 숫자가 아니거나 비어있습니다");
			return false;
		}else{
			message = confirm("정말로 해당 객실을 삭제하시겠습니까?");
			if(message){
				$.ajax({
					url : 'deleteDetailRoom',
					data : {'room_detail_id' : room_detail_id},
					method : 'POST',
					success : function(data){
						location.reload();
						console.log(data);
						if(data >0){
							alert("삭제가 완료되었습니다");	
						}else{
							alert("삭제에 실패했습니다");
						}
					}
				})	
			}else{
				alert("삭제되지 않았습니다");
			}
		}
	}
	
	function updateDetailRoom(index,dt_id){
		let room_detail_id = dt_id;
		let room_price = $('#room_price'+index+'').val();
		let room_rev = $('#room_rev'+index+'').val();
		console.log(room_detail_id);
		console.log(room_price);
		console.log(room_rev);
		if(isNaN(room_price)||room_price ==null||room_price ==""){
			alert("입력된 값이 숫자가 아니거나 비어있습니다");
			return false;
		}else{
			$.ajax({
				url : 'updateDetailRoom',
				data : {'room_detail_id' : room_detail_id,
						'room_price' : room_price,
						'room_rev' : room_rev},
				method : 'POST',
				success : function(data){
					console.log(data);
					if(data>0){
						alert('수정이 완료되었습니다');
						$('#room_price'+index+'').attr("value", room_price);
						$('#sp_room_rev'+index+'').text(room_rev);
						
					}else{
						alert("수정에 실패했습니다");
					}
					
				}
			})	
		}
	}
	
	
	function deleteRoom(id){
		let room_id = id;
		console.log(room_id);
		message = confirm("정말로 해당 객실을 삭제하시겠습니까?");
		if(message){
			$.ajax({
				url : 'deleteRoom',
				data : {'room_id' : room_id},
				method : 'POST',
				success : function(data){
					console.log(data);
					if(data>0){
						alert("삭제가 완료되었습니다");
						location.reload();
					}else{
						alert("삭제가 실패하였습니다")
					}
				}
			})
		}else{
			alert("삭제를 취소했습니다");
		}
	}
	
	
	
	function moveDetailInsert(str1,str2){
		$('.insertDetailForm').empty();
		let room_id = str1;
		let room_type = str2;
		console.log("room_type ->"+room_type);
		console.log("room_id ->"+room_id);
		$.ajax({
			url : 'getNextRoom_detail_id',
			success : function(data){
				console.log(data);
				$('.insertDetailForm').append("<table class='table table-striped mt-3'><thead><tr><th>룸타입</th><th>객실상세ID</th><th>날짜</th><th>가격</th><th>비고</th></tr></thead>"+
						"<tr><td><input type='text' readonly='readonly' id='room_type_input' name='room_type' class='form-control-plaintext' value='"+room_type+"'></td>"+
						"<td><input type='text'readonly='readonly' id='room_detail_id_input' class='form-control-plaintext' value='"+data+"'></td>"+
						"<td><input type='date' class='form-control' name='room_date' id='room_date_input'></td>"+
						"<td><input type='number' class='form-control' name='room_price' id='room_price_input'></td>"+
						"<td><input type='button' onclick='insertRoomDetail()' class='genric-btn info mt-3' value='객실상세 추가하기'><input type='hidden' id='room_id_input' value='"+room_id+"'></td>"+
						"</tr></table>");
				chkDate();
			}
		})	
	}
	
	function chkDate(){
		let room_date = $('#room_date_input');
		room_date.attr("min",new Date().toISOString().substring(0, 10));
		room_date.val(new Date().toISOString().substring(0, 10));
	}
	
		
	function update_img(str,img_id){
		let fileCheck = document.getElementById("r_img_path").value;
	    if(!fileCheck){
	        alert("파일을 첨부해 주세요");
	        return false;
	    }
		let room_id = str;
		let r_img_id = img_id;
		var form = new FormData();
        form.append( "file1", $("#r_img_path")[0].files[0]);
        form.append("room_id",room_id);
        form.append("r_img_id",r_img_id);
        $.ajax({
        	url : "updateRoomImg",
        	method : 'POST',
        	processData : false,
            contentType : false,
            data : form,
            success:function(data) {
                alert("성공하였습니다.");
                console.log(data);
            }
        });
	}
	
	function insertRoomDetail(){
		let room_type = $('#room_type_input').val();
		let room_detail_id = $('#room_detail_id_input').val();
		let room_date = $('#room_date_input').val();
		let room_price = $('#room_price_input').val();
		let room_id = $('#room_id_input').val();
		console.log(room_type);
		console.log(room_detail_id);
		console.log(room_date);
		console.log(room_price);
		console.log(room_id);
		if(room_price ==null||room_price ==''){
			alert("가격에 문자가 입력되었거나 비어있습니다 입력해주세요");
			return false;
		}
		$.ajax({
			url : 'insertRoomDetail',
			method : 'POST',
			data : {'room_type' : room_type,
					'room_detail_id' : room_detail_id,
					'room_date' : room_date,
					'room_price' : room_price,
					'room_id' : room_id},
			success : function(data){
				if(data>0){
					alert('추가가완료되었습니다');
					location.reload();
				}
			}
		})
	}
	
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
</script>
</body>
</html>