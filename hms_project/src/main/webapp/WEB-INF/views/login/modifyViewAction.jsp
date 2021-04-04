<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<script src="${path}js/script.js"></script>
<body onload="modifyPwdFocus();">
	<%@ include file="../common/header.jsp" %>
	<section style="height: 100vh;" class="goMyPage">
		<div>
			<div class="logoDiv">
				<a href="main.al"><img src="${path}img/anabolicLogo.png"></a>
			</div>
			<section>
				<form method="post" action="modifyMemViewAction.me" name="modifyMemberPwdCheck" 
					onsubmit="return modifyPwdCheck();">
					<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
					<div class="loginBox">
						<div class="loginTitle">회원정보 수정</div>
						<hr style="border: 1px solid #ccc;">
						<h3>회원정보 수정</h3>
						<input type="hidden" name="id" value="${sessionScope.memberId}">
						<input class="intext" type="password" name="pwd" placeholder="•••••"> <br><br>
						<input class="modifyBtn" type="submit" name="loginBtn" value="회원정보 수정">
						<input class="modifyBtn" type="reset" value="취소" onclick="window.history.back();">
					</div>
				</form>
			</section>
		</div>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>