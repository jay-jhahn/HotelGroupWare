<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<html>
<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-none d-lg-block">
		<div class="container clearfix">
			<div class="contact-info float-left">
				<i class="icofont-envelope"></i><a href="mailto:hotel@gmail.com">hotel@gmail.com</a>
				<i class="icofont-phone"></i> +82 10 5517 9648
			</div>
			<div class="social-links float-right">
				<a href="#" class="twitter"><i class="icofont-twitter"></i></a> 
				<a href="#" class="facebook"><i class="icofont-facebook"></i></a> 
				<a href="#" class="instagram"><i class="icofont-instagram"></i></a>
			</div>
		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container">
			<div class="logo float-left">
				<h1 class="text-light">
					<a href="main.al"><span>HMS</span></a>
				</h1>
			</div>

			<nav class="nav-menu float-right d-none d-lg-block">
				<ul>
					<li class="active"><a href="main.al">Home</a></li>
					<li><a href="#team">직원가상품</a></li>
					<li class="drop-down"><a href="#">부서</a>
						<ul>
							<li><a href="shareMain.al">공통</a></li>
							<li><a href="roomMain.al">객실</a></li>
							<li><a href="officeMain.ad">경영지원</a></li>
						</ul></li>
					<li><a href="#contact">Contact Us</a></li>
					<c:if test="${sessionScope.empCode != null}">
						<li><a href="#" onclick="document.getElementById('logout-form').submit();">Logout</a></li>
						<form id="logout-form" action='<c:url value='logout.al' />' method="POST">
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>
					</c:if>
				</ul>
			</nav> <!--.nav-menu -->
		</div>
	</header> <!--End Header -->
</body>
</html>