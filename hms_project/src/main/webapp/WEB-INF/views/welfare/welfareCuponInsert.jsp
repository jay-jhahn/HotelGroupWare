<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<body>
	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/office.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />

			<div class="content">
				<div class="row">
					<div class="col-md-12">
					
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">쿠폰 입력</h4>
						</div>
						<div class="card-body">
							<form action="welfareCuponInsert.al" style="text-align:center" method="post" name="cuponInsertForm">
								<table class="table" style="width:50%">
									<tr>
										<th class="backgray">쿠폰명<span class="redStar"> * </span></th>
										<td colspan="2"><input type="text" class="form-control" name="prodName"/></td>
									<tr>
									<tr>
										<th class="backgray">원가<span class="redStar"> * </span></th>
										<td colspan="2"><input type="number" class="form-control" value="100000" min="0"
												max="1000000" step="10000" name="realPrice"/></td>
									<tr>
									<tr>
										<th class="backgray">할인율<span class="redStar"> * </span></th>
										<td colspan="2"><input type="number" class="form-control" value="30" min="0"
												max="100" step="1" name="dcRate"/></td>
									<tr>
									<tr>
										<th class="backgray">객실종류</th>
										<td>
											<select class="form-control" name="roomClass">
												<option selected>등급</option>
												<option value="스탠다드">스탠다드</option>
												<option value="슈페리어">슈페리어</option>
												<option value="디럭스">디럭스</option>
												<option value="이그제큐티브">이그제큐티브</option>
											</select>
										</td>
										<td>
											<select class="form-control" name="roomType">
												<option selected>객실</option>
												<option value="싱글">싱글</option>
												<option value="더블">더블</option>
												<option value="트윈">트윈</option>
												<option value="트리플">트리플</option>
												<option value="스위트">스위트</option>
											</select>
										</td>
									<tr>
									<tr>
										<th class="backgray">조식여부</th>
										<td colspan="2">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="isBreakfast" value="조식지원o" checked>조식지원o
											</div>
											&nbsp;&nbsp;
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="isBreakfast" value="조식지원x">조식지원x
											</div>
										</td>
									<tr>
									<tr>
										<th class="backgray">상세내용1<span class="redStar"> * </span></th>
										<td colspan="2"><input type="text" class="form-control" name="prodContents1" placeholder="ex:루프탑 뷔폐 + 바베큐 2인세트"/></td>
									<tr>
									<tr>
										<th class="backgray">상세내용2</th>
										<td colspan="2"><input type="text" class="form-control" name="prodContents1" placeholder="ex:맥주 무제한"/></td>
									<tr>
									<tr>
										<th class="backgray">상세내용3</th>
										<td colspan="2"><input type="text" class="form-control" name="prodContents1" placeholder=""/></td>
									<tr>
								</table>
								
								<input type="submit" class="btn input" style="background-color: #55789B;" value="입력">
								<input type="reset" class="btn input" style="background-color: #516375;" value="취소">
							</form>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">쿠폰 목록</h4>
						</div>
						<div class="card-body">

								<input type="hidden" value="${pageNum}" name="pageNum"/>
								<table class="table table-bordered text-center">
									<tr class="backgray">
										<th>No</th>
										<th>쿠폰이름</th>
										<th>객실종류</th>
										<th>조식포함여부</th>
										<th>쿠폰상세</th>
										<th>실가격</th>
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
											<td>${vo.realPrice}</td>
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
								
								<div style="width:100%">
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center">
											<!-- 게시글이 존재할때만 페이징 처리 -->
											<c:if test="${cnt > 0}">
												<!-- 처음[◀◀] / 이전블록[◀] -->
												<c:if test="${startPage > pageBlock}">
													<li class="page-item"><a class="page-link" href="welfareCuponList.al">«</a></li>
													<li class="page-item"><a class="page-link" href="welfareCuponList.al?pageNum=${startPage - pageBlock}">Prev</a></li>
												</c:if>
												
												<!-- 블록내의 페이지 번호 -->
												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:if test="${i == currentPage}">
														<li class="page-item active"><a class="page-link">${i}<span class="sr-only">(current)</span></a></li>
													</c:if>
													
													<c:if test="${i != currentPage}">
														<li class="page-item"><a class="page-link" href="welfareCuponList.al?pageNum=${i}"> ${i} </a></li>
													</c:if>
													
												</c:forEach>
												
												<!-- 다음블록[▶] / 마지막[▶▶] -->
												<c:if test="${endPage < pageCount}">
													<li class="page-item"><a class="page-link" href="welfareCuponList.al?pageNum=${startPage + pageBlock}">Next</a></li>
													<li class="page-item"><a class="page-link" href="welfareCuponList.al?pageNum=${pageCount}">»</a></li>
												</c:if>
											</c:if>
										</ul>
									</nav>
								</div>
							
						</div>
					</div><!-- ====== Card ===== -->
					
					
				</div>
			</div>

		</div>
	</div>
	<!-- close main-panel -->
	</div>
	<!-- close wrapper -->
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>