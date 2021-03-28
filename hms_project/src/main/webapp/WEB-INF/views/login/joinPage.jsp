<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>


<html>
<script src="${path}js/myScript.js"></script>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="../common/header.jsp" %>
	
	<div class="container my-4">
		<div class="JoinLoGo">
			<a href="main.al"><img src="${path}img/anabolicLogo.png"></a>
		</div>
		<section class="register-form mx-auto">
			<form action="joinAction.al" name="joinform" class="joinForm text-center border border-dark p-5">
				<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
				<p class="h4 mb-4">Sign up</p>
				
				<!-- memNo/memId/memPwd/memName/memJumin/memPhone/memEmail/memAddr/memDeAddr/regDate/isHost/leave -->
				<!-- Id -->
				<input type="text" name="id" class="form-control-id mb-4" placeholder="ID">&nbsp;
	
				<!-- Password -->
				<input type="password" name="pwd" class="form-control" placeholder="Password"
					aria-describedby="joinformPwdHelpBlock">
				<small id="joinformPwdHelpBlock" class="form-text text-muted mb-2"> 
					8자 이상, 특수문자, 영대소문자 포함
				</small>
				
				<!-- Name -->
				<input type="text" name="name" class="form-control mb-4" placeholder="Name">

				<!-- E-mail -->
				<input type="text" name="email1" class="form-control-three mb-4" placeholder="E-mail">&nbsp;@&nbsp;
				<input type="text" name="email2" class="form-control-three mb-4">&nbsp;
				<select class="form-control-three" name="email3" onchange="selectSignInEmailChk();">
					<option value="0">직접입력</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="nate.com">네이트</option>
					<option value="daum.com">다음</option>
					<option value="kakao.com">카카오</option>
				</select>
	
				<!-- Sign up button -->
				<input class="signupBtn mb-2" type="submit" name="signupBtn" value="Sign up">
				<hr>
			</form>	
		</section>
	</div>
	
	<!-- ======= Footer ======= -->
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>