<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body onload="getEmpListDept('${sessionScope.empCode}');">
	<div class="wrapper">
	<c:if test="${empVo.deptCode eq 'OF'}">
		<jsp:include page="${jspPath}common/sideMenu/office.jsp" flush="false" />
	</c:if>
	<c:if test="${empVo.deptCode eq 'RO'}">
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />
	</c:if>
		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="getInsertEmp();"> 인사고과 </a></li>
						</ul>
						<div class="card ratingResult">
							
						</div> <!-- close card -->
					</div>
				</div> <!-- close row -->
			</div> <!-- close content -->
		</div> <!-- close main-panel -->
	</div> <!-- close wrapper -->
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>