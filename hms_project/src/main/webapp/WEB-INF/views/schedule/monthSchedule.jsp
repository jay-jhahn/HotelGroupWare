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
    eventSources: [
    {
          url : 'ko.south_korea#holiday@group.v.calendar.google.com',
          className: '대한민국의 휴일',
          color: '#0000FF', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
    },
   		 {
    		url : 'getWork.al',
    		color : '#58FAAC',
    		textColor : 'black'
    	},
    	
    ],
  
   	  dateClick: function() {
   		var date = calendar.getDate();
   		
  	  	alert("The current date of the calendar is " + date.toISOString() );
  		var popUrl = "detailSchedule.al";	//팝업창에 출력될 페이지 URL
  		var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
  			window.open(popUrl, "", popOption); 
    } 
  
  });
  calendar.render();
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

				<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="window.location='monthSchedule.al'"> 스케줄 조회 </a></li>
				<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='reqModify.al'"> 근무 변경 신청  </a></li>
			</ul> 
			<div class="card"> 
				<div class="card-header"> 
					<h4 class="card-title"> 스케줄 조회 </h4> 
			</div> 
				<div class="card-body">
					<div class="table-responsive">
					   <table class="table"> 
						  <tr>  										
							  <td>직원조회<input type="text" name="empName"  id="empName" value="직원 이름 입력"></td>
							  <!-- 조회하기 클릭 시 직원 소속 부서 전화번호까지 나오게 조회하기 --> 										<!-- selectCode Javascript 페이지 이동 시 분류  0:monthSchedule.al  1:insertSchedule.al -->		
							  <td ><input type="button" class="btn" value="직원조회" class="btn" style="background-color: #55789B; border-radius: 0rem;" onclick="searchEmp(empName.value, 1)" ></td>  
							  <td>소속부서
							  <input type="text" name="dayOffDept"  value="조회 한 직원 부서 값 받기" readonly></td>
						</tr> 
						
						  <tr>
						  	<td> 오전근무 	
						  	<input type="text"  value="오전근무 일 수"  readonly></td>	
						  	<td> 오후근무 
						  	<input type="text"  value="오후근무 일 수"  readonly></td>	
						  	<td> 야간근무 
						  	<input type="text"  value="야간근무 일 수" readonly></td>	
						  	<td> 휴무일 수
						  	<input type="text"  value="휴무 일 수" readonly></td>	
						  </tr>			
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
   </div>
  </div>
</div> <!-- close wrapper -->	


	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />


</body>
</html>


