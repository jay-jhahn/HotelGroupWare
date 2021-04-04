<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>

<div class="wrapper">
	<!-- ====== Side Menu ===== -->
	<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" />
	
	<div class="main-panel" id="main-panel">
		<!-- ======= Header ======= -->
		<jsp:include page="${jspPath}common/header.jsp" flush="false" />
		
		<div class="content">
			<div class="row">
				<div class="col-md-12">
				<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link emplListTab" 	data-toggle="tab" onclick="window.location='insertSchedule.al'"> 스케줄 입력 </a></li>
						<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='scdModifyList.al'"> 스케줄 수정  </a></li>
						<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="window.location='workTimeList.al'"> 직원 근태리스트  </a></li>
					</ul>  
					<div class="card"> 
						<div class="card-header">
							<h4 class="card-title"> 직원 근태 리스트 </h4>  
						</div> 
						<div class="card-body">
							<div class="table-responsive">
							<% Object empCode = session.getAttribute("empCode"); %>
							
								<iframe src="http://localhost:3000/WorkTimeList" style="width:100%; height:800; overflow:hidden; border:0;">
				
								</iframe>
								
							</div> 
						</div> 
					</div> 
				</div> 
			</div> 
		</div>
		
	</div> <!-- close main-panel -->
</div> <!-- close wrapper -->


	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
	
	
</body>
</html>