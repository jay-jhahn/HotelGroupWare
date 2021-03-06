<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!--    </div> -->
	<!-- ======= Main ======= -->
	<div style="background-color: #EBECF1">
		<!-- ======= Header ======= -->

		<header id="header">
			<div class="container">
				<div class="logo float-left">
					<h1 class="text-light">
						<a href="#"><span>HMS</span></a>
					</h1>
				</div>
			</div>
		</header>
		<!--End Header -->

		<div>
			<div class="content">
				<form action="checkInInsert.ra" name="insertForm" method="post">
<%-- 					<input type="hidden" name="roomNum" value="${roomNum }" > --%>
<%-- 					<input type="hidden" name="roomKind" value="${roomKind }" >  --%>
<%-- 					<input type="hidden" name="roomPrice" value="${roomPrice }">  --%>
<%-- 					<input type="hidden" name="empCode" value="${sessionScope.empCode }" > --%>
					
					<span class="numNb"><b>${roomNum }호</b></span>
					<div class="card">
						<table class="table">
							<tr>
								<td><span class="nb">담당직원 : </span></td>
								<td><input type="text" name="empCode" class="input"
									value="${sessionScope.empCode }" readonly></td>
							</tr>
							<tr>
								<td><span class="nb">고객명 : </span></td>
								<td><input type="text" name="guestName" class="input"></td>
							</tr>
							<tr>
								<td><span class="nb">연락처 : </span></td>
								<td><input type="text" name="guestPhone" class="input">
									예) 01012345678</td>
							</tr>
							<tr>
								<td><span class="nb">이메일 : </span></td>
								<td><input type="text" name="guestEmail01" class="input">
									@ <select name="guestEmail02">
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
										<option value="google.co.kr">구글</option>
										<option value="nate.com">네이트</option>
								</select></td>
							</tr>
							<tr>
								<td><span class="nb">고객 등급 : </span></td>
								<td><input type="text" class="input" placeholder="없음"
									readonly> <input type="hidden" name="guestLevel"
									value="0"></td>
							</tr>
							<tr>
								<td><span class="nb">체크인 : </span></td>
								<td><input type="time" name="checkIn" class="input"></td>
							</tr>
							<tr>
								<td><span class="nb">체크아웃 : </span></td>
								<td><input type="time" name="checkOut" class="input"></td>
							</tr>
						</table>
					</div>
					<div align="center">
						<input type="button" value="확인" class="updateBtn"
						onclick="chechInInsert('${roomNum }','${roomKind }','${roomPrice }','${sessionScope.empCode }')"> 
						<input type="button" value="취소" class="updateBtn" onclick="checkInExit()">
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- ======= Footer ======= -->


	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>