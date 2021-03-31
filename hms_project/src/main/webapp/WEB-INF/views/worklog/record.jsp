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
							<h4 class="card-title">업무일지</h4>
						</div>
						<div class="card-body">
							<div>
								<iframe class="holidayListIframe" src="http://localhost:3000/MainList">
								
								</iframe>
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