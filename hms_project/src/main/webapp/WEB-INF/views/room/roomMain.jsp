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
<div class="main-panel" id="main-panel">
<!-- ======= Header ======= -->
<%@ include file="../common/sideMenu/room.jsp"%>
<jsp:include page="${jspPath}common/header.jsp" flush="false" />

   <div id="result">
   
   </div>
   
</div>


  <!-- ======= Footer ======= -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>

  

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
