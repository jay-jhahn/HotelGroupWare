<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<body class="popUp" onload="drawChart();">
<c:if test="${updateCnt != null && ratingState eq 2}">
	<script type="text/javascript">
		alert("제출이 완료되었습니다.");
	</script>
</c:if>
<c:if test="${updateCnt != null && ratingState eq 3}">
	<script type="text/javascript">
		alert("결재가 완료되었습니다.");
	</script>
</c:if>
	<div class="ratingForm">
		<table class="table ratEmpInfo">
			<tr>
				<th colspan="4">피평가자</th>
				<th>날짜</th>
				<th>${rlVo.ratDate}</th>
				<th>등급</th>
			</tr>
			<tr>
				<th style="width: 10%;">사번</th>
				<td style="width: 20%;">${empVo.empCode}</td>
				<th style="width: 10%;">이름</th>
				<td style="width: 20%;">${empVo.empName}</td>
				<th style="width: 10%;">부서</th>
				<td style="width: 15%;">${empVo.deptVo.deptName}</td>
				<td style="width: 15%;">${rlVo.ratGrade}</td>
			</tr>
		</table>

		<table class="table ratingInfo" id="ratTbl">
			<tr>
				<th style="width: 20%;">평가항목</th>
				<th style="width: 15%;">점수</th>
				<th style="width: 75%;">능력 분포 그래프</th>
			</tr>
			<c:set var="j" value="1" />
			<c:forEach var="rspiList" items="${rspiList}">
				<tr>
					<th>${rspiList.ratItem}</th>
					<td>${rspiList.ratScore}</td>
					<c:if test="${j==1}">
						<td rowspan="9" class="chart_section">
							<canvas id="myChart" width="400" height="400">
								
							</canvas>
						</td>
					</c:if>
				</tr>
				<c:set var="j" value="${j+1}" />
			</c:forEach>
			<tr>
				<th>평균</th>
				<td class="avg_section">${rlVo.ratAvg}</td>
			</tr>
		</table>
		<c:if test="${empVo.ratingState eq 1}">
			<div class="ratSbmDiv">
				<input type="button" class="faMemBtn" value="제출" id="ratSbmBtn" onclick="location.href='updateState.or?empCode=${empVo.empCode}'">
			</div>
		</c:if>
		
		<c:if test="${empVo.ratingState eq 2}">
			<div class="ratSbmDiv">
				<input type="button" class="faMemBtn" value="결재승인" id="ratSbmBtn" onclick="location.href='updateState.or?empCode=${empVo.empCode}'">
			</div>
		</c:if>
	</div>
</body>
</html>