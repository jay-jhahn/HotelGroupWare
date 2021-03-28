<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<body>
	<div class="wrapper ">
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />
		<div class="main-panel" id="main-panel">
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			<div class="content">
			SELECT COUNT(*) FROM EXCHANGE_TBLl WHERE exCode = "'';
				<div class="d-flex">
					<div class="mr-auto p-2"><h3> 환전내역조회</h3></div>
					<div class="p-2"></div>
				</div>
				<div class="row">
				<div class="col-md-12">
					<div class="card">
					    <div class="card-header">
					        <h4 class="card-title">입력</h4>
					    </div>
					    <div class="card-body">					    
					        <div class="table-responsive">   
						       	<div class="row">
									<div class="col-md-4">
										<input type="date"> ~ <input type="date">
										<input type="submit" value="search">
										
									</div>
									<div class="col-md-4 col-md-offset-4">
										<form class="form-inline">
											<input class="form-control mr-sm-2" type="text" placeholder="Search">
											<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
										</form>
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
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

</body>
</html>