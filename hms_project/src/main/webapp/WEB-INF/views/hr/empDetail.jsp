<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
<script type="text/javascript">
	empDetails('${empVo.deptCode}', '${empVo.levelCode}', '${empVo.dutyCode}', '${empVo.gender}', '${empVo.empState}', '${empVo.payConStand}', '${empVo.isProbation}');
</script>
	<div class="detail-wrap">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#personalData"> 인적사항 </a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#famHistory" onclick="return modifyChk();"> 가족사항 </a></li>
		</ul>
		<form action="modifyAction.al?${_csrf.parameterName}=${_csrf.token}" method="post" name="modifyForm" 
			id="modifyForm"	enctype="multipart/form-data" >
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
			<div class="tab-content">
				<div class="tab-pane fade show active" id="personalData">
					<div class="perDataDiv mb-10 mt-10">
						<div class="perDataImg mt-10"> 
							<img id="image_section" alt="" src="http://placehold.it/300x400" src="">
							<div class="filebox">
								<label for="empImg">증명사진</label>	
								<input type="file" id="empImg" name="empImg" accept="image/*" onchange="setThumbnail(event);">
							</div>
						</div>
						<div class="perDataSection">
							<table class="table table-bordered mb-10 mt-10 perDataTab">
								<tr>
									<th> 사원번호 </th>
									<td><input type="text" class="form-control" name="empCode" id="empCode" value="${empVo.empCode}" readonly></td>
									<th><span class="redStar"> * </span> 성명  </th>
									<td><input type="text" class="form-control" name="empName" id="empName" value="${empVo.empName}"></td>
								</tr>
	
								<tr>
									<th><span class="redStar"> * </span> 주민번호  </th>
									<td>
										<input type="text" class="form-control-jumin" id="empJumin1" name="empJumin1" maxlength="6" value="${fn:split(empVo.empJumin,'-')[0]}">&nbsp;-&nbsp;
										<input type="password" class="form-control-jumin" id="empJumin2" name="empJumin2" maxlength="7" value="${fn:split(empVo.empJumin,'-')[1]}">
									</td>
									<th> 성별  </th>
									<td>
										<input type="radio" value="male" id="male" name="gender">&nbsp;&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" value="female" id="female" name="gender">&nbsp;&nbsp;여자
									</td>
								</tr>
	
								<tr>
									<th><span class="redStar"> * </span> 생년월일 </th>
									<td><input type="date" class="form-control" name="empBirth" id="empBirth" value="${empVo.empBirth}"></td>
									<th><span class="redStar"> * </span> 양력&nbsp;음력 </th>
									<td>
										<c:if test="${empVo.solarOrLunar == '양력'}">
											<input type="radio" value="양력" name="solarOrLunar" checked>&nbsp;&nbsp;양력&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" value="음력" name="solarOrLunar">&nbsp;&nbsp;음력
										</c:if>
										<c:if test="${empVo.solarOrLunar == '음력'}">
											<input type="radio" value="양력" name="solarOrLunar">&nbsp;&nbsp;양력&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" value="음력" name="solarOrLunar" checked>&nbsp;&nbsp;음력
										</c:if>
										
									</td>
								</tr>
								
								<tr>
									<th> 자택전화</th>
									<td>  
										<input type="text" class="form-control3-phone" name="homePhone1" id="homePhone1" maxlength="3" value="${fn:split(empVo.empHomePhone,'-')[0]}">&nbsp;-&nbsp;
										<input type="text" class="form-control3-phone" name="homePhone2" id="homePhone2" maxlength="4" value="${fn:split(empVo.empHomePhone,'-')[1]}">&nbsp;-&nbsp;
										<input type="text" class="form-control3-phone" name="homePhone3" id="homePhone3" maxlength="4" value="${fn:split(empVo.empHomePhone,'-')[2]}">
									</td>
									
									<th><span class="redStar"> * </span> 핸드폰 </th>
									<td> 
										<input type="text" class="form-control3-phone" name="empPhone1" id="empPhone1" maxlength="3" value="${fn:split(empVo.empPhone,'-')[0]}">&nbsp;-&nbsp;
										<input type="text" class="form-control3-phone" name="empPhone2" id="empPhone2" maxlength="4" value="${fn:split(empVo.empPhone,'-')[1]}">&nbsp;-&nbsp;
										<input type="text" class="form-control3-phone" name="empPhone3" id="empPhone3" maxlength="4" value="${fn:split(empVo.empPhone,'-')[2]}">
									</td>
								</tr>
	
								<tr>
									<th><span class="redStar"> * </span> 이메일 </th>
									<td colspan="3">
										<input type="text" class="form-control2" name="empEmail1" placeholder="E-mail" value="${fn:split(empVo.empEmail,'@')[0]}">&nbsp;@&nbsp;
										<input type="text" class="form-control2" name="empEmail2" value="${fn:split(empVo.empEmail,'@')[1]}">&nbsp;
										<select name="empEmail3" class="select" onchange="selectMdfEmailChk();">
											<option value="0"> 직접입력 </option>
											<option value="naver.com"> 네이버 </option>
											<option value="gmail.com"> 구글 </option>
											<option value="nate.com"> 네이트 </option>
											<option value="daum.com"> 다음 </option>
											<option value="kakao.com"> 카카오 </option>
										</select>
									</td>
								</tr>
	
								<tr>
									<th><span class="redStar"> * </span> 자택주소 </th>
									<td colspan="3"> 
										<input type="text" class="addrPostCode" name="postCode" id="postCode" placeholder="우편번호" value="${empVo.postCode}">
										<input type="button" class="searchPostBtn" onclick="daumPostcode()" value="우편번호 찾기">
										<input type="text" class="roadAddrInput" name="roadAddress" id="roadAddress" placeholder="도로명주소" value="${empVo.roadAddress}"><br>
										<input type="hidden" class="addr" name="jibunAddress" id="jibunAddress" placeholder="지번주소" value="${empVo.jibunAddress}">
										<span id="guide" style="color:#999;display:none"></span>
										<input type="text" class="addr" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${empVo.detailAddress}">
										<input type="text" class="addr" name="extraAddress" id="extraAddress" placeholder="참고항목" value="${empVo.extraAddress}">
									</td>
								</tr>
							</table>
						</div>
					</div>
	
					<div class="perDataDiv3 mb-10">
						<table class="table table-bordered mb-10 mt-10 perDataTab">
							<tr>
								<th><span class="redStar"> * </span> 부서 </th>
								<td>
									<select name="dept" id="dept" class="select" onchange="makeEmpCode();">
										<option value="#"> == 부서선택 == </option>
										<option value="RO"> 객실부 </option>
										<option value="OF"> 사무부 </option>
										<option value="FB"> 식음료 </option>
										<option value="CO"> 조리부 </option>
									</select> 
								</td>
								<th> 급여계약기준 </th>
								<td>
									<select name="payConStand" id="payConStand" class="select">
										<option value="#"> == 급여계약기준 == </option>
										<option value="연봉제"> 연봉제 </option>
										<option value="시급"> 시급 </option>
									</select> 
								</td>
								<th><span class="redStar"> * </span> 입사일자 </th>
								<td> <input type="date" class="form-control" name="enterDate" id="enterDate" value="${empVo.enterDate}"> </td>
							</tr>
	
							<tr>
								<th><span class="redStar"> * </span> 직위 </th>
								<td>
									<select name="level" id="level" class="select">
										<option value="#"> == 직위선택 == </option>
										<option value="1"> 인턴 </option>
										<option value="2"> 수습 </option>
										<option value="3"> 사원 </option>
										<option value="4"> 주임 </option>
										<option value="5"> 계장 </option>
										<option value="6"> 대리 </option>
										<option value="7"> 과장 </option>
										<option value="8"> 차장 </option>
										<option value="9"> 부장 </option>
									</select> 
								</td>
								<th> 수습여부/적용률 </th>
								<td> 
									<c:if test="${empVo.isProbation=='Y'}">
										<input type="checkbox" class="probationCheck" name="isProbation" value="Y" checked>&nbsp;&nbsp;
									</c:if>
									<c:if test="${empVo.isProbation=='N'}">
										<input type="checkbox" class="probationCheck" name="isProbation" value="N">&nbsp;&nbsp;
									</c:if>
									<input type="text" class="form-control-check" name="rate" id="rate" placeholder="%" value="${empVo.rate}"> 
								</td>
								<th> 퇴사일자 </th>
								<td> 
									<c:if test="${empVo.resignDate != null}">
										<input type="date" class="form-control" name="resignDate" id="resignDate" value="${empVo.resignDate}">
									</c:if>
									<c:if test="${empVo.resignDate == null}">
										<input type="date" class="form-control" name="resignDate" id="resignDate">
									</c:if> 
								</td>
							</tr>
	
							<tr>
								<th> 직책 </th>
								<td>
									<select name="duty" id="duty" class="select">
										<option value="#"> == 직책선택 == </option>
										<option value="NONE"> 없음 </option>
										<option value="EMP"> 사원 </option>
										<option value="MNG"> 매니저 </option>
										<option value="SMNG"> 시니어 매니저 </option>
										<option value="GM"> 총지배인 </option>
									</select> 
								</td>
								<th> 재직구분 </th>
								<td>
									<select name="empState" id="empState" class="select">
										<option value="#"> == 재직구분 == </option>
										<option value="1"> 재직 </option>
										<option value="2"> 휴직 </option>
										<option value="0"> 퇴사 </option>
									</select> 
								</td>
								<th colspan="2"></th>
							</tr>
	
							<tr>
								<th> 비고 </th>
								<td colspan="5"> <textarea class="notes" name="notes" rows="4" cols="90" > ${empVo.empNotes} </textarea> </td>
							</tr>
						</table>
						<div class="faMemBtnDiv">
								<input type="button" class="faMemBtn" value="닫기" id="closeMdfBtn">
								<input type="button" class="faMemBtn" value="수정" id="mdfBtn">
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="famHistory">
					<div class="perFamDataDiv">
						<div>
							<div class="addMemberBtnDiv">
								<input type="button" class="addMemberBtn" value="十 구성원 추가" onclick="addRow();">
							</div>
							<input type="hidden" class="femMemArr" name="femMems" value="">
							<table class="table table-bordered famMemTbl" id="famMemTbl">
									<tr>
										<th rowspan="10" class="famMemHead"> 가족관계 </th>
										<th> 관계 </th>
										<th> 성명 </th>
										<th> 나이 </th>
										<th> 동거여부 </th>
									</tr>
									<c:forEach var="empFamMem" items="${empFamMemList}">
										<tr>
											<td> <input type="text" class="form-control" name="relation1" value="${empFamMem.relation}"> </td>
											<td> <input type="text" class="form-control" name="faMemName1" value="${empFamMem.faMemName}"> </td>
											<td> <input type="text" class="form-control" name="faMemAge1" value="${empFamMem.faMemAge}"> </td>
											<td> <input type="text" class="form-control" name="isLiveTogt1" value="${empFamMem.isLiveTogt}"> </td>
										</tr>
									</c:forEach>
							</table>
							<div class="faMemBtnDiv">
								<input type="button" class="faMemBtn" value="닫기" id="closeMdfBtn">
								<input type="button" class="faMemBtn" value="수정" id="mdfBtn">
							</div>
						</div>	
					</div>									
				</div>
			</div>
		</form>
	</div>
</body>
</html>