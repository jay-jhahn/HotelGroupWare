<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<body>
<div class="wrapper">
   <!-- ====== Side Menu ===== -->
   <jsp:include page="${jspPath}common/sideMenu/office.jsp" flush="false" />
   
   <div class="main-panel" id="main-panel">
      <!-- ======= Header ======= -->
      <jsp:include page="${jspPath}common/header.jsp" flush="false" />
      
      <div class="content">

            <div class="d-flex">
               <div class="mr-auto p-2"><h3> 급여명세서 목록</h3></div>
               <div class="p-2">백오피스 > 급여관리 > 급여명세서 목록</div>
            </div>
            
            <!-- ====== Card ===== -->
            <div class="row">
            <div class="col-md-12">
               <div class="card cardPadding">
                   <div class="card-header">
                       <h4 class="card-title"></h4>
                   </div>
                       
					<div class="card-body">
						<form action="selectPayEmp.ad" method="post">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="d-flex">
                              <div class="p-2" style="width: 200px">
                             	 <c:if test="${pmtDate == null}">
                                 	<input type="month" class="form-control" name="pmtDate">
                                 </c:if>
                                 <c:if test="${pmtDate != null}">
                                 	<input type="month" class="form-control" name="pmtDate" value="${pmtDate}">
                                 </c:if>
                              </div>
                              <div class="p-2" style="width: 70px">
                                 <input type="submit" class="btn input" value="확인" style="margin:0; height:32.39px; padding: 5px 22px">
                              </div>
                           </div>
                         
                            <!-- 직원리스트 -->
                            <div class="table-responsive" style="padding: 10px;">
                                <div class="stroll" style="width:40%; height:750px; overflow:auto; float:left;">
                                   <legend>직원 목록</legend>
                                   <table class="table table-bordered">
                                   
                                      <tr class="text-center backgray">
                                         <th><input type="checkbox" name="checkbox" onclick="selectAll(this)"></th>
                                              <th>No</th>
                                              <th>성명</th>
                                              <th>부서</th>
                                              <th>직위</th>
                                      </tr>
                                      
                                      <c:forEach var="vo" items="${list}" varStatus="status">
                                      <input type="hidden" name="empCode" class="empCode" value="${vo.empCode}">
                                      <input type="hidden" name="pmtDate" class="pmtDate" value="${vo.pmtDate}">
                                      <tr>
                                         <td class="text-center"><input type="checkbox" name="checkbox" class="pmtCode" value="${vo.pmtCode}"></td>
                                         <td><a class="nav-link" data-toggle="tab" onclick="payMgtDetail('${vo.empCode}','${vo.pmtDate}');">${vo.empCode}</a></td> <!-- NO -->
                                         <td>${vo.empName}</td> <!-- 성명 -->
                                         <td>${vo.deptName}</td> <!-- 부서 -->
                                         <td>${vo.levelName}</td> <!-- 직위 -->
                                      </tr>
                                      </c:forEach>
                                      
                                   </table>
                                </div>
                                
                                <div class="stroll" style="width:5%; height:750px; overflow:auto; float:left;">
                                </div>
                                
                                <div class="stroll2" id="payMgtDetail" style="width:55%; height:750px; overflow:auto; float:left;">
                                   <!-- 급여명세 상세 조회 부분 -->
                                   <div id="result" style="padding-top: 43px"></div>
                                </div>
                             </div>
                             
                             <!-- 직원 이름 클릭시 버튼 나타나도록 하기, 수정 누른 경우 직원코드 들고 수정페이지로 이동, 전송누른 경우 해당화면 이메일 전송 -->
                             <div class="text-center">
                                <input type="submit" class="btn input" style="background-color: #55789B;" value="수정" formaction="payMgtLUpdate.ad">
                                <input type="submit" class="btn input" style="background-color: #516375;" value="전송">
                             </div>
                         </div>
					</form>
				</div>
            </div>
            </div><!-- ====== Card ===== -->
           

      </div>
   </div> <!-- close main-panel -->
</div> <!-- close wrapper -->
   <!-- ======= Footer ======= -->
   <jsp:include page="${jspPath}common/footer.jsp" flush="false" />

</body>
<script type="text/javascript">
function payMgtDetail(code1,code2) {
	var param="&${_csrf.parameterName}=${_csrf.token}&empCode=" + code1 + "&pmtDate=" + code2;
	$.ajax({
		url: 'payMgtDetail.ad',	
		type: 'POST',
		data: param,
		success: function(data){	
			$('#result').html(data);
			$('#payMgtDetail').attr('style', "display:'';");  //나타내기
		},
		error: function(){
			alert('오류');
		}
	});
};
</script>
</html>