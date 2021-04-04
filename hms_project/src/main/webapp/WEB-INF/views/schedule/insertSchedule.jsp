<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.5.1/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.5.1/lib/main.js'></script>
<script src="${path}js/script.js"></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyDHLasQBGd_u8gnZge7HTHig6MUxvgdWBE',
    themeSystem: 'bootstrap',
    eventSources: [
    {
          googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
          className: '대한민국의 휴일',
          color: '#0000FF', 
           
        }
  
   
    ],
  	  dateClick: function() {
  		var popUrl = "makeSchedule.rs";	//팝업창에 출력될 페이지 URL
  		var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
  			window.open(popUrl, "" , popOption);
    }
  });
  calendar.render();
});

function makeSchedule(empCode) {
	var popUrl = "makeSchedule.al?empCode="+empCode ;
	var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;"; 
	window.open(popUrl, "스케줄 입력", popOption);
}

</script>
<head>
<meta charset="UTF-8">
<title> 스케줄 입력 </title>
</head>
<body>

<!-- ======= Main ======= -->
<div class="wrapper">
	<!-- ====== Side Menu ===== -->
	<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" />
	
	<div class="main-panel" id="main-panel">
	<!-- ======= Header ======= -->
	<jsp:include page="${jspPath}common/header.jsp" flush="false" />
		
	<div class="content">	
		 <form action ="#" method="post">
	    <div class="d-flex">
		  <div class="mr-auto p-2"><h3> 스케줄 입력 </h3></div>
		  <div class="p-2">공통 > 스케줄 > 스케줄 입력 </div>
	     </div>
	    <input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    	<div class="row">
 				<div class="col-md-12"> 
 					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" 	data-toggle="tab" onclick="window.location='insertSchedule.al'"> 스케줄 입력 </a></li>
						<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='scdModifyList.al'"> 스케줄 수정  </a></li>
						<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='workTimeList.al'"> 직원 근태리스트  </a></li>
					</ul>  
 					<div class="card"> 
 						<div class="card-header"> 
 							<h4 class="card-title"> 직원 스케줄 입력 </h4> 
						</div> 
 						<div class="card-body">
 							<div class="table-responsive">
								<table class="table"> 
								<c:if test="${workDay == null }" >
					 				<tr>
							 		 <td colspan="4">직원조회<input type="text" name="empName"  id="empName" value="직원 이름 입력">
							 			 <!-- 조회하기 클릭 시 직원 소속 부서 전화번호까지 나오게 조회하기 --> 										<!-- selectCode Javascript 페이지 이동 시 분류  0:monthSchedule.al  1:insertSchedule.al -->		
								  		<input type="button" class="btn" value="직원조회" class="btn" style="background-color: #55789B; border-radius: 0rem;" onclick="searchEmp(empName.value, 2)">
							 		 </td>
							 		</tr>
							 	</c:if>	 
							 	
							 	 <c:if test="${workDay != null }" >
							 	 <input type="hidden" name="empCode" value="${vo.empCode}">	 
							 	 	<tr>
							 		 <td colspan="4">직원조회<input type="text" name="empName"  id="empName" value="직원 이름 입력">
							 			 <!-- 조회하기 클릭 시 직원 소속 부서 전화번호까지 나오게 조회하기 --> 										<!-- selectCode Javascript 페이지 이동 시 분류  0:monthSchedule.al  1:insertSchedule.al -->		
								  		<input type="button" class="btn" value="직원조회" class="btn" style="background-color: #55789B; border-radius: 0rem;" onclick="searchEmp(empName.value, 2)">
							 		 </td>
								 		<td colspan="2"><input type="text" name="dayOffDept"  value="조회 한 직원 부서 값 받기" readonly></td> 
										<td><input type="button" class="btn" style="background-color: #55789B; border-radius: 0rem;" value="입력하기" onclick="makeSchedule(empCode.value);"></td> 
						   			</tr>
						   		
									 <tr>
										<td> 연락처  </td>
										<td><input type="text"  value="${vo.empPhone}"  readonly></td>	 
										<td> 이메일  </td>
										<td><input type="text"  value="${vo.empEmail}"  readonly></td>
										<td> 직급  </td>
										<td><input type="text"  value="${vo.levelCode}"  readonly></td>
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
 								<div id="calendar"></div>
 							</div> 
 						</div> 
 					</div> 
				</div> 
 			</div> 
 		  </div>
		</form>
		</div>
	</div>
</div>


<!-- ======= Footer ======= -->
<jsp:include page="${jspPath}common/footer.jsp" flush="false" />




</body>
</html>