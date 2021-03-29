<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
<div class="wrapper">
	<!-- ====== Side Menu ===== -->
	<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" />
	
	<div class="main-panel" id="main-panel">
		<!-- ======= Header ======= -->
		<jsp:include page="${jspPath}common/header.jsp" flush="false" />
		
		<div class="content">
			<div>
				<div class="jumbotron">
					  <h1 class="display-3">비콘전송</h1>
					  <p class="lead">HMS 출퇴근용 비콘 </p>
					  <hr class="my-4">
					  <p>주의사항 : 한번 클릭시 재전송이 불가하니 신중히 클릭할것!</p>
					  <p class="lead">
					    <a class="btn btn-primary btn-lg" href="#" role="button">비콘전송</a>
					  </p>
				</div>
			</div>
		</div>
	</div> <!-- close main-panel -->
</div> <!-- close wrapper -->
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>