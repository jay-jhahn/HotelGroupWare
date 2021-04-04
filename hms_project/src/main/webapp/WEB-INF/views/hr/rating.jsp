<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<body class="popUp" onload="drawChart();">
	<!-- 입력오류 -->
	<c:if test="${errMsg!=null}">
		<script type="text/javascript">
			alert('${errMsg}');
		</script>
	</c:if>
	
	<!-- 평가를 진행한 적이 없는 경우 -->
	<c:if test="${rspiList == null}">
		<form action="ratingAction.or" id="ratingForm" name="ratingForm" class="ratingForm">
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd"/></c:set>
			<input type="hidden" value="${today}" name="ratDate">
			<input type="hidden" name="avg" class="avg" value="">
			<input type="hidden" name="empCode" value="${empVo.empCode}">
			<div>
				<table class="table ratEmpInfo">
					<tr>
						<th colspan="4"> 피평가자 </th>
						<th> 날짜 </th>
						<th>${today}</th>
						<th> 등급 </th>
					</tr>
					<tr>
						<th style="width: 10%;"> 사번 </th>
						<td style="width: 20%;"> ${empVo.empCode} </td>
						<th style="width: 10%;"> 이름 </th>
						<td style="width: 20%;"> ${empVo.empName} </td>
						<th style="width: 10%;"> 부서 </th>
						<td style="width: 15%;"> ${empVo.deptVo.deptName} </td>
						<td style="width: 15%;"><div class="grade_section"></div></td>
					</tr>
				</table>
				
				<table class="table ratingInfo" id="ratTbl">
					<tr>
						<th style="width: 20%;"> 평가항목 </th>
						<th style="width: 15%;"> 점수 </th>
						<th style="width: 75%;"> 능력 분포 그래프 </th>
					</tr>
					<c:set var="i" value="1"/>	
					<c:forEach var="rtList" items="${rtList}">
						<tr>
							<th>${rtList.ratItem}</th>
							<td> 
								<select class="ratScore" id="score${i}" name="score${i}" onchange="calAvg();">
									<option value="0">점수</option>
									<option value="5">5</option>
									<option value="4.5">4.5</option>
									<option value="4">4</option>
									<option value="3.5">3.5</option>
									<option value="3">3</option>
									<option value="2.5">2.5</option>
									<option value="2">2</option>
									<option value="1.5">1.5</option>
									<option value="1">1</option>
								</select> 
							</td>
							<c:if test="${i==1}">
								<td rowspan="9" class="chart_section">
									<canvas id="myChart" width="400" height="400">
									</canvas>
								</td>
							</c:if>
						</tr>
						<c:set var="i" value="${i+1}"/>
					</c:forEach>
					<tr>
						<th> 평균 </th>
						<td class="avg_section">  </td>
					</tr>
				</table>
				<div class="ratSbmDiv">
					<input type="submit" class="faMemBtn" value="저장" id="ratSaveBtn">
					<input type="button" class="faMemBtn" value="제출" id="ratSbmBtn">
				</div>
			</div>
		</form>
	</c:if>
	
	<!-- 평가내용 수정일 경우 -->
	<c:if test="${rspiList != null}">
		<script type="text/javascript">
			getScores();
		</script>
		
		<form action="ratingMdfAction.or" id="ratingMdfForm" name="ratingMdfForm" class="ratingMdfForm">
			<c:set var="now" value="<%= new java.util.Date() %>"/>
			<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd"/></c:set>
			<input type="hidden" name="upDate" value="${today}" >
			<input type="hidden" name="ratDate" value="${rlVo.ratDate}" >
			<input type="hidden" name="avg" class="avg" value="">
			<input type="hidden" name="empCode" value="${empVo.empCode}">
			
			<c:set var="i" value="1" />
			<c:forEach var="rspiList" items="${rspiList}">
				<input type="hidden" name="scores${i}" id="scores${i}" class="scores" value="${rspiList.ratScore}" >
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
			
			<div>
				<table class="table ratEmpInfo">
					<tr>
						<th colspan="4"> 피평가자 </th>
						<th> 날짜 </th>
						<th>${rlVo.ratDate}</th>
						<th> 등급 </th>
					</tr>
					<tr>
						<th style="width: 10%;"> 사번 </th>
						<td style="width: 20%;"> ${empVo.empCode} </td>
						<th style="width: 10%;"> 이름 </th>
						<td style="width: 20%;"> ${empVo.empName} </td>
						<th style="width: 10%;"> 부서 </th>
						<td style="width: 15%;"> ${empVo.deptVo.deptName} </td>
						<td style="width: 15%;"> ${rlVo.ratGrade} </td>
					</tr>
				</table>
				
				<table class="table ratingInfo" id="ratTbl">
					<tr>
						<th style="width: 20%;"> 평가항목 </th>
						<th style="width: 15%;"> 점수 </th>
						<th style="width: 75%;"> 능력 분포 그래프 </th>
					</tr>
					<c:set var="i" value="1"/>	
					<c:forEach var="rtList" items="${rtList}">
						<tr>
							<th>${rtList.ratItem}</th>
							<td> 
								<select class="ratScore" id="score${i}" name="score${i}" onchange="calAvg();">
									<option value="0">점수</option>
									<option value="5">5</option>
									<option value="4.5">4.5</option>
									<option value="4">4</option>
									<option value="3.5">3.5</option>
									<option value="3">3</option>
									<option value="2.5">2.5</option>
									<option value="2">2</option>
									<option value="1.5">1.5</option>
									<option value="1">1</option>
								</select> 
							</td>
							<c:if test="${i==1}">
								<td rowspan="9" class="chart_section">
									<canvas id="myChart" width="400" height="400">
									</canvas>
								</td>
							</c:if>
						</tr>
						<c:set var="i" value="${i+1}"/>
					</c:forEach>
					<tr>
						<th> 평균 </th>
						<td class="avg_section">  </td>
					</tr>
				</table>
				<div class="ratSbmDiv">
					<input type="submit" class="faMemBtn" value="저장" id="ratSaveBtn">
					<input type="button" class="faMemBtn" value="제출" id="ratSbmBtn">
				</div>
			</div>
		</form>
	</c:if>
</body>
</html>