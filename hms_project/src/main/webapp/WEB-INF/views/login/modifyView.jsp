<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<script src="${path}js/script.js"></script>
<body onload="modifyMemberFocus();">
	<%@ include file="../common/header.jsp" %>
	<div class="container my-4">
		<div class="JoinLoGo">
			<a href="main.al"><img src="${path}img/anabolicLogo.png"></a>
		</div>
		<section class="register-form mx-auto">
			<form action="modifyAction.me" name="modifyform" class="joinForm text-center border border-dark p-5" 
				onsubmit="return modifyCheck();">
				<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
				
				<p class="h4 mb-4">회원정보 수정</p>
				
				<!-- id -->
				<input type="text" name="id" class="form-control mb-4" value="${vo.memId}" readonly>&nbsp;
				
				<!-- pwd -->
				<input type="password" name="pwd" class="form-control" placeholder="Password"
					aria-describedby="joinformPwdHelpBlock">
				<small id="joinformPwdHelpBlock" class="form-text text-muted mb-2"> 
					8자 이상, 특수문자, 영대소문자 포함
				</small>
				
				<!-- confirm pwd -->
				<input type="password" name="repwd" class="form-control" placeholder="Password Confirm"
					aria-describedby="joinformPwdConfirmHelpBlock">
				<small id="joinformPwdConfirmHelpBlock" class="form-text text-muted mb-2"> 
					비밀번호를 확인하세요.
				</small>

				<!-- name -->
				<input type="text" name="name" class="form-control mb-4" placeholder="Name" value="${vo.memName}">
				
				<!-- jumin -->
				<c:if test="${vo.getMemJumin() == null}">				
					<input type="text" name="jumin1" class="form-control-jumin mb-4" 
						onkeyup="nextModiJumin1();" placeholder="주민번호 " maxlength="6">&nbsp;-&nbsp;&nbsp;
					<input type="password" name="jumin2" class="form-control-jumin mb-4" 
						onkeyup="nextModiJumin2();" maxlength="7">
				</c:if>
				
				<c:if test="${vo.getMemJumin() != null}">
					<c:set var="jumin" value="${fn:split(vo.getMemJumin(), '-')}"/>
				
					<input type="text" name="jumin1" class="form-control-jumin mb-4" 
						onkeyup="nextModiJumin1();" placeholder="주민번호 " maxlength="6" value="${jumin[0]}">&nbsp;-&nbsp;&nbsp;
					<input type="password" name="jumin2" class="form-control-jumin mb-4" 
						onkeyup="nextModiJumin2();" maxlength="7" value="${jumin[1]}"> 
				</c:if>
				
				<!-- phone -->
				<c:if test="${vo.getMemPhone()==null}">
					<input type="text" name="phone1" class="form-control-three mb-4" 
						onkeyup="nextModiHp1();" placeholder="Phone" maxlength="3">&nbsp;-&nbsp;
					<input type="text" name="phone2" class="form-control-three mb-4" 
						onkeyup="nextModiHp2();" maxlength="4">&nbsp;-&nbsp;
					<input type="text" name="phone3" class="form-control-three mb-4" 
						onkeyup="nextModiHp3();" maxlength="4">
				</c:if> 
				
				<c:if test="${vo.getMemPhone()!=null}">
					<c:set var="phone" value="${fn:split(vo.getMemPhone(), '-')}"></c:set>
					<input type="text" name="phone1" class="form-control-three mb-4" 
						onkeyup="nextModiHp1();" placeholder="Phone" maxlength="3" value="${phone[0]}">&nbsp;-&nbsp;
					<input type="text" name="phone2" class="form-control-three mb-4" 
						onkeyup="nextModiHp2();" maxlength="4" value="${phone[1]}">&nbsp;-&nbsp;
					<input type="text" name="phone3" class="form-control-three mb-4" 
						onkeyup="nextModiHp3();" maxlength="4" value="${phone[2]}">
				</c:if> 
				
				<!-- email -->
				<c:if test="${vo.getMemEmail()==null}">
					<input type="text" name="email1" class="form-control-three mb-4" placeholder="E-mail">&nbsp;@&nbsp;
					<input type="text" name="email2" class="form-control-three mb-4">&nbsp;
					<select class="form-control-three" name="email3" onchange="selectModifyEmailChk();">
						<option value="0">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="gmail.com">구글</option>
						<option value="nate.com">네이트</option>
						<option value="daum.com">다음</option>
						<option value="kakao.com">카카오</option>
					</select>
				</c:if>
				<c:if test="${vo.getMemEmail()!=null}">
					<c:set var="email" value="${fn:split(vo.getMemEmail(), '@')}">
					</c:set>
					<input type="text" name="email1" class="form-control-three mb-4" value="${email[0]}">&nbsp;@&nbsp;
					<input type="text" name="email2" class="form-control-three mb-4" value="${email[1]}">&nbsp;
					<select class="form-control-three" name="email3" onchange="selectModifyEmailChk();">
						<option value="0">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="gmail.com">구글</option>
						<option value="nate.com">네이트</option>
						<option value="daum.com">다음</option>
						<option value="kakao.com">카카오</option>
					</select>
				</c:if>
				
				<input type="text" name="addr" class="form-control mb-4" value="${vo.getMemAddr()}"> 
				
				<input type="text" name="deAddr" class="form-control mb-4" value="${vo.getMemDeAddr()}">
				
				<input type="text" name="regDate" class="form-control mb-4" 
					value="<fmt:formatDate value='${vo.getRegDate()}' pattern='yyyy-MM-dd HH:mm' />" readonly>
	
				<input class="signupBtn mb-2" type="submit" name="signupBtn" value="수정완료">
			</form>	
		</section>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>