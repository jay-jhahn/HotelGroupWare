<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<style>
  .stroll {
    width: 250px;
    height: 140px;
    overflow: auto;
  }
  .stroll::-webkit-scrollbar {
    width: 10px;
  }
  .stroll::-webkit-scrollbar-thumb {
    background-color: #A8B1BA;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .stroll::-webkit-scrollbar-track {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: inset 0px 0px 2px white;
  }
</style>
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
                   
                        <form>
                        <div class="card-body">
                            <div class="d-flex">
                              <div class="p-2">
                                 <select class="form-control custom-select" name="Date">
                                    <option selected>년-월</option>
                                    <option value="최근 날짜">최근 날짜</option>
                                       <option value="~">~</option>
                                       <option value="마지막 기한">마지막 기한</option>
                                 </select>
                              </div>
                           </div>
                            
                            <!-- 직원리스트 -->
                            <div class="table-responsive" style="padding: 10px;">
                                <div class="stroll" style="width:40%; height:750px; overflow:auto; float:left;">
                                   <p>직원 목록</p>
                                   <table class="table table-bordered">
                                      <tr class="text-center backgray">
                                         <th><input type="checkbox" name="checkbox" onclick="selectAll(this)"></th>
                                              <th>No</th>
                                              <th>성명</th>
                                              <th>부서</th>
                                              <th>직책</th>
                                      </tr>
                                      <tr>
                                         <td class="text-center"><input type="checkbox" name="checkbox" value="${vo.id}"></td>
                                               <td>회원코드</td> <!-- NO -->
                                               <td>홍길동</td> <!-- 성명 -->
                                               <td>프론트</td> <!-- 부서 -->
                                               <td>-</td> <!-- 직책 -->
                                      </tr>
                                   </table>
                                </div>
                                
                                <div class="stroll" style="width:5%; height:750px; overflow:auto; float:left;">
                                </div>
                                
                                <div class="stroll" style="width:55%; height:750px; overflow:auto; float:left;">
                                   <p>지급내용(과세)</p>
                                   <table class="table table-bordered">
                                      <tr class="text-center backgray">
                                         <th class="backgray">지급항목(과세)</th>
                                         <th>금액</th>
                                         <th class="backgray">지급항목(비과세)</th>
                                         <th>금액</th>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">급여</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                         <th class="backgray">식대</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">연장수당</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                         <th class="backgray">자가운전보조금</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">휴일수당</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                         <th class="backgray">출산/보육수당</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">상여금</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                         <th class="backgray">기타</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">지급합계</th>
                                         <td colspan="3"><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                   </table>
                                   
                                   <p>지급내용(과세)</p>
                                   <table class="table table-bordered">
                                      <tr class="text-center backgray">
                                         <th class="backgray">공제내용</th>
                                         <th class="backgray">금액</th>
                                         <th class="backgray">공제내용</th>
                                         <th class="backgray">금액</th>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">소득세</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                         <th class="backgray">고용보험</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">주민세</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                         <th class="backgray">국민연금</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">기타</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                         <th class="backgray">장기요양</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray"></th>
                                         <td></td>
                                         <th class="backgray">건강보험</th>
                                         <td><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                      <tr class="text-center">
                                         <th class="backgray">공제합계</th>
                                         <td colspan="3"><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                   </table>
                                   
                                   <table class="table table-bordered" style="font-size:14px;">
                                      <tr class="text-center">
                                         <th class="backgray">차감수령액</th>
                                         <td colspan="3"><fmt:formatNumber type="number" pattern="#,##0" value=""/>원</td>
                                      </tr>
                                   </table>
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
</html>