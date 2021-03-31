<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body onload="${onload}">
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
							<c:if test="${onload=='payMgtInsert();'}">
								<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="payMgtInsert();"> 급여명세서 입력 </a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" onclick="payMgtUpdate();"> 급여명세서 수정 </a></li>
							</c:if>
							<c:if test="${onload=='payMgtUpdate();'}">
								<li class="nav-item"><a class="nav-link" data-toggle="tab" onclick="payMgtInsert();"> 급여명세서 입력 </a></li>
								<li class="nav-item"><a class="nav-link active" data-toggle="tab" onclick="payMgtUpdate();"> 급여명세서 수정 </a></li>
							</c:if>
						</ul>
						<div class="card result" style="padding: 5px 15px;">
						
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