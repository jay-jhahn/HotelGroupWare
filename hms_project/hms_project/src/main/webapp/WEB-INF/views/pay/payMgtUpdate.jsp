<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
	<div class="card-header">
		<h4 class="card-title">급여명세서 수정</h4>
	</div>
	
	<div class="card-body">
		<form>
		<div class="table-responsive">

			<table class="table">
				<tr>
					<td style="width: 5%;" />
					<td colspan="5">
						<div class="d-flex">
							<div class="p-2">
								<div class="form-group">
									<label for="empCode">직원코드</label> <input type="text"
										class="form-control" id="empCode" name="empCode" placeholder="코드">
								</div>
							</div>
							<div class="p-2">
								<div class="form-group">
									<label for="empName">직원명</label> <input type="text"
										class="form-control" id="empName" name="empName" placeholder="성명" readonly>
								</div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td style="width: 5%;" />

					<td><br> <br>
					<br>
						<div class="form-group">
							<label for="family">가족수</label> <input type="number"
								class="form-control" value="1" min="1" max="6" step="1"
								id="family" name="family">
						</div>
						<div class="form-group">
							<label for="bonus">상여금</label> <input
								type="number" class="form-control" value="0" min="0"
								max="1000000" step="5000" id="bonus" name="bonus">
						</div>
						<div class="form-group">
							<label for="etc">기타</label> <input
								type="number" class="form-control" value="0" min="0"
								max="1000000" step="5000" id="etc" name="etc">
						</div></td>

					<td style="width: 2.5%; border-right: 1px solid #dee2e6;" />
					<td style="width: 2.5%;" />

					<td><br> <br>
					<br>
						<div class="form-group">
							<label for="meals">식대</label> <input
								type="number" class="form-control" value="0" min="0"
								max="1000000" step="5000" id="meals" name="meals">
						</div>
						<div class="form-group">
							<label for="selfDrive">자가운전보조금</label> <input
								type="number" class="form-control" value="0" min="0"
								max="1000000" step="5000" id="selfDrive" name="selfDrive">
						</div>
						<div class="form-group">
							<label for="welfare">출산/보육수당</label> <input
								type="number" class="form-control" value="0" min="0"
								max="1000000" step="5000" id="welfare" name="welfare">
						</div></td>

					<td style="width: 5%;" />
				</tr>
			</table>

			<div class="text-center">
				<input type="submit" class="btn input"
					style="background-color: #55789B;" value="수정"> <input
					type="reset" class="btn input" style="background-color: #516375;"
					value="취소">
			</div>
			
		</div><!-- <div class="table-responsive"> -->
		</form>
	</div><!-- <div class="card-body"> -->
	
</body>
</html>