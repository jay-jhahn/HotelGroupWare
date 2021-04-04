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
									data-toggle="tab" href="#dayAccount">금일 결산 내역</a></li>
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
												<th colspan="5">금일 결산 내역</th>
											</tr>
											<tr>
												<th>일</th>
												<th>객실</th>
												<th>연회장</th>
												<th>손실</th>
												<th>순이익</th>
											</tr>
											<c:forEach var="vo" items="${list3}">
											<tr>
												<td>${vo.this_day}일</td>
												<td><fmt:formatNumber value="${vo.room_account_days}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.hall_account_days}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.pmt_account_days }" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.room_account_days + vo.hall_account_days - vo.pmt_account_days}" pattern="#,###"/>원</td>
											</tr>
											</c:forEach>
										</table>
									</form>
								</div>
								<div class="tab-pane fade" id="monthAccount">
									<form action="cartAction.do" method="post" id="months">
										<table class="table table-striped" align="center" border="1px solid">
											<tr>
												<th colspan="5">월별 결산 내역</th>
											</tr>
											<tr>
												<th>월</th>
												<th>객실</th>												
												<th>연회장</th>
												<th>손실</th>
												<th>순이익</th>
											</tr>
											<c:forEach var="vo" items="${list2}">
											<tr>
												<td>${vo.this_month}월</td>
												<td><fmt:formatNumber value="${vo.room_account_months}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.hall_account_months}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.pmt_account_months }" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.room_account_months + vo.hall_account_months - vo.pmt_account_months}" pattern="#,###"/>원</td>
											</tr>
											</c:forEach>											
										</table>
									</form>
								</div>
								<div class="tab-pane fade" id="yearAccount">
									<form action="cartAction.do" method="post" id="years">
										<table class="table table-striped" align="center" border="1px solid">
											<tr>
												<th colspan="5">연별 결산 내역</th>
											</tr>
											<tr>
												<th>년도</th>
												<th>객실</th>												
												<th>연회장</th>
												<th>손실</th>
												<th>순이익</th>
											</tr>
											<c:forEach var="vo" items="${list1}">
											<tr>
												<td>${vo.this_year}년</td>
												<td><fmt:formatNumber value="${vo.room_account_years}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.hall_account_years}" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.pmt_account_years }" pattern="#,###"/>원</td>
												<td><fmt:formatNumber value="${vo.room_account_years + vo.hall_account_years - vo.pmt_account_years}" pattern="#,###"/>원</td>
											</tr>
											</c:forEach>
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