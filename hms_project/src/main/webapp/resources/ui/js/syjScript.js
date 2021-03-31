/*
 * 설예진 자바스크립트
 */


//=====================================================================================
// 방 상태 변경창 오픈
function roomStateChange(roomNum){

	var url = "emptyRoomStateChange.al?roomNum="+roomNum;
	window.open(url, "stateChange", "menubar=no, width=700, height=600");
}

// 체크인
function chekIn(roomNum){
	location.href="checkIn.al?roomNum="+roomNum;
}

// 수리중
function repair(roomNum){
	location.href="repair.al?roomNum="+roomNum;
}

//청소중
function cleaning(roomNum){
	location.href="cleaning.al?roomNum="+roomNum;
}

// 창 끄기
function checkInExit(){
   window.close();
}

//=====================================================================================

// 체크인 된 방 상세정보
function roomDetail(){
   
   var url = "roomDetail.al";
   window.open(url, "roomDetail", "menubar=no, width=700, height=600");
}

//=====================================================================================

// 방 리스트
function checkList(){
	$.ajax({
		// sendRequest(콜백함수명, url, method, params)
		url: "check.al", // 전송 페이지 => 컨트롤러 "basic_next"
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
		url: "boardList.al", // 전송 페이지 => 컨트롤러 "basic_next"
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
		url: "boardList.al", // 전송 페이지 => 컨트롤러 "basic_next"
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
		url: "mainCount.al", // 전송 페이지 => 컨트롤러 "basic_next"
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
