<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<div class="card-header">
		<h4 class="card-title">사원명부</h4>
	</div>

	<div class="card-body">
		<div class="searchDiv">
			<div class="d-flex">
				<div class="p-2">
					<span class="searchWord">검색옵션</span> <select name="searchKind" id="searchKind" class="searchKind">
						<option value="empCode">사원번호</option>
						<option value="empName">성명</option>
						<option value="dept">부서명</option>
						<option value="duty">직책</option>
					</select>
				</div>
				<div class="p-2">
					<input type="text" class="searchInput" name="searchKeyword" id="searchKeyword"> 
					<input type="checkbox" value="empState" class="check"><span class="include">퇴직자포함</span>
				</div>
				<div class="ml-auto" style="padding: 0px;">
					<input type="button" value="search" class="searchBtn" onClick="">
				</div>
			</div>
		</div>

		<div class="empListDiv">
			<table class="table table-bordered empListTbl">
				<tr>
					<th style="width: 5%;">사번</th>
					<th style="width: 10%;">성명</th>
					<th style="width: 10%;">직책</th>
					<th style="width: 10%;">부서</th>
					<th style="width: 10%;">입사일자</th>
					<th style="width: 10%;">퇴사일자</th>
					<th style="width: 10%;">핸드폰</th>
					<th style="width: 15%;">E-MAIL</th>
					<th style="width: 20%;">주소</th>
				</tr>

				<c:if test="${empList != null}">
					<c:forEach var="list" items="${empList}">
						<tr>
							<td>${list.empCode}</td>
							<td>${list.empName}</td>
							<td>${list.duty.dutyName}</td>
							<td>${list.dept.deptName}</td>
							<td>${list.enterDate}</td>
							<td>${list.resignDate}</td>
							<td>${list.empPhone}</td>
							<td>${list.empEmail}</td>
							<td>${list.empAddr1}&nbsp;${list.empAddr2}&nbsp;${list.empAddr3}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empList == null}">
					<tr>
						<td colspan="9" class="noData">사원이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div> <!-- close card-body -->
</body>
</html>