<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
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
		 <input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		    <div class="d-flex">
			  <div class="mr-auto p-2"></div>
			  <div class="p-2">공통 > 스케줄 > 스케줄 수정 </div>
		     </div>
		    <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
		    	<div class="row">
	 				<div class="col-md-12"> 
	 					<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='insertSchedule.al'"> 스케줄 입력 </a></li>
							<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="window.location='scdModifyList.al'"> 스케줄 수정  </a></li>
						</ul>  
	 					<div class="card"> 
	 						<div class="card-header"> 
	 							<h4 class="card-title"> 직원 스케줄 수정 </h4> 
							</div> 
	 						<div class="card-body"> <!-- 직원 스케줄 수정 변경 신청한 직원들 목록  진행중 / 반려함 / 완료함 나중에 구분 잘 하기  -->
	 							<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="window.location='#'"> 진행중 </a></li>
									<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='#'"> 반려함  </a></li>
									<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab" onclick="window.location='#'"> 완료함  </a></li>
								</ul>  
	 							<div class="table-responsive">
									<table class="table text-center">
								<tr class="text-center backgray">
 									<th> 직원이름 </th>
 									<th> 소속부서 </th>
 									<th> 신청일  </th>
 									<th> 상세보기  </th>
 								</tr>
 									
								<tr>
 									<td> 이철한 </td>
 									<td> 객실부서 </td>
 									<td> 2021-03-28 </td>
 									<td><input type="button" class="btn" style="background-color: #55789B; border-radius: 0rem;" value="상세보기"></td>
 								</tr>
 								</table> 
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