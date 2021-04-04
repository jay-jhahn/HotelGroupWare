<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<body>
	<!--    </div> -->
	<!-- ======= Main ======= -->

	<!-- <table>
      <tr>
         <td><a href="#1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;♡101~107</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td><a href="#2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;♡201~207</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td><a href="#3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;♡301~307</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td><a href="#4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;♡401~407</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td><a href="#5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;♡501~507</a></td>
      </tr>
   </table> -->

 	<div class="content">
 	<div align="center">
 		<a href="#1001"><button class="Btn">1001 ~ 1020</button></a>
 		<a href="#2001"><button class="Btn">2001 ~ 2020</button></a>
 		<a href="#3001"><button class="Btn">3001 ~ 3020</button></a>
 		<a href="#4001"><button class="Btn">4001 ~ 4020</button></a>
 		<a href="#5001"><button class="Btn">5001 ~ 5020</button></a>
 		<a href="#6001"><button class="Btn">6001 ~ 6020</button></a>
 	</div>
 	<br><br>
		<form style="padding-left: 2%; padding-right: 2%">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<c:set var="i" value="0" />
			<c:set var="j" value="10" />
			<div class="card">
			<div id="1001"><h4 style="margin-left: 7%"> 1001 ~ 1020</h4></div>
			<table style="margin: auto; width: 1500px; height: 400px">
				<c:forEach items="${list }" var="list">
				<c:if test="${fn:substring(list.roomNum,0,2) eq 10 }">
					<c:if test="${i%j == 0 }">
						<tr style="text-align: center">
					</c:if>
					<c:if test="${list.roomState eq '0'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="redFont">공실</b> <br> 
									</div><br><input type="button" value="변경" 
									onclick="roomStateChange('${list.roomNum }','${list.roomKind}','${list.roomPrice}')"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '1'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">체크인</b> <br> <a href="#"
									class="textDa" onclick="roomDetail(${list.roomNum })">체크인 정보 보기</a>
							</div> <br> <input type="button" value="변경" onclick="checkInRoomStateChange(${list.roomNum })"
							class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '2'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">청소중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '3'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">수리중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:if>
				</c:forEach>
			</table>
			</div>
			<br id="2001"><br>
			<div class="card">
			<div><h4 style="margin-left: 7%"> 2001 ~ 2020</h4></div>
			<table style="margin: auto; width: 1500px; height: 400px">
				<c:forEach items="${list }" var="list">
				<c:if test="${fn:substring(list.roomNum,0,2) eq 20 }">
					<c:if test="${i%j == 0 }">
						<tr style="text-align: center">
					</c:if>
					<c:if test="${list.roomState eq '0'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="redFont">공실</b> <br> 
									</div><br><input type="button" value="변경" 
									onclick="roomStateChange('${list.roomNum }','${list.roomKind}','${list.roomPrice}')"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '1'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">체크인</b> <br> <a href="#"
									class="textDa" onclick="roomDetail(${list.roomNum })">체크인 정보 보기</a>
							</div> <br> <input type="button" value="변경" onclick="checkInRoomStateChange(${list.roomNum })"
							class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '2'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">청소중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '3'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">수리중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:if>
				</c:forEach>
			</table>
			</div>
			
			<br id="3001"><br>
			<div class="card">
			<div><h4 style="margin-left: 7%"> 3001 ~ 3020</h4></div>
			<table style="margin: auto; width: 1500px; height: 400px">
				<c:forEach items="${list }" var="list">
				<c:if test="${fn:substring(list.roomNum,0,2) eq 30 }">
					<c:if test="${i%j == 0 }">
						<tr style="text-align: center">
					</c:if>
					<c:if test="${list.roomState eq '0'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="redFont">공실</b> <br> 
									</div><br><input type="button" value="변경" 
									onclick="roomStateChange('${list.roomNum }','${list.roomKind}','${list.roomPrice}')"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '1'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">체크인</b> <br> <a href="#"
									class="textDa" onclick="roomDetail(${list.roomNum })">체크인 정보 보기</a>
							</div> <br> <input type="button" value="변경" onclick="checkInRoomStateChange(${list.roomNum })"
							class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '2'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">청소중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '3'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">수리중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:if>
				</c:forEach>
			</table>
			</div>
			
			<br id="4001"><br>
			<div class="card">
			<div><h4 style="margin-left: 7%"> 4001 ~ 4020</h4></div>
			<table style="margin: auto; width: 1500px; height: 400px">
				<c:forEach items="${list }" var="list">
				<c:if test="${fn:substring(list.roomNum,0,2) eq 40 }">
					<c:if test="${i%j == 0 }">
						<tr style="text-align: center">
					</c:if>
					<c:if test="${list.roomState eq '0'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="redFont">공실</b> <br> 
									</div><br><input type="button" value="변경" 
									onclick="roomStateChange('${list.roomNum }','${list.roomKind}','${list.roomPrice}')"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '1'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">체크인</b> <br> <a href="#"
									class="textDa" onclick="roomDetail(${list.roomNum })">체크인 정보 보기</a>
							</div> <br> <input type="button" value="변경" onclick="checkInRoomStateChange(${list.roomNum })"
							class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '2'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">청소중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '3'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">수리중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:if>
				</c:forEach>
			</table>
			</div>
			
			<br id="5001"><br>
			<div class="card">
			<div><h4 style="margin-left: 7%"> 5001 ~ 5020</h4></div>
			<table style="margin: auto; width: 1500px; height: 400px">
				<c:forEach items="${list }" var="list">
				<c:if test="${fn:substring(list.roomNum,0,2) eq 50 }">
					<c:if test="${i%j == 0 }">
						<tr style="text-align: center">
					</c:if>
					<c:if test="${list.roomState eq '0'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="redFont">공실</b> <br> 
									</div><br><input type="button" value="변경" 
									onclick="roomStateChange('${list.roomNum }','${list.roomKind}','${list.roomPrice}')"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '1'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">체크인</b> <br> <a href="#"
									class="textDa" onclick="roomDetail(${list.roomNum })">체크인 정보 보기</a>
							</div> <br> <input type="button" value="변경" onclick="checkInRoomStateChange(${list.roomNum })"
							class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '2'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">청소중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '3'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">수리중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:if>
				</c:forEach>
			</table>
			</div>
			
			<br id="6001"><br>
			<div class="card">
			<div><h4 style="margin-left: 7%"> 6001 ~ 6010</h4></div>
			<table style="margin: auto; width: 1500px; height: 400px">
				<c:forEach items="${list }" var="list">
				<c:if test="${fn:substring(list.roomNum,0,2) eq 60 }">
					<c:if test="${i%j == 0 }">
						<tr style="text-align: center">
					</c:if>
					<c:if test="${list.roomState eq '0'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="redFont">공실</b> <br> 
									</div><br><input type="button" value="변경" 
									onclick="roomStateChange('${list.roomNum }','${list.roomKind}','${list.roomPrice}')"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '1'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">체크인</b> <br> <a href="#"
									class="textDa" onclick="roomDetail(${list.roomNum })">체크인 정보 보기</a>
							</div> <br> <input type="button" value="변경" onclick="checkInRoomStateChange(${list.roomNum })"
							class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '2'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">청소중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${list.roomState eq '3'.charAt(0) }">
						<td align="center"><div class="roomMainInput">
								<b class="fontCo">${list.roomNum }</b> <br> 
								<b class="fontCo">${list.roomKind }</b> <br><b
									class="backCo">수리중</b> <br> 
									</div> <br> <input type="button" value="변경" onclick="emptyGoRoomStateChange(${list.roomNum })"
									class="updateBtn" /></td>
					</c:if>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:if>
				</c:forEach>
			</table>
			</div>
		</form>
	</div> 



	<%-- <div class="content">
		<form style="padding-left: 3%; padding-right: 3%">
			<div class="card" style="width: 1000px; height: 200px">
				<table class="table">
					<tr>
						<c:forEach var="list" items="${list }">
							<c:if test="${fn:substring(list.roomNum,0,2) eq 10 }">
								<c:if test="${list.roomState eq '1'.charAt(0) }">
									<td style="width: 50px;"><div>
										<b class="fontCo">${list.roomNum }</b> <br>
										<b class="backCo">${list.roomState }</b> <br>
										<a href="#" class="textDa" onclick="roomDetail()">예약자 :이름</a></div><br>
										<input type="button" value="수정버튼" onclick="chekIn()"
											class="updateBtn" />
									</td>
								</c:if>
								<c:if test="${list.roomState eq '0'.charAt(0) || list.roomState eq '0'.charAt(0) }">
									<td align="center" style="width: 100px;"><div class="roomMainInput">
										<b class="fontCo">${list.roomNum }</b> <br>
										<b class="backCo">${list.roomState }</b> <br>
										<a href="#" class="textDa" onclick="roomDetail()">예약자 : 없음</a></div><br>
										<input type="button" value="수정버튼" onclick="chekIn()"
											class="updateBtn" />
									</td>
								</c:if>
							</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>
					
			<br><br>
					
			<div class="card">
				<table class="table">
					<tr>
						<c:forEach var="list" items="${list }">
							<c:if test="${fn:substring(list.roomNum,0,2) eq 20 }">
								<c:if test="${list.roomState eq '1'.charAt(0) }">
									<td align="center"><div class="roomMainInput">
										<b class="fontCo">${list.roomNum }</b> <br>
										<b class="backCo">${list.roomState }</b> <br>
										<a href="#" class="textDa" onclick="roomDetail()">예약자 :이름</a></div><br>
										<input type="button" value="수정버튼" onclick="chekIn()"
											class="updateBtn" />
									</td>
								</c:if>
								<c:if test="${list.roomState eq '0'.charAt(0) }">
									<td align="center"><div class="roomMainInput">
										<b class="fontCo">${list.roomNum }</b> <br>
										<b class="backCo">${list.roomState }</b> <br>
										<a href="#" class="textDa" onclick="roomDetail()">예약자 : 없음</a></div><br>
										<input type="button" value="수정버튼" onclick="chekIn()"
											class="updateBtn" />
									</td>
								</c:if>
							</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>


		</form>
	</div> --%>


	<!-- ======= Footer ======= -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>