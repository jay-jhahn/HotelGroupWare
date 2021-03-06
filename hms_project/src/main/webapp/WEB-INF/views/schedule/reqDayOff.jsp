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
 										<td> <input type="text" name="empName"  value="${vo.empName}" readonly></td> 
 									</tr> 
 									<tr>  										
										<td> 소속부서 </td> 
 										<td> <input type="text" name="empDept"  value="${vo.deptName}" readonly></td> 
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
 								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab"       onclick="location.href='reqDayOff.ra?state=0'"> 진행중 </a></li>
									<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab"  onclick="location.href='reqDayOff.ra?state=2'"> 반려함  </a></li>
									<li class="nav-item"><a class="nav-link emplListTab" data-toggle="tab"  onclick="location.href='reqDayOff.ra?state=1'"> 완료함  </a></li>
								</ul> 
 							<div class="table-responsive">
 							
 							<div id="holidayState">
								<table class="table text-center">
								<!-- List로 Dummy Data 띄워보기  -->
								<!-- 상세보기시 휴가사유 나오게 하기  <th> 휴가사유 </th> --> 
								<!-- List로 Dummy Data 띄워보기--> 
								
								<tr class="text-center backgray">  										
										<th> No </th> 
 										<th> 휴가구분 </th>
 										<th> 시작일 </th>
 										<th> 종료일 </th>
 										<th> 상태 </th>
 										<th> 상세보기 </th>
 								</tr> 
								<c:forEach var="list" items="${logDayOff}">
								
									<input type="hidden" name="empCode" value="${list.empCode}">
									<tr><!--  나중에 sysdate로 신청일 주기  -->
								
 										<td> ${list.holidayCode} </td>
 										<td> <%-- ${list.kindHoliday} 0:연차 / 1:병가  / 2:오전 반차 / 3:오후 반차 --%>  
 											<c:if test="${list.kindHoliday == 0 }" >
 												 연차										
 											</c:if>
 											<c:if test="${list.kindHoliday == 1 }" >
												  병가										
 											</c:if>
 											<c:if test="${list.kindHoliday == 2 }" >
												  오전 반차									
 											</c:if>
 											<c:if test="${list.kindHoliday == 3 }" >
												  오후 반차									
 											</c:if>
 										</td>
 										<td><fmt:formatDate pattern="YYYY-MM-dd" value="${list.startHoliday}" /></td>
 										<td><fmt:formatDate pattern="YYYY-MM-dd" value="${list.endHoliday}" /></td>
 										<td> <!-- 휴무 신청 상태 ( 0:진행중 / 1:승인 / 2:반려) -->
 											<c:if test="${ list.state==0}">
 												진행 중 
 											</c:if>
 											
 											<c:if test="${ list.state==1}">
 												승인 
 											</c:if>
 											<c:if test="${ list.state==2}">
 												반려 
 											</c:if>
 										</td>
 										<td><input type="button" class="btn" style="background-color: #55789B; border-radius: 0rem;" data-toggle="modal" data-target="#detailModal" value="상세보기 " onclick="getDetailHoliday(empCode.value);"></td>
 									</tr>
								</c:forEach>
 								</table>
 							</div> 
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
 							 <form action ="reqDayOffAction.ra" method="post" onsubmit="return reqDayOffChk();">
 							 	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
								<table class="table"> 
									<tr>
										<td>&nbsp;&nbsp;휴무선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<select name="dayOffType" id="selectOff" onchange="holidayType(this)">
												<option value="0"> 휴무선택  </option>
												<option value="1"> 병가 	 </option>
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


<!-- Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				<td><input type="text" name="empName" value="${vo.empName}" readonly></td>
			</tr>
			<tr>	
				<th> 휴무 희망일  </th>
				<td><input type="text" name="hopeDayOff" value="" readonly></td>
			</tr>
			<tr>	
				<th> 휴무 타입 </th>
				<td ><input type="text" name="kindHoliday" value="" readonly></td>
				
			</tr>
			
			<tr>
				<th> 신청사유 </th>
				<td><textarea type="text" name="" class="modalTextarea" value="${reasonHoliday}" readonly></textarea> </td>
			
			</tr>
			<tr class="text-center">
			    <td colspan="2">
		     	  <input type="button" class="btn" style="background-color: #516375; border-radius: 0rem;" onClick="self.close()" value="닫기"> 
			    </td>
			</tr>
        </table>
       </form>
      </div>
    </div>
  </div>
</div>



	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />


</body>
</html>