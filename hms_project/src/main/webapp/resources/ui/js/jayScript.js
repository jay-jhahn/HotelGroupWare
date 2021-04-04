/**
 * 안재효 자바스크립트
 */
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
/* 사원명부 가져오는 AJAX */
function getEmpList(){
	$.ajax({
		url: 'empList.oa',	
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
		url: 'regEmpPage.oa',	
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
	const table = $('#famMemTbl');
	var i = table.find("tr").length;
	table.append("<tr><td> <input type='text' class='form-control' name='relation" + i + "' value=''> </td>"+
			"<td> <input type='text' class='form-control' name='faMemName" + i + "' value=''> </td>"+
			"<td> <input type='text' class='form-control' name='faMemAge" + i + "' value=''> </td>"+
			"<td> <input type='text' class='form-control' name='isLiveTogt" + i + "' value=''> </td></tr>");
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

/* 개인정보 상세 페이지 */
function empDetails(dept, level, duty, gender, state, payConStand) {
	$('#dept').val(dept).attr("selected", true);
	$('#level').val(level).attr("selected", true);
	$('#duty').val(duty).attr("selected", true);
	$('input:radio[name=gender]:input[value='+ gender +']').attr("checked", true);
	$('#empState').val(state).attr("selected", true);
	$('#payConStand').val(payConStand).attr("selecter", true);
}

/* 인사 정보 상세 페이지 가져오는 AJAX */
function empDetail(empCode) {
	$.ajax({
		url: 'empDetail.oa?empCode='+empCode,	
		type: 'GET',	
		dataType: 'html',	
		success: function(content){	
			$('.detailDiv').html(content);
		},
		error: function(){
			alert('오류');
		}
	});
}

/* 인사정보 상세 띄워주는 DIV */
function displayDetail(empCode) {
	empDetail(empCode);
	$('.detailDiv').show();
	location.href="#personalData";
}

/* 인사정보 상세 div 닫기 버튼 */
$('#closeMdfBtn').click(function(){
	$('.detailDiv').hide();
});

/* 인사정보 상세 div CSS 시작 */
/* 인사정보등록 페이지 이메일 select로 입력 */
function selectMdfEmailChk() {
	var form = document.modifyForm;
	if(form.empEmail3.value == '0'){
		form.empEmail2.value = "";
		form.empEmail2.focus();
	} else {
		form.empEmail2.value = form.empEmail3.value;
	}
}

function modifyChk(){
	var form = document.modifyForm;
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

/* 인사정보수정 페이지 수정버튼 클릭시 발생 이벤트 */
$("#mdfBtn").click(function(){
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
	$("#modifyForm").submit();
});

/* 부서별 사원 리스트 */
function getEmpListDept(empCode) {
	var dept = empCode.substr(0,2);
	$.ajax({
		url: 'getEmpListDept.or?deptCode=' + dept + '',	
		type: 'GET',	
		dataType: 'html',	
		success: function(content){	
			$('.ratingResult').html(content);
		},
		error: function(){
			alert('오류');
		}
	});
}

/* 인사고과 평가창 */
function goRating(deptCode, empCode) {
	var width = (window.innerWidth/2);
	var height = window.innerHeight;
	
	var _left = 300;
    var _top = 40; 
    
    window.open('goRating.or?deptCode='+ deptCode +'&empCode='+ empCode +'', '인사고과 평가하기', 'width='+ width +', height='+ height +', left='+ _left +', top='+ _top);
}

/* 인사고과 평가 결과 조회창 */
function goRatingResult(deptCode, empCode) {
	var width = (window.innerWidth/2);
	var height = window.innerHeight;
	
	var _left = 300;
    var _top = 40; 
    
    window.open('goRatResult.or?deptCode='+ deptCode +'&empCode='+ empCode +'', '인사고과 평가결과 조회', 'width='+ width +', height='+ height +', left='+ _left +', top='+ _top);
}

/* 점수가 변할때마다 실시간 평균 반영하기 */
function calAvg() {
	var tr = $('#ratTbl').find("tr");
	var trlen = tr.length;
	var score = 0;
	var sum = 0;
	
	for(var i=1;i<trlen-1;i++) {
		score = $('#score'+i+'').val();
		realScore = Number(score);
		sum += realScore;
	}
	var avg = sum/(trlen-2);
	$('.avg').val(avg.toFixed(1));
	$('.avg_section').text(avg.toFixed(1));
}

/* 인사고과 평가 점수 저장하기 전 수정할 수 있는 페이지에 점수 뿌려주기 */
function getScores() {
	$('#score1').val($('#scores1').val()).props("selected", true);
	$('#score2').val($('#scores2').val()).props("selected", true);
	$('#score3').val($('#scores3').val()).props("selected", true);
	$('#score4').val($('#scores4').val()).props("selected", true);
	$('#score5').val($('#scores5').val()).props("selected", true);
	$('#score6').val($('#scores6').val()).props("selected", true);
	$('#score7').val($('#scores7').val()).props("selected", true);
	$('#score8').val($('#scores8').val()).props("selected", true);
}




/* 인사고과 차트 가져오기 */
function drawChart() {
	$.ajax({
		url: 'chartData.or',
		type: 'GET',
		dataType: 'json',
		success: function(jsonData) {
			var ctx = document.getElementById("myChart").getContext('2d');
			var myChart = new Chart(ctx, {
				type: 'radar',
				data: {
					labels: ["달성도", "성실성", "노력도", "의사전달력", "신속성", "협동심", "고객응대", "책임감"],
					datasets: [{
						label: '인사고과 평가 차트',
						data: [5, 4.5, 3, 4, 4, 2.5, 3.5, 4.5],
						backgroundColor: [
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 159, 64, 0.2)'
							],
							borderColor: [
								'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)',
								'rgba(255, 159, 64, 1)',
								'rgba(255, 159, 64, 1)'
								],
								borderWidth: 1
					}]
				},
				options: {
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero:true
							}
						}]
					}
				}
			});
			
		}
	});
}













