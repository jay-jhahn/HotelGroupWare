<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<link  rel="stylesheet" href="${path}css/exchange/NewFile.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile2.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile3.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile4.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile5.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile6.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile7.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile8.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile9.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile10.css">
<link  rel="stylesheet" href="${path}css/exchange/NewFile11.css">
<body class="hana-body">
	<div class="wrapper">
		<jsp:include page="${jspPath}common/sideMenu/room.jsp" flush="false" />
		<div class="main-panel" id="main-panel">
			<jsp:include page="${jspPath}common/header.jsp" flush="false" />
			<div class="content">
				<div id="HANA_CONTENTS_DIV" data-ready="on">
					<div class="tradeSearchBox">
						<form id="inqFrm" name="inqFrm" action="#//HanaBank">
							<table class="tblForm"
								summary="통화선택,일자선택,고시회차(으)로 이루어진 현재환율 조회 테이블입니다.">
								<caption>현재환율 조회</caption>
								<colgroup>
									<col width="7%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="curCd">통화선택</label></th>
										<td class="selBox que"><select name="curCd" id="curCd"
											title="통화구분 선택하세요" onchange="" class="basicSelect exSel">
												<option value="">선택하세요</option>
												<option value="USD">USD:달러(미국)</option>
												<option value="EUR">EUR:유로(유럽연합)</option>
												<option value="JPY">JPY:100엔(일본)</option>
												<option value="CNY">CNY:위안(중국)</option>
												<option value="GBP">GBP:파운드(영국)</option>
												<option value="CAD">CAD:달러(캐나다)</option>
												<option value="CHF">CHF:프랑(스위스)</option>
												<option value="HKD">HKD:달러(홍콩)</option>
												<option value="SEK">SEK:크로나(스웨덴)</option>
												<option value="AUD">AUD:달러(호주)</option>
												<option value="AED">AED:디르함(UAE)</option>
												<option value="BDT">BDT:타카(방글라데시)</option>
												<option value="BHD">BHD:디나르(바레인)</option>
												<option value="BND">BND:달러(브루나이)</option>
												<option value="BRL">BRL:헤알(브라질)</option>
												<option value="CLP">CLP:페소(칠레)</option>
												<option value="COP">COP:페소(콜롬비아)</option>
												<option value="CZK">CZK:코루나(체코)</option>
												<option value="DKK">DKK:크로나(덴마크)</option>
												<option value="DZD">DZD:디나르(알제리)</option>
												<option value="EGP">EGP:파운드(이집트)</option>
												<option value="HUF">HUF:포린트(헝가리)</option>
												<option value="IDR">IDR:100루피아(인도네시아)</option>
												<option value="ILS">ILS:셰켈(이스라엘)</option>
												<option value="INR">INR:루피(인도)</option>
												<option value="JOD">JOD:디나르(요르단)</option>
												<option value="KES">KES:실링(케냐)</option>
												<option value="KWD">KWD:디나르(쿠웨이트)</option>
												<option value="KZT">KZT:텡게(카자흐스탄)</option>
												<option value="LKR">LKR:루피(스리랑카)</option>
												<option value="MNT">MNT:투그릭(몽골)</option>
												<option value="MXN">MXN:페소(멕시코)</option>
												<option value="MYR">MYR:링기트(말레이시아)</option>
												<option value="NOK">NOK:크로나(노르웨이)</option>
												<option value="NZD">NZD:달러(뉴질랜드)</option>
												<option value="OMR">OMR:리얄(오만)</option>
												<option value="PHP">PHP:페소(필리핀)</option>
												<option value="PKR">PKR:루피(파키스탄)</option>
												<option value="PLN">PLN:즈워티(폴란드)</option>
												<option value="QAR">QAR:리얄(카타르)</option>
												<option value="RUB">RUB:루블(러시아)</option>
												<option value="SAR">SAR:리얄(사우디)</option>
												<option value="SGD">SGD:달러(싱가포르)</option>
												<option value="THB">THB:바트(태국)</option>
												<option value="TRY">TRY:리라(터키)</option>
												<option value="TWD">TWD:달러(대만)</option>
												<option value="TZS">TZS:실링(탄자니아)</option>
												<option value="VND">VND:100동(베트남)</option>
												<option value="ZAR">ZAR:랜드(남아공화국)</option>
										</select></td>
									</tr>
									<tr>
										<th scope="row"><label for="tmpInqStrDt">일자선택</label></th>
										<td>

											<div class="calendar">
												<input type="text" id="tmpInqStrDt" name="tmpInqStrDt"
													maxlength="10" placeholder="2016-01-26" title="조회일 입력"
													value="2021-03-20"
													onchange="pbk.foreign.rate.pbld.prs.chkInqStrDt(document.forms['inqFrm']);"
													isinit="true"> <a href="#//HanaBank"
													onclick="opb.util.calendar.openCalendar_fnc('tmpInqStrDt',this,'Y-m-d',false, function() { pbk.foreign.rate.pbld.prs.chkInqStrDt(document.forms['inqFrm']); } );"><img
													src="https://image.kebhana.com/cont/common/img/common/bg_calendar.gif"
													alt="시작일달력 버튼"></a>
											</div> <span class="txtTypeExp calTxt">연월일 8자리로 ‘-’ 없이 입력해야
												합니다. 예) 20160101</span>

										</td>
									</tr>
									<tr>
										<th scope="row">고시회차</th>
										<td class="selBox que">
											<div class="choiceArea">
												<input type="radio" id="pbldDvCd_1" name="pbldDvCd"
													value="1" class="radioForm"
													onclick="pbk.foreign.rate.pbld.prs.chkRadio(document.forms['inqFrm']);">
												<label for="pbldDvCd_1" class="radioForm"><span></span>최초</label>
												<input type="radio" id="pbldDvCd_2" name="pbldDvCd"
													checked="checked" value="3" class="radioForm"
													onclick="pbk.foreign.rate.pbld.prs.chkRadio(document.forms['inqFrm']);">
												<label for="pbldDvCd_2" class="radioForm on">
													<div id="Area1">
														<span></span>현재
													</div>
													<div id="Area2" style="display: none;">
														<span></span>최종
													</div>
												</label> 
												<input type="radio" id="pbldDvCd_3" name="pbldDvCd" value="2" class="radioForm" onclick="pbk.foreign.rate.pbld.prs.chkRadio(document.forms['inqFrm']);">
												<label for="pbldDvCd_3" class="radioForm"><span></span>특정회차</label>
												<label style="font-size: 14px;">고시회차</label>&nbsp;
												<input type="text" id="pbldSqn" name="pbldSqn" maxlength="5" disable="true" class="wd50px disabled" readonly="readonly" style="background: rgb(202, 205, 208);" isinit="true">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" id="inqStrDt" name="inqStrDt"
								value="20210320"><input type="hidden" id="inqKindCd"
								name="inqKindCd" value="1"><input type="hidden"
								name="hid_key_data" id="hid_key_data" value="">
						</form>
					</div>

					<div class="btnBoxCenter">
						<a href="#//HanaBank" onclick="pbk.foreign.rate.pbld.prs.search(document.forms['inqFrm']);" class="btnDefault bg"><span>조회</span></a>
					</div>
					<div id="searchContentDiv">
						<div class="printdiv">

							<div style="display: none">
								<h4>현재환율</h4>
							</div>

							<p class="txtRateBox">
								<span class="fl"><em>기준일</em> : <strong>2021년03월20일</strong><em>고시회차</em>
									: <strong>432회차</strong><em>고시시간</em> : <strong>20시02분00초</strong></span>
								<span class="fr"><em>조회시각</em> : <strong>2021년03월20일
										16시53분40초</strong></span>
							</p>

							<table class="tblBasic leftNone"
								summary="통화,현찰,송금,T/C사실때,외화수표파실때,매매기준율,환가료율,미화환산율,사실 때,파실 때,보낼 때,받을 때,환율,Spread,환율,Spread(으)로 이루어진 기간별 기준가격 고시회차에 대한 내용 테이블입니다.">
								<caption>기간별 기준가격 고시회차에 대한 내용</caption>
								<colgroup>
									<col style="width: *">
									<col style="width: 8%">
									<col style="width: 7%">
									<col style="width: 8%">
									<col style="width: 7%">
									<col style="width: 8%">
									<col style="width: 7%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 8%">
									<col style="width: 8%">
								</colgroup>
								<thead>
									<tr>
										<th class="leftNone" scope="col" rowspan="3">통화</th>
										<th class="leftLine" scope="col" colspan="4">현찰</th>
										<th class="leftLine" scope="col" colspan="2">송금</th>
										<th class="leftLine" scope="col" rowspan="3">T/C<br>사실때
										</th>
										<th class="leftLine" scope="col" rowspan="3">외화<br>수표<br>파실때
										</th>
										<th class="leftLine" scope="col" rowspan="3">매매<br>기준율
										</th>
										<th class="leftLine" scope="col" rowspan="3">환가<br>료율
										</th>
										<th class="leftLine" scope="col" rowspan="3">미화<br>환산율
										</th>
									</tr>
									<tr>
										<th class="leftLine" scope="col" colspan="2">사실 때</th>
										<th class="leftLine" scope="col" colspan="2">파실 때</th>
										<th class="leftLine" scope="col" rowspan="2">보낼 때</th>
										<th class="leftLine" scope="col" rowspan="2">받을 때</th>
									</tr>
									<tr>
										<th class="leftLine" scope="col">환율</th>
										<th class="leftLine" scope="col">Spread</th>
										<th class="leftLine" scope="col">환율</th>
										<th class="leftLine" scope="col">Spread</th>
									</tr>
								</thead>
								<tbody>


									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="미국 USD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('USD','20210320');">
												<u> 미국 USD </u>
										</a></td>
										<td class="txtAr">1,149.77</td>
										<td class="txtAr">1.75</td>
										<td class="txtAr">1,110.23</td>
										<td class="txtAr">1.75</td>
										<td class="txtAr">1,141.00</td>
										<td class="txtAr">1,119.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">1,118.39</td>
										<td class="txtAr">1,130.00</td>
										<td class="txtAr">1.96088</td>
										<td class="txtAr">1.0000</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="일본 JPY (100) 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('JPY','20210320');">
												<u> 일본 JPY (100) </u>
										</a></td>
										<td class="txtAr">1,056.19</td>
										<td class="txtAr">1.75</td>
										<td class="txtAr">1,019.87</td>
										<td class="txtAr">1.75</td>
										<td class="txtAr">1,048.20</td>
										<td class="txtAr">1,027.86</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">1,027.37</td>
										<td class="txtAr">1,038.03</td>
										<td class="txtAr">1.90767</td>
										<td class="txtAr">0.9186</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="유로 EUR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('EUR','20210320');">
												<u> 유로 EUR </u>
										</a></td>
										<td class="txtAr">1,370.93</td>
										<td class="txtAr">1.99</td>
										<td class="txtAr">1,317.45</td>
										<td class="txtAr">1.99</td>
										<td class="txtAr">1,357.63</td>
										<td class="txtAr">1,330.75</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">1,330.23</td>
										<td class="txtAr">1,344.19</td>
										<td class="txtAr">1.39800</td>
										<td class="txtAr">1.1895</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="중국 CNY 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('CNY','20210320');">
												<u> 중국 CNY </u>
										</a></td>
										<td class="txtAr">182.16</td>
										<td class="txtAr">5.00</td>
										<td class="txtAr">164.82</td>
										<td class="txtAr">5.00</td>
										<td class="txtAr">175.22</td>
										<td class="txtAr">171.76</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">173.49</td>
										<td class="txtAr">5.06833</td>
										<td class="txtAr">0.1535</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="홍콩 HKD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('HKD','20210320');">
												<u> 홍콩 HKD </u>
										</a></td>
										<td class="txtAr">148.35</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">142.63</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">146.94</td>
										<td class="txtAr">144.04</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">143.97</td>
										<td class="txtAr">145.49</td>
										<td class="txtAr">2.14500</td>
										<td class="txtAr">0.1288</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="태국 THB 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('THB','20210320');">
												<u> 태국 THB </u>
										</a></td>
										<td class="txtAr">38.47</td>
										<td class="txtAr">5.00</td>
										<td class="txtAr">34.45</td>
										<td class="txtAr">6.00</td>
										<td class="txtAr">37.00</td>
										<td class="txtAr">36.28</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">36.26</td>
										<td class="txtAr">36.64</td>
										<td class="txtAr">2.52500</td>
										<td class="txtAr">0.0324</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="대만 TWD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('TWD','20210320');">
												<u> 대만 TWD </u>
										</a></td>
										<td class="txtAr">44.97</td>
										<td class="txtAr">13.10</td>
										<td class="txtAr">36.99</td>
										<td class="txtAr">7.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">39.77</td>
										<td class="txtAr">2.34500</td>
										<td class="txtAr">0.0352</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="필리핀 PHP 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('PHP','20210320');">
												<u> 필리핀 PHP </u>
										</a></td>
										<td class="txtAr">25.56</td>
										<td class="txtAr">10.00</td>
										<td class="txtAr">21.34</td>
										<td class="txtAr">8.20</td>
										<td class="txtAr">23.47</td>
										<td class="txtAr">23.01</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">23.24</td>
										<td class="txtAr">3.38900</td>
										<td class="txtAr">0.0206</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="싱가포르 SGD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('SGD','20210320');">
												<u> 싱가포르 SGD </u>
										</a></td>
										<td class="txtAr">858.75</td>
										<td class="txtAr">1.99</td>
										<td class="txtAr">825.25</td>
										<td class="txtAr">1.99</td>
										<td class="txtAr">850.42</td>
										<td class="txtAr">833.58</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">833.11</td>
										<td class="txtAr">842.00</td>
										<td class="txtAr">2.28500</td>
										<td class="txtAr">0.7451</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="호주 AUD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('AUD','20210320');">
												<u> 호주 AUD </u>
										</a></td>
										<td class="txtAr">893.52</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">859.00</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">885.02</td>
										<td class="txtAr">867.50</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">867.00</td>
										<td class="txtAr">876.26</td>
										<td class="txtAr">2.12500</td>
										<td class="txtAr">0.7755</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="베트남 VND (100) 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('VND','20210320');">
												<u> 베트남 VND (100) </u>
										</a></td>
										<td class="txtAr">5.47</td>
										<td class="txtAr">11.80</td>
										<td class="txtAr">4.33</td>
										<td class="txtAr">11.80</td>
										<td class="txtAr">4.94</td>
										<td class="txtAr">4.86</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">4.90</td>
										<td class="txtAr">2.77500</td>
										<td class="txtAr">0.0043</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="영국 GBP 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('GBP','20210320');">
												<u> 영국 GBP </u>
										</a></td>
										<td class="txtAr">1,604.98</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">1,542.98</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">1,589.71</td>
										<td class="txtAr">1,558.25</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">1,557.38</td>
										<td class="txtAr">1,573.98</td>
										<td class="txtAr">2.02413</td>
										<td class="txtAr">1.3929</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="캐나다 CAD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('CAD','20210320');">
												<u> 캐나다 CAD </u>
										</a></td>
										<td class="txtAr">923.21</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">887.55</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">914.43</td>
										<td class="txtAr">896.33</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">895.78</td>
										<td class="txtAr">905.38</td>
										<td class="txtAr">2.19500</td>
										<td class="txtAr">0.8012</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="말레이시아 MYR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('MYR','20210320');">
												<u> 말레이시아 MYR </u>
										</a></td>
										<td class="txtAr">292.44</td>
										<td class="txtAr">6.30</td>
										<td class="txtAr">254.76</td>
										<td class="txtAr">7.40</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">272.36</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">275.11</td>
										<td class="txtAr">3.85500</td>
										<td class="txtAr">0.2435</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="러시아 RUB 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('RUB','20210320');">
												<u> 러시아 RUB </u>
										</a></td>
										<td class="txtAr">16.34</td>
										<td class="txtAr">7.00</td>
										<td class="txtAr">13.60</td>
										<td class="txtAr">11.00</td>
										<td class="txtAr">15.43</td>
										<td class="txtAr">15.13</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">15.28</td>
										<td class="txtAr">6.69500</td>
										<td class="txtAr">0.0135</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="남아공화국 ZAR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('ZAR','20210320');">
												<u> 남아공화국 ZAR </u>
										</a></td>
										<td class="txtAr">81.50</td>
										<td class="txtAr">6.00</td>
										<td class="txtAr">70.74</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">77.81</td>
										<td class="txtAr">75.97</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">76.89</td>
										<td class="txtAr">7.22500</td>
										<td class="txtAr">0.0680</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="노르웨이 NOK 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('NOK','20210320');">
												<u> 노르웨이 NOK </u>
										</a></td>
										<td class="txtAr">135.86</td>
										<td class="txtAr">2.45</td>
										<td class="txtAr">129.38</td>
										<td class="txtAr">2.45</td>
										<td class="txtAr">133.94</td>
										<td class="txtAr">131.30</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">131.22</td>
										<td class="txtAr">132.62</td>
										<td class="txtAr">2.35500</td>
										<td class="txtAr">0.1174</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="뉴질랜드 NZD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('NZD','20210320');">
												<u> 뉴질랜드 NZD </u>
										</a></td>
										<td class="txtAr">825.82</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">793.92</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">817.96</td>
										<td class="txtAr">801.78</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">801.27</td>
										<td class="txtAr">809.87</td>
										<td class="txtAr">2.33500</td>
										<td class="txtAr">0.7167</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="덴마크 DKK 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('DKK','20210320');">
												<u> 덴마크 DKK </u>
										</a></td>
										<td class="txtAr">185.20</td>
										<td class="txtAr">2.45</td>
										<td class="txtAr">176.36</td>
										<td class="txtAr">2.45</td>
										<td class="txtAr">182.58</td>
										<td class="txtAr">178.98</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">178.89</td>
										<td class="txtAr">180.78</td>
										<td class="txtAr">1.83500</td>
										<td class="txtAr">0.1600</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="멕시코 MXN 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('MXN','20210320');">
												<u> 멕시코 MXN </u>
										</a></td>
										<td class="txtAr">61.14</td>
										<td class="txtAr">10.00</td>
										<td class="txtAr">50.93</td>
										<td class="txtAr">8.40</td>
										<td class="txtAr">56.14</td>
										<td class="txtAr">55.04</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">55.59</td>
										<td class="txtAr">6.22700</td>
										<td class="txtAr">0.0492</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="몽골 MNT 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('MNT','20210320');">
												<u> 몽골 MNT </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.40</td>
										<td class="txtAr">13.47500</td>
										<td class="txtAr">0.0004</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="바레인 BHD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('BHD','20210320');">
												<u> 바레인 BHD </u>
										</a></td>
										<td class="txtAr">3,189.01</td>
										<td class="txtAr">6.40</td>
										<td class="txtAr">2,757.42</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">3,027.16</td>
										<td class="txtAr">2,967.22</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">2,964.25</td>
										<td class="txtAr">2,997.19</td>
										<td class="txtAr">3.57500</td>
										<td class="txtAr">2.6524</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="방글라데시 BDT 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('BDT','20210320');">
												<u> 방글라데시 BDT </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">13.35</td>
										<td class="txtAr">5.01010</td>
										<td class="txtAr">0.0118</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="브라질 BRL 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('BRL','20210320');">
												<u> 브라질 BRL </u>
										</a></td>
										<td class="txtAr">223.94</td>
										<td class="txtAr">10.20</td>
										<td class="txtAr">186.97</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">200.79</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">203.22</td>
										<td class="txtAr">4.13000</td>
										<td class="txtAr">0.1798</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="브루나이 BND 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('BND','20210320');">
												<u> 브루나이 BND </u>
										</a></td>
										<td class="txtAr">875.68</td>
										<td class="txtAr">4.00</td>
										<td class="txtAr">791.48</td>
										<td class="txtAr">6.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">842.00</td>
										<td class="txtAr">2.28500</td>
										<td class="txtAr">0.7451</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="사우디아라비아 SAR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('SAR','20210320');">
												<u> 사우디아라비아 SAR </u>
										</a></td>
										<td class="txtAr">320.27</td>
										<td class="txtAr">6.30</td>
										<td class="txtAr">280.51</td>
										<td class="txtAr">6.90</td>
										<td class="txtAr">304.30</td>
										<td class="txtAr">298.28</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">298.07</td>
										<td class="txtAr">301.29</td>
										<td class="txtAr">2.62500</td>
										<td class="txtAr">0.2666</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="스리랑카 LKR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('LKR','20210320');">
												<u> 스리랑카 LKR </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">5.71</td>
										<td class="txtAr">6.77500</td>
										<td class="txtAr">0.0051</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="스웨덴 SEK 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('SEK','20210320');">
												<u> 스웨덴 SEK </u>
										</a></td>
										<td class="txtAr">135.54</td>
										<td class="txtAr">2.45</td>
										<td class="txtAr">129.06</td>
										<td class="txtAr">2.45</td>
										<td class="txtAr">133.62</td>
										<td class="txtAr">130.98</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">130.90</td>
										<td class="txtAr">132.30</td>
										<td class="txtAr">2.20500</td>
										<td class="txtAr">0.1171</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="스위스 CHF 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('CHF','20210320');">
												<u> 스위스 CHF </u>
										</a></td>
										<td class="txtAr">1,240.79</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">1,192.85</td>
										<td class="txtAr">1.97</td>
										<td class="txtAr">1,228.98</td>
										<td class="txtAr">1,204.66</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">1,204.27</td>
										<td class="txtAr">1,216.82</td>
										<td class="txtAr">1.17620</td>
										<td class="txtAr">1.0768</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="아랍에미리트공화국 AED 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('AED','20210320');">
												<u> 아랍에미리트공화국 AED </u>
										</a></td>
										<td class="txtAr">324.56</td>
										<td class="txtAr">5.50</td>
										<td class="txtAr">286.42</td>
										<td class="txtAr">6.90</td>
										<td class="txtAr">310.71</td>
										<td class="txtAr">304.57</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">304.38</td>
										<td class="txtAr">307.64</td>
										<td class="txtAr">2.24500</td>
										<td class="txtAr">0.2722</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="알제리 DZD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('DZD','20210320');">
												<u> 알제리 DZD </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">8.47</td>
										<td class="txtAr">7.22500</td>
										<td class="txtAr">0.0075</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="오만 OMR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('OMR','20210320');">
												<u> 오만 OMR </u>
										</a></td>
										<td class="txtAr">3,196.28</td>
										<td class="txtAr">8.90</td>
										<td class="txtAr">2,758.96</td>
										<td class="txtAr">6.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">2,935.06</td>
										<td class="txtAr">4.37500</td>
										<td class="txtAr">2.5974</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="요르단 JOD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('JOD','20210320');">
												<u> 요르단 JOD </u>
										</a></td>
										<td class="txtAr">1,735.63</td>
										<td class="txtAr">8.90</td>
										<td class="txtAr">1,466.29</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">1,593.79</td>
										<td class="txtAr">5.44300</td>
										<td class="txtAr">1.4104</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="이스라엘 ILS 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('ILS','20210320');">
												<u> 이스라엘 ILS </u>
										</a></td>
										<td class="txtAr">377.05</td>
										<td class="txtAr">10.00</td>
										<td class="txtAr">315.36</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">342.78</td>
										<td class="txtAr">2.13500</td>
										<td class="txtAr">0.3033</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="이집트 EGP 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('EGP','20210320');">
												<u> 이집트 EGP </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">72.07</td>
										<td class="txtAr">7.22500</td>
										<td class="txtAr">0.0638</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="인도 INR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('INR','20210320');">
												<u> 인도 INR </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">15.59</td>
										<td class="txtAr">5.71500</td>
										<td class="txtAr">0.0138</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="인도네시아 IDR (100) 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('IDR','20210320');">
												<u> 인도네시아 IDR (100) </u>
										</a></td>
										<td class="txtAr">8.41</td>
										<td class="txtAr">7.00</td>
										<td class="txtAr">7.08</td>
										<td class="txtAr">10.00</td>
										<td class="txtAr">7.93</td>
										<td class="txtAr">7.79</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">7.79</td>
										<td class="txtAr">7.86</td>
										<td class="txtAr">5.52500</td>
										<td class="txtAr">0.0070</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="체코 CZK 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('CZK','20210320');">
												<u> 체코 CZK </u>
										</a></td>
										<td class="txtAr">55.76</td>
										<td class="txtAr">8.50</td>
										<td class="txtAr">46.78</td>
										<td class="txtAr">9.00</td>
										<td class="txtAr">51.96</td>
										<td class="txtAr">50.84</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">51.40</td>
										<td class="txtAr">2.32500</td>
										<td class="txtAr">0.0455</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="칠레 CLP 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('CLP','20210320');">
												<u> 칠레 CLP </u>
										</a></td>
										<td class="txtAr">1.70</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">1.46</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">1.58</td>
										<td class="txtAr">1.60900</td>
										<td class="txtAr">0.0014</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="카자흐스탄 KZT 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('KZT','20210320');">
												<u> 카자흐스탄 KZT </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">2.68</td>
										<td class="txtAr">13.47500</td>
										<td class="txtAr">0.0024</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="카타르 QAR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('QAR','20210320');">
												<u> 카타르 QAR </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">310.35</td>
										<td class="txtAr">2.22500</td>
										<td class="txtAr">0.2746</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="케냐 KES 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('KES','20210320');">
												<u> 케냐 KES </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">10.29</td>
										<td class="txtAr">7.67500</td>
										<td class="txtAr">0.0091</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="콜롬비아 COP 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('COP','20210320');">
												<u> 콜롬비아 COP </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.32</td>
										<td class="txtAr">0.00000</td>
										<td class="txtAr">0.0003</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="쿠웨이트 KWD 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('KWD','20210320');">
												<u> 쿠웨이트 KWD </u>
										</a></td>
										<td class="txtAr">3,983.48</td>
										<td class="txtAr">6.50</td>
										<td class="txtAr">3,441.14</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">3,777.76</td>
										<td class="txtAr">3,702.96</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">3,699.75</td>
										<td class="txtAr">3,740.36</td>
										<td class="txtAr">3.09500</td>
										<td class="txtAr">3.3101</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="탄자니아 TZS 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('TZS','20210320');">
												<u> 탄자니아 TZS </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.49</td>
										<td class="txtAr">8.47500</td>
										<td class="txtAr">0.0004</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="터어키 TRY 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('TRY','20210320');">
												<u> 터키 TRY </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">157.73</td>
										<td class="txtAr">154.31</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">156.02</td>
										<td class="txtAr">20.57500</td>
										<td class="txtAr">0.1381</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="파키스탄 PKR 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('PKR','20210320');">
												<u> 파키스탄 PKR </u>
										</a></td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">7.25</td>
										<td class="txtAr">9.17500</td>
										<td class="txtAr">0.0064</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="폴란드 PLN 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('PLN','20210320');">
												<u> 폴란드 PLN </u>
										</a></td>
										<td class="txtAr">313.97</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">267.47</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">293.91</td>
										<td class="txtAr">287.53</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">290.72</td>
										<td class="txtAr">2.04500</td>
										<td class="txtAr">0.2573</td>

									</tr>

									<tr>
										<td class="tc"><a href="#//HanaBank"
											title="헝가리 HUF 일일변동내역 보기"
											onclick="pbk.foreign.rate.pbld.prs.goFluctuation('HUF','20210320');">
												<u> 헝가리 HUF </u>
										</a></td>
										<td class="txtAr">3.98</td>
										<td class="txtAr">9.30</td>
										<td class="txtAr">3.36</td>
										<td class="txtAr">8.00</td>
										<td class="txtAr">3.69</td>
										<td class="txtAr">3.61</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">0.00</td>
										<td class="txtAr">3.65</td>
										<td class="txtAr">2.90500</td>
										<td class="txtAr">0.0032</td>

									</tr>



								</tbody>
							</table>
						</div>



					</div>
				</div>
			</div>
		</div>

		<div class="contNotice">
			<h5 class="notiTitle">유의사항</h5>
			<ul class="orderListDot">

				<li>2014.3.4 이후 중국 위안화 (CNY)환율은 홍콩시장에서 거래되는 위안화환율을 고시합니다.</li>
				<li>스프레드율은 각 통화의 매매기준율과 대고객 매매율의 차이를 계산하기 위하여 매매기준을 곱하는 백분율입니다.</li>
				<li>각 통화별 매매기준율과 현찰매매 스프레드율에 의해 아래와 같이 현찰 사실때/파실때 환율이 산출됩니다.
					<ul class="orderListDash">
						<li>현찰 사실 때 환율 : 매매기준율 * (1+외화현찰 사실 때 스프레드율)</li>
						<li>현찰 파실 때 환율 : 매매기준율 * (1-외화현찰 파실 때 스프레드율)</li>
					</ul>
				</li>
				<li>NCU[독일(DEM), 프랑스(FRF), 이탈리아(ITL), 벨기에(BEF), 오스트리아(ATS),
					네덜란드(NLG), 스페인(ESP), 핀란드(FIM), 슬로바키아(SKK)] 통화는 비고시환율에서 조회됩니다.</li>
				<li>선택하신 조회일이 휴일인 경우 전 영업일자로 조회되며, 일자선택 시 1986.1.27 부터 조회
					가능합니다.
					<ul class="orderListDash">
						<li>단, 2017.9.23부터 주말을 비롯한 휴일에도 시장상황에 따라 환율이 재고시 될 수 있으며,
							전영업일 마지막회차 다음 회차로 표시됩니다.</li>
					</ul>
				</li>
				<li>당행에서 거래되지 않는 환율은 고시되지 않습니다.</li>
			</ul>
		</div>
	</div>

	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />

</body>

</body>
</html>