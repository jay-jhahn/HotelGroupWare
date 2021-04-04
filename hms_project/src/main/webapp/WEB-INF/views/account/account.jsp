<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', '총 매출액', '총 손실액', '순이익'],
          ['2014', 1000, 400, 200],
          ['2015', 1170, 460, 250],
          ['2016', 660, 1120, 300],
          ['2017', 1030, 540, 350],
          ['2018', 803, 320, 100],
          ['2014', 1000, 400, 200],
          ['2015', 1170, 460, 250],
          ['2016', 660, 1120, 300],
          ['2017', 1030, 540, 350],
          ['2018', 803, 320, 100],
          ['2017', 1030, 540, 350],
          ['2018', 803, 320, 100]
        ]);
	
        var options = {
          chart: {
            title: 'Hotel Groupware',
            subtitle: '2021년도 결산',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
</script>
<body>

<div class="wrapper">
	<!-- ====== Side Menu ===== -->
	<jsp:include page="${jspPath}common/sideMenu/office.jsp" flush="false" />
	
	<div class="main-panel" id="main-panel">
		<!-- ======= Header ======= -->
		<jsp:include page="${jspPath}common/header.jsp" flush="false" />
		
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active emplListTab" data-toggle="tab" onclick="window.location='account.ad'"> 결산목록조회 </a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab" onclick="window.location='accountByYMD.ad'"> 결산상세조회 </a></li>
					</ul>
					<div class="card result">
						
					<div class="content">
						<div>
							<div id="barchart_material" style="width: 900px; height: 500px;"></div>
						</div>
						<div><br></div>
						<div>
							<table class="table table-hover">
								  <thead>
								    <tr>
								      <th scope="col">날짜</th>
								      <th scope="col">객실</th>
								      <th scope="col">연회장</th>
								      <th scope="col">총매출액</th>
								      <th scope="col">손실</th>
								      <th scope="col">순이익</th>
								    </tr>
								  </thead>
								  <tbody>
									  <c:forEach var="vo" items="${list}">
										    <tr class="table-active">
										      <th scope="row">${vo.room_date}</th>
										      <td><fmt:formatNumber value="${vo.hall_account}" pattern="#,###"/>원</td>
										      <td><fmt:formatNumber value="${vo.room_account}" pattern="#,###"/>원</td>
										      <td><fmt:formatNumber value="${vo.hall_account + vo.room_account}" pattern="#,###"/>원</td>										      
										      <td><fmt:formatNumber value="${vo.pmt_account}" pattern="#,###"/>원</td>
										      <td><fmt:formatNumber value="${vo.hall_account + vo.room_account - vo.pmt_account}" pattern="#,###"/>원</td>										      
										    </tr>
								    	</c:forEach>
								    </tbody>
								</table>
							</div>
						</div>
					</div> <!-- close card -->
				</div> <!-- close row -->
			</div>
		</div>
	</div> <!-- close main-panel -->
</div> <!-- close wrapper -->
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>