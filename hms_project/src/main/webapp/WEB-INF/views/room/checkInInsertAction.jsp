<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${insertCnt == 0}">
			<script type="text/javascript">
				alert("체크인 실패");
				location.href="check.ra";
			</script>
		</c:if>
		<c:if test="${insertCnt != 0}">	
			<script type="text/javascript">
				alert("체크인 성공");
				window.close();
				window.opener.checkList();
			</script>
		</c:if>
</body>
</html>