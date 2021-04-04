<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
<c:if test="${errMsg!=null}">
	<script type="text/javascript">
		alert('${errMsg}');
		location.href="/hms/main.al";
	</script>
</c:if>
	<div class="card-header">
		<h4 class="card-title">사원명부(${deptName})</h4>
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
				</div>
				<div class="ml-auto" style="padding: 0px;">
					<input type="button" value="search" class="searchBtn" onClick="">
				</div>
			</div>
		</div>

		<table class="table table-bordered ratingTbl">
			<tr>
				<th style="width: 15%;">사번</th>
				<th style="width: 15%;">성명</th>
				<th style="width: 15%;">직위</th>
				<th style="width: 15%;">직책</th>
				<th style="width: 20%;">입사일자</th>
				<th style="width: 20%;">평가상태</th>
			</tr>
		
			<c:if test="${empList != null}">
				<c:forEach var="empList" items="${empList}">
					<tr>
						<td>${empList.empCode}</td>
						<td>${empList.empName}</td>
						<td>${empList.levelVo.levelName}</td>
						<td>${empList.dutyVo.dutyName}</td>
						<td>${empList.enterDate}</td>
						<c:if test="${empList.ratingState==0}">
							<td><input type="button" value="평가하기" class="ratingBtn" onclick="goRating('${deptCode}', '${empList.empCode}');"/></td>
						</c:if>
						<c:if test="${empList.ratingState==1}">
							<td><input type="button" value="제출대기" class="ratingBtn" onclick="goRatingResult('${deptCode}', '${empList.empCode}');"/></td>
						</c:if>
						<c:if test="${empList.ratingState==2}">
							<td><input type="button" value="결재대기" class="ratingBtn" onclick="goRatingResult('${deptCode}', '${empList.empCode}');"/></td>
						</c:if>
						<c:if test="${empList.ratingState==3}">
							<td><input type="button" value="평가완료" class="ratingBtn" onclick="goRatingResult('${deptCode}', '${empList.empCode}');"/></td>
						</c:if>
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