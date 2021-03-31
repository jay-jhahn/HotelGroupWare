<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<c:if test="">
		<script type="text/javascript">
			setTimeout(function() {
				alert('수정되었습니다.');
				window.location='hallMain'; // 메인으로	
			}, 1000);
		</script>
	</c:if>
	
	<c:if test="">
		<script type="text/javascript">
			setTimeout(function() {
				alert('다시 수정해주세요.');
				window.location='hallModify'; // 수정페이지로	
			}, 1000);
		</script>
	</c:if>
</body>
</html>