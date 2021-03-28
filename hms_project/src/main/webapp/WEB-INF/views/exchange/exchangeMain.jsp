<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />

			<div class="content">
				<nav class="navbar navbar-expand-lg" style="background-color: #516375;">
					<div class="collapse navbar-collapse" id="navbarColor01">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active">
								<a class="nav-link" href="exchangeRate.al">환율조회</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="exchangeCheck.al">환전내역조회</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="exchangeInsert.al">환전신청</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="exchangeTotal.al">외화보유금액</a>
							</li>
						</ul>
					</div><!-- close navbar-collapse -->
				</nav>
			</div>
		</div> <!-- close main-panel -->
	</div> <!-- close wrapper -->
	
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>