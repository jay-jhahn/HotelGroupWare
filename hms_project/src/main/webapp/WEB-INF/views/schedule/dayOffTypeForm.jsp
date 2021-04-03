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
					<div class="card"> 
						<div class="card-header">
							<h4 class="card-title"> 스케줄 변경 신청 </h4>  
						</div> 
						<div class="card-body">
						<!-- 잔여일 수 / 사용일 수 / 사용가능한 일 수  -->
							<div class="table-responsive" id="form1">
								<table class="table"> 
									<tr>
										<td> 발생일 수 </td>
										<td><input type="text" value="${available}">
										</td>
										<td> 사용일 수 </td>
										<td>	<input type="text" value="${usedCount}">
										</td>
										<td> 사용가능일 수 </td>
										<td>	
											<input type="text" value="${available - usedCount}" >
										 </td>
									</tr>
									
									<tr>		
										<td> 시작일자 </td> 
 										<td><input type="date" name="startDate" required></td> 
 									 										
										<td > 종료일자 </td> 
 										<td><input type="date" name="endDate" onchange="calculateDay();" required></td> 
 										
 										<td > 사용일 수</td> 
 										<td><input type="text" name="endDate" value="endDate-startDate" readonlys></td> 
 									</tr> 
 									
 									<tr>
 									  <td> 신청사유 </td>
 									  <td colspan="8">
 									  	<textarea name="dayOffReason" cols="130" rows="10"></textarea>
 									  </td>
 									</tr>
 								</table> 
							</div>
							
							<div class="table-responsive" id="form2">
								<table class="table"> 
									<tr>
										<td> 발생일 수 </td>
										<td><input type="text" value="${available}">
										</td>
										<td> 사용일 수 </td>
										<td>	<input type="text" value="${usedCount}">
										</td>
										<td> 사용가능일 수 </td>
										<td>	
											<input type="text" value="${available - usedCount}" >
										 </td>
									</tr>
									
									<tr>		
										<td> 시작일자 </td> 
 										<td><input type="date" name="startDate"  value="시작일자 값 받기" required></td> 
 									 										
										<td> 종료일자</td> 
 										<td><input type="date" name="endDate"  value="종료일자 값 받기" required></td> 
 										<td> 반차선택</td> 
 										<td>
 										<select name="halfDayOff" id="selectOff">
 										<!-- 반차 선택시 시간 나오게 하기  -->
											<option value=""> 반차선택  </option>
											<option value="5"> 오전 반차 	 </option>
											<option value="6"> 오후 반차      </option>
										</select>	
 										</td>
 									</tr> 
 									
 									<tr>
 									  <td> 신청사유 </td>
 									  <td colspan="8">
 									  	<textarea name="dayOffReason" cols="130" rows="10"></textarea>
 									  </td>
 									</tr>
 								</table> 
							</div>
							
							<div class="table-responsive" id="form3">
								<table class="table"> 
									<tr>
										<td> 발생일 수 </td>
										<td><input type="text" value="${available}">
										</td>
										<td> 사용일 수 </td>
										<td><input type="text" value="${usedCount}">
										</td>
										<td> 사용가능일 수 </td>
										<td>	
											<input type="text" value="${available - usedCount}" >
										 </td>
									</tr>
									
									<tr>		
										<td> 시작일자 </td> 
 										<td><input type="date" name="startDate"  value="시작일자 값 받기" required></td> 
 									 										
										<td > 종료일자</td> 
 										<td><input type="date" name="endDate"  value="종료일자 값 받기" required></td> 
 									</tr> 
 									
 									<tr>
 									  <td> 신청사유 </td>
 									  <td colspan="8">
 									  	<textarea name="dayOffReason" cols="130" rows="10"></textarea>
 									  </td>
 									</tr>
 								</table> 
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