<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<title>연회장 수정 페이지</title>
<body>
	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />

			<div class="content">
				<form action="hallModifyAction.al" method="post" class="wrap" name="">
					<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}">
					<input type="hidden"name="empCode" value="${sessionScope.empCode }">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">연회장예약수정</h4>
										<input type="hidden" name="resCode"  value="${vo.resCode}">
								</div>

								<div class="card-body">
<!-- 									<ul class="nav nav-tabs"> -->
<!-- 										<li class="nav-item"><a class="nav-link active"data-toggle="tab" href="#insert"> 입력 </a></li> -->
<!-- 										<li class="nav-item"><a class="nav-link"data-toggle="tab" href="#famHistory"> 가족사항 </a></li> -->
<!-- 									</ul> -->
									<div class="tab-content">
										<div class="tab-pane fade show active" id="insert">
											<div class="perDataDivEx mb-15 mt-15">
												<table class="table table-bordered mb-15 mt-15 perDataTab">
												
												<tr>
													<th>예약자</th>
													<td><input type="text" class="form-control"
														name="guestName" value="${vo.guestName}"></td>
													<th>연락처</th>
													<td><input type="text" class="form-control"
														name="guestPhone" value="${vo.guestPhone}"></td>
													<th>행사명</th>
													<td><input type="text" class="form-control"
														name="eventTitle" value="${vo.eventTitle}"> <%-- <fmt:formatDate  value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss "/> --%>
													</td>
													<th>예약날짜</th>
													<td><input type="date" class="form-control"
														name="eventDate" value="${vo.eventDate}">
												</tr>
												<tr>
													<th>DECORATION CAKE</th>
													<td><input type="text" class="form-control"
														name="eventCake" Value="${vo.eventCake}"></td>
													<th>ICE-CARVING</th>
													<td><input type="text" class="form-control"
														name="eventIce" Value="${vo.eventIce}"></td>

													<th>FLOWERS</th>
													<td><input type="text" class="form-control"
														name="eventFlower" Value="${vo.eventFlower}"></td>
													<th>MIST MACHINE</th>
													<td><input type="text" class="form-control"
														name="eventMist" Value="${vo.eventMist}"></td>
												</tr>
												<tr>
													<th>Menu명</th>
													<td><input type="radio" class=”form-control
														name="eventMenu" value="${vo.eventMenu}" checked> 한식 
														<input type="radio" class=”form-control name="eventMenu"
														value="양식" value="${vo.eventMenu}" checked> 양식 
														<input type="radio"class=”form-control name="eventMenu" 
														value="중식"value="${vo.eventMenu}" checked>중식 
														<input type="radio"class=”form-control name="eventMenu" 
														value="중식" value="${vo.eventMenu}" checked>일식
													<th>예약인원</th>
													<td><input type="text" class="form-control"
														name="resCount" value="${vo.resCount}"></td>
													<th>연회장명</th>
													<td><input type="text" class="form-control"
														name="hallName" value=""></td>
													<th>연회장가격</th>
													<td><input type="text" class="form-control" 
													    name="price" value=""></td>		
												</tr>
												<tr>
													<th>기타사항</th>
													<td colspan="7"><input type="text"
														class="form-control" name="eventNotes" value="${vo.eventNotes}"></td>
												</tr>
												<tr>
													<th>Menu 상세</th>
													<td colspan="3"><textarea rows="10"
															style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
															name="eventMenu1" value="${vo.eventMenu1}"></textarea></td>
													<th>TABLE SETTING</th>
													<td colspan="3"><textarea rows="10"
															style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
															name="eventTableSet" value="${vo.eventTableSet}"></textarea></td>
												</tr>
										
												</table>
												<div class="faMemBtnDiv">
													<input type="submit" class="faMemBtn" value="수정">
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