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
   
   <div>
<div class="content">
<form action="#" method="post">
<span class="numNb"><b>101호</b></span>
   <div class="card">
      <table class="table">
         <tr>
            <td><span class="nb">담당직원 : </span></td>
            <td><input type="text" name="empCode" class="input"></td>
         </tr>
         <tr>
            <td><span class="nb">고객명 : </span></td>
            <td><input type="text" name="empCode" class="input"></td>
         </tr>
         <tr>
            <td><span class="nb">연락처 : </span></td>
            <td><input type="text" name="empCode" class="input"></td>
         </tr>
         <tr>
            <td><span class="nb">이메일 : </span></td>
            <td><input type="text" name="empCode" class="input"></td>
         </tr>
         <tr>
            <td><span class="nb">예약 인원 : </span></td>
            <td><input type="number" name="resCount" class="input"></td>
         </tr>
         <tr>
            <td><span class="nb">예약 날짜 : </span></td>
            <td><input type="date" name="resDate" class="input"></td>
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
   <div align="center" >
         <input type="submit" value="확인" class="updateBtn">
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