/**
 *   이철한 자바스크립트 소스 
 */

/* 휴가신청 페이지에서 휴무타입 선택시 div요소 변하는 스크립트	*/
function holidayType(obj) {
	
	if($(obj).val() == 0) {
		$("#boxForm").empty();
	} else if($(obj).val() == 1) {
		$("#boxForm").load("dayOffTypeForm.ra #form1");
	} else if ($(obj).val() == 2){
		$("#boxForm").load("dayOffTypeForm.ra #form2");
	} else if($(obj).val()==3) {
		$("#boxForm").load("dayOffTypeForm.ra #form3");
	}
	
}

/* 스케줄 조회 직원 조회하는 스크립트 */
function searchEmp(empName, selectCode) {
	
	var popUrl = "searchEmp.ra?empName=" + empName + "&selectCode=" + selectCode;
	var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption); 
	
}

/* 직원조회하여 맞는 직원 선택하는 스크립트 */
function giveEmpInfo(empCode, selectCode) {

	alert("선택 되었습니다.");
	
	/* selectCode 페이지 이동시 사용 */
	if(selectCode==1) {
		// monthSchedule.al 페이지로 이동 
		opener.parent.location.replace("monthSchedule.ra?empCode=" + empCode);
	} else if(selectCode ==2) {
		// insertSchedule.al 페이지로 이동 
		opener.parent.location.replace("insertSchedule.al?empCode="+ empCode);
	} else {
		// selectCode 가 불분명할 시 main.al 로 이동
		opener.parent.location.replace("main.al");
	}
	
	self.close();
}	

/* 휴무신청 유효성 검사 */
function reqDayOffChk() {
	
	alert(document.getElementById('selectOff').value);
	alert(document.getElementById('startDate'));
	
	if(document.getElementById('selectOff').value == 0 ) {
		alert('휴무타입을 선택해 주세요 ! ');
		return false;
	} else if ( document.getElementById('startDate') == "" ) {
		alert('시작일자를 선택해 주세요 !')
		return false;
	} else if (document.getElementById('endDate') == "" ) {
		alert('종료일자를 선택해 주세요 ! ')
		return false;
	}
	
	
}

/* 휴무 계산시 사용일 수 구해주기 위한 스크립트 */
function calculateDay() {
	
	var endDate = document.getElementById('endDate');
	var startDate = document.getElementById('startDate');
	
	
}

/* 휴가신청 페이지에서 서류 상태에 따라 나뉘어 주는  스크립트	*/
function holidayState(obj) {
	
	 if (obj == 0) {
		$("#holidayState").load("reqDayOff.ra #holidayState"); /* 진행중  */
	} else if (obj == 2){
		$("#holidayState").load("holidayStateForm.ra?state=2 #form2"); /* 반려함  */
	} else if (obj == 1){
		$("#holidayState").load("holidayStateForm.ra?state=1 #form3"); /* 완료함   */
	}
	
}

/* 관리자가 근무 입력시 확인하는 스크립트*/
function makeScdChk () {
	
	var scd = documnet.getElementsById('"workType"');
	
	for(var i=0; i<scd.length; i++){
		if(scd[i] == 0) {
			alert('입력하지 않은 근무 일이 있습니다 !')
			return false;
		}
		
	}
	
}



/* 근무 편성 자바스크립트 언제 표시안했는지 추가해주기 
function insertScd(){
	
	var workChecked = document.getElementsByTagName('workType');
	
	for(var i=0; i<workChecked.length; i++){
		if(workChecked[i] == 0 ) {
			alert('근무를 선택해주세요 ! ');
		}
	}
	
}

*/
























































