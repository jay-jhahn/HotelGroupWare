<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>


<body>
	<c:if test="${errMsg != null}">
		<script type="text/javascript">
			alert('${errMsg}');
			setTimeout(function(){
				history.back();
				}, 1000);
		</script>
	</c:if>
	<img alt="403 Error" src="${path}img/errorImg/403error.jpg" 
		style="width:100%; height:100%;">
</body>
</html>