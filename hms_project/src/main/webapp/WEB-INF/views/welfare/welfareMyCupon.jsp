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
								<h4 class="card-title">마이 쿠폰 목록</h4>
							</div>
							<div class="card-body">
								<form>
									<table class="table table-hover text-center">
										<tr class="backgray">
											<th>No</th>
											<th>쿠폰이름</th>
											<th>객실종류</th>
											<th>조식포함여부</th>
											<th>쿠폰상세</th>
											<th>구매가격</th>
											<th>사용여부</th>
										</tr>

										<c:forEach var="vo" items="${list}">
											<tr>
												<td>${vo.welfareCode}</td>
												<td>${vo.prodName}</td>
												<td>${vo.roomKind}</td>
												<td>${vo.isBreakfast}</td>
												<td>
													<c:if test="${vo.prodContents2 != null && vo.prodContents3 != null}">
														${vo.prodContents1}, ${vo.prodContents2}, ${vo.prodContents3}
													</c:if>
													<c:if test="${vo.prodContents2 != null && vo.prodContents3 == null}">
														${vo.prodContents1}, ${vo.prodContents2}
													</c:if>
													<c:if test="${vo.prodContents2 == null && vo.prodContents3 == null}">
														${vo.prodContents1}
													</c:if>
												</td>
												<td>${vo.dcPrice}</td>
												<td>
													<c:if test="${vo.isUsed == 0}">
														미사용
													</c:if>
													<c:if test="${vo.isUsed != 0}">
														사용
													</c:if>
												</td>
											</tr>
										</c:forEach>

									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- ====== Card ===== -->


			</div>
		</div>
		<!-- close main-panel -->
	</div>
	<!-- close wrapper -->
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>