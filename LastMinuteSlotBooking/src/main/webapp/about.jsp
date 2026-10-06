<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>About | Last Minute Slot Booking</title>


<style>

/* =========================================
           RESET
        ========================================= */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	background: #f5f8fc;
	color: #172033;
	overflow-x: hidden;
	animation: pageLoad 0.7s ease;
}

@
keyframes pageLoad {from { opacity:0;
	
}

to {
	opacity: 1;
}

}

/* =========================================
           NAVBAR
        ========================================= */
.navbar {
	width: 100%;
	height: 72px;
	background: #071a33;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 7%;
	position: sticky;
	top: 0;
	z-index: 1000;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
	animation: navbarDown 0.7s ease;
}

@
keyframes navbarDown {from { transform:translateY(-100%);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
.logo {
	text-decoration: none;
	color: white;
	font-size: 21px;
	font-weight: bold;
}

.logo span {
	color: #1687ff;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 28px;
}

.nav-links a {
	position: relative;
	text-decoration: none;
	color: #dce7f5;
	font-size: 14px;
	transition: 0.3s ease;
}

.nav-links a::after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -7px;
	width: 0;
	height: 2px;
	background: #1687ff;
	transition: 0.3s ease;
}

.nav-links a:hover {
	color: white;
}

.nav-links a:hover::after {
	width: 100%;
}

.nav-links .active {
	color: white;
}

.nav-links .active::after {
	width: 100%;
}

/* =========================================
           HERO
        ========================================= */
.hero {
	min-height: 460px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	padding: 60px 20px;
	color: white;
	background-image: linear-gradient(rgba(3, 20, 42, 0.84),
		rgba(5, 48, 96, 0.80)),
		url("https://static.vecteezy.com/system/resources/thumbnails/071/825/744/small_2x/illuminated-stadium-night-view-with-lush-green-field-neural-network-photo.jpg");
	background-size: cover;
	background-position: center;
	animation: heroImage 1.2s ease;
}

@
keyframes heroImage {from { background-size:115%;
	
}

to {
	background-size: cover;
}

}
.hero-content {
	max-width: 850px;
	animation: heroContent 0.9s ease;
}

@
keyframes heroContent {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.hero-badge {
	display: inline-block;
	padding: 8px 18px;
	margin-bottom: 18px;
	border-radius: 30px;
	background: rgba(22, 135, 255, 0.18);
	border: 1px solid rgba(110, 190, 255, 0.4);
	color: #8bcaff;
	font-size: 13px;
	font-weight: bold;
}

.hero h1 {
	font-size: 52px;
	line-height: 1.15;
	margin-bottom: 20px;
}

.hero h1 span {
	color: #4da3ff;
}

.hero p {
	max-width: 700px;
	margin: auto;
	color: #dce9f7;
	font-size: 16px;
	line-height: 1.8;
}

/* =========================================
           COMMON SECTION
        ========================================= */
.section {
	padding: 80px 7%;
}

.section-heading {
	text-align: center;
	max-width: 750px;
	margin: 0 auto 50px;
}

.section-heading .label {
	color: #087df5;
	font-size: 13px;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 1.5px;
	margin-bottom: 8px;
}

.section-heading h2 {
	font-size: 35px;
	color: #10233f;
	margin-bottom: 12px;
}

.section-heading p {
	color: #718096;
	font-size: 14px;
	line-height: 1.7;
}

/* =========================================
           ABOUT
        ========================================= */
.about-section {
	background: white;
}

.about-wrapper {
	max-width: 1100px;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 55px;
	align-items: center;
}

.about-image {
	height: 390px;
	border-radius: 20px;
	background-image: linear-gradient(rgba(5, 25, 50, 0.20),
		rgba(5, 25, 50, 0.20)),
		url("https://static.vecteezy.com/system/resources/thumbnails/071/825/744/small_2x/illuminated-stadium-night-view-with-lush-green-field-neural-network-photo.jpg");
	background-size: cover;
	background-position: center;
	box-shadow: 0 20px 50px rgba(10, 40, 80, 0.15);
	animation: aboutImage 0.9s ease;
}

@
keyframes aboutImage {from { opacity:0;
	transform: translateX(-40px);
}

to {
	opacity: 1;
	transform: translateX(0);
}

}
.about-content {
	animation: aboutText 0.9s ease;
}

@
keyframes aboutText {from { opacity:0;
	transform: translateX(40px);
}

to {
	opacity: 1;
	transform: translateX(0);
}

}
.about-content h3 {
	font-size: 29px;
	color: #10233f;
	margin-bottom: 17px;
}

.about-content p {
	color: #68788e;
	font-size: 14px;
	line-height: 1.8;
	margin-bottom: 14px;
}

.goal-box {
	margin-top: 22px;
	padding: 18px;
	background: #eef6ff;
	border-left: 4px solid #087df5;
	border-radius: 8px;
	color: #4a5f77;
	font-size: 14px;
}

/* =========================================
           FEATURES
        ========================================= */
.features-section {
	background: #f5f8fc;
}

.features-grid {
	max-width: 1100px;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 22px;
}

.feature-card {
	background: white;
	padding: 28px;
	border-radius: 17px;
	border: 1px solid #e2eaf2;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	animation: cardUp 0.7s ease;
}

@
keyframes cardUp {from { opacity:0;
	transform: translateY(25px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.feature-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 18px 40px rgba(15, 55, 100, 0.12);
}

.feature-icon {
	width: 55px;
	height: 55px;
	border-radius: 15px;
	background: #eaf4ff;
	color: #087df5;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	margin-bottom: 18px;
	transition: 0.3s ease;
}

.feature-card:hover .feature-icon {
	transform: scale(1.1) rotate(-5deg);
}

.feature-card h3 {
	font-size: 18px;
	color: #172b49;
	margin-bottom: 8px;
}

.feature-card p {
	color: #718096;
	font-size: 13px;
	line-height: 1.7;
}

/* =========================================
           HOW IT WORKS
        ========================================= */
.how-section {
	background: white;
}

.steps {
	max-width: 1050px;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.step {
	text-align: center;
	padding: 20px;
}

.step-number {
	width: 58px;
	height: 58px;
	margin: 0 auto 18px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: bold;
	background: linear-gradient(135deg, #087df5, #075dcc);
	box-shadow: 0 10px 25px rgba(8, 125, 245, 0.25);
	transition: 0.3s ease;
}

.step:hover .step-number {
	transform: translateY(-6px) scale(1.05);
}

.step h3 {
	color: #1d3557;
	font-size: 17px;
	margin-bottom: 7px;
}

.step p {
	color: #718096;
	font-size: 13px;
	line-height: 1.6;
}

/* =========================================
           SECURITY
        ========================================= */
.security-section {
	background: #071a33;
	color: white;
}

.security-section .section-heading h2 {
	color: white;
}

.security-section .section-heading p {
	color: #b9c8da;
}

.security-grid {
	max-width: 1050px;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 22px;
}

.security-card {
	padding: 30px;
	text-align: center;
	border-radius: 16px;
	background: rgba(255, 255, 255, 0.06);
	border: 1px solid rgba(255, 255, 255, 0.10);
	transition: 0.3s ease;
}

.security-card:hover {
	transform: translateY(-7px);
	background: rgba(255, 255, 255, 0.09);
}

.security-icon {
	font-size: 30px;
	margin-bottom: 13px;
}

.security-card h3 {
	font-size: 18px;
	margin-bottom: 8px;
}

.security-card p {
	color: #b9c8da;
	font-size: 13px;
	line-height: 1.7;
}

/* =========================================
           IMPORTANT STATEMENTS
        ========================================= */
.statements-section {
	background: #f5f8fc;
}

.statements {
	max-width: 1000px;
	margin: auto;
}

.statement {
	background: white;
	border: 1px solid #e1e8f0;
	border-radius: 14px;
	padding: 23px;
	margin-bottom: 14px;
	transition: 0.3s ease;
}

.statement:hover {
	transform: translateX(5px);
	border-color: #a9cef0;
	box-shadow: 0 10px 25px rgba(10, 50, 90, 0.06);
}

.statement h3 {
	color: #172b49;
	font-size: 17px;
	margin-bottom: 7px;
}

.statement p {
	color: #68788e;
	font-size: 13px;
	line-height: 1.7;
}

/* =========================================
           CTA
        ========================================= */
.cta {
	padding: 75px 7%;
	text-align: center;
	color: white;
	background: linear-gradient(135deg, #087df5, #064da5);
}

.cta h2 {
	font-size: 34px;
	margin-bottom: 10px;
}

.cta p {
	color: #dcecff;
	font-size: 14px;
	margin-bottom: 25px;
}

.cta-button {
	display: inline-block;
	padding: 13px 28px;
	background: white;
	color: #075dcc;
	text-decoration: none;
	border-radius: 9px;
	font-weight: bold;
	transition: 0.3s ease;
}

.cta-button:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
}

/* =========================================
           FOOTER
        ========================================= */
.footer {
	background: #041326;
	color: white;
	padding: 50px 7% 20px;
}

.footer-container {
	max-width: 1100px;
	margin: auto;
	display: grid;
	grid-template-columns: 2fr 1fr 1fr 1fr;
	gap: 35px;
}

.footer-column h3 {
	font-size: 17px;
	margin-bottom: 14px;
}

.footer-column p {
	color: #9dafc4;
	font-size: 13px;
	line-height: 1.7;
}

.footer-links {
	list-style: none;
}

.footer-links li {
	margin-bottom: 8px;
}

.footer-links a {
	color: #9dafc4;
	text-decoration: none;
	font-size: 13px;
	transition: 0.25s ease;
}

.footer-links a:hover {
	color: white;
	padding-left: 4px;
}

.footer-bottom {
	max-width: 1100px;
	margin: 35px auto 0;
	padding-top: 18px;
	border-top: 1px solid rgba(255, 255, 255, 0.08);
	display: flex;
	justify-content: space-between;
	gap: 20px;
	color: #7f91a8;
	font-size: 12px;
}

/* =========================================
           RESPONSIVE
        ========================================= */
@media ( max-width : 900px) {
	.about-wrapper {
		grid-template-columns: 1fr;
	}
	.features-grid {
		grid-template-columns: repeat(2, 1fr);
	}
	.steps {
		grid-template-columns: repeat(2, 1fr);
	}
	.security-grid {
		grid-template-columns: repeat(2, 1fr);
	}
	.footer-container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 600px) {
	.navbar {
		padding: 0 20px;
	}
	.logo {
		font-size: 16px;
	}
	.nav-links {
		gap: 12px;
	}
	.nav-links a {
		font-size: 11px;
	}
	.hero {
		min-height: 400px;
	}
	.hero h1 {
		font-size: 36px;
	}
	.hero p {
		font-size: 14px;
	}
	.section {
		padding: 60px 20px;
	}
	.section-heading h2 {
		font-size: 28px;
	}
	.about-image {
		height: 280px;
	}
	.features-grid, .steps, .security-grid, .footer-container {
		grid-template-columns: 1fr;
	}
	.footer-bottom {
		flex-direction: column;
	}
}
</style>

</head>


<body>


	<!-- =====================================================
     NAVBAR
===================================================== -->

	<nav class="navbar">

		<a href="index.jsp" class="logo"> 📅 Last Minute <span>Slot
				Booking</span>
		</a>


		<div class="nav-links">

			<a href="index.jsp"> Home </a> <a href="about.jsp" class="active">
				About </a> <a href="login.jsp"> Login </a> <a href="register.jsp">
				Register </a>

		</div>

	</nav>



	<!-- =====================================================
     HERO
===================================================== -->

	<section class="hero">

		<div class="hero-content">

			<div class="hero-badge">✦ About Our Platform</div>

			<h1>
				Making Last-Minute <span>Booking Simple</span>
			</h1>

			<p>Last Minute Slot Booking is a web-based platform designed to
				make discovering, claiming and managing available slots simple, fast
				and convenient.</p>

		</div>

	</section>



	<!-- =====================================================
     ABOUT SECTION
===================================================== -->

	<section class="section about-section">

		<div class="about-wrapper">


			<div class="about-image"></div>


			<div class="about-content">

				<h3>What is Last Minute Slot Booking?</h3>

				<p>Last Minute Slot Booking is designed to provide users with a
					simple way to discover available slots and claim suitable
					opportunities.</p>

				<p>Instead of going through a complicated process, users can
					create an account, login, explore available slots and manage their
					claims from one platform.</p>

				<p>Administrators can manage slot information while users can
					access available booking opportunities.</p>


				<div class="goal-box">

					<strong>Our Goal:</strong> To make slot discovery and booking
					faster, simpler and easier to manage.

				</div>

			</div>

		</div>

	</section>



	<!-- =====================================================
     FEATURES
===================================================== -->

	<section class="section features-section" id="features">

		<div class="section-heading">

			<div class="label">Platform Features</div>

			<h2>Everything You Need</h2>

			<p>The platform focuses on providing a simple, organized and
				user-friendly booking experience.</p>

		</div>


		<div class="features-grid">


			<div class="feature-card">

				<div class="feature-icon">⚡</div>

				<h3>Quick Booking</h3>

				<p>Find available slots and claim suitable opportunities through
					a simple process.</p>

			</div>


			<div class="feature-card">

				<div class="feature-icon">🔄</div>

				<h3>Availability Updates</h3>

				<p>Slot availability changes when slots are claimed or
					cancelled.</p>

			</div>


			<div class="feature-card">

				<div class="feature-icon">📋</div>

				<h3>Easy Management</h3>

				<p>Users can view and manage their claimed slots from one place.
				</p>

			</div>


			<div class="feature-card">

				<div class="feature-icon">🔐</div>

				<h3>Secure Access</h3>

				<p>Authentication and role-based access help organize platform
					functionality.</p>

			</div>


			<div class="feature-card">

				<div class="feature-icon">👨‍💼</div>

				<h3>Admin Management</h3>

				<p>Authorized administrators can create and manage available
					slots.</p>

			</div>


			<div class="feature-card">

				<div class="feature-icon">📱</div>

				<h3>Responsive Design</h3>

				<p>The interface is designed to work across desktop, tablet and
					mobile screens.</p>

			</div>

		</div>

	</section>



	<!-- =====================================================
     HOW IT WORKS
===================================================== -->

	<section class="section how-section" id="how-it-works">

		<div class="section-heading">

			<div class="label">Simple Process</div>

			<h2>How It Works</h2>

			<p>Get started with a simple four-step process.</p>

		</div>


		<div class="steps">


			<div class="step">

				<div class="step-number">01</div>

				<h3>Create Account</h3>

				<p>Register using your name, email and password.</p>

			</div>


			<div class="step">

				<div class="step-number">02</div>

				<h3>Login</h3>

				<p>Login to access the available platform features.</p>

			</div>


			<div class="step">

				<div class="step-number">03</div>

				<h3>Find a Slot</h3>

				<p>Browse available slots and review their details.</p>

			</div>


			<div class="step">

				<div class="step-number">04</div>

				<h3>Claim Slot</h3>

				<p>Select a suitable slot and manage your booking.</p>

			</div>

		</div>

	</section>



	<!-- =====================================================
     SECURITY
===================================================== -->

	<section class="section security-section" id="security">

		<div class="section-heading">

			<div class="label">Trust & Security</div>

			<h2>Built With Responsibility</h2>

			<p>Important practices that help provide a structured platform
				experience.</p>

		</div>


		<div class="security-grid">


			<div class="security-card">

				<div class="security-icon">🔐</div>

				<h3>Account Protection</h3>

				<p>Users should keep their login credentials private and avoid
					sharing account access.</p>

			</div>


			<div class="security-card">

				<div class="security-icon">🛡️</div>

				<h3>Role-Based Access</h3>

				<p>Different platform operations can be controlled according to
					user roles.</p>

			</div>


			<div class="security-card">

				<div class="security-icon">✓</div>

				<h3>Responsible Use</h3>

				<p>Users are expected to use the platform honestly and
					responsibly.</p>

			</div>

		</div>

	</section>



	<!-- =====================================================
     IMPORTANT STATEMENTS
===================================================== -->

	<section class="section statements-section" id="statements">

		<div class="section-heading">

			<div class="label">Important Information</div>

			<h2>Platform Statements</h2>

			<p>Please understand the following information when using the
				platform.</p>

		</div>


		<div class="statements">


			<div class="statement">

				<h3>🔒 Privacy Statement</h3>

				<p>Users should provide accurate information when creating an
					account. Account credentials should be kept confidential and should
					not be shared with other users.</p>

			</div>


			<div class="statement">

				<h3>📅 Booking Statement</h3>

				<p>Slot availability can change when another user claims or
					cancels a slot. A slot is subject to availability at the time of
					booking.</p>

			</div>


			<div class="statement">

				<h3>❌ Cancellation Statement</h3>

				<p>Eligible claimed slots may be cancelled using the available
					cancellation functionality. A cancelled slot may become available
					again.</p>

			</div>


			<div class="statement">

				<h3>⚖️ Fair Use Statement</h3>

				<p>Users must not attempt to misuse the platform, interfere with
					its functionality, access another user's account or perform
					unauthorized activities.</p>

			</div>


			<div class="statement">

				<h3>ℹ️ Availability Disclaimer</h3>

				<p>Slot information and availability may change without prior
					notice because of bookings, cancellations or administrator updates.
				</p>

			</div>


			<div class="statement">

				<h3>👨‍💼 Administrator Statement</h3>

				<p>Authorized administrators are responsible for adding and
					managing slot information. Users should review event name,
					location, time, duration and price before claiming a slot.</p>

			</div>


			<div class="statement">

				<h3>⚠️ Platform Disclaimer</h3>

				<p>This platform provides a digital interface for slot
					management and booking. Users should review the information
					displayed before making a booking decision.</p>

			</div>

		</div>

	</section>



	<!-- =====================================================
     CALL TO ACTION
===================================================== -->

	<section class="cta">

		<h2>Ready to Get Started?</h2>

		<p>Create your account and start exploring available slots.</p>

		<a href="register.jsp" class="cta-button"> Create Account → </a>

	</section>



	<!-- =====================================================
     FOOTER
===================================================== -->

	<footer class="footer">

		<div class="footer-container">


			<div class="footer-column">

				<h3>📅 Last Minute Slot Booking</h3>

				<p>A simple web-based platform designed to make discovering,
					claiming and managing available slots easier.</p>

			</div>


			<div class="footer-column">

				<h3>Quick Links</h3>

				<ul class="footer-links">

					<li><a href="index.jsp"> Home </a></li>

					<li><a href="about.jsp"> About </a></li>

					<li><a href="login.jsp"> Login </a></li>

					<li><a href="register.jsp"> Register </a></li>

				</ul>

			</div>


			<div class="footer-column">

				<h3>Explore</h3>

				<ul class="footer-links">

					<li><a href="#features"> Features </a></li>

					<li><a href="#how-it-works"> How It Works </a></li>

					<li><a href="#security"> Security </a></li>

					<li><a href="#statements"> Statements </a></li>

				</ul>

			</div>


			<div class="footer-column">

				<h3>Contact</h3>

				<p>📧 support@agwanajay28@gmail.com</p>

				<p>🕐 Monday - Saturday</p>

			</div>

		</div>


		<div class="footer-bottom">

			<span> © 2026 Last Minute Slot Booking. All Rights Reserved. </span>

			<span> Built for a better booking experience. </span>

		</div>

	</footer>


</body>

</html>