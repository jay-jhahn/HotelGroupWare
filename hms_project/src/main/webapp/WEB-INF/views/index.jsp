<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/setting.jsp"%>
<body>
	<!-- ======= Header ======= -->
	<jsp:include page="${jspPath}common/header.jsp" flush="false" />

	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" class="carousel">
				<!-- c태그 붙이기 -->
				<div class="carousel-item active" style="background-image: url('${path}img/main/main.png');">
					<div class="carousel-container">
						<!-- 로그인 되기 전 -->
						<c:if test="${sessionScope.empCode == null}">
							<div class="carousel-content container">
								<h2 class="animate__animated animate__fadeInDown">
									Welcome to <span>Hotel</span>
								</h2>
								<div class="col-lg-6 form-group">
									<form action="loginAction.al" method="post" name="loginform" onsubmit="return loginCheck();">
										<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
										<input type="text" class="animate__animated animate__fadeInUp form-control input mb-2" 
											name="empCode" id="id" placeholder="id">
										<input type="password" class="animate__animated animate__fadeInUp form-control input mb-2" 
											name="empPwd" id="pwd" placeholder="password">
										<input type="submit" class="animate__animated animate__fadeInUp btn-get-started scrollto" value="login">
									</form>
								</div>
							</div>
						</c:if>
						
						<!-- 로그인 되었을 때 -->
						<c:if test="${sessionScope.empCode != null}">
						   <div class="carousel-content container">
						      <h2 class="animate__animated animate__fadeInDown">
						         Welcome to <span>Hotel</span>
						      </h2>
						      <div class="col-lg-6 form-group animate__animated animate__fadeInUp">
						         <form>
						            <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
						            <div class="media">
										<img class="mr-3 image_section" alt="증명사진 이미지" src="<c:url value="/uploadPath/${empVo.getEmpImg()}"/>"/>
										<div class="media-body">
											<h3 class="mt-0" style="color: white;"><b>${empVo.getEmpName()}</b></h3>
											<h6 style="color: white;">사번 : ${empVo.getEmpCode()}</h6>
											<h6 style="color: white;">부서 : ${empVo.getDeptName()}</h6>
											<h6 style="color: white;">EMAIL : ${empVo.getEmpEmail()}</h6>
											<h6 style="color: white;">PHONE : ${empVo.getEmpPhone()}</h6>
						               </div>
						            </div>
						         </form>
						      </div>
						   </div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">
		<!-- ======= Our Team Section ======= -->
		<section id="team" class="team">
			<div class="container">

				<div class="section-title">
					<h2>이달의 우수사원</h2>
					<p>이 달의 우수사원을 소개합니다.</p>
				</div>

				<div class="row">

					<div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up">
						<div class="member">
							<div class="pic">
								<img src="${path}img/employee/lch.png" style="width: 600px; height: 300px;" class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>Lee Chul Han</h4>
								<span>객실팀 팀장</span>
								<div class="social">
									<a href="#"><i class="icofont-twitter"></i></a> 
									<a href="#"><i class="icofont-facebook"></i></a> 
									<a href="#"><i class="icofont-instagram"></i></a> 
									<a href="#"><i class="icofont-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="100">
						<div class="member">
							<div class="pic">
								<img src="${path}img/employee/psw.png" style="width: 600px; height: 300px;" class="img-fluid">
							</div>
							<div class="member-info">
								<h4>Park Sang Won</h4>
								<span>객실팀</span>
								<div class="social">
									<a href="#"><i class="icofont-twitter"></i></a> 
									<a href="#"><i class="icofont-facebook"></i></a> 
									<a href="#"><i class="icofont-instagram"></i></a> 
									<a href="#"><i class="icofont-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
						<div class="member">
							<div class="pic">
								<img src="${path}img/employee/pse.png" style="width: 600px; height: 300px;" class="img-fluid">
							</div>
							<div class="member-info">
								<h4>Park Sung Eon</h4>
								<span>객실팀</span>
								<div class="social">
									<a href="#"><i class="icofont-twitter"></i></a> 
									<a href="#"><i class="icofont-facebook"></i></a> 
									<a href="#"><i class="icofont-instagram"></i></a> 
									<a href="#"><i class="icofont-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up"
						data-aos-delay="300">
						<div class="member">
							<div class="pic">
								<img src="${path}img/employee/syj.png" style="width: 600px; height: 300px;" class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>Seul Ye Jin</h4>
								<span>객실팀</span>
								<div class="social">
									<a href="#"><i class="icofont-twitter"></i></a> <a href="#"><i
										class="icofont-facebook"></i></a> <a href="#"><i
										class="icofont-instagram"></i></a> <a href="#"><i
										class="icofont-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Our Team Section -->

		<!-- ======= Counts Section ======= -->
		<!-- 사원수/객실/연회장/뷔페 예약수 (00시 기준 업데이트) -->
		<section class="counts section-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up">
						<div class="count-box">
							<i class="icofont-simple-smile" style="color: #20b38e;"></i> <span
								data-toggle="counter-up">232</span>
							<p>직원수</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
						data-aos-delay="200">
						<div class="count-box">
							<i class="icofont-document-folder" style="color: #c042ff;"></i> <span
								data-toggle="counter-up">521</span>
							<p>금일 객실 예약수</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
						data-aos-delay="400">
						<div class="count-box">
							<i class="icofont-live-support" style="color: #46d1ff;"></i> <span
								data-toggle="counter-up">1,463</span>
							<p>금일 연회장 예약수</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
						data-aos-delay="600">
						<div class="count-box">
							<i class="icofont-users-alt-5" style="color: #ffb459;"></i> <span
								data-toggle="counter-up">15</span>
							<p>필독 공지수</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Counts Section -->




		<!-- ======= Contact Us Section ======= -->
		<section id="contact" class="contact section-bg">
			<div class="container">
				<div class="section-title">
					<h2>Contact Us</h2>
				</div>
				<div class="row">

					<div class="col-lg-6 d-flex align-items-stretch" data-aos="fade-up">
						<div class="info-box">
							<i class="bx bx-map"></i>
							<h3>Our Address</h3>
							<p>A108 Adam Street, New York, NY 535022</p>
						</div>
					</div>

					<div class="col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
						<div class="info-box">
							<i class="bx bx-envelope"></i>
							<h3>Email Us</h3>
							<p>
								info@example.com<br>hotel@gmail.com
							</p>
						</div>
					</div>

					<div class="col-lg-3 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
						<div class="info-box ">
							<i class="bx bx-phone-call"></i>
							<h3>Call Us</h3>
							<p>
								+1 5589 55488 55<br>+1 6678 254445 41
							</p>
						</div>
					</div>

					<div class="col-lg-12" data-aos="fade-up" data-aos-delay="300">
						<form action="forms/contact.php" method="post" role="form" class="php-email-form">
							<div class="form-row">
								<div class="col-lg-6 form-group">
									<input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" 
										data-msg="Please enter at least 4 chars" />
									<div class="validate"></div>
								</div>
								<div class="col-lg-6 form-group">
									<input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" 
										data-msg="Please enter a valid email" />
									<div class="validate"></div>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" 
									data-msg="Please enter at least 8 chars of subject" />
								<div class="validate"></div>
							</div>
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" 
									placeholder="Message"></textarea>
								<div class="validate"></div>
							</div>
							<div class="mb-3">
								<div class="loading">Loading</div>
								<div class="error-message"></div>
								<div class="sent-message">Your message has been sent.
									Thank you!</div>
							</div>
							<div class="text-center">
								<button type="submit">Send Message</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- End Contact Us Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="${jspPath}common/footer.jsp" flush="false" />

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>
</html>