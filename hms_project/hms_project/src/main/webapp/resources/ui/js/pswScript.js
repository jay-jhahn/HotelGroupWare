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
