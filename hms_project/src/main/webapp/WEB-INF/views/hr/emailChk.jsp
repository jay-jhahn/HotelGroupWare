<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>    
<body>
<c:if test = "${updateCnt == 0}">	
	<script type="text/javascript">
		errorAlert("이메일 인증이 실패했습니다.");
	</script>
</c:if>

<c:if test = "${updateCnt != 0 }">	
	<script type="text/javascript">
		alert("이메일 인증이 완료되었습니다.\n비밀번호 변경 후 이용해주세요.");
		window.location = "main.al";
	</script>
</c:if>
</body>
</html>