<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/setting.jsp" %>
	<script src="${path}js/script.js"></script>
</head>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			errorAlert(updateError);
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("회원정보가 수정되었습니다.");
				window.location="main.al";
			}, 500);
		</script>
	</c:if>
</body>
</html>