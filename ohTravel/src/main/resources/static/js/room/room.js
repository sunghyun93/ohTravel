
function makeRoomList(data) {
	
	let innerHtml = ``;
	
	console.log(data);
	console.log(data.length);
	
			<!-- 호텔이 가지고 있는 방 종류마다 반복될 folding box -->
	
    let type= '';
	for(let i = 0; i < data.length; i++){
		console.log(${data[i].room_type});
		
		if(data[i].room_type != type){
			type = ${data[i].room_type}
		innerHtml += `<div class="room_type_more">
						<div class="fluid-wrap">
							<div class="container-fluid">
/* 			 	<!-- style="min-height: calc(100vh - 136px);" -->
			    <!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. --> */
			   /*    <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. --> */
			      		<div class="panel panel-default">
			         		<a class="r_type_name" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_${data[i].room_id}" aria-expanded="false">
						        <div class="panel-heading" role="tab">
						           	<p>${data[i].room_type}</p>
							   	</div>
		    				</a>

						<div id="collapse_${data[i].room_id}" class="panel-collapse collapse" role="tabpanel">	
	         				<div class="panel-body">
	           					<div class="room_type_detail">
									<div class="room_img">
										<img alt="room" src="${pageContext.request.contextPath }/img/hotel/room1.jpg">
									</div>
								<div class="r_name">
									<h3>${data[i].room_name}</h3>
								</div>
/* 								<div class="r_option">
									<h4>뭔가의 방 옵션정보</h4>
								</div> */
								<div class="r_price">
									<h3>${data[i].room_price}</h3>
								</div>
								<div class="reservation">
									<button type="button" class="genric-btn primary ela" onclick="goReserve(${data[i].room_name},${data[i].room_price})">예약하기</button>
								</div>
							</div>
						</div><!-- panel-body -->
	       	 		 </div> <!-- #collapse1 -->
	        </div> <!-- panel-default -->
	      </div> <!-- panel-group -->
		 </div> <!-- container-fluid -->
		</div>
	</div> <!-- room_type_more 끝 -->
	`
	

			console.log(반복문+(i+1)+번째-> +type);
		} else {
			continue;
		}
	}
	
	$(#roomAllInfo).append(innerHtml);

}