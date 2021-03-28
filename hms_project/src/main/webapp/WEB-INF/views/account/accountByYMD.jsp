<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<body>

	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/office.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />

			<div class="content">
				<div class="col-md-12">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link" data-toggle="tab" onclick="window.location='account.ad'"> 결산목록조회 </a></li>
						<li class="nav-item"><a class="nav-link active emplListTab" data-toggle="tab" onclick="window.location='accountByYMD.ad'"> 결산상세조회 </a></li>
					</ul>
				<div class="card result">
					<div class="content">
						<div>
							<br>
						</div>
						<div>
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#dayAccount">일별 결산</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#monthAccount">월별 결산</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#yearAccount">연별 결산</a></li>
							</ul>
							<div>
								<br>
							</div>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active show" id="dayAccount">
									<form action="cartAction.do" method="post" id="days">
										<table class="table table-striped" align="center" border="1px solid">
											<tr>
												<th colspan="4">일별 결산 내역</th>
											</tr>
											<tr>
												<th>객실</th>
												<th>연회장</th>
												<th>추가1</th>
												<th>추가2</th>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</table>
									</form>
								</div>
								<div class="tab-pane fade" id="monthAccount">
									<form action="cartAction.do" method="post" id="months">
										<table class="table table-striped" align="center" border="1px solid">
											<tr>
												<th colspan="4">월별 결산 내역</th>
											</tr>
											<tr>
												<th>객실</th>
												<th>연회장</th>
												<th>추가1</th>
												<th>추가2</th>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</table>
									</form>
								</div>
								<div class="tab-pane fade" id="yearAccount">
									<form action="cartAction.do" method="post" id="years">
										<table class="table table-striped" align="center" border="1px solid">
											<tr>
												<th colspan="4">연별 결산 내역</th>
											</tr>
											<tr>
												<th>객실</th>
												<th>연회장</th>
												<th>추가1</th>
												<th>추가2</th>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> <!-- close main-panel -->
		</div> <!-- close wrapper -->
	</div>
</div><!-- ======= Footer ======= -->
		<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>