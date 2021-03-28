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
								<h5 class="card-title">스케줄 상세 조회</h5>
							</div>
							<div class="card-body">
								<div class="table-responsive"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table text-center">
											<tr>
												<th>날짜</th>
												<th>유형</th>
												<th>REMARK</th>
											</tr>

											<tr>
												<!-- 이벤트 일정 DB에서 값 가져와서 뿌려주기 (SELECT 한 DATE 기준) -->
												<td>2021-03-22</td>
												<td>팀 프로젝트 PPT 2차 발표</td>
												<td><textarea name="" class="" cols="30" rows="3" placeholder="저장되어있는 REMARK 가져오기"></textarea></td>
											</tr>

											<tr>
												<!-- 이벤트 일정 DB에서 값 가져와서 뿌려주기 (SELECT 한 DATE 기준) -->
												<td>2021-03-29</td>
												<td>팀 프로젝트 PPT 3차 발표</td>
												<td><textarea name="" class="" cols="30" rows="3" placeholder="저장되어있는 REMARK 가져오기"></textarea></td>
											</tr>

											<tr>
												<td colspan="3"><input type="button" class="btn" value="돌아가기"></td>
											</tr>
										</table>
									</div>
								</div>
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