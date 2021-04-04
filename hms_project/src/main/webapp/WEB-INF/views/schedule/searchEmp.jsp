<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<script src="${path}js/script.js"></script>
<head>
<meta charset="UTF-8">
<title>스케줄 상세 조회</title>
</head>
<body>

	<!-- ======= Main ======= -->
	<div class="wrapper">
		<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" /> 
		<div class="main-panel" id="main-panel">
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />

			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h5 class="card-title"> 직원 조회 </h5>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table text-center">
									<!-- selectCode 페이지이동을 위한 코드 0:직원 근무 입력    1:직원 스케줄 조회 -->
									<input type="hidden" id="selectCode" value="${selectCode}">
										<tr class="text-center backgray">		
											<th> 이름 </th>
											<th> 소속부서 </th>
											<th> 직급 </th>
											<th> 전화번호 </th>
											<th> 선택 </th>
										</tr>
									<c:forEach var="list" items="${vo}">
									<input type="hidden"  id="empCode" value="${list.empCode}">
									<input type="hidden"  id="empName" value="${list.empName}">
										<tr>
											<td> ${list.empName}</td>
											<td> ${list.deptName} </td>
											<td> ${list.levelVo} </td>
											<td> ${list.dutyCode} </td>
											<th><input type="button" class="btn" value="선택하기 " style="background-color:#55789B; border-radius: 0rem;" onclick="giveEmpInfo(empCode.value, selectCode.value);"></th>
										</tr>
									</c:forEach>
									</table>
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