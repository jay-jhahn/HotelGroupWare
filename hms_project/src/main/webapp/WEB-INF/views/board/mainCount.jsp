<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<script type="text/javascript">
		function counter() {
			var dday = new Date(2021, 04, 30); //디데이
			setInterval(
					function() {
						var now = new Date(); //현재 날짜 가져오기
						var distance = dday.getTime() - now.getTime();
						var d = (Math.floor(distance / (1000 * 60 * 60 * 24)) * 1) - 30;
						var h = (Math.floor(distance / (1000 * 60 * 60) % 24));
						var m = (Math.floor(distance / (1000 * 60) % 60));
						var s = Math.floor((distance % (1000 * 60)) / 1000);
						if (s < 10) {
							s = '0' + s;
						}
						$('.content').html(
								+d + '일' + h + '시간' + m + '분' + s + '초')
					}, 1000);
		}
	</script>

	<div align="center">
		<br> <br> <br>
		<h4>월급날까지 ${cmd }</h4>
		<div class="content" style="font-size: 30px; color: red;">
			<script type="text/javascript">
				counter();
			</script>

			<!-- <script type="text/javascript">
                  var Dday = new Date(2021,03,26);   
                  var now = new Date();                    
            
                  var gap = Dday.getTime() - now.getTime();    
                  var result = (Math.floor(gap / (1000 * 60 * 60 * 24)) * 1) -30;   
                  var h = (Math.floor(gap / (1000 * 60 * 60) % 24));   
                  var m = (Math.floor(gap / (1000 * 60) % 60));   
            
            
                  document.write("월급날까지 " + result + " 일 남았습니다!" + h + "시간" + m + "분");  
               </script> -->
		</div>

		<h4>남았습니다!</h4>
	</div>
	<br>
	<br>
	<br>
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>