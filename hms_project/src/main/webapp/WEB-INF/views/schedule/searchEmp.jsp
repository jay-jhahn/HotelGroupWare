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
								<h5 class="card-title"> 직원 조회 </h5>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table text-center">
										<tr class="text-center backgray">									
											<th> 이름 </th>
											<th> 소속부서 </th>
											<th> 직급 </th>
											<th> 전화번호 </th>
											<th> 선택 </th>
										</tr>
									
										<tr>
											<td> LEE CHUL HAN </td>
											<td> 객실부서 </td>
											<td> 지배인 </td>
											<td> 010-1111-2222 </td>
											<th><input type="button" class="btn" value="선택하기 " style="background-color:#55789B; border-radius: 0rem;" onclick="#"></th>
										</tr>


										<tr>
											<td> LEE CHUL HAN </td>
											<td> 객실부서 </td>
											<td> 지배인 </td>
											<td> 010-1111-2222 </td>
											<th><input type="button" class="btn" value="선택하기 " style="background-color:#55789B; border-radius: 0rem;" onclick="#"></th>
										</tr>
									</table>
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