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
					<a href="main.al"><span>HMS</span></a>
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
				<td>안재효</td>
			</tr>
			<tr>
				<td><span class="nb">고객명 : </span></td>
				<td>이철한</td>
			</tr>
			<tr>
				<td><span class="nb">연락처 : </span></td>
				<td>010-6243-3613</td>
			</tr>
			<tr>
				<td><span class="nb">이메일 : </span></td>
				<td>std06172@naver.com</td>
			</tr>
			<tr>
				<td><span class="nb">회원등급 : </span></td>
				<td>VVVIP></td>
			</tr>
			<tr>
				<td><span class="nb">예약 인원 : </span></td>
				<td>2명</td>
			</tr>
			<tr>
				<td><span class="nb">예약 날짜 : </span></td>
				<td>2021-03-22</td>
			</tr>
			<tr>
				<td><span class="nb">체크인 : </span></td>
				<td>11:00</td>
			</tr>
			<tr>
				<td><span class="nb">체크아웃 : </span></td>
				<td>16:00</td>
			</tr>
			<tr>
				<td><span class="nb">객실 종류 : </span></td>
				<td>스위트룸</td>
			</tr>
			<tr>
				<td><span class="nb">이용가격 : </span></td>
				<td>250.000</td>
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