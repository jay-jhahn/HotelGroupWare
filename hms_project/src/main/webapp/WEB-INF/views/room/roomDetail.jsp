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
<!-- 	</div> -->
<!-- ======= Main ======= -->
<div style="background-color: #EBECF1" >
<!-- ======= Header ======= -->
<script src="${path}js/room.js"></script>

	<header id="header">
		<div class="container">
			<div class="logo float-left">
				<h1 class="text-light">
					<a href="#"><span>HMS</span></a>
				</h1>
			</div>
		</div>
	</header> <!--End Header -->
	
<div class="content">
<form action="#" method="post">
<span class="numNb"><b>101호</b></span>
	<div class="card">
		<table class="table">
			<tr>
				<td><span class="nb">담당직원 : </span></td>
				<td>${empName }</td>
			</tr>
			<tr>
				<td><span class="nb">고객명 : </span></td>
				<td>${guestName }</td>
			</tr>
			<tr>
				<td><span class="nb">연락처 : </span></td>
				<td>${guestPhone }</td>
			</tr>
			<tr>
				<td><span class="nb">이메일 : </span></td>
				<td>${guestEmail }</td>
			</tr>
			<tr>
				<td><span class="nb">회원등급 : </span></td>
				<c:if test="${guestLevel == '0'}">
					<td>골드</td>
				</c:if>
				<c:if test="${guestLevel == '1'}">
					<td>다이아</td>
				</c:if>
				<c:if test="${guestLevel == '2'}">
					<td>플래티넘</td>
				</c:if>
			</tr>
			<tr>
				<td><span class="nb">지금까지 이용 금액 : </span></td>
				<td>${guestUsePrice }</td>
			</tr>
			<tr>
				<td><span class="nb">이용 날짜 : </span></td>
				<td>${roomUseDate }</td>
			</tr>
			<tr>
				<td><span class="nb">체크인 : </span></td>
				<td>${checkIn }</td>
			</tr>
			<tr>
				<td><span class="nb">체크아웃 : </span></td>
				<td>${checkIn }</td>
			</tr>
		</table>
	</div>
	<div align="center" >
			<input type="button" value="취소" onclick="checkInExit()" style="background-color: #55789B; border: #55789B; color: #fff; height: 30px">
		</div>
</form>
</div>
</div>


  <!-- ======= Footer ======= -->
  

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>