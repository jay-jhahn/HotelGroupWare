<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<script type="text/javascript">
		getEmpInnerList();
	</script>
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

		<div class="empListDiv">
			<!-- 사원리스트 출력될 곳 -->
		</div>
		
	</div> <!-- close card-body -->
</body>
</html>