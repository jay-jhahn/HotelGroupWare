<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<%@ include file="../common/setting.jsp"%>
<body onload="regiFocus();">
	<div class="wrapper">
		<!-- ====== Side Menu ===== -->
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />

		<div class="main-panel" id="main-panel">
			<!-- ======= Header ======= -->
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			
			<div class="content">
				<form action="hallModify.al" method="post" class="wrap" name="registerform">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						
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
<%-- 													<td onclick="hallList.al">${vo.hallName}</td> --%>
													<td>고객성함</td>
													<td>${vo.gVo.guestName}</td>
													<td>${vo.hVo.hallName}</td>
													<td>
													
												</tr>
											</thead>
											<tbody>
											<c:forEach var="vo" items="${vo}">
											<input type="hidden" name="resCode" value="${vo.resCode}">
												<tr> 
													<td></td> 
													<td>${vo.guestName }</td> 
 													<td>${vo.eventTitle }</td> 
 													<td>${vo.eventDate }</td> 
 													<td>${vo.eventCake }</td> 
 													<td><input type="submit" value="수정">
													<input type="button" value="삭제"></td>
 												</tr> 
											</c:forEach>	
											</tbody>
										</table>
									</div>
								</div>	
							</div>									
						</form>
					</div>
				</div>
			</div>
						
				
			
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>

