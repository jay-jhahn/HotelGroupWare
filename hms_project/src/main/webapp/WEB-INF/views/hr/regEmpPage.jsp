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
				<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#famHistory"> 가족사항 </a></li>
			</ul>
			<form action="regEmpAction.al?${_csrf.parameterName}=${_csrf.token}" method="post" name="regEmpForm" 
				id="regEmpForm"	enctype="multipart/form-data">
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="personalData">
						<div class="perDataDiv mb-10 mt-10">
							<div class="perDataImg mt-10"> 
								<img id="image_section" alt="" src="http://placehold.it/300x400">
								<div class="filebox">
									<label for="imgInput">증명사진</label>	
									<input type="file" id="imgInput" accept="image/*" onchange="setThumbnail(event);">
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
										<th> 영문성명  </th>
										<td><input type="text" class="form-control" name="empEngName" id="empEngName"></td>
										<th> 한자성명  </th>
										<td><input type="text" class="form-control" name="empChiName" id="empChiName"></td>
									</tr>
	
									<tr>
										<th><span class="redStar"> * </span> 주민번호  </th>
										<td><input type="text" class="form-control" name="empJumin" id="empJumin"></td>
										<th> 성별  </th>
										<td>
											<input type="radio" value="male" name="gender">&nbsp;&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" value="female" name="gender">&nbsp;&nbsp;여자
										</td>
									</tr>
	
									<tr>
										<th><span class="redStar"> * </span> 생년월일 </th>
										<td><input type="text" class="form-control" name="empBirth" id="empBirth"></td>
										<th><span class="redStar"> * </span> 양력&nbsp;음력 </th>
										<td>
											<input type="radio" value="solarCalendar" name="solarOrLunar">&nbsp;&nbsp;양력&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" value="lunarCalendar" name="solarOrLunar">&nbsp;&nbsp;음력
										</td>
									</tr>
	
									<tr>
										<th><span class="redStar"> * </span> 결혼유무 </th>
										<td>
											<input type="radio" value="married" name="isMarried">&nbsp;&nbsp;기혼&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" value="single" name="isMarried">&nbsp;&nbsp;미혼
										</td>
										<th> 결혼기념일 </th>
										<td><input type="text" class="form-control" name="weddingAnniv" id="weddingAnniv"></td>
									</tr>
	
								</table>
							</div>
						</div>
	
						<div class="perDataDiv2 mb-10">
							<table class="table table-bordered mb-10 mt-10 perDataTab">
								<tr>
									<th> 회사전화 </th>
									<td> 
										<input type="text" class="form-control3" name="comPhone1" id="comPhone1" maxlength="3">&nbsp;-&nbsp;
										<input type="text" class="form-control3" name="comPhone2" id="comPhone2" maxlength="4">&nbsp;-&nbsp;
										<input type="text" class="form-control3" name="comPhone3" id="comPhone3" maxlength="4"> 
									</td>
									<th> 자택전화</th>
									<td>  
										<input type="text" class="form-control3" name="homePhone1" id="homePhone1" maxlength="3">&nbsp;-&nbsp;
										<input type="text" class="form-control3" name="homePhone2" id="homePhone2" maxlength="4">&nbsp;-&nbsp;
										<input type="text" class="form-control3" name="homePhone3" id="homePhone3" maxlength="4">
									</td>
								</tr>
	
								<tr>
									<th><span class="redStar"> * </span> 핸드폰 </th>
									<td colspan="3"> 
										<input type="text" class="form-control3-phone" name="empPhone1" id="empPhone1" maxlength="3">&nbsp;-&nbsp;
										<input type="text" class="form-control3-phone" name="empPhone2" id="empPhone2" maxlength="4">&nbsp;-&nbsp;
										<input type="text" class="form-control3-phone" name="empPhone3" id="empPhone3" maxlength="4">
									</td>
								</tr>
	
								<tr>
									<th> 회사이메일 </th>
									<td colspan="3"> 
										<input type="text" class="form-control2" name="empComEmail1" placeholder="E-mail">&nbsp;@&nbsp;
										<input type="text" class="form-control2" name="empComEmail2" >&nbsp;
										<select name="empComEmail3" class="select" onchange="selectRegComEmailChk();">
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
									<th><span class="redStar"> * </span> 외부이메일 </th>
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
										<input type="text" class="addrPostCode" id="postCode" placeholder="우편번호">
										<input type="button" class="searchPostBtn" onclick="daumPostcode()" value="우편번호 찾기">
										<input type="text" class="roadAddrInput" id="roadAddress" placeholder="도로명주소"><br>
										<input type="hidden" class="addr" id="jibunAddress" placeholder="지번주소">
										<span id="guide" style="color:#999;display:none"></span>
										<input type="text" class="addr" id="detailAddress" placeholder="상세주소">
										<input type="text" class="addr" id="extraAddress" placeholder="참고항목">
									</td>
								</tr>
							</table>
						</div>
	
						<div class="perDataDiv mb-10">
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
									<td> <input type="text" class="form-control" name="payConStand" id="payConStand"> </td>
									<th> 입사일자 </th>
									<td> <input type="date" class="form-control" name="enterDate" id="enterDate"> </td>
								</tr>
	
								<tr>
									<th><span class="redStar"> * </span> 직급 </th>
									<td>
										<select name="level" class="select">
											<option value="#"> == 직급선택 == </option>
											<option value="0"> 인턴 </option>
											<option value="1"> 수습 </option>
											<option value="2"> 사원 </option>
											<option value="3"> 주임 </option>
											<option value="4"> 계장 </option>
											<option value="5"> 대리 </option>
											<option value="6"> 과장 </option>
											<option value="7"> 차장 </option>
											<option value="8"> 부장 </option>
										</select> 
									</td>
									<th> 수습여부/적용률 </th>
									<td> 
										<input type="checkbox" class="probationCheck" name="isProbation">&nbsp;&nbsp;
										<input type="text" class="form-control-check" name="rate" id="rate" placeholder="%"> 
									</td>
									<th> 퇴사일자 </th>
									<td> <input type="date" class="form-control" name="resignDate" id="resignDate"> </td>
								</tr>
	
								<tr>
									<th> 직위 </th>
									<td> <input type="text" class="form-control" name="levelCode" id="levelCode"> </td>
									<th> 재직구분 </th>
									<td> <input type="text" class="form-control" name="empState" id="empState"> </td>
									<th colspan="2"></th>
								</tr>
	
								<tr>
									<th> 비고 </th>
									<td colspan="5"> <textarea class="notes" rows="4" cols="90"></textarea> </td>
								</tr>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="famHistory">
						<div class="perFamDataDiv">
							<div>
								<div class="addMemberBtnDiv">
									<input type="button" class="addMemberBtn" value="十 구성원 추가" onclick="addRow();">
								</div>
								<table class="table table-bordered famMemTbl" id="famMemTbl">
									<tr>
										<th rowspan="10" class="famMemHead"> 가족관계 </th>
										<th> 관계 </th>
										<th> 성명 </th>
										<th> 나이 </th>
										<th> 동거여부 </th>
									</tr>
									
									<tr>
										<td> <input type="text" class="form-control" name="relation" id="relation1"> </td>
										<td> <input type="text" class="form-control" name="faMemName" id="faMemName1"> </td>
										<td> <input type="text" class="form-control" name="faMemAge" id="faMemAge1"> </td>
										<td> <input type="text" class="form-control" name="isLiveTogt" id="isLiveTogt1"> </td>
									</tr>
									
									<tr>
										<td> <input type="text" class="form-control" name="relation" id="relation2"> </td>
										<td> <input type="text" class="form-control" name="faMemName" id="faMemName2"> </td>
										<td> <input type="text" class="form-control" name="faMemAge" id="faMemAge2"> </td>
										<td> <input type="text" class="form-control" name="isLiveTogt" id="isLiveTogt2"> </td>
									</tr>
									
									<tr>
										<td> <input type="text" class="form-control" name="relation" id="relation3"> </td>
										<td> <input type="text" class="form-control" name="faMemName" id="faMemName3"> </td>
										<td> <input type="text" class="form-control" name="faMemAge" id="faMemAge3"> </td>
										<td> <input type="text" class="form-control" name="isLiveTogt" id="isLiveTogt3"> </td>
									</tr>
									
									<tr>
										<td> <input type="text" class="form-control" name="relation" id="relation4"> </td>
										<td> <input type="text" class="form-control" name="faMemName" id="faMemName4"> </td>
										<td> <input type="text" class="form-control" name="faMemAge" id="faMemAge4"> </td>
										<td> <input type="text" class="form-control" name="isLiveTogt" id="isLiveTogt4"> </td>
									</tr>
								</table>
								<div class="faMemBtnDiv">
									<input type="reset" class="faMemBtn" value="초기화">
									<input type="submit" class="faMemBtn" value="저장">
								</div>
							</div>	
						</div>									
					</div>
				</div>
			</form>
		</div>
	</div>
</body>

<script src="${path}js/myScript.js"></script>

</html>