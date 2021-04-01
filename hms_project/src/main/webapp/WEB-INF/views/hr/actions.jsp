<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<c:if test="${insertEmpCnt == 1&&insertFamCnt==1}">
		<script type="text/javascript">
			alert("계정이 생성되었습니다.");
			location.href="/hrInfo.ad";
		</script>
	</c:if>
	
	<c:if test="${insertEmpCnt != 1}">
		<script type="text/javascript">
			alert("개인사항 입력 오류");
			location.href="/hrInfo.ad";
		</script>
	</c:if>
	
	<c:if test="${insertFamCnt != 1}">
		<script type="text/javascript">
			alert("가족사항 입력 오류");
			location.href="/hrInfo.ad";
		</script>
	</c:if>
	
	<c:if test="${error != null}">
		<script type="text/javascript">
			alert(${error});
			location.href="/hrInfo.ad";
		</script>
	</c:if>
</body>
</html>