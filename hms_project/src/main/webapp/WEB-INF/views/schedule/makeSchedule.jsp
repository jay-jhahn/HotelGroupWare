<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<script src="${path}js/script.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ======= Main ======= -->
<div class="wrapper">
<jsp:include page="${jspPath}common/sideMenu/share.jsp" flush="false" /> 
<div class="main-panel" id="main-panel">
<jsp:include page="${jspPath}common/header.jsp" flush="false"/>
	
	<div class="content">
		
		<div class="row"> 
 			<div class="col-md-12"> 
 				<div class="card"> 
					<div class="card-header">
						<div class="card-body">
							<div> 
								<table class="table text-center"> 
								  <tr>
								  	<th > 근무 편성 </th>
								  </tr>
								
								  <tr>  										
									<td> 이름 </td> 
									<td><input type="text" class="animate__animated animate__fadeInUp form-control inputIdPwd mb-2" 
									style="width:130px;" name=""  placeholder="이름 값 받아오기" ></td>
									<td> 부서 </td>
									<td><input type="text" class="animate__animated animate__fadeInUp form-control inputIdPwd mb-2" 
									style="width:130px;" name=""  placeholder="부서 값 받아오기" > </td>
 								  </tr>
 								</table>
 							</div>
							<div class="table-responsive"> 
								 
 								<table class="table text-center"> 
 								
								  <tr>  										
									<th> 날짜 </th> 
									<th> 유형 </th>
									<th> REMARK </th> 
 								  </tr>
 								  
 								  <tr>
									<!-- 이벤트 일정 DB에서 값 가져와서 뿌려주기 (SELECT 한 DATE 기준) -->
									<td> <input type="text" name="scheduleDate"  value="2021-03-01"></td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									<td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								   <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-02" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-03" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-04" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-05" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-06" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-07" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-08" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-09" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-10" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-11" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-12" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3" ></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-13" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3" ></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-14" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3" ></textarea> </td>
 								  </tr>
 								  
 								   <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-15" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-15" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-16" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-17" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-18" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-19" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-20" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-21" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-22" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-23" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-15" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-24" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-25" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-26" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-26" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-27" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-28" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  
 								  <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-29" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								   <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-28" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								   <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-30" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								   <tr>
 								   	<td> <input type="text" name="scheduleDate"  value="2021-03-31" readonly> </td>
									<td> 
										<select name="">
											<option value=""> 근무선택 </option>
											<option value=""> 오전근무 </option>
											<option value=""> 오후근무  </option>
											<option value=""> 야간근무  </option>
											<option value=""> 휴무 </option>
										</select>	
									 </td>
									 <td><textarea name="" class="" cols="30" rows="3"></textarea> </td>
 								  </tr>
 								  
 								  <tr>
						        	<td colspan="3"><input type="button" class="btn" style="background-color:#55789B; border-radius: 0rem;" value="입력하기"></td>
 								  </tr>
 								</table> 
 							</div> 
 						</div> 
 					</div> 
				</div> 
 			</div> 
		</div>
	</div>
	
</div>
</div>
	<!-- ======= Footer ======= -->
  	<jsp:include page="${jspPath}common/footer.jsp" flush="false"/>
</body>
</html>