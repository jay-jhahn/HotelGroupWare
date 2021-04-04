<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<body>
<table class="table table-bordered" style="height: 36px">
	<tr>
		<th class="backgray">지급일</th>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.pmtDate}"/></td>
		<th class="backgray">사번</th>
		<td>${vo.empCode}</td>
		<th class="backgray">사원명</th>
		<td>${vo.empName}</td>
	</tr>
</table>
<legend>지급항목</legend>
<table class="table table-bordered">
   <tr class="text-center backgray">
      <th class="backgray">지급항목(과세)</th>
      <th>금액</th>
      <th class="backgray">지급항목(비과세)</th>
      <th>금액</th>
   </tr>
   <tr class="text-center">
      <th class="backgray">급여</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.salary}"/>원</td>
      <th class="backgray">식대</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.meals}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray">연장수당</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.extension}"/>원</td>
      <th class="backgray">자가운전보조금</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.selfDrive}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray">휴일수당</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.holiday}"/>원</td>
      <th class="backgray">출산/보육수당</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.welfare}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray">상여금</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.bonus}"/>원</td>
      <th class="backgray">기타</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.etc}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray">지급합계</th>
      <td colspan="3"><fmt:formatNumber type="number" pattern="#,##0" value="${vo.totalPmt}"/>원</td>
   </tr>
</table>

<legend>공제항목</legend>
<table class="table table-bordered">
   <tr class="text-center backgray">
      <th class="backgray">공제내용</th>
      <th class="backgray">금액</th>
      <th class="backgray">공제내용</th>
      <th class="backgray">금액</th>
   </tr>
   <tr class="text-center">
      <th class="backgray">갑근세</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.payrollTx}"/>원</td>
      <th class="backgray">고용보험</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.employmentIns}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray">주민세</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.rsdtTx}"/>원</td>
      <th class="backgray">국민연금</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.nationalPension}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray"></th>
      <td></td>
      <th class="backgray">장기요양</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.longCareIns}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray"></th>
      <td></td>
      <th class="backgray">건강보험</th>
      <td><fmt:formatNumber type="number" pattern="#,##0" value="${vo.healthIns}"/>원</td>
   </tr>
   <tr class="text-center">
      <th class="backgray">공제합계</th>
      <td colspan="3"><fmt:formatNumber type="number" pattern="#,##0" value="${vo.totalDeduct}"/>원</td>
   </tr>
</table>

<table class="table table-bordered" style="font-size:14px;">
   <tr class="text-center">
      <th class="backgray">차감수령액</th>
      <td colspan="3"><fmt:formatNumber type="number" pattern="#,##0" value="${vo.ddctAmount}"/>원</td>
   </tr>
</table>
</body>
</html>