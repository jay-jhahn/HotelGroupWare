<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<body>
	<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />

	<div class="main-panel" id="main-panel">
		<!-- ======= Header ======= -->
		<jsp:include page="${jspPath}common/header.jsp" flush="false" />

		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">연회장 예약</h4>
						</div>
						<div class="card-body">
							<form action="#" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
								<c:set var="i" value="0" />
								<c:set var="j" value="4" />
								<table style="margin: auto; width: 1000px; height: 400px">
									<c:forEach items="${vo }" var="vo">
										<%-- <c:if test="${fn:substring(list.roomNum,0,2) eq 10 }"> --%>
										<c:if test="${i%j == 0 }">
											<tr style="text-align: center">
										</c:if>
										<td align="center">
											<div class="roomMainInput">
												<b class="fontCo"><span>${vo.hallName}</span>></b>
												<table class="table" style="background-color: #EBECF1">

													<tr class="tr1">
														<td>10시 ~ 11시<input type="checkbox" name="timecheck"
															value="1" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>11시 ~ 12시<input type="checkbox" name="timecheck"
															value="2" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>12시 ~ 13시<input type="checkbox" name="timecheck"
															value="3" onclick="hallStateChange()">
														</td>
													</tr>


													<tr>
														<td>13시 ~ 14시<input type="checkbox" name="timecheck"
															value="4" onclick="hallStateChange()">
														</td>
													</tr>

													<tr>
														<td>14시 ~ 15시<input type="checkbox" name="timecheck"
															value="5" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>15시 ~ 16시<input type="checkbox" name="timecheck"
															value="6" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>16시 ~ 17시<input type="checkbox" name="timecheck"
															value="7" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>17시 ~ 18시<input type="checkbox" name="timecheck"
															value="8" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>18시~ 19시<input type="checkbox" name="timecheck"
															value="9" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>19시~ 20시<input type="checkbox" name="timecheck"
															value="10" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>20시~ 21시<input type="checkbox" name="timecheck"
															value="11" onclick="hallStateChange()">
														</td>
													</tr>
													<tr>
														<td>21시~ 22시<input type="checkbox" name="timecheck"
															value="11" onclick="hallStateChange()">
														</td>
													</tr>
													<c:if test="${i%j == j-2 }">

													<c:set var="i" value="${i+2 }" />
													</c:if>
												</table>
											</div>
										</td>
										<%-- </c:if> --%>
									</c:forEach>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<body>


	<!-- ======= Footer ======= -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>