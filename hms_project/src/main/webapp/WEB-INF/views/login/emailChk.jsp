<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test = "${insertCnt == 0}">	<!-- insert 실패 -->
	<script type="text/javascript">
		errorAlert("이메일 인증 실패 !!");
	</script>
</c:if>

<c:if test = "${insertCnt != 0 }">	<!-- insert 성공 -->
	<script type="text/javascript">
		alert("이메일 인증 성공!!");
		window.location = "loginPage.al";
	</script>
</c:if>
</body>
</html>