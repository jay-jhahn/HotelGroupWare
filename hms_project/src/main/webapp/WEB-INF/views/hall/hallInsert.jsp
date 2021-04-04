<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<html>
<title>연회장 예약 페이지</title>
<script type="text/javascript">
	function resSub() {

		if (document.resTable.resKind.value == 0) {
			alert('이름을 입력하세요 !');
			return false;
		}
	}

	$(function() {
		if ($('input').is(":checked") == true) {
			$('b').text('체크된 상태');
		} else {
			$('b').text('체크 안 된 상태');
		}
	});

	$("form").attr("action", "hallModifyAction.al");
</script>
<body>
<div class="wrapper">
	<!-- ====== Side Menu ===== -->
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
<!-- 							<ul class="nav nav-tabs"> -->
<!-- 								<li class="nav-item"><a class="nav-link active" -->
<!-- 									data-toggle="tab" href="#insert"> 입력 </a></li> -->
<!-- 								<li class="nav-item"><a class="nav-link" data-toggle="tab" -->
<!-- 									href="#modify"> 수정 </a></li> -->
<!-- 							</ul> -->
							<div class="tab-content">
								<div class="tab-pane fade show active" id="insert">
									<form action="hallInsertAction.al" method="post" class="wrap"name="">
										<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"> 
										<div class="perDataDivEx mb-15 mt-15">
											<table class="table table-bordered mb-15 mt-15 perDataTab"
												name="resTable">
												<tr>
													<th>고객성함</th>
													<td><input type="text" class="form-control"
														name="resName"></td>
													<th>고객번호</th>
													<td><input type="text" class="form-control"
														name="resPhone"></td>
													<th>연회장명</th>
													<td><input type="radio" class=”form-control
														       name="resHallName" value="케이크">청룡 
														<input type="radio" class=”form-control
														       name="resHallName" value="미스트머신">주작<br>
														<input type="radio" class=”form-control 
														       name="resHallName" value="장식꽃">백호
														<input type="radio" class=”form-control 
														       name="resHallName" value="얼음 조형">현무 
													</td>
													<th>담당직원</th>
													<td><input type="text" class="form-control"
														name="${sessionScope.empCode}"></td>
												</tr>
												<tr>
													<th>행사명</th>
													<td><input type="text" class="form-control"
														name="eventTitle">
													<th>예약날짜</th>
													<td><input type="date" class="form-control"
														name="eventDate">
													<th>대여시간</th>
													<td><input type="time" class="form-control"
														name="startDate">
														<input type="time" class="form-control"
														name="endDate">	
													</td>
													<th>예약인원</th>
													<td><input type="text" class="form-control"
														name="resCount"></td>	
												</tr>
												<tr>
													<th>연회장 가격</th>
													<td><input type="text" class="form-control"
														name="resHallPrice"></td>
													<th>Menu명</th>
													<td><input type="radio" class=”form-control name="eventMenu" 
													    value="한식">한식 
														<input type="radio" class=”form-control name="eventMenu"
														value="양식">양식  <br>
														<input type="radio"class=”form-control name="eventMenu" 
														value="중식">중식 
														<input type="radio"class=”form-control name="eventMenu" 
														value="중식">일식</td>	
													<th>특약사항</th>
													<td><input type="checkbox" class=”form-control
														       name="decoration" value="케이크">케이크 
														<input type="checkbox" class=”form-control
														       name="decoration" value="미스트머신">안개머신
														<input type="checkbox" class=”form-control 
														       name="decoration" value="장식꽃">장식꽃
														<input type="checkbox" class=”form-control 
														       name="decoration" value="얼음 조형">얼음조형
													<th>기타사항</th>
													<td><input type="text" class="form-control"
														name="eventNotes"></td> 
												</tr>
												<tr>
													<th>Menu 상세</th>
													<td colspan="3"><textarea rows="10"
															style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
															name="eventMenu1"></textarea></td>
													<th>TABLE SETTING</th>
													<td colspan="3"><textarea rows="10"
															style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
															name="eventTableSet"></textarea></td>
												</tr>
											</table>
											<div class="faMemBtnDiv">
												<input type="submit" class="faMemBtn" value="예약"> 
												<input type="reset" class="faMemBtn" value="취소"
													onclick="window.history.back();">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>