<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="/hms/resources/ui/" />
<link type="text/css" rel="stylesheet" href="${path}css/style.css">
<script src="${path}js/myscript.js"></script>
<html>
<body onload="confirmIdFocus();">
	<form action="confirmId.al" method="post" name="confirmform" onsubmit="return confirmIdCheck();">
		<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
		<c:if test="${selectCnt == 1}">
			<table>
				<tr style="text-align: center;">
					<th colspan="2">
						<span>${id}</span>는 사용할 수 없습니다.
					</th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input class="input" type="text" name="id" maxlength="20"
							style="width:150px;" autofocus required>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="확인">
						<input class="inputButton" type="reset" value="취소" onclick="self.close();">
					</th>
				</tr>
			</table>	
		</c:if>	
		<c:if test="${selectCnt == 0}">
			<table>
				<tr  style="text-align: center;">
					<th align="center">
						<span>${id}</span>는 사용가능한 아이디입니다.
					</th>			
				</tr>
				
				<tr>
					<td align="center">
						<input class="inputButton" type="button" value="확인" onclick="setId('${id}');">
					</td>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>