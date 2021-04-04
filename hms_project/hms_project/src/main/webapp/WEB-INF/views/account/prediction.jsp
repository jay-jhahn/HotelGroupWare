<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawCurveTypes);

	function drawCurveTypes() {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', '전년 매출액');
      data.addColumn('number', '예상 매출액');

      data.addRows([
        [1, 0, 0],
        [2, 11, 3],
        [3, 30, 22],
        [4, 52, 44],
        [5, 60, 72],
        [6, 55, 77],
        [7, 62, 54],
        [8, 63, 55],
        [9, 72, 74],
        [10, 71, 63],
        [11, 64, 76],
        [12, 73, 56]
      ]);

      var options = {
        hAxis: {
          title: 'month'
        },
        series: {
          1: {curveType: 'function'}
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
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
			<nav class="navbar navbar-expand-lg" style="background-color: #516375;">
			  <a class="navbar-brand" align="center">매출 증감률 예측</a>
			</nav>
		<div class="content">
			<div>
				<div id="chart_div"></div>
			</div>
			<div><br></div>
			</div>
		</div>
	</div> <!-- close main-panel -->
</div> <!-- close wrapper -->
	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />
</body>
</html>