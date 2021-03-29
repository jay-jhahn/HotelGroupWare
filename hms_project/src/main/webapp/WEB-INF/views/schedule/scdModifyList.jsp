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
<<<<<<< HEAD
 									<td><input type="button" class="btn" style="background-color: #516375; border-radius: 0rem;" data-toggle="modal" data-target="#exampleModal" value="상세보기"></td>
=======
 									<td><input type="button" class="btn" style="background-color: #55789B; border-radius: 0rem;" value="상세보기"></td>
>>>>>>> main
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


<<<<<<< HEAD
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> 상세보기 </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action ="#" method="post">
      <input type = "hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <table class="table text-center">
			<tr>
				<th> 신청자 </th>
				<td><input type="text" name="empName"  value="${empCode}" readonly></td>
			</tr>
			<tr>	
				<th> 변경희망일  </th>
				<td><input type="text" name=""  value="변경희망일 값" readonly></td>
			</tr>
			<tr>	
				<th> 변경근무 타입 </th>
				<td><input type="text" name=""  value="희망변경근무 값" readonly> </td>
				
			</tr>
			
			<tr>
				<th> 변경사유</th>
				<td><textarea type="text" name=""  value="변경사유 값" readonly></textarea> </td>
			
			</tr>
			<tr class="text-center">
			    <td>
		      	  <input type="submit" class="btn" style="background-color: #516375; border-radius: 0rem;" data-dismiss="modal" value="승인"> 
		      	  <input type="button" class="btn" style="background-color: #516375; border-radius: 0rem;"  value="반려"> 
		     	  <input type="button" class="btn" style="background-color: #516375; border-radius: 0rem;" onclick="self.close()" value="닫기"> 
			    </td>
			</tr>
        </table>
       </form>
      </div>
    </div>
  </div>
</div>



<!-- ======= Footer ======= -->
<jsp:include page="${jspPath}common/footer.jsp" flush="false"/>
=======
<!-- ======= Footer ======= -->
<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
>>>>>>> main

	
</body>
</html>