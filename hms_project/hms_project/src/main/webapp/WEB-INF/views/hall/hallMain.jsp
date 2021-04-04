<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<!-- ======= Main ======= -->
	<div class="wrapper ">
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />
		<div class="main-panel" id="main-panel">
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			<div class="content">
				<form action="" method="post">
					<div>
						<label>행사명</label> 
						<input type="text" value="" placeholder="">
						<label>전화번호</label>
						 <input type="text" value="">
					</div>
					<div>
						<label>행사일</label>
						 <input type="text" value=""> 
						 <label>예약자</label>
						<input type="text" value="">
					</div>
					<div>
						<label>행사시간</label> 
						<input type="text" value=""> 
						<label>행사 장소</label> 
						<input type="text" value="">
					</div>
					<div>
						<label>행사인원</label> 
						<input type="text" value=""> 
						<label>MENU명</label> 
						<input type="text" value="">
					</div>
					<div>
						<label>Menu</label> 
						<input type="text" value="">
					</div>
					<div>
						<label>TABLE SETTING</label>
						 <input type="text" value="">
					</div>
					<div>
						<label>특 약 사 항</label> 
						<input type="text" value="">
					</div>
					<div>
						<label>기 타 사 항</label> 
						<input type="text" value="">
					</div>
					<div>
						<label>테코레이션 케이크</label> 
						<input type="text" value="">
					</div>
					<div>
						<label>아이스 카빙</label> 
						<input type="text" value="">
					</div>
					<div>
						<label>플라워</label> 
						<input type="text" value="">
					</div>
					
					<div>
						<button type="submit" value="전송"></button>
						<button type="button" value="취소"></button>
						<button type="button" value="수정" onclick=""></button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>