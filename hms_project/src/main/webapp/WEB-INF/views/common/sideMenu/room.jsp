<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<body>
	<script type="text/javascript">
		$(function() {
			var submenu = $(this).next("ul");
			var submenu = $(this).next("ul");
			$('.dpMenu').mouseenter(function() {
				this.classList.add('active');
				submenu.slideDown();
			});
			$('.dpMenu').mouseleave(function() {
				this.classList.remove('active');
			});

		});

		$(document).ready(function() {
			$(".dpMenu>a").click(function() {
				var submenu = $(this).next("ul");
				// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
				if (submenu.is(":visible")) {
					submenu.slideUp();
				} else {
					submenu.slideDown();
				}
			});
		});
	</script>
	<div class="sidebar" data-color="sora">
		<div class="logo">
			<a href="#" class="simple-text logo-mini"> HMS </a> 
			<a href="#" class="simple-text logo-normal"> 객실 </a>
		</div>

		<div class="sidebar-wrapper" id="sidebar-wrapper">
			<ul class="nav">
				<sec:authorize access="hasAnyRole('ROLE_ROM', 'ROLE_ROSM')">
					<li class="dpMenu">
						<a> 
							<i class="now-ui-icons users_single-02"></i> 인사관리
						</a>
						<ul class="hide list-group list-group-flush text-center" style="display: none;">
							<li class="subMenuLi list-group-item"><a href="ratingList.or">인사고과</a></li>
						</ul>
					</li>
				</sec:authorize>
				<li class="dpMenu">
					<a href="#"> 
						<i class="now-ui-icons design_app"></i> 객실
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item"><a onclick="checkList();">체크인/체크아웃</a></li>
					</ul>
				</li>
				
				<li class="dpMenu">
					<a href="#"> 
						<i class="now-ui-icons design_app"></i> 연회장
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item">
							<a href="hallInsert.al">연회장 예약 관리</a>
						</li>
						<li class="subMenuLi list-group-item">
							<a href="hallModify.al">연회장 예약 수정</a>
						</li>
					</ul>
				</li>

				<li class="dpMenu">
					<a href="#"> 
						<i class="now-ui-icons education_atom"></i> 환전
					</a>
					<ul class="hide list-group list-group-flush text-center" style="display: none;">
						<li class="subMenuLi list-group-item"><a href="exchangeRate.al">환율조회</a></li>
						<li class="subMenuLi list-group-item"><a href="exchangeInsert.al">환전신청%내역</a></li>
				   <!-- <li class="subMenuLi list-group-item"><a href="exchangeInsert.al">환전신청</a></li> -->
		  	       <!-- <li class="subMenuLi list-group-item"><a href="#">보유외화</a></li> -->
					</ul>
				</li>
			</ul>
		</div>
	</div>

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

</body>
</html>