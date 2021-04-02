<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<body>
<script type="text/javascript">
$(function(){
	   var submenu = $(this).next("ul");
	    var submenu = $(this).next("ul");
	     $('.dpMenu').mouseenter(function(){
	         this.classList.add('active');
	         submenu.slideDown();
	     });
	     $('.dpMenu').mouseleave(function(){
	        this.classList.remove('active');
	     });
	     
	});
	   
	$(document).ready(function(){
	   $(".dpMenu>a").click(function(){
	        var submenu = $(this).next("ul");
	        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	        if(submenu.is(":visible") ){
	            submenu.slideUp();
	        } else {
	           submenu.slideDown();
	        }
	    });
	});  
</script>
	<div class="sidebar" data-color="sora">
		<div class="logo">
			<a href="#" class="simple-text logo-mini"> HMS </a> <a href="#"
				class="simple-text logo-normal"> 백오피스 </a>
		</div>

		<div class="sidebar-wrapper" id="sidebar-wrapper">
			<ul class="nav">
				<li class="dpMenu">
					<a> 
						<i class="now-ui-icons users_single-02"></i> 인사관리
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item"><a href="hrInfo.ad">인사정보</a></li>
						<li class="subMenuLi list-group-item"><a href="#">인사고과</a></li>
					</ul>
				</li>
				
				<li class="dpMenu">
					<a> 
						<i class="now-ui-icons users_single-02"></i> 전자결재
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item"><a href="#">휴가결재</a></li>
					</ul>
				</li>

				<li class="dpMenu">
					<a href="#"> 
						<i class="now-ui-icons business_badge"></i> 근태관리
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item"><a href="holidayCondition.ad">휴가현황</a></li>
						<li class="subMenuLi list-group-item"><a href="#">근태조회</a></li>
					</ul>
				</li>
				
				<li class="dpMenu">
					<a> 
						<i class="now-ui-icons emoticons_satisfied"></i> 직원 복지
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item"><a href="welfareCuponList.oa">쿠폰 목록 및 입력</a></li>
					</ul>
				</li>
				
				<li class="dpMenu">
					<a href="#"> 
						<i class="now-ui-icons business_money-coins"></i> 급여관리
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="list-group-item remuneration">
							<a href="payMgt.ad">급여명세서 관리</a>
						</li>
						
						<li class="list-group-item remuneration">
							<a href="payMgtList.ad">급여멍세서 목록</a>
						</li>
					</ul>
				</li>

				<li class="dpMenu">
					<a href="#"> 
						<i class="now-ui-icons business_chart-bar-32"></i> 결산
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item"><a href="account.ad">결산목록 조회</a></li>
						<li class="subMenuLi list-group-item"><a href="prediction.ad">매출 증감률 예측</a></li>
					</ul>
				</li>

			</ul>
		</div>
	</div>

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>