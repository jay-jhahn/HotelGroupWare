/*--------------------------------------------------------------
# 상원 SCRIPT
--------------------------------------------------------------*/
/* 급여명세서 페이지 상위 탭 ajax */
/* 급여명세서 입력 페이지 */
function payMgtInsert(){
	$.ajax({
		url: 'payMgtInsert.ad',	
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

/* 급여명세서 수정 페이지 */
function payMgtUpdate() {
	$.ajax({
		url: 'payMgtUpdate.ad',	
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


function iSabunChange() {

	$.ajax({
		url: 'selectISabun.ad?empCode=' + document.getElementById("empCode").value,	
		type: 'GET',
		datatype: 'json',
		success: function(rest){
			$('#empName').val(rest);
		},
		error: function(){
			alert('오류');
		}
	});

	$.ajax({
		url: 'selectIBonus.ad?empCode=' + document.getElementById("empCode").value,	
		type: 'GET',
		datatype: 'json',
		success: function(rest){
			var d = 0;
			d=rest
			$('#bonus').val(d);
		},
		error: function(){
			alert('오류');
		}
	});
}
function uSabunChange() {

	$.ajax({
		url: 'selectUSabun.ad?empCode=' + document.getElementById("empCode").value,	
		type: 'GET',
		datatype: 'json',
		success: function(rest){
			$('#empName').val(rest);
		},
		error: function(){
			alert('오류');
		}
	});

	$.ajax({
		url: 'selectUBonus.ad?empCode=' + document.getElementById("empCode").value,	
		type: 'GET',
		datatype: 'json',
		success: function(rest){
			var d = 0;
			d=rest
			$('#bonus').val(d);
		},
		error: function(){
			alert('오류');
		}
	});
}

function selectAll(selectAll)  {
	const checkboxes 
		= document.getElementsByName('checkbox');
  
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}



