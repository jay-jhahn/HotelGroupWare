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
	    <div class="d-flex">
		  <div class="mr-auto p-2"><h3> 휴가신청 </h3></div>
		  <div class="p-2">공통 > 스케줄 > 휴가신청 </div>
	     </div>
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
 										<td> <input type="text" name="empName"  value="${empCode}" readonly></td> 
 									</tr> 
 									<tr>  										
										<td> 소속부서 </td> 
 										<td> <input type="text" name="empDept"  value="부서 값 받기" readonly></td> 
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
 										<th> 상세보기 </th>
 								</tr> 
								<c:forEach var="list" items="${logDayOff}">
									<tr><!-- 나중에 sysdate로 신청일 주기  -->
 										<td> ${list.holidayCode} </td>
 										<td><fmt:formatDate pattern="yyyy-mm-dd" value="${list.startHoliday}" /></td>
 										<td> <%-- ${list.kindHoliday} --%> 휴가 구분 주기 
 											<c:if test="${list.kindHoliday == 0 }" >
 												반차											
 											</c:if>
 											<c:if test="${list.kindHoliday == 1 }" >
												  연차										
 											</c:if>
 											<c:if test="${list.kindHoliday == 2 }" >
												  병가										
 											</c:if>
 										</td>
 										<td><fmt:formatDate pattern="yyyy-mm-dd" value="${list.startHoliday}" /></td>
 										<td><fmt:formatDate pattern="yyyy-mm-dd" value="${list.endHoliday}" /></td>
 										<td> <!-- 휴무 신청 상태 ( 0: 신청됨 1: 반려 / 2: 승인 나타내는 코드) -->
 											<c:if test="${ list.state == 0}">
 												진행 중 
 											</c:if>
 										</td>
 										
 										<td><input type="button" class="btn" class="btn" style="background-color: #516375; border-radius: 0rem;"  value="상세보기 " ></td>
 									</tr>
								</c:forEach>
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
 							 <form action ="reqDayOffAction.al" method="post">
 							 	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
								<table class="table"> 
									<tr>
										<td> 휴무선택
											<select name="dayOffType" id="selectOff" onchange="holidayType(this)">
												<option value=""> 휴무선택  </option>
												<option value="1"> 휴가 	 </option>
												<option value="2"> 반차      </option>
												<option value="3"> 연차      </option>
											</select>	
										</td>
									</tr>
									
									<tr>	  
										<td><div id="boxForm"> </div><td> 		
					         	 	<tr>
					         	 	
					         	 	<tr>
					         	 		<td>
					         	 			<div class="text-center">
					         	 				<input type="submit" class="btn" style="background-color:#55789B; border-radius: 0rem;" value="입력">
						        				<input type="reset"  class="btn" style="background-color: #516375; border-radius: 0rem;" value="취소">
						        			</div>
						        		</td>
					         	 	</tr>
					         	 </table>
					         	 </form> 
					          </div>
 							</div> 
 						</div> 
 					</div> 
 				</div> 
 			</div> 
	</div>
</div>

	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />


</body>
</html>