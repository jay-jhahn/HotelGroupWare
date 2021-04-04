/*
 * 설예진 자바스크립트
 */


//=====================================================================================

// 체크인할때 값가지고 가기
function chechInInsert(roomNum, roomKind, roomPrice, empCode){
	var form = document.insertForm;
	var guestName = form.guestName.value;
	var guestPhone = form.guestPhone.value;
	var guestEmail01 = form.guestEmail01.value;
	var guestEmail02 = form.guestEmail02.value;
	var guestLevel = form.guestLevel.value;
	var checkIn = form.checkIn.value;
	var checkOut = form.checkOut.value;
	
	var form = document.insertForm;
	
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
	if(!form.guestEmail01.value){
		alert("이메일을 입력해주세요");
		form.guestEmail01.focus();
		return false;
	}
	if(!form.guestEmail02.value){
		alert("이메일 양식에 맞지 않습니다");
		form.guestEmail02.focus();
		return false;
	}
	if(!form.checkIn.value){
		alert("체크인 시간을 입력해주세요");
		form.checkIn.focus();
		return false;
	}
	if(!form.checkOut.value){
		alert("체크아웃 시간을 입력해주세요");
		form.checkOut.focus();
		return false;
	}
	var form = document.insertForm;
	var guestName = form.guestName.value;
	var guestPhone = form.guestPhone.value;
	var guestEmail01 = form.guestEmail01.value;
	var guestEmail02 = form.guestEmail02.value;
	var guestLevel = form.guestLevel.value;
	var checkIn = form.checkIn.value;
	var checkOut = form.checkOut.value;
	
	location.href="checkInInsert.ra?roomNum="+roomNum+"&roomKind="+roomKind+"&roomPrice="+roomPrice+"&empCode="+empCode+"&guestName="+guestName+"&guestPhone="+guestPhone+"&guestEmail01="+guestEmail01+"&guestEmail02="+guestEmail02+"&guestLevel="+guestLevel+"&checkIn="+checkIn+"&checkOut="+checkOut;
}

// 방 상태 변경창 오픈
function roomStateChange(roomNum, roomKind, roomPrice){

	var url = "emptyRoomStateChange.ra?roomNum="+roomNum+"&roomKind="+roomKind+"&roomPrice="+roomPrice;
	window.open(url, "stateChange", "menubar=no, width=1000, height=700");
}

// 체크인
function chekIn(roomNum, roomKind, roomPrice){
	location.href="checkIn.ra?roomNum="+roomNum+"&roomKind="+roomKind+"&roomPrice="+roomPrice;
}

// 수리중
function repair(roomNum){
	location.href="repair.ra?roomNum="+roomNum;
}

//청소중
function cleaning(roomNum){
	location.href="cleaning.ra?roomNum="+roomNum;
}

// 체크인 => 공	방
function checkInRoomStateChange(roomNum){
	location.href="checkInRoomStateChange.ra?roomNum="+roomNum;
}

// 공방으로
function emptyGoRoomStateChange(roomNum){
	location.href="emptyGoRoomStateChange.ra?roomNum="+roomNum;
}

// 창 끄기
function checkInExit(){
   window.close();
}

// 체크인인서트 체크
//function checkInCheck(){
//	var form = document.checkInInsert;
//	
//	if(!form.guestName.value){
//		alert("고객명을 입력해주세요");
//		form.guestName.focus();
//		return false;
//	}
//	if(!form.guestPhone.value){
//		alert("연락처를 입력해주세요");
//		form.guestPhone.focus();
//		return false;
//	}
//	if(!form.guestEmail01.value){
//		alert("이메일을 입력해주세요");
//		form.guestEmail01.focus();
//		return false;
//	}
//	if(!form.guestEmail02.value){
//		alert("이메일 양식에 맞지 않습니다");
//		form.guestEmail02.focus();
//		return false;
//	}
//	if(!form.checkIn.value){
//		alert("체크인 시간을 입력해주세요");
//		form.checkIn.focus();
//		return false;
//	}
//	if(!form.checkOut.value){
//		alert("체크아웃 시간을 입력해주세요");
//		form.checkOut.focus();
//		return false;
//	}
//
//	
//	
//}

//=====================================================================================

// 체크인 된 방 상세정보
function roomDetail(roomNum){
   
   var url = "roomDetail.ra?roomNum="+roomNum;
   window.open(url, "roomDetail", "menubar=no, width=700, height=600");
}

//=====================================================================================

// 방 리스트
function checkList(){
	$.ajax({
		// sendRequest(콜백함수명, url, method, params)
		url: "check.ra", // 전송 페이지 => 컨트롤러 "basic_next"
		type: 'GET', // 전송방식('GET', 'POST') - method
		dataType: 'text', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
		success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
			$('#result').html(data);
		},
		error: function(){
			alert('오류');
		}
	});
}

//=====================================================================================

//게시글 목록
function boardList(){
	$.ajax({
		// sendRequest(콜백함수명, url, method, params)
		url: "boardList.lo", // 전송 페이지 => 컨트롤러 "basic_next"
		type: 'GET', // 전송방식('GET', 'POST') - method
		dataType: 'html', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
		success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
			$('#result').html(data);
		},
		error: function(){
			alert('오류');
		}
	});
}

// 게시글 작성
function boardWrite(){
	$.ajax({
		// sendRequest(콜백함수명, url, method, params)
		url: "boardWrite.or", // 전송 페이지 => 컨트롤러 "basic_next"
		type: 'GET', // 전송방식('GET', 'POST') - method
		dataType: 'html', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
		success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
			$('#result').html(data);
		},
		error: function(){
			alert('오류');
		}
	});
}

//공통 메인
function mainCount(){
	$.ajax({
		// sendRequest(콜백함수명, url, method, params)
		url: "mainCount.lo", // 전송 페이지 => 컨트롤러 "basic_next"
		type: 'GET', // 전송방식('GET', 'POST') - method
		dataType: 'html', // 요청한 데이터 형식('html','xml','json','text','jsoup') - params?
		success: function(data){ // 콜백함수 - 전송에 성공했을 때의 결과가 data변수에 전달된다.
			$('#result').html(data);
		},
		error: function(){
			alert('오류');
		}
	});
}

//=====================================================================================
