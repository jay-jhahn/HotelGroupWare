/*
 * 설예진 자바스크립트
 */
// room 자바스크립트
function chekIn(){
   
   var url = "checkIn.al";
   window.open(url, "checkIn", "menubar=no, width=700, height=600");
}

function checkInExit(){
   window.close();
}

function roomDetail(){
   var url = "roomDetail.al";
   window.open(url, "roomDetail", "menubar=no, width=700, height=600");
}

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
