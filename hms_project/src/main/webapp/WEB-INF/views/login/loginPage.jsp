<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<script src="${path}js/script.js"></script>
<body onload="idFocus();">

	<!-- ======= Header ======= -->
	<%@ include file="../common/header.jsp" %>
	
	<c:if test = "${errMsg != null}">
		<script type="text/javascript">
			alert("${errMsg}");
		</script>
	</c:if>
	
	<section style="height: 100vh;" class="login">
		<div>
			<div class="logoDiv">
				<a href="main.al"><img src="${path}img/anabolicLogo.png"></a>
			</div>
			<section>
				<form method="post" action="loginAction.al" name="loginform" onsubmit="return loginCheck();">
				<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
					<div class="loginBox">
						<div class="loginTitle">Login</div>
						<hr style="border: 1px solid #ccc;">
						<input class="intext" type="text" name="empCode" placeholder="User">
						<input class="intext" type="password" name="empPwd" placeholder="•••••"> 
						<input class="loginBtn mb-3" type="submit" name="loginBtn" value="LogIn">
						
						<a href="join.al" class="loginBottom"> JOIN </a>&nbsp;&nbsp;
						<a href="#" class="loginBottom"> forget ID/PW </a>
					</div>
				</form>
			</section>
			<br> 
			<span class="loginWelcome">Welcome To Anabolic</span> 
			<a href="join.al"><span class="loginToJoin">JOIN US</span></a>
			<a href="main.al"><span class="urlToMain">www.alwaysAnabolic.com</span></a>
		</div>
	</section>
	
	<!-- ======= Footer ======= -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>