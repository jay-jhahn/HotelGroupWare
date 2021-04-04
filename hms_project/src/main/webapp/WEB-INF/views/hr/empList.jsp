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
					<select name="solting" id="solting" class="solting">
						<option value="#">정렬</option>
						<option value="empCode">사번</option>
						<option value="empName">성명</option>
						<option value="deptName">부서</option>
						<option value="levelName">직위</option>
						<option value="enterDate">입사날짜</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="searchWord">검색옵션</span> 
					<select name="searchKind" id="searchKind" class="searchKind">
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
	</div> <!-- close card-body -->
</body>
</html>