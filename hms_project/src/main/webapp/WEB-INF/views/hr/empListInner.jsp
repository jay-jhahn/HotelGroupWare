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
				<tr>
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
		</c:if>
		<c:if test="${empList == null}">
			<tr>
				<td colspan="9" class="noData">사원이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
	<div class="pages">
		<!-- 페이징 처리 -->
		<!-- 게시글이 있으면 -->
		<c:if test="${cnt > 0}">
			
			<!-- 처음[◀◀] / 이전블록[◀] -->
			<c:if test="${startPage > pageBlock}">
				<a href="getEmpList.ad">[◀◀]</a> <!-- 첫페이지로 이동 -->
				<a href="getEmpList.ad?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전'블록'으로 이동 -->
			</c:if>
			
			<!-- 블록내의 페이지 번호 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<strong><b>[${i}]</b></strong>
				</c:if>
				
				<c:if test="${i != currentPage}">
					<a href="getEmpList.ad?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<!-- 다음블록[▶] / 마지막[▶▶] -->
			<c:if test="${pageCount > endPage}">
				<a href="getEmpList.ad?pageNum=${startPage + pageBlock}">[▶]</a>
				<a href="getEmpList.ad?pageNum=${pageCount}">[▶▶]</a>
			</c:if>					
		</c:if>
		
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt == 0}">
			
		</c:if>
	</div>
</body>
</html>