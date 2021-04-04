<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body onload="regiFocus();">
	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			
			<!-- 환율 api -->
			
			<div class="content">
				<form action="#" method="post" class="wrap" name="registerform">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title"> 환전&외화보유금액 </h4>
								</div>
								<div class="card-body">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#insert"> 화전내역입력 </a></li>
										<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#exchangeList"> 환전리스트 </a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="insert">
											<div class="perDataDivEx mb-15 mt-15">
												<table class="table table-bordered mb-15 mt-15 perDataTab">
													<tr>
														<th>성함</th>
														<td><input type="text" class="form-control" name="" id=""></td>
														<th>환전시간</th>
														<td><input type="text" class="form-control" name="" id=""></td>
													</tr>
													<tr>
														<th>환전통화</th>
														<td><input type="checkbox" value="달러"> 달러
															<input type="checkbox" value="엔화"> 엔화
															<input type="checkbox" value="유로"> 유로
														</td> 
														<th>환전신청금액</th> <!-- 1인환전금액 -->
														<td><input type="text" class="form-control" name="" id=""></td>
													</tr>
													<tr>
														<th> 주의 사항 </th>
														<td> 1명의 환전가능 금액 <br>
														           달러: 5천달러 <br>
														           엔화: 5만엔화 <br>
														           유로: 5만유로</td>
														<th> 호텔 보유 금액 </th>
														<td> 
														          총달러: 5천달러 <br>
														          총엔화: 5만엔화 <br>
														          총유로: 5만유로</td>           
													</tr>
												</table>
													<div class="faMemBtnDiv">
														<input type="submit" class="faMemBtn" value="신청">
														<input type="reset" class="faMemBtn" value="취소">
													</div>
												</div>
											</div>
								
										<div class="tab-pane fade" id="exchangeList">
											<div class="perFamDataDivEx">
													<div class="table-responsive">   
												       	<div class="d-flex">
															<div class="col-md-4 p-2" style="margin-top: 15px">
																<input type="date"> ~ <input type="date">
																<input type="submit" value="search">
															</div>
															<div class="col-md-4 col-md-offset-4 ml-auto justify-content-end">
																	<input class="form-control" type="text" style="width: 70%; display: inline">
																	<input class="btn btn-secondary" type="submit"  value="검색" formaction="# action">
															</div>
														</div>
														<table class="table">
															<thead class="backgray">
																<tr>
																	<th class="wid-20">고객 성함</th>
																	<th class="wid-20">환전 시간</th>
																	<th class="wid-20">나라(통화)</th>
																	<th class="wid-20">환전신청금액</th>
																	<th class="wid-20">환전금액</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td >프린세스예진</td>
																	<td>2021-03-13-18:12</td>
																	<td>홍콩달러</td>
																	<td>$1,000</td>
																	<td>113,000원</td>
																</tr>
																<tr>
																	<td>프린세스예진</td>
																	<td>2021-03-14-18:12</td>
																	<td>홍콩달러</td>
																	<td>$1,000</td>
																	<td>113,000원</td>
												
																</tr>
																<tr >
																	<td>강(철)</td>
																	<td>2021-03-15-18:12</td>
																	<td>엔화</td>
																	<td>￥ 10,000</td>
																	<td>103,803.00원</td>
																</tr>
																<tr>
																	<td>강(철)</td>
																	<td>2021-03-16-18:12</td>
																	<td>엔화</td>
																	<td>￥ 10,000</td>
																	<td>103,803.00원</td>
																</tr>
																<tr>
																	<td>울프성원</td>
																	<td>2021-03-17-18:12</td>
																	<td>미국달러</td>
																	<td>$100</td>
																	<td>145,490.00원</td>
																</tr>
																<tr>
																	<td>울프성원</td>
																	<td>2021-03-18-18:12</td>
																	<td>미국달러</td>
																	<td>$100</td>
																	<td>145,490.00원</td>
																</tr>
																<tr>
																	<td>민트</td>
																	<td>2021-03-20-18:12</td>
																	<td>미국달러</td>
																	<td>$100</td>
																	<td>145,490.00원</td>
																</tr>
																<tr>
																	<td>민트</td>
																	<td>2021-03-19-18:12</td>
																	<td>미국달러</td>
																	<td>$100</td>
																	<td>145,490.00원</td>
												
																</tr>
																<tr>
																	<td>강(철)</td>
																	<td>2021-03-21-18:12</td>
																	<td>엔화</td>
																	<td>￥ 10,000</td>
																	<td>103,803.00원</td>
																</tr>
																<tr>
																	<td>울프성원</td>
																	<td>2021-03-21-18:12</td>
																	<td>미국달러</td>
																	<td>$100</td>
																	<td>145,490.00원</td>
																</tr>
															</tbody>
														</table>
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
			</div> <!-- close main-panel -->
		</div> <!-- close wrapper -->

	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>