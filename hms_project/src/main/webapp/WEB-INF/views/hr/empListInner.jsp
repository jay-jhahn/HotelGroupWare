<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<table class="table table-bordered empListTbl">
		<tr>
			<th style="width: 10%;">사번</th>
			<th style="width: 10%;">성명</th>
			<th style="width: 5%;">직위</th>
			<th style="width: 7%;">부서</th>
			<th style="width: 10%;">입사일자</th>
			<th style="width: 10%;">퇴사일자</th>
			<th style="width: 13%;">핸드폰</th>
			<th style="width: 15%;">E-MAIL</th>
			<th style="width: 20%;">주소</th>
		</tr>

		<c:if test="${empList != null}">
			<c:forEach var="empList" items="${empList}">
				<tr onclick="displayDetail('${empList.empCode}');">
					<td>${empList.empCode}</td>
					<td>${empList.empName}</td>
					<td>${empList.levelVo.levelName}</td>
					<td>${empList.deptVo.deptName}</td>
					<td>${empList.enterDate}</td>
					<td>${empList.resignDate}</td>
					<td>${empList.empPhone}</td>
					<td>${empList.empEmail}</td>
					<td>${empList.postCode}&nbsp;${empList.roadAddress}&nbsp;${empList.detailAddress}</td>
				</tr>
			</c:forEach>
			<div class="detailDiv" style="display: none;">
			</div>
		</c:if>
		<c:if test="${empList == null}">
			<tr>
				<td colspan="9" class="noData">사원이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
</body>
</html>