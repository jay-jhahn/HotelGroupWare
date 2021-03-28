<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<script src="${path}js/script.js"></script>
<head>
<meta charset="UTF-8">
<title> 휴무 신청 </title>
</head>
<body>

<div class="wrapper">
<!-- ====== Side Menu ===== -->
	<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" />
	<div class="main-panel" id="main-panel">
		<!-- ======= Header ======= -->
		<jsp:include page="${jspPath}common/header.jsp" flush="false" />

	<div class="content">	
	  <form action ="reqDayOffAction.al" method="post">
	    <div class="d-flex">
		  <div class="mr-auto p-2"><h3> 휴가신청 </h3></div>
		  <div class="p-2">공통 > 스케줄 > 휴가신청 </div>
	     </div>
	    <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
	    	<div class="row">
 				<div class="col-md-12"> 
 					<div class="card"> 
 						<div class="card-header"> 
 							<h4 class="card-title"> 휴가 신청자  </h4> 
						</div> 
 						<div class="card-body">
 							<div class="table-responsive">
								<table class="table"> 
									<tr>  										
										<td> 신청자 </td> 
 										<td> <input type="text" name="dayOffName"  value="이름 값 받기" readonly></td> 
 									</tr> 
 									<tr>  										
										<td> 소속부서 </td> 
 										<td> <input type="text" name="dayOffDept"  value="부서 값 받기" readonly></td> 
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
 							<h4 class="card-title"> 휴가 신청내역 </h4> 
						</div> 
 						<div class="card-body">
 							<div class="table-responsive">
								<table class="table text-center">
								<!-- List로 Dummy Data 띄워보기  
								-->
								<!-- 상세보기시 휴가사유 나오게 하기  <th> 휴가사유 </th> --> 
								<!-- List로 Dummy Data 띄워보기 -->
								<tr class="">  										
										<th> No </th> 
 										<th> 신청일 </th>
 										<th> 휴가구분 </th>
 										<th> 시작일 </th>
 										<th> 종료일 </th>
 										<th> 상태 </th>
 								</tr> 
								<c:forEach var="list" items="${logDayOff}">
									<tr>
 										<td> ${list.startHoliday} </td>
 										<td> ${list.endHoliday} </td>
 										<td> ${list.state}</td>
 										<td> 2021-03-17 </td>
 										<td> 2021-03-18 </td>
 										<td>  
 										<!-- DayOffType => 휴무타입  휴무 신청  상태 ( 0: 신청됨 1: 반려 / 2: 승인  나타내는 코드)  -->
 										<c:if test="${list.state == 0}">
 											정상신청 
 										</c:if>
 										
 										<c:if test="${list.state == 1}">
 											반려
 										</c:if>
 										
 										<c:if test="${list.state == 2}">
											승인 										
 										</c:if>
 										</td>
 									</tr>
								</c:forEach>
								<!--  
									<tr class="">  										
										<th> No </th> 
 										<th> 신청일 </th>
 										<th> 휴가구분 </th>
 										<th> 시작일 </th>
 										<th> 종료일 </th>
 										<th> 상태 </th>
 									</tr> 
 									<tr>
 										<td> 1 </td>
 										<td> 2021-03-15 </td>
 										<td> 연차 </td>
 										<td> 2021-03-17 </td>
 										<td> 2021-03-18 </td>
 										<td> 상태 </td>
 									</tr>
 									
 									<tr>
 										<td> 2 </td>
 										<td> 2021-02-15 </td>
 										<td> 연차 </td>
 										<td> 2021-02-19 </td>
 										<td> 2021-02-20 </td>
 										<td> 상태 </td>
 									</tr>
 									-->
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
 						<h4 class="card-title"> 휴가 신청하기  </h4> 
					  </div> 
 						<div class="card-body">
 							<div class="table-responsive">
								<table class="table"> 
									<tr>
										<td> 휴무종료 </td>
										<td>
											<select name="dayOffType">
												<option value="0"> 휴무선택  </option>
												<option value="1"> 휴가 </option>
												<option value="2"> 반차 </option>
												<option value="3"> 연차 </option>
											</select>	
										</td>
									  										
										<td> 시작일자 </td> 
 										<td><input type="date" name="startDate"  value="시작일자 값 받기"></td> 
 									 										
										<td > 종료일자</td> 
 										<td><input type="date" name="endDate"  value="종료일자 값 받기"></td> 
 									</tr> 
 									<tr>
 									  <td> 신청사유 </td>
 									  <td colspan="8">
 									  	<textarea name="dayOffReason" cols="130" rows="10"></textarea>
 									  </td>
 									</tr>
 								</table> 
 								
					          <div class="text-center">
						        <input type="submit" class="btn" style="background-color:#55789B; border-radius: 0rem;" value="입력">
						        <input type="reset"  class="btn" style="background-color: #516375; border-radius: 0rem;" value="취소">
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