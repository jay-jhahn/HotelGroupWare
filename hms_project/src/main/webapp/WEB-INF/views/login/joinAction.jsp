<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<script src="${path}js/myScript.js"></script>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("오류!");		
		</script>
	</c:if>
	<c:if test="${insertCnt != 0}">	
		<c:redirect url="main.al" />
	</c:if>
</body>
</html>