<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<script src="${path}js/script.js"></script>
<head>
<meta charset="UTF-8">
<title> 휴무신청 처리 페이지 </title>
</head>
<body>
	
	<c:if test = "${insertCnt == 0}">
		<script type="text/javascript">
			alert('입력 오류 입니다');			
		</script>
	</c:if>

	<c:if test= "${insertCnt == 1}">
		<script type="text/javascript">
			alert('정상 신청 되었습니다 !');
			window.location.href="main.al";
		</script>
	</c:if>
	

</body>
</html>




