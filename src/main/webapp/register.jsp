<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Create Account | Last Minute Slot Booking</title>

    <style>

        /* =====================================================
           GLOBAL
        ===================================================== */

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
            background: #f8fafc;
            color: #0f172a;
            min-height: 100vh;
            overflow-x: hidden;
            animation: pageFade 0.5s ease-in-out;
        }

        @keyframes pageFade {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }


        /* =====================================================
           NAVBAR
        ===================================================== */

        .navbar {
            height: 72px;
            background: #0f172a;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;

            box-shadow: 0 4px 20px rgba(15, 23, 42, 0.18);

            position: relative;
            z-index: 10;

            animation: navSlide 0.6s ease-out;
        }

        @keyframes navSlide {

            from {
                transform: translateY(-100%);
                opacity: 0;
            }

            to {
                transform: translateY(0);
                opacity: 1;
            }

        }


        /* LOGO */

        .logo {
            color: #ffffff;
            font-size: 22px;
            font-weight: 700;

            text-decoration: none;
            letter-spacing: 0.3px;

            white-space: nowrap;
        }

        .logo span {
            color: #3b82f6;
        }


        /* NAV LINKS */

        .nav-links {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .nav-links a {
            color: #cbd5e1;

            text-decoration: none;
            font-size: 15px;
            font-weight: 500;

            position: relative;

            transition: 0.25s ease;
        }

        .nav-links a::after {
            content: "";

            position: absolute;

            width: 0;
            height: 2px;

            background: #3b82f6;

            left: 0;
            bottom: -7px;

            border-radius: 5px;

            transition: 0.25s ease;
        }

        .nav-links a:hover {
            color: #ffffff;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .nav-links .active {
            color: #ffffff;
        }

        .nav-links .active::after {
            width: 100%;
        }


        /* =====================================================
           REGISTER SECTION
        ===================================================== */

        .register-section {
            min-height: calc(100vh - 72px);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 35px 20px 45px;
        }


        /* =====================================================
           REGISTER CONTAINER
        ===================================================== */

        .register-container {

            width: 1050px;
            max-width: 100%;

            background: #ffffff;

            border-radius: 22px;

            overflow: hidden;

            display: grid;

            grid-template-columns: 48% 52%;

            box-shadow:
                0 20px 60px rgba(15, 23, 42, 0.12);

            border: 1px solid #e2e8f0;

            animation: registerCard 0.7s ease-out;
        }

        @keyframes registerCard {

            from {
                opacity: 0;
                transform: translateY(30px) scale(0.98);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }

        }


        /* =====================================================
           LEFT SIDE
        ===================================================== */

        .register-left {

            position: relative;

            background:
                linear-gradient(
                    135deg,
                    rgba(15, 23, 42, 0.95),
                    rgba(30, 64, 175, 0.88)
                ),
                url("https://static.vecteezy.com/system/resources/thumbnails/071/825/744/small_2x/illuminated-stadium-night-view-with-lush-green-field-neural-network-photo.jpg");

            background-size: cover;
            background-position: center;

            padding: 45px;

            color: #ffffff;

            display: flex;
            flex-direction: column;
            justify-content: center;

            min-height: 540px;

            animation: imageZoom 1s ease-out;
        }

        @keyframes imageZoom {

            from {
                background-size: 115%;
                opacity: 0.7;
            }

            to {
                background-size: cover;
                opacity: 1;
            }

        }


        /* Decorative circles */

        .register-left::before {

            content: "";

            position: absolute;

            width: 230px;
            height: 230px;

            border-radius: 50%;

            background: rgba(59, 130, 246, 0.16);

            top: -80px;
            left: -80px;

            animation: circleMove 7s ease-in-out infinite;
        }

        .register-left::after {

            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            border-radius: 50%;

            border: 1px solid rgba(255, 255, 255, 0.14);

            right: -70px;
            bottom: -60px;

            animation: circleMoveReverse 8s ease-in-out infinite;
        }

        @keyframes circleMove {

            0% {
                transform: translate(0, 0);
            }

            50% {
                transform: translate(25px, 20px);
            }

            100% {
                transform: translate(0, 0);
            }

        }

        @keyframes circleMoveReverse {

            0% {
                transform: translate(0, 0);
            }

            50% {
                transform: translate(-20px, -25px);
            }

            100% {
                transform: translate(0, 0);
            }

        }


        /* =====================================================
           LEFT CONTENT
        ===================================================== */

        .left-content {
            position: relative;
            z-index: 2;
        }


        /* ICON */

        .register-icon {

            width: 68px;
            height: 68px;

            border-radius: 18px;

            background: rgba(255, 255, 255, 0.12);

            border: 1px solid rgba(255, 255, 255, 0.22);

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 32px;

            margin-bottom: 20px;

            backdrop-filter: blur(8px);

            animation:
                iconPop 0.7s ease-out,
                iconFloat 3s ease-in-out 1s infinite;
        }

        @keyframes iconPop {

            from {
                opacity: 0;
                transform: scale(0.5);
            }

            70% {
                transform: scale(1.08);
            }

            to {
                opacity: 1;
                transform: scale(1);
            }

        }

        @keyframes iconFloat {

            0% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-6px);
            }

            100% {
                transform: translateY(0);
            }

        }


        /* HEADING */

        .register-left h1 {

            font-size: 36px;

            line-height: 1.2;

            margin-bottom: 13px;

            animation:
                textSlideLeft 0.8s ease-out 0.15s both;
        }

        .register-left h1 span {
            color: #60a5fa;
        }

        .register-left p {

            color: #dbeafe;

            line-height: 1.6;

            font-size: 14px;

            max-width: 410px;

            animation:
                textSlideLeft 0.8s ease-out 0.25s both;
        }

        @keyframes textSlideLeft {

            from {
                opacity: 0;
                transform: translateX(-25px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }

        }


        /* =====================================================
           FEATURES
        ===================================================== */

        .register-features {

            margin-top: 28px;

            display: flex;
            flex-direction: column;

            gap: 13px;
        }

        .feature {

            display: flex;
            align-items: center;

            gap: 12px;

            color: #e2e8f0;

            font-size: 14px;

            opacity: 0;

            animation:
                featureAppear 0.7s ease-out forwards;
        }

        .feature:nth-child(1) {
            animation-delay: 0.4s;
        }

        .feature:nth-child(2) {
            animation-delay: 0.55s;
        }

        .feature:nth-child(3) {
            animation-delay: 0.7s;
        }

        .feature:nth-child(4) {
            animation-delay: 0.85s;
        }

        @keyframes featureAppear {

            from {
                opacity: 0;
                transform: translateX(-20px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }

        }


        .check {

            width: 24px;
            height: 24px;

            border-radius: 50%;

            background: #2563eb;

            color: #ffffff;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 12px;

            flex-shrink: 0;

            box-shadow:
                0 4px 10px rgba(37, 99, 235, 0.35);

            transition: 0.25s ease;
        }

        .feature:hover .check {

            transform:
                scale(1.12)
                rotate(8deg);
        }


        /* =====================================================
           RIGHT SIDE
        ===================================================== */

        .register-right {

            padding: 40px 50px;

            display: flex;
            flex-direction: column;
            justify-content: center;

            background: #ffffff;
        }


        /* =====================================================
           FORM HEADER
        ===================================================== */

        .form-icon {

            width: 58px;
            height: 58px;

            border-radius: 16px;

            background: #eff6ff;

            color: #2563eb;

            border: 1px solid #dbeafe;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 26px;

            margin-bottom: 15px;

            animation:
                formIconPop 0.7s ease-out;
        }

        @keyframes formIconPop {

            from {
                opacity: 0;
                transform: scale(0.5);
            }

            70% {
                transform: scale(1.08);
            }

            to {
                opacity: 1;
                transform: scale(1);
            }

        }


        .register-right h2 {

            font-size: 29px;

            color: #0f172a;

            margin-bottom: 6px;

            animation:
                headingSlide 0.7s ease-out 0.15s both;
        }

        .register-subtitle {

            color: #64748b;

            font-size: 14px;

            margin-bottom: 23px;

            animation:
                headingSlide 0.7s ease-out 0.25s both;
        }

        @keyframes headingSlide {

            from {
                opacity: 0;
                transform: translateX(20px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }

        }


        /* =====================================================
           FORM
        ===================================================== */

        .register-form {
            width: 100%;
        }

        .input-group {

            margin-bottom: 15px;

            opacity: 0;

            animation:
                inputAppear 0.7s ease-out forwards;
        }

        .input-group:nth-child(1) {
            animation-delay: 0.3s;
        }

        .input-group:nth-child(2) {
            animation-delay: 0.4s;
        }

        .input-group:nth-child(3) {
            animation-delay: 0.5s;
        }


        /* LABEL */

        .input-group label {

            display: block;

            font-size: 13px;

            font-weight: 600;

            color: #334155;

            margin-bottom: 7px;
        }


        /* INPUT BOX */

        .input-box {
            position: relative;
        }


        /* INPUT ICON */

        .input-box span {

            position: absolute;

            left: 15px;
            top: 50%;

            transform: translateY(-50%);

            font-size: 16px;

            color: #94a3b8;

            transition: 0.25s ease;

            pointer-events: none;

            z-index: 2;
        }


        /* INPUT */

        .input-box input {

            width: 100%;

            height: 49px;

            border: 1px solid #cbd5e1;

            border-radius: 10px;

            padding: 0 44px;

            outline: none;

            font-size: 14px;

            color: #0f172a;

            background: #f8fafc;

            transition:
                border-color 0.25s ease,
                box-shadow 0.25s ease,
                transform 0.25s ease,
                background 0.25s ease;
        }

        .input-box input::placeholder {
            color: #94a3b8;
        }

        .input-box input:hover {
            border-color: #93c5fd;
        }

        .input-box input:focus {

            border-color: #2563eb;

            background: #ffffff;

            transform: translateY(-1px);

            box-shadow:
                0 0 0 4px rgba(37, 99, 235, 0.10);
        }

        .input-box input:focus + span {
            color: #2563eb;
        }

        @keyframes inputAppear {

            from {
                opacity: 0;
                transform: translateY(15px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }


        /* =====================================================
           PASSWORD TOGGLE
        ===================================================== */

        .password-toggle {

            position: absolute;

            right: 13px;
            top: 50%;

            transform: translateY(-50%);

            border: none;

            background: transparent;

            cursor: pointer;

            font-size: 16px;

            color: #64748b;

            transition: 0.2s ease;

            z-index: 3;
        }

        .password-toggle:hover {

            color: #2563eb;

            transform:
                translateY(-50%)
                scale(1.12);
        }


        /* =====================================================
           REGISTER BUTTON
        ===================================================== */

        .register-submit {

            width: 100%;

            height: 50px;

            border: none;

            border-radius: 10px;

            background:
                linear-gradient(
                    135deg,
                    #2563eb,
                    #1d4ed8
                );

            color: #ffffff;

            font-size: 15px;

            font-weight: 700;

            cursor: pointer;

            margin-top: 6px;

            box-shadow:
                0 8px 20px rgba(37, 99, 235, 0.25);

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease,
                background 0.25s ease;

            animation:
                buttonAppear 0.8s ease-out 0.6s both;
        }

        .register-submit:hover {

            transform: translateY(-2px);

            background:
                linear-gradient(
                    135deg,
                    #1d4ed8,
                    #1e40af
                );

            box-shadow:
                0 12px 26px rgba(37, 99, 235, 0.35);
        }

        .register-submit:active {

            transform:
                translateY(0)
                scale(0.98);
        }

        @keyframes buttonAppear {

            from {
                opacity: 0;
                transform: translateY(15px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }


        /* =====================================================
           LOGIN LINK
        ===================================================== */

        .login-text {

            text-align: center;

            font-size: 14px;

            color: #64748b;

            margin-top: 18px;

            animation:
                fadeUp 0.8s ease-out 0.75s both;
        }

        .login-text a {

            color: #2563eb;

            font-weight: 700;

            text-decoration: none;

            transition: 0.25s ease;
        }

        .login-text a:hover {

            color: #1d4ed8;

            text-decoration: underline;
        }


        /* =====================================================
           SECURITY NOTE
        ===================================================== */

        .security-note {

            margin-top: 17px;

            padding: 11px 13px;

            border-radius: 9px;

            background: #f0f7ff;

            border: 1px solid #dbeafe;

            color: #475569;

            font-size: 11px;

            text-align: center;

            animation:
                fadeUp 0.8s ease-out 0.9s both;
        }

        @keyframes fadeUp {

            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }


        /* =====================================================
           TABLET
        ===================================================== */

        @media (max-width: 850px) {

            .register-section {

                align-items: flex-start;

                padding:
                    25px
                    20px
                    40px;
            }

            .register-container {

                grid-template-columns: 1fr;

                max-width: 560px;
            }

            .register-left {

                min-height: 310px;

                padding: 35px;
            }

            .register-left h1 {
                font-size: 30px;
            }

            .register-features {

                margin-top: 22px;

                gap: 10px;
            }

            .register-right {

                padding: 35px;
            }

        }


        /* =====================================================
           MOBILE
        ===================================================== */

        @media (max-width: 600px) {

            .navbar {

                height: auto;

                min-height: 65px;

                padding:
                    14px 18px;

                flex-direction: column;

                gap: 12px;
            }

            .logo {
                font-size: 18px;
            }

            .nav-links {

                gap: 17px;

                flex-wrap: wrap;

                justify-content: center;
            }

            .nav-links a {
                font-size: 12px;
            }

            .register-section {

                min-height: auto;

                padding:
                    18px
                    12px
                    30px;
            }

            .register-container {

                border-radius: 18px;
            }

            .register-left {

                min-height: 290px;

                padding:
                    30px
                    25px;
            }

            .register-icon {

                width: 55px;
                height: 55px;

                font-size: 26px;

                margin-bottom: 15px;
            }

            .register-left h1 {
                font-size: 27px;
            }

            .register-left p {
                font-size: 13px;
            }

            .register-features {

                margin-top: 18px;

                gap: 8px;
            }

            .feature {
                font-size: 12px;
            }

            .check {

                width: 21px;
                height: 21px;

                font-size: 11px;
            }

            .register-right {

                padding:
                    30px
                    22px;
            }

            .form-icon {

                width: 52px;
                height: 52px;

                font-size: 24px;
            }

            .register-right h2 {
                font-size: 25px;
            }

            .register-subtitle {
                margin-bottom: 20px;
            }

        }


        /* =====================================================
           SMALL HEIGHT LAPTOP
        ===================================================== */

        @media (min-width: 851px) and (max-height: 800px) {

            .register-section {

                align-items: flex-start;

                padding-top: 20px;

                padding-bottom: 30px;
            }

            .register-left {

                padding:
                    32px
                    40px;

                min-height: 500px;
            }

            .register-right {

                padding:
                    30px
                    45px;
            }

            .register-icon {
                margin-bottom: 15px;
            }

            .register-left h1 {
                font-size: 32px;
            }

            .register-features {

                margin-top: 20px;

                gap: 10px;
            }

        }


        /* =====================================================
           REDUCED MOTION
        ===================================================== */

        @media (prefers-reduced-motion: reduce) {

            *,
            *::before,
            *::after {

                animation-duration: 0.01ms !important;

                animation-iteration-count: 1 !important;

                transition-duration: 0.01ms !important;
            }

        }

    </style>

</head>


<body>


    <!-- =====================================================
         NAVBAR
    ===================================================== -->

    <nav class="navbar">

        <a href="index.jsp" class="logo">
            📅 Last Minute <span>Slot Booking</span>
        </a>

        <div class="nav-links">

            <a href="index.jsp">
                Home
            </a>

            <a href="about.jsp">
                About
            </a>

            <a href="login.jsp">
                Login
            </a>

            <a href="register.jsp" class="active">
                Register
            </a>

        </div>

    </nav>


    <!-- =====================================================
         REGISTER SECTION
    ===================================================== -->

    <section class="register-section">

        <div class="register-container">


            <!-- =================================================
                 LEFT SIDE
            ================================================= -->

            <div class="register-left">

                <div class="left-content">

                    <div class="register-icon">
                        📝
                    </div>

                    <h1>
                        Join <span>Last Minute</span>
                    </h1>

                    <p>
                        Create your account and start booking available
                        slots quickly and easily. Never miss an
                        opportunity again.
                    </p>


                    <div class="register-features">

                        <div class="feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                Quick and easy registration
                            </span>

                        </div>


                        <div class="feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                View available slots in real time
                            </span>

                        </div>


                        <div class="feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                Book your preferred slots
                            </span>

                        </div>


                        <div class="feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                Manage your bookings easily
                            </span>

                        </div>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 RIGHT SIDE
            ================================================= -->

            <div class="register-right">

                <div class="form-icon">
                    👤
                </div>

                <h2>
                    Create Account
                </h2>

                <p class="register-subtitle">
                    Register now and start booking your slots
                </p>


                <!-- =================================================
                     REGISTER FORM
                ================================================= -->

                <form
                    action="register"
                    method="post"
                    class="register-form"
                >


                    <!-- NAME -->

                    <div class="input-group">

                        <label>
                            Full Name
                        </label>

                        <div class="input-box">

                            <input
                                type="text"
                                name="name"
                                placeholder="Enter your full name"
                                autocomplete="name"
                                required
                            >

                            <span>
                                👤
                            </span>

                        </div>

                    </div>


                    <!-- EMAIL -->

                    <div class="input-group">

                        <label>
                            Email Address
                        </label>

                        <div class="input-box">

                            <input
                                type="email"
                                name="email"
                                placeholder="Enter your email"
                                autocomplete="email"
                                required
                            >

                            <span>
                                ✉️
                            </span>

                        </div>

                    </div>


                    <!-- PASSWORD -->

                    <div class="input-group">

                        <label>
                            Password
                        </label>

                        <div class="input-box">

                            <input
                                type="password"
                                name="password"
                                id="password"
                                placeholder="Create a password"
                                autocomplete="new-password"
                                required
                            >

                            <span>
                                🔒
                            </span>

                            <button
                                type="button"
                                class="password-toggle"
                                onclick="togglePassword()"
                                aria-label="Show or hide password"
                            >
                                👁
                            </button>

                        </div>

                    </div>


                    <!-- SUBMIT -->

                    <button
                        type="submit"
                        class="register-submit"
                    >
                        Create Account &nbsp; →
                    </button>

                </form>


                <!-- LOGIN -->

                <p class="login-text">

                    Already have an account?

                    <a href="login.jsp">
                        Login here
                    </a>

                </p>


                <!-- SECURITY -->

                <div class="security-note">

                    🔐 &nbsp;
                    Your account information is securely stored.

                </div>

            </div>

        </div>

    </section>


    <!-- =====================================================
         PASSWORD TOGGLE
    ===================================================== -->

    <script>

        function togglePassword() {

            const password =
                document.getElementById("password");

            const button =
                document.querySelector(".password-toggle");


            if (password.type === "password") {

                password.type = "text";

                button.innerHTML = "🙈";

            } else {

                password.type = "password";

                button.innerHTML = "👁";

            }

        }

    </script>


</body>
</html>