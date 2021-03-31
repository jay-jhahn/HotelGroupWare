<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<script src="${path}js/script.js"></script>
<body onload="deletePwdFocus();">
	<%@ include file="../common/header.jsp" %>
	<section style="height: 100vh;" class="goMyPage">
		<div>
			<div class="logoDiv">
				<a href="main.al"><img src="${path}img/anabolicLogo.png"></a>
			</div>
			<section>
				<form method="post" action="deleteMemberAction.me" name="deletePwdCheck" 
					onsubmit="return dPwdCheck();">
					<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
					<div class="loginBox">
						<div class="loginTitle">My Page</div>
						<hr style="border: 1px solid #ccc;">
						<h4>회원탈퇴</h4>
						<input type="hidden" name="id" value="${sessionScope.memberId}">
						<input class="intext" type="password" name="pwd" placeholder="•••••"> <br><br>
						<input class="modifyBtn" type="submit" name="loginBtn" value="회원탈퇴">
						<input class="modifyBtn" type="reset" value="취소" onclick="window.history.back();">
					</div>
				</form>
			</section>
		</div>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>