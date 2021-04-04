<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<script src="${path}js/script.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ======= Main ======= -->
<div class="wrapper">
<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" />
<div class="main-panel" id="main-panel">
<jsp:include page="${jspPath}common/header.jsp" flush="false"/>
	
	<div class="content">
		<div class="row"> 
 			<div class="col-md-12"> 
 				<div class="card"> 
					<div class="card-header">
						<div class="card-body">
						<form action="insertAction.al" method="post" onsubmit="return makeScdChk();">
							<input type = "hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
							<input type="hidden" name="empCode" value="${vo.empCode}">
							  <div> 
								<table class="table text-center">
								  <tr>
								  	<th > ${nextMonth}월 근무 편성 </th>
								  </tr>
								  <tr>  										
									<td> 이름 </td> 
									<td><input type="text" class="animate__animated animate__fadeInUp form-control inputIdPwd mb-2" 
									style="width:130px;" name="empName"  placeholder="${vo.empName}" readonly ></td>
									<td> 부서 </td>
									<td><input type="text" class="animate__animated animate__fadeInUp form-control inputIdPwd mb-2" 
									style="width:130px;" name="scdEmpCode"  placeholder="${vo.empCode}" readonly> </td>
 								  </tr>
 								</table>
 							</div>
								<div class="table-responsive"> 
 								<table class="table text-center"> 
								  <tr class="text-center backgray">  										
									<th> 날짜 </th> 
									<th> 유형 </th>
									<th> REMARK </th> 
 								  </tr>
 								  
 								  <tr>
 								  	<c:forEach  var="days" items="${days}" varStatus="status">
 									<!-- 이벤트 일정 DB에서 값 가져와서 뿌려주기 (SELECT 한 DATE 기준) -->
										<tr><!-- 현재 1일은 01이 아닌 1로 뿌려짐 방법을 생각해 보기  -->
	 								   	<td> 
	 								   		<c:if test="${status.count < 10 }">
	 								   			<input type="text" name="scheduleDate"  value="2021-0${nextMonth}-0${status.count}" readonly> 
	 								   		</c:if>
	 								   		
	 								   		<c:if test="${status.count > 9 }" >
	 								   			<input type="text" name="scheduleDate"  value="2021-0${nextMonth}-${status.count}" readonly> 
	 								   		</c:if>
	 								   		
	 								   		<!-- 월이 2자리 일시 월의 0 뺴주기 위함 -->
	 								   		<c:if test="${nextMonth > 9}">
	 								   			<c:if test="${status.count < 10 }">
	 								   			<input type="text" name="scheduleDate"  value="2021-${nextMonth}-0${status.count}" readonly> 
	 								   		</c:if>
	 								   	
	 								   		<c:if test="${status.count > 9 }" >
	 								   			<input type="text" name="scheduleDate"  value="2021-${nextMonth}-${status.count}" readonly> 
	 								   		</c:if>
	 								   		</c:if>
	 								   	</td>
	 								   	
										<td> 
											<select name="workType">
												<option value="0"> 근무선택 </option>
												<option value="1"> 오전근무 </option>
												<option value="2"> 오후근무  </option>
												<option value="3"> 야간근무  </option>
												<option value="7"> 휴무 </option>
											</select>	
										 </td>
										 	<td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
	 								  	</tr>
 									</c:forEach>
 								  
 								  <tr>
						        	<td colspan="3"><input type="submit" class="btn" style="background-color:#55789B; border-radius: 0rem;" value="입력하기"></td>
 								  </tr>
 								</table> 
 								</div>
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
  	<jsp:include page="${jspPath}common/footer.jsp" flush="false"/>
  	
  	
</body>
</html>