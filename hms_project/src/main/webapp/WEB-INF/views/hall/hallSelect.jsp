<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<body>
	<!-- ======= Main ======= -->
	<div class="wrapper ">
		<jsp:include page="${jspPath}common/sideMenu.jsp" flush="false" />
		<div class="main-panel" id="main-panel">
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			<div class="content">
				<form action="" method="post">
				
						<div>
							<label for="id"></label>
							<input type="text"  id="id" minlength="3"  maxlength="15" value="" >
							<!-- <small>3~15자 이내로 입력해주세여</small> -->
						</div>

						<div>
							<input type="button" value="상세내열 조회">
							<input type="button" value="예약 내역 삭제">
						</div>
					
				</form>
			</div>
		</div>
	</div>

	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>