<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<c:if test="">
		<script type="text/javascript">
			setTimeout(function() {
				alert('예약되었습니다.');
				window.location='hallMain'; // 메인으로	
			}, 1000);
		</script>
	</c:if>
	
	<c:if test="">
		<script type="text/javascript">
			setTimeout(function() {
				alert('다시 예약해주세요.');
				window.location='hallInsert'; // 수정페이지로	
			}, 1000);
		</script>
	</c:if>
</body>
</html>