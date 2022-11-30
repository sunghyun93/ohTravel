<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<body>
                <!-- 패키지 상세 상품 부분 -->
                    <!-- 패키지 상품 정렬 부분 -->
                    <div class="option_wrap result">
                    	<div class="right_cont">
                            <ul class="list_sort">
                                <li class="search_type" data-order="1">출발시간 빠른순</li>
                                <li class="search_type" data-order="2">높은 가격순</li>
                                <li class="search_type" data-order="3">낮은 가격순</li>
                            </ul>
                   		</div>
                        
                  
	                        <div class="text_wrap big">
									<h5><strong>✈️ 가는 항공편</strong></h5>
										<c:if test="${not empty start_date1 }">
										<div class="calendar">${start_date1}
											<span class="calendar_day1"></span>
											<span class="startCity1"></span> 🔜  <span class="endCity1"></span>
										</div>
									</c:if>
									<c:if test="${not empty start_date2}">
										<div class="calendar">${start_date2}
											<span class="calendar_day1"></span>
											<span class="startCity1"></span> 🔜  <span class="endCity1"></span>
										</div>
									</c:if>	
		                        
		                    </div><!-- option_wrap result -->
		             <div class="one_list">
		             <c:if test="${gubun_check == 1}">  
		             <c:forEach var="schedule" items="${schedule_list}">
							<div class="go_airplane">
								<div class="airline"><img class="airline_pic" src="${pageContext.request.contextPath}${schedule.air_picture}" width="20px" height="20px">${schedule.air_name}<br>
								<span class="airline_num">${schedule.airplane_name}</span>
								</div>
								
								<div class="go_airplane_day">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${schedule.start_time}"/><br>
									<span class="time"><fmt:formatDate pattern="HH:mm" value="${schedule.start_time}"/></span><br>
									<span class="airport">${schedule.start_airport_name}</span>
								</div>
								<div>
										<span class="step">직항</span><br>
										<img class="emoji" src="${pageContext.request.contextPath}/airport/img/arro.png"><br>
										<span class="hour">${schedule.lead_time}분</span>
								</div>		
								<div class="depart_airplane_day">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${schedule.end_time}"/><br>
									<span class="time"><fmt:formatDate pattern="HH:mm" value="${schedule.end_time}"/></span><br>
									<span class="airport">${schedule.end_airport_name}</span>
								</div>
								<div class="reservation_check">
									 예약가능<br>
									<span>잔여5석</span>
								</div>
								<div class="price">
									<c:if test="${seat_position == 'C'}">
									<fmt:formatNumber value="${1*schedule.schedule_price}" pattern="#,###"/>원<br>
									 </c:if>
									 <c:if test="${seat_position == 'B'}">
									<fmt:formatNumber value="${2*schedule.schedule_price}" pattern="#,###"/>원<br> 	
									 </c:if>
									 <c:if test="${seat_position == 'A'}">
									<fmt:formatNumber value="${3*schedule.schedule_price}" pattern="#,###"/>원<br>
									 </c:if>
							</div>
						</div>
				</c:forEach>
				</c:if>
				<c:if test="${gubun_check == 0}">  
		             <c:forEach var="go" items="${goList}">
							<div class="go_airplane">
								<div class="airline"><img class="airline_pic" src="${pageContext.request.contextPath}${go.air_picture}" width="20px" height="20px">${go.air_name}<br>
								<span class="airline_num">${go.airplane_name}</span>
								</div>
								
								<div class="go_airplane_day">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${go.start_time}"/><br>
									<span class="time"><fmt:formatDate pattern="HH:mm" value="${go.start_time}"/></span><br>
									<span class="airport">${go.start_airport_name}</span>
								</div>
								<div>
										<span class="step">직항</span><br>
										<img class="emoji" src="${pageContext.request.contextPath}/airport/img/arro.png"><br>
										<span class="hour">${go.lead_time}분</span>
								</div>		
								<div class="depart_airplane_day">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${go.end_time}"/><br>
									<span class="time"><fmt:formatDate pattern="HH:mm" value="${go.end_time}"/></span><br>
									<span class="airport">${go.end_airport_name}</span>
								</div>
								<div class="reservation_check">
									 예약가능<br>
									<span>잔여5석</span>
								</div>
								<div class="price">
									<c:if test="${seat_position == 'C'}">
									<fmt:formatNumber value="${1*go.schedule_price}" pattern="#,###"/>원<br>
									 </c:if>
									 <c:if test="${seat_position == 'B'}">
									<fmt:formatNumber value="${2*go.schedule_price}" pattern="#,###"/>원<br> 	
									 </c:if>
									 <c:if test="${seat_position == 'A'}">
									<fmt:formatNumber value="${3*go.schedule_price}" pattern="#,###"/>원<br>
									 </c:if>
							</div>
						</div>
				</c:forEach>
				</c:if>  
			</div>     
		</div>
		<!--오는 항공편  -->
		           <div class="text_wrap big">
		           				<c:if test="${gubun_check == 0 }">
									<h5><strong>✈️ 오는 항공편</strong></h5>
										<div class="calendar">${end_date}
											<span class="calendar_day2"></span>
											<span class="startCity2">${end_city_id}</span> 🔜  <span class="endCity2">${start_city_id}</span>
										</div>
		                        </c:if>
                    </div><!-- option_wrap result -->
		             <div class="one_list">
		             <c:if test="${gubun_check == 0 }">   
		             <c:forEach var="come" items="${comeList}">
							<div class="go_airplane">
								<div class="airline"><img class="airline_pic" src="${pageContext.request.contextPath}${come.air_picture}" width="20px" height="20px">${come.air_name}<br>
								<span class="airline_num">${come.airplane_name}</span>
								</div>
								
								<div class="go_airplane_day">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${come.start_time}"/><br>
									<span class="time"><fmt:formatDate pattern="HH:mm" value="${come.start_time}"/></span><br>
									<span class="airport">${come.start_airport_name}</span>
								</div>
								<div>
										<span class="step">직항</span><br>
										<img class="emoji" src="${pageContext.request.contextPath}/airport/img/arro.png"><br>
										<span class="hour">${come.lead_time}분</span>
								</div>		
								<div class="depart_airplane_day">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${come.end_time}"/><br>
									<span class="time"><fmt:formatDate pattern="HH:mm" value="${come.end_time}"/></span><br>
									<span class="airport">${come.end_airport_name}</span>
								</div>
								<div class="reservation_check">
									 예약가능<br>
									<span>잔여5석</span>
								</div>
								<div class="price">
									<c:if test="${seat_position == 'C'}">
									<fmt:formatNumber value="${1*come.schedule_price}" pattern="#,###"/>원<br>
									 </c:if>
									 <c:if test="${seat_position == 'B'}">
									<fmt:formatNumber value="${2*come.schedule_price}" pattern="#,###"/>원<br> 	
									 </c:if>
									 <c:if test="${seat_position == 'A'}">
									<fmt:formatNumber value="${3*come.schedule_price}" pattern="#,###"/>원<br>
									 </c:if>
								</div>
							</div>
					</c:forEach>
				</c:if>	
		</div>   
</body>		
</html>
	
