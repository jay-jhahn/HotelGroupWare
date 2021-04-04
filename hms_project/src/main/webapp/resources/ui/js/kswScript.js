/* 김석원 자바스크립트 */

// 팝업창
function hallStateChange(hallCode, hallName, price){

	var url = "emptyhallStateChange.al?hallCode="+hallCode+"&hallName="+hallName+"&price="+price;
	window.open(url, "stateChange", "menubar=no, width=1000, height=700");
}





// 연회장 리스트
function hallList(){
	$.ajax({
		// sendRequest(콜백함수명, url, method, params)
		url: "hallList.al", // 전송 페이지 => 컨트롤러 "basic_next"
		type: 'GET', // 전송방식('GET', 'POST') - method
		dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') -
							// params?
		success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
			$('#result').html(data);
		},
		error: function(){
			alert('오류');
		}
	});
}


// 체크시 시간 변화
function hallTimeChange(timecheck) {
	
	var url = "hallList.al?timecheck="+timecheck;
	 	location.href=url;	
}
		
// 눌렀을때 색변화
function hallStateChange(hallCode, hallName, price){	
	timecheck=$("input[name$='timecheck']" ).is(":checked");
		    
	if(timecheck==true) {
		$("timecheck").css('background-color', 'black');
	}

	var url = "emptyhallStateChange.al?hallCode="+hallCode+"&hallName="+hallName+"&price="+price;
	window.open(url, "stateChange", "menubar=no, width=1000, height=700");
	
}

// 연회장 예약
function chekIn(hallCode, hallName, price){
	location.href="hallInsert.al?hallCode="+hallCode+"&hallName="+hallName+"&price="+price;
}

// 예약 인서트 유효성 체크
function checkInCheck(){
	var form = document.checkInInsert;
	
	if(!form.guestName.value){
		alert("고객명을 입력해주세요");
		form.guestName.focus();
		return false;
	}
	
	if(!form.guestPhone.value){
		alert("연락처를 입력해주세요");
		form.guestPhone.focus();
		return false;
	}
	
	if(!form.eventTitle.value){
		alert("행사명을 입력해주세요");
		form.guestEmail01.focus();
		return false;
	}
	
	if(!form.eventDate.value){
		alert("날짜를 입력해주세요");
		form.guestEmail02.focus();
		return false;
	}
	
	if(!form.eventMenu.value){
		alert("음식을 선택해주세요");
		form.guestEmail02.focus();
		return false;
	}
	
	if(!form.resCount.value){
		alert("인원을 입력해주세요");
		form.guestEmail02.focus();
		return false;
	}
	
	if(!form.hallName.value){
		alert("인원을 입력해주세요");
		form.guestEmail02.focus();
		return false;
	}
	if(!form.price.value){
		alert("가격을 입력해주세요");
		form.guestEmail02.focus();
		return false;
	}
	
	if(!form.eventMenu1.value){
		alert("메뉴상세를 입력해주세요");
		form.guestEmail02.focus();
		return false;
	}
	
	if(!form.eventTableSet.value){
		alert("테이블 세팅을 입력해주세요");
		form.guestEmail02.focus();
		return false;
	}
	
}

