<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body onload="getEmpList();">
	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/office.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active emplListTab" data-toggle="tab" onclick="getEmpList();"> 사원명부 </a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" onclick="getInsertEmp();"> 인사정보등록 </a></li>
						</ul>
						<div class="card result">
						
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