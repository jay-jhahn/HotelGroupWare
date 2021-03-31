/**
 * 안재효 자바스크립트
 */
var invalidIdError = "아이디가 존재하지 않습니다.\n확인 후 다시 시도하세요.";
var passwordError = "비밀번호가 일치하지 않습니다.\n확인 후 다시 시도하세요.";

/* 에러메시지 */
function errorAlert(errorMsg) {
	alert(errorMsg);
	window.history.back();	// 이전 페이지로 이동
}

/* 로그인 페이지 */
function idFocus() {
	document.loginform.memId.focus();
}

function loginCheck() {
	if(!document.loginform.memId.value) {
		alert("아이디를 입력하세요.");
		return false;
	}
	if(!document.loginform.memPwd.value) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
}

/* 인사정보 페이지 상위 탭 ajax 시작 */
/* 사원명부 */
function getEmpList(){
	$.ajax({
		url: 'empList.ad',	
		type: 'GET',	
		dataType: 'html',	
		success: function(content){	
			$('.result').html(content);
		},
		error: function(){
			alert('오류');
		}
	});
};

/* 인사정보 등록 페이지 */
function getInsertEmp() {
	$.ajax({
		url: 'regEmpPage.ad',	
		type: 'GET',	
		dataType: 'html',	
		success: function(content){	
			$('.result').html(content);
		},
		error: function(){
			alert('오류');
		}
	});
};
/* 인사정보 페이지 상위 탭 ajax 끝 */

/* 부서 선택하면 사원번호 생성 */
function makeEmpCode() {
	// 6자리 난수 생성
	var ranNum = Math.floor(Math.random() * 1000000)+100000;
	if(ranNum>1000000) {
		ranNum = ranNum - 100000;
	}
	// 사번 input 태그에 부서 약자 + 6자리 난수 자동 입력
	$("#empCode").val($("#dept").val() + ranNum);
}


/* 우편번호/도로명주소 검색 */
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

/* 증명사진 미리보기 */
function setThumbnail(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#image_section').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#empImg").change(function() {
	setThumbnail(this);
});

/* 인사정보등록 페이지 로드시 이름 input에 포커스 */
function regiFocus() {
	document.regEmpForm.empName.focus();
}

/* 인사정보등록 페이지 이메일 select로 입력 */
function selectRegEmailChk() {
	var form = document.regEmpForm;
	if(form.empEmail3.value == '0'){
		form.empEmail2.value = "";
		form.empEmail2.focus();
	} else {
		form.empEmail2.value = form.empEmail3.value;
	}
}

/* 인사정보등록 페이지 저장 버튼 클릭시 발생 이벤트 */
$("#sbmBtn").click(function(){
	var tr = $("#famMemTbl").find("tr"); // 가족구성원 테이블의 tr 
	var trlen = tr.length;		// 행의 갯수
	
	var famJson = new Object();		// 가족구성원 한명의 정보를 담을 JSON Object
	var famJsonArray = new Array();	// 가족구성원 모두의 정보를 담을 Array

	for(var i=1;i<trlen; i++){
		var relation = $("input[name='relation"+i+"']").val();
		var faMemName = $("input[name='faMemName"+i+"']").val();
		var faMemAge = $("input[name='faMemAge"+i+"']").val();
		var isLiveTogt = $("input[name='isLiveTogt"+i+"']").val();
		// JSON Object에 배열로 한명의 정보 담음
		famJson = {
				relation : relation,
				faMemName : faMemName,
				faMemAge : faMemAge,
				isLiveTogt : isLiveTogt
		};
		famJsonArray.push(famJson);
		var famJson = JSON.stringify(famJsonArray);
	}
	$(".femMemArr").val(famJson);
	$("#regEmpForm").submit();
});

function registerChk(){
	var form = document.regEmpForm;
	if(!form.empName.value) {
		alert("이름을 입력하세요.");
		form.empName.focus();
		return false;
	}
	if(!form.empJumin1.value) {
		alert("주민번호를 입력하세요.");
		form.empJumin1.focus();
		return false;
	}
	if(!form.empJumin2.value) {
		alert("주민번호를 입력하세요.");
		form.empJumin2.focus();
		return false;
	}
	if(!form.empBirth.value) {
		alert("생년월일을 입력하세요.");
		return false;
	}
	if(!form.empPhone1.value) {
		alert("핸드폰 번호를 입력하세요.");
		form.empPhone1.focus();
		return false;
	}
	if(!form.empPhone2.value) {
		alert("핸드폰 번호를 입력하세요.");
		form.empPhone2.focus();
		return false;
	}
	if(!form.empPhone3.value) {
		alert("핸드폰 번호를 입력하세요.");
		form.empPhone3.focus();
		return false;
	}
	if(!form.empEmail1.value) {
		alert("이메일 주소를 입력하세요.");
		form.empEmail1.focus();
		return false;
	}
	if(!form.empEmail2.value) {
		alert("이메일 주소를 입력하세요.");
		form.empEmail2.focus();
		return false;
	}
	if(!form.postCode.value) {
		alert("자택주소를 입력하세요.");
		return false;
	}
	if(!form.empCode.value) {
		alert("부서를 선택하세요.");
		form.dept.focus();
		return false;
	}
	if(!form.enterDate.value) {
		alert("입사일을 선택하세요.");
		return false;
	}
	if(!form.level.value) {
		alert("직위를 선택하세요.");
		return false;
	}
	return true;
};

/* 인사정보등록 페이지 수습여부 체크박스 */
function changeVal() {
	if($('.probationCheck').prop('checked')) {
		$('.probationCheck').val('Y');
	} else {
		$('.probationCheck').val('N');
	}
}

/* 가족사항 테이블 열 추가 */
function addRow() {
	var num = $('.num').val();
	var i = parseInt(num);
	
	const table = document.getElementById('famMemTbl');
	const newRow = table.insertRow();
	newRow.insertCell(0).innerHTML = "<td> <input type='text' class='form-control' name='relation" + i + "' value=''> </td>";
	newRow.insertCell(1).innerHTML = "<td> <input type='text' class='form-control' name='faMemName" + i + "' value=''> </td>";
	newRow.insertCell(2).innerHTML = "<td> <input type='text' class='form-control' name='faMemAge" + i + "' value=''> </td>";
	newRow.insertCell(3).innerHTML = "<td> <input type='text' class='form-control' name='isLiveTogt" + i + "' value=''> </td>";
	
	$('.num').val(i+1);
}

/* 인사정보등록 페이지 주민번호 쓰면 자동으로 생년월일, 성별 입력 */
$('#empJumin2').focusout(function(){
	var jumin2 = $('#empJumin2').val();
	var gender = jumin2.charAt(0);

	var jumin1 = $('#empJumin1').val();
	var year = jumin1.substring(0, 2);
	var mm = jumin1.substring(2, 4);
	var dd = jumin1.substring(4, 6);
	var fullYear = "";
	
	if(gender == '1' || gender == '3'){
		$('#male').attr('checked', true);
	} else if(gender=='2'||gender=='4'){
		$('#female').attr('checked', true);
	}
	
	if(gender == '1' || gender =='2') {
		fullYear = "19"+year;
		$('#empBirth').val(fullYear+"-"+mm+"-"+dd);
	} else if(gender == '3' || gender == '4') {
		fullYear = "20"+year;
		$('#empBirth').val(fullYear+"-"+mm+"-"+dd);
	}
});










function confirmId() {
	var form = document.joinform;
	// id값 미입력시
	if(!form.id.value) {
		alert("아이디를 입력하세요.");
		form.id.focus();
		return false;
	} 
	var url = "confirmId.al?id=" + form.id.value;
	window.open(url, "confirm", "menubar=no, width=300, height=150");
}

function setId(id) {
	opener.document.joinform.id.value = id;
	opener.document.joinform.hiddenId.value = 1;
	self.close();
}


function nextJumin1() {	// 주민번호 앞자리 6자리 입력받으면 주민번호 뒷자리로 focus 이동
	var form = document.joinform;
	if(form.jumin1.value.length >= 6) {
		form.jumin2.focus();
	}
}

function nextJumin2() {	// 주민번호 뒷자리 7자리 입력받으면 휴대폰번호 앞자리 focus 이동
	var form = document.joinform;
	if(form.jumin2.value.length >= 7) {
		form.phone1.focus();
	}
}

function nextHp1() {
	var form = document.joinform;
	if(form.phone1.value.length >= 3) {
		form.phone2.focus();
	}
}

function nextHp2() {
	var form = document.joinform;
	if(form.phone2.value.length >= 4) {
		form.phone3.focus();
	}
}

function nextHp3() {
	var form = document.joinform;
	if(form.phone3.value.length >= 4) {
		form.email1.focus();
	}
}


/* 마이페이지 이동 */
function pwdCheck() {
	var form = document.mypagePwdCheck;
	if(!form.pwd.value) {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
		return false;
	}
}

function pwdFocus() {
	document.mypagePwdCheck.pwd.focus();
}

/* 회원탈퇴 */
function dPwdCheck() {
	var form = document.deletePwdCheck;
	if(!form.pwd.value) {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
		return false;
	}
}

function deletePwdFocus() {
	document.deletePwdCheck.pwd.focus();
}

/* 회원정보 수정 */
function modifyPwdCheck() {
	var form = document.modifyMemberPwdCheck;
	if(!form.pwd.value) {
		alert("비밀번호를 입력해주세요.");
		form.pwd.focus();
		return false;
	}
}

function modifyPwdFocus() {
	document.modifyMemberPwdCheck.pwd.focus();
}

/* 회원정보 수정 */
function modifyMemberFocus() {
	document.modifyform.id.focus();
}

function selectModifyEmailChk() {
	var form = document.modifyform;
	
	if(form.email3.value == '0'){
		form.email2.value = "";
		form.email2.focus();
	} else {
		form.email2.value = form.email3.value;
	}
}

function modifyCheck() {
	var form = document.modifyform;
	
	if(!form.pwd.value){
		alert("비밀번호를 입력하세요.");
		form.pwd.focus();
		return false;
	} 
	if(!form.repwd.value){
		alert("비밀번호를 확인하세요.");
		form.repwd.focus();
		return false;
	} 
	if(form.pwd.value != form.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		form.repwd.focus();
		return false;
	} 
	if(!form.name.value){
		alert("이름을 입력하세요.");
		form.name.focus();
		return false;
	} 
	if(!form.jumin1.value){
		alert("주민번호를 입력하세요.");
		form.jumin1.focus();
		return false;
	} 
	if(!form.jumin2.value){
		alert("주민번호 뒷자리를 입력하세요.");
		form.jumin2.focus();
		return false;
	}
	if(!form.email1.value){
		alert("이메일을 입력하세요.");
		form.email1.focus();
		return false;
	} 
	if(!form.email2.value || form.email2.value == "0"){
		alert("이메일을 형식에 일치하지 않습니다.");
		form.email2.focus();
		return false;
	}
}

function nextModiJumin1() {	
	var form = document.modifyform;
	if(form.jumin1.value.length >= 6) {
		form.jumin2.focus();
	}
}

function nextModiJumin2() {	
	var form = document.modifyform;
	if(form.jumin2.value.length >= 7) {
		form.phone1.focus();
	}
}

function nextModiHp1() {
	var form = document.modifyform;
	if(form.phone1.value.length >= 3) {
		form.phone2.focus();
	}
}

function nextModiHp2() {
	var form = document.modifyform;
	if(form.phone2.value.length >= 4) {
		form.phone3.focus();
	}
}

function nextModiHp3() {
	var form = document.modifyform;
	if(form.phone3.value.length >= 4) {
		form.email1.focus();
	}
}

/* 게시글 작성 비밀글 여부 체크박스 체크 */
$(function isSecret(){
	$('input[type="checkbox"][id="isSecret"]').change(function(){
		if(this.checked){
			$("#pwd").attr('disabled', false);
			$("#isSecret").val('Y');
		} 
		if(!this.checked) {
			$("#pwd").attr('disabled', true);
			$("#pwd").val('');
			$("#isSecret").val('N');
		}
	});
});

