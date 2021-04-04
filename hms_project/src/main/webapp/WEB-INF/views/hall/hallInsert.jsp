<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<title>연회장 예약 페이지</title>
<body>
	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />

			<div class="content">
				<form action="#" method="post" class="wrap" name="">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">연회장 예약</h4>
								</div>

								<div class="card-body">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"data-toggle="tab" href="#insert"> 입력 </a></li>
										<li class="nav-item"><a class="nav-link"data-toggle="tab" href="#famHistory"> 가족사항 </a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="insert">
											<div class="perDataDivEx mb-15 mt-15">
												<table class="table table-bordered mb-15 mt-15 perDataTab">
													<tr>
														<th>행사명</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>전화번호</th> 
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>행사일</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>예약자</th>
														<td><input type="text" class="form-control" name="" id=""></td>
													</tr>
													<tr>
														<th>행사시간</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>행사인원</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>Menu명</th>
														<td>
															<input type="checkbox" class=”form-control value="중식"> 한식 
															<input type="checkbox" class=”form-control value="양식"> 양식 
															<input type="checkbox" class=”form-control value="중식"> 중식
															<input type="checkbox" class=”form-control value="양식"> 일식 
														</td>
														<th>대실가격</th>
														<td><input type="text" class="form-control" name="" id=""></td>
													</tr>
													<tr>
														<th>DECORATION CAKE</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>ICE-CARVING</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>FLOWERS</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>MIST MACHINE</th>
														<td><input type="text" class="form-control" name="" id=""></td>
													</tr>
													<tr>
														<th>특약사항</th>
														<td colspan="3"><input type="text"
															class="form-control" name="" id=""></td>
														<th>기타사항</th>
														<td colspan="3"><input type="text"
															class="form-control" name="" id=""></td>
													</tr>
													<tr>
														<th>Menu</th>
														<td colspan="3">
															<textarea rows="10" style="width:100%;border:1;overflow:visible;text-overflow:ellipsis;" name=""></textarea>
														</td>
														<th>TABLE SETTING</th>
														<td colspan="3">
															<textarea rows="10" style="width:100%;border:1;overflow:visible;text-overflow:ellipsis;" name=""></textarea>
														</td>
													</tr>
												</table>
												<div class="faMemBtnDiv">
													<input type="submit" class="faMemBtn" value="예약">
													<input type="reset" class="faMemBtn" value="취소"> 
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>