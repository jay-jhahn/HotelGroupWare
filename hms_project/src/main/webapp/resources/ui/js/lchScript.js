/**
 *   이철한 자바스크립트 소스 
 */

/* 휴가신청 페이지에서 휴무타입 선택시 div요소 변하는 스크립트	*/
function holidayType(obj) {
	
	if($(obj).val() == 0) {
		$("#boxForm").empty();
	} else if($(obj).val() == 1) {
		$("#boxForm").load("dayOffTypeForm.al #form1");
	} else if ($(obj).val() == 2){
		$("#boxForm").load("dayOffTypeForm.al #form2");
	} else if($(obj).val()==3) {
		$("#boxForm").load("dayOffTypeForm.al #form3");
	}
	
}

/* 스케줄 조회 직원 조회하는 스크립트 */
function searchEmp(empName, selectCode) {
	
	var popUrl = "searchEmp.al?empName=" + empName + "&selectCode=" + selectCode;
	var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption); 
	
}

/* 직원조회하여 맞는 직원 선택하는 스크립트 */
function giveEmpInfo(selectCode) {

	alert("선택 되었습니다.");
	
	/* selectCode 페이지 이동시 사용 */
	if(selectCode==1) {
		// monthSchedule.al 페이지로 이동 
		opener.parent.location.replace("monthSchedule.al?empName=" + document.getElementById('empName').value + "&empCode=" + document.getElementById('empCode').value );
	} else if(selectCode ==2) {
		// insertSchedule.al 페이지로 이동 
		opener.parent.location.replace("insertSchedule.al?empName=" + document.getElementById('empName').value + "&empCode=" + document.getElementById('empCode').value );
	} else {
		// selectCode 가 불분명할 시 main.al 로 이동
		opener.parent.location.replace("main.al");
	}
	
	self.close();
}	














