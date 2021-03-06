<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body onload="regiFocus();">
	<div class="card">
		<div class="card-header">
			<h4 class="card-title"> 인사정보등록 </h4>
		</div>

		<div class="card-body">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#personalData"> 인적사항 </a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#famHistory" onclick="return registerChk();"> 가족사항 </a></li>
			</ul>
			<form action="regEmpAction.oa?${_csrf.parameterName}=${_csrf.token}" method="post" name="regEmpForm" 
				id="regEmpForm"	enctype="multipart/form-data" >
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="personalData">
						<div class="perDataDiv mb-10 mt-10">
							<div class="perDataImg mt-10"> 
								<img id="image_section" alt="" src="http://placehold.it/300x400">
								<div class="filebox">
									<label for="empImg">증명사진</label>	
									<input type="file" id="empImg" name="empImg" accept="image/*" onchange="setThumbnail(event);">
								</div>
							</div>
							<div class="perDataSection">
								<table class="table table-bordered mb-10 mt-10 perDataTab">
									<tr>
										<th> 사원번호 </th>
										<td><input type="text" class="form-control" name="empCode" id="empCode" value="" readonly></td>
										<th><span class="redStar"> * </span> 성명  </th>
										<td><input type="text" class="form-control" name="empName" id="empName"></td>
									</tr>
	
									<tr>
										<th><span class="redStar"> * </span> 주민번호  </th>
										<td>
											<input type="text" class="form-control-jumin" id="empJumin1" name="empJumin1" maxlength="6">&nbsp;-&nbsp;
											<input type="password" class="form-control-jumin" id="empJumin2" name="empJumin2" maxlength="7">
										</td>
										<th> 성별  </th>
										<td>
											<input type="radio" value="male" id="male" name="gender">&nbsp;&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" value="female" id="female" name="gender">&nbsp;&nbsp;여자
										</td>
									</tr>
	
									<tr>
										<th><span class="redStar"> * </span> 생년월일 </th>
										<td><input type="date" class="form-control" name="empBirth" id="empBirth"></td>
										<th><span class="redStar"> * </span> 양력&nbsp;음력 </th>
										<td>
											<input type="radio" value="양력" name="solarOrLunar" checked>&nbsp;&nbsp;양력&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" value="음력" name="solarOrLunar">&nbsp;&nbsp;음력
										</td>
									</tr>
									
									<tr>
										<th> 자택전화</th>
										<td>  
											<input type="text" class="form-control3-phone" name="homePhone1" id="homePhone1" maxlength="3">&nbsp;-&nbsp;
											<input type="text" class="form-control3-phone" name="homePhone2" id="homePhone2" maxlength="4">&nbsp;-&nbsp;
											<input type="text" class="form-control3-phone" name="homePhone3" id="homePhone3" maxlength="4">
										</td>
										
										<th><span class="redStar"> * </span> 핸드폰 </th>
										<td> 
											<input type="text" class="form-control3-phone" name="empPhone1" id="empPhone1" maxlength="3">&nbsp;-&nbsp;
											<input type="text" class="form-control3-phone" name="empPhone2" id="empPhone2" maxlength="4">&nbsp;-&nbsp;
											<input type="text" class="form-control3-phone" name="empPhone3" id="empPhone3" maxlength="4">
										</td>
									</tr>
		
									<tr>
										<th><span class="redStar"> * </span> 이메일 </th>
										<td colspan="3">
											<input type="text" class="form-control2" name="empEmail1" placeholder="E-mail">&nbsp;@&nbsp;
											<input type="text" class="form-control2" name="empEmail2">&nbsp;
											<select name="empEmail3" class="select" onchange="selectRegEmailChk();">
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
											<input type="text" class="addrPostCode" name="postCode" id="postCode" placeholder="우편번호">
											<input type="button" class="searchPostBtn" onclick="daumPostcode()" value="우편번호 찾기">
											<input type="text" class="roadAddrInput" name="roadAddress" id="roadAddress" placeholder="도로명주소"><br>
											<input type="hidden" class="addr" name="jibunAddress" id="jibunAddress" placeholder="지번주소">
											<span id="guide" style="color:#999;display:none"></span>
											<input type="text" class="addr" name="detailAddress" id="detailAddress" placeholder="상세주소">
											<input type="text" class="addr" name="extraAddress" id="extraAddress" placeholder="참고항목">
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
									<td> <input type="date" class="form-control" name="enterDate" id="enterDate"> </td>
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
										<input type="checkbox" class="probationCheck" name="isProbation" value="Y">&nbsp;&nbsp;
										<input type="text" class="form-control-check" name="rate" id="rate" placeholder="%"> 
									</td>
									<th> 퇴사일자 </th>
									<td> <input type="date" class="form-control" name="resignDate" id="resignDate"> </td>
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
									<td colspan="5"> <textarea class="notes" name="notes" rows="4" cols="90"></textarea> </td>
								</tr>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="famHistory">
						<div class="perFamDataDiv">
							<div>
								<input type="hidden" class="num" value="2" >
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
										<tr>
											<td> <input type="text" class="form-control" name="relation1" value=""> </td>
											<td> <input type="text" class="form-control" name="faMemName1" value=""> </td>
											<td> <input type="text" class="form-control" name="faMemAge1" value=""> </td>
											<td> <input type="text" class="form-control" name="isLiveTogt1" value=""> </td>
										</tr>
								</table>
								<div class="faMemBtnDiv">
									<input type="reset" class="faMemBtn" value="초기화">
									<input type="button" class="faMemBtn" value="저장" id="sbmBtn">
								</div>
							</div>	
						</div>									
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="${path}js/jayScript.js"></script>
</html>