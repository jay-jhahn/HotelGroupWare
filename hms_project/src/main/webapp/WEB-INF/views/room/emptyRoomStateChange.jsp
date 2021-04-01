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
<form method="post">
   <div class="card">
      <table class="table">
         <tr align="center">
         	<td>
            	<input type="button" value="체크인" onclick="chekIn('${roomNum}','${roomKind }', '${roomPrice }')" class="updateBtn">
            </td>
         </tr>
         <tr align="center">
           	<td>
            	<input type="button" value="청소중" onclick="cleaning('${roomNum}')" class="updateBtn">
            </td>
         </tr>
         <tr align="center">
          	<td>
            	<input type="button" value="수리중" onclick="repair('${roomNum}')" class="updateBtn"> 
            </td>
         </tr>
        
      </table>
   </div>
  
</form>
</div>
</div>
</div>


  <!-- ======= Footer ======= -->
  

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>