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
          color: '#0000FF', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        }
  
    /*   {
          googleCalendarId: '여기에 구글 캘린더 ID를 붙여넣기하시면 됩니다.',
          className: '정보처리기능사',
            color: '#204051',
            //textColor: 'black' 
        },
      {
          googleCalendarId: '여기에 구글 캘린더 ID를 붙여넣기하시면 됩니다.',
          className: '정보처리기사',
            color: '#3b6978',
            //textColor: 'black' 
        } */
    ],
  	  dateClick: function() {
  		var popUrl = "makeSchedule.al";	//팝업창에 출력될 페이지 URL
  		var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
  			window.open(popUrl, "" , popOption);
    }
  });
  calendar.render();
});

function makeSchedule() {
	var popUrl = "makeSchedule.al" ;
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
	    <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
	    	<div class="row">
 				<div class="col-md-12"> 
 					<div class="card"> 
 						<div class="card-header"> 
 							<h4 class="card-title"> 직원 스케줄 입력 </h4> 
						</div> 
 						<div class="card-body">
 							<div class="table-responsive">
								<table class="table"> 
									<tr>  										
										<td> 직원조회 </td> 
 										<td><input type="text" name="dayOffName"  value="직원 조회한 이름" readonly></td> 
										<td> 소속부서 </td> 
 										<td><input type="text" name="dayOffDept"  value="조회 한 직원 부서 값 받기" readonly></td> 
 										<td><input type="button"  class="btn" style="background-color: #55789B; border-radius: 0rem;" value="입력하기" onclick="makeSchedule();"></td> 
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
		</form>
		</div>
	</div>
</div>


<!-- ======= Footer ======= -->
<jsp:include page="${jspPath}common/footer.jsp" flush="false" />




</body>
</html>