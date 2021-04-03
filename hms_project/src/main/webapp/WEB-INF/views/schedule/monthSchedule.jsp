<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
<script src="${path}js/script.js"></script>
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.5.1/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.5.1/lib/main.js'></script>
<script type='text/javascript'>
 
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
 
  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyDHLasQBGd_u8gnZge7HTHig6MUxvgdWBE',
   	themeSystem: 'bootstrap',
   	header: { 
   		left: 'prev,next today', center: 'title', right: '' 
   		},
    eventSources: [
    {
          url : 'ko.south_korea#holiday@group.v.calendar.google.com',
          className: '대한민국의 휴일',
          color: '#0000FF', 
         
    },
   		 {
    		url : 'getWork.al',
    		color : '#58FAAC',
    		textColor : 'black'

    	},
    	
    ],
    
  });
	  calendar.render();
  
});

$('.fc-button-prev span').click(function(){
	var prevDate = $("#calendar").fullCalendar('getDate').toDate();
	alert(prevDate); 
	});

 $('.fc-button-next span').click(function(){
var nextMonthDate = $("#calendar").fullCalendar('getDate').toDate();
alert(nextMonthDate);
});

</script>
		
<head>
<meta charset="UTF-8">
<title> 스케줄 월별 조회 </title>
</head>
<body>

<div class="wrapper">
<!-- ====== Side Menu ===== -->
<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" />	
	
	<!-- ======= Main ======= -->
	<div class="main-panel" id="main-panel">
	
	<!-- ======= Header ======= -->
	<jsp:include page="${jspPath}common/header.jsp" flush="false" />
	
	<div class="content">
	<div class="row">
		<div class="col-md-12">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="window.location='monthSchedule.ra'"> 스케줄 조회 </a></li>
				<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='reqModify.ra'"> 근무 변경 신청  </a></li>
			</ul> 
			<div class="card"> 
				<div class="card-header"> 
					<h4 class="card-title"> 스케줄 조회 </h4> 
			</div> 
				<div class="card-body">
					<div class="table-responsive">
					   <table class="table"> 
					   <c:if test="${workDay == null }" >
					   	<tr>
							  <td colspan="4">직원조회<input type="text" name="empName"  id="empName" value="직원 이름 입력">
							  <!-- 조회하기 클릭 시 직원 소속 부서 전화번호까지 나오게 조회하기 --> 										<!-- selectCode Javascript 페이지 이동 시 분류  0:monthSchedule.al  1:insertSchedule.al -->		
								  <input type="button" class="btn" value="직원조회" class="btn" style="background-color: #55789B; border-radius: 0rem;" onclick="searchEmp(empName.value, 1)">
							 </td>
					   	</tr>
					   </c:if>
					   
					    <c:if test="${ workDay != null}"> 
						  <tr>
							  <td colspan="4">직원조회<input type="text" name="empName"  id="empName" value="직원 이름 입력">
							  <!-- 조회하기 클릭 시 직원 소속 부서 전화번호까지 나오게 조회하기 --> 										<!-- selectCode Javascript 페이지 이동 시 분류  0:monthSchedule.al  1:insertSchedule.al -->		
								  <input type="button" class="btn" value="직원조회" class="btn" style="background-color: #55789B; border-radius: 0rem;" onclick="searchEmp(empName.value, 1)">
							 </td>
							 <td colspan="4">소속부서<input type="text" name="dayOffDept"  value="조회 한 직원 부서 값 받기" readonly></td>
						  </tr> 
						 </c:if>	
						  
						  <c:if test="${workDay != null}"> 
							<tr>
							  	<td colspan="2"> 오전근무 	
							  	<input type="text"  value="${workDay.dayWork}"  readonly></td>	
							  	<td colspan="2"> 오후근무 
							  	<input type="text"  value="${workDay.afterWork}"  readonly></td>	
							  	<td colspan="2"> 야간근무 
							  	<input type="text"  value="${workDay.nightWork}" readonly></td>	
							  	<td	colspan="2"> 휴무일 수
							  	<input type="text"  value="${workDay.rest}" readonly></td>	
						 	 </tr>	
						 </c:if>	 
						  <c:if test="${workDay != null}"> 	 
							 <tr>
								<td> 연락처  </td>
								<td><input type="text"  value="${vo.empPhone}"  readonly></td>	 
								<td> 이메일  </td>
								<td><input type="text"  value="${vo.empEmail}"  readonly></td>
								<td> 직급  </td>
								<td><input type="text"  value="${list.levelVo}"  readonly></td>
								<td> 직책  </td>
								<td><input type="text"  value="${vo.dutyCode}"  readonly></td>
							</tr>	
							</c:if>	
						</table> 
					</div> 
				</div> 
			</div> 
		</div> 
	</div> 
	
	<div class="row"> 
			<div class="col-md-12"> 
				<div class="card"> 
					<div class="card-header">
						<div class="card-body">
							<div class="table-responsive">
						  <div id="calendar">
						  </div>
						</div> 
					</div> 
				</div> 
			</div> 
 		</div> 
	  </div>
   </div>
  </div>
</div> <!-- close wrapper -->	

	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />


</body>
</html>


