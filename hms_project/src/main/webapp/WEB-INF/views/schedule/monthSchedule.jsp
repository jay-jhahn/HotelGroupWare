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
			<div class="card"> 
				<div class="card-header"> 
					<h4 class="card-title"> 3 월 스케줄 조회 </h4> 
			</div> 
				<div class="card-body">
					<div class="table-responsive">
					   <table class="table"> 
						  <tr>  										
							  <td> 직원조회 </td> 
							  <td><input type="text" name="dayOffName"  value="직원 조회한 이름" readonly></td> 
							  <td> 소속부서 </td> 
							  <td><input type="text" name="dayOffDept"  value="조회 한 직원 부서 값 받기" readonly></td>
							  <!-- 조회하기 클릭 시 직원 소속 부서 전화번호까지 나오게 조회하기 --> 
							  <td><input type="button"  class="btn" style="background-color: #55789B; border-radius: 0rem;" value="조회하기" onclick=""></td> 
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
  
</div> <!-- close wrapper -->	
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />


</body>
</html>


