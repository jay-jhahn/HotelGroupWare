<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			setTimeout(function() {
				alert('수정되었습니다.');
				window.location='hallList.al'; // 메인으로	
			}, 1000);
		</script>
	</c:if>
	s
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			setTimeout(function() {
				alert('다시 수정해주세요.');
				window.location='hallModify.al'; // 수정페이지로	
			}, 1000);
		</script>
	</c:if>
</body>
</html>