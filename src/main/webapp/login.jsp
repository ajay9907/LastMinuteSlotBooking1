
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>Login | Last Minute Slot Booking</title>

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
            min-height: 100vh;
            background: #f8fafc;
            color: #0f172a;
            overflow-x: hidden;

            animation: pageFade 0.6s ease-in-out;
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

            box-shadow:
                0 4px 20px rgba(15, 23, 42, 0.18);

            position: relative;
            z-index: 10;

            animation:
                navSlide 0.6s ease-out;
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


        /* =====================================================
           LOGO
        ===================================================== */

        .logo {

            display: flex;
            align-items: center;

            gap: 9px;

            color: #ffffff;

            font-size: 21px;

            font-weight: 700;

            text-decoration: none;

            white-space: nowrap;
        }

        .logo-icon {
            font-size: 25px;
        }

        .logo-text span {
            color: #3b82f6;
        }


        /* =====================================================
           NAV LINKS
        ===================================================== */

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

        .nav-links a:hover {

            color: #ffffff;
        }

        .nav-links a::after {

            content: "";

            position: absolute;

            left: 0;
            bottom: -8px;

            width: 0;
            height: 2px;

            background: #3b82f6;

            border-radius: 10px;

            transition: 0.25s ease;
        }

        .nav-links a:hover::after {

            width: 100%;
        }

        /* IMPORTANT:
           Login is the active page */

        .nav-links .active {

            color: #ffffff;
        }

        .nav-links .active::after {

            width: 100%;
        }


        /* =====================================================
           LOGIN WRAPPER
        ===================================================== */

        .login-wrapper {

            min-height:
                calc(100vh - 72px);

            display: flex;

            align-items: center;

            justify-content: center;

            padding:
                35px 20px 45px;
        }


        /* =====================================================
           LOGIN CONTAINER
        ===================================================== */

        .login-container {

            width: 1050px;

            max-width: 100%;

            min-height: 540px;

            background: #ffffff;

            border-radius: 22px;

            overflow: hidden;

            display: grid;

            grid-template-columns:
                48% 52%;

            border:
                1px solid #e2e8f0;

            box-shadow:
                0 20px 60px
                rgba(15, 23, 42, 0.12);

            animation:
                loginCard 0.7s ease-out;
        }

        @keyframes loginCard {

            from {

                opacity: 0;

                transform:
                    translateY(30px)
                    scale(0.98);
            }

            to {

                opacity: 1;

                transform:
                    translateY(0)
                    scale(1);
            }

        }


        /* =====================================================
           LEFT PANEL
        ===================================================== */

        .login-left {

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

            color: #ffffff;

            padding: 45px;

            display: flex;

            flex-direction: column;

            justify-content: center;

            min-height: 540px;

            animation:
                imageZoom 1s ease-out;
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


        /* =====================================================
           LEFT DECORATION
        ===================================================== */

        .login-left::before {

            content: "";

            position: absolute;

            width: 220px;
            height: 220px;

            border-radius: 50%;

            background:
                rgba(59, 130, 246, 0.15);

            top: -75px;
            left: -75px;

            animation:
                circleMove 7s ease-in-out infinite;
        }

        .login-left::after {

            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            border-radius: 50%;

            border:
                1px solid
                rgba(255, 255, 255, 0.15);

            right: -70px;
            bottom: -60px;

            animation:
                circleMoveReverse 8s ease-in-out infinite;
        }

        @keyframes circleMove {

            0% {
                transform:
                    translate(0, 0);
            }

            50% {
                transform:
                    translate(25px, 20px);
            }

            100% {
                transform:
                    translate(0, 0);
            }

        }

        @keyframes circleMoveReverse {

            0% {
                transform:
                    translate(0, 0);
            }

            50% {
                transform:
                    translate(-20px, -25px);
            }

            100% {
                transform:
                    translate(0, 0);
            }

        }


        /* =====================================================
           LEFT CONTENT
        ===================================================== */

        .left-content {

            position: relative;

            z-index: 2;

            max-width: 430px;
        }


        /* =====================================================
           LEFT ICON
        ===================================================== */

        .left-icon {

            width: 68px;

            height: 68px;

            border-radius: 18px;

            background:
                rgba(59, 130, 246, 0.95);

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 31px;

            margin-bottom: 20px;

            box-shadow:
                0 10px 30px
                rgba(0, 0, 0, 0.25);

            animation:
                floatingIcon 3s ease-in-out infinite;
        }

        @keyframes floatingIcon {

            0% {
                transform:
                    translateY(0);
            }

            50% {
                transform:
                    translateY(-7px);
            }

            100% {
                transform:
                    translateY(0);
            }

        }


        /* =====================================================
           LEFT HEADING
        ===================================================== */

        .login-left h1 {

            font-size: 36px;

            line-height: 1.2;

            margin-bottom: 14px;

            animation:
                textSlideLeft
                0.8s
                ease-out
                0.15s
                both;
        }

        .login-left h1 span {

            color: #60a5fa;
        }

        .login-left p {

            color: #dbeafe;

            font-size: 14px;

            line-height: 1.65;

            max-width: 410px;

            margin-bottom: 27px;

            animation:
                textSlideLeft
                0.8s
                ease-out
                0.25s
                both;
        }

        @keyframes textSlideLeft {

            from {

                opacity: 0;

                transform:
                    translateX(-25px);
            }

            to {

                opacity: 1;

                transform:
                    translateX(0);
            }

        }


        /* =====================================================
           FEATURES
        ===================================================== */

        .left-features {

            display: flex;

            flex-direction: column;

            gap: 12px;
        }

        .left-feature {

            display: flex;

            align-items: center;

            gap: 12px;

            color: #e2e8f0;

            font-size: 14px;

            opacity: 0;

            animation:
                featureSlide
                0.7s
                ease-out
                forwards;
        }

        .left-feature:nth-child(1) {
            animation-delay: 0.4s;
        }

        .left-feature:nth-child(2) {
            animation-delay: 0.55s;
        }

        .left-feature:nth-child(3) {
            animation-delay: 0.7s;
        }

        .left-feature:nth-child(4) {
            animation-delay: 0.85s;
        }

        @keyframes featureSlide {

            from {

                opacity: 0;

                transform:
                    translateX(-20px);
            }

            to {

                opacity: 1;

                transform:
                    translateX(0);
            }

        }

        .check {

            width: 24px;

            height: 24px;

            border-radius: 50%;

            background: #2563eb;

            display: flex;

            align-items: center;

            justify-content: center;

            color: #ffffff;

            font-size: 12px;

            flex-shrink: 0;

            transition:
                0.25s ease;
        }

        .left-feature:hover .check {

            transform:
                scale(1.12)
                rotate(8deg);
        }


        /* =====================================================
           RIGHT PANEL
        ===================================================== */

        .login-right {

            padding:
                40px 50px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #ffffff;
        }


        /* =====================================================
           LOGIN FORM
        ===================================================== */

        .login-form {

            width: 100%;

            max-width: 410px;
        }


        /* =====================================================
           FORM ICON
        ===================================================== */

        .form-icon {

            width: 58px;

            height: 58px;

            border-radius: 16px;

            background: #eff6ff;

            border:
                1px solid #dbeafe;

            color: #2563eb;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 27px;

            margin-bottom: 15px;

            animation:
                iconPop 0.7s ease-out;
        }

        @keyframes iconPop {

            from {

                opacity: 0;

                transform:
                    scale(0.5);
            }

            70% {

                transform:
                    scale(1.08);
            }

            to {

                opacity: 1;

                transform:
                    scale(1);
            }

        }


        /* =====================================================
           FORM HEADING
        ===================================================== */

        .login-form h2 {

            font-size: 29px;

            color: #0f172a;

            margin-bottom: 6px;

            animation:
                textSlide
                0.7s
                ease-out
                0.15s
                both;
        }

        .subtitle {

            color: #64748b;

            font-size: 14px;

            margin-bottom: 24px;

            animation:
                textSlide
                0.7s
                ease-out
                0.25s
                both;
        }

        @keyframes textSlide {

            from {

                opacity: 0;

                transform:
                    translateX(20px);
            }

            to {

                opacity: 1;

                transform:
                    translateX(0);
            }

        }


        /* =====================================================
           INPUT GROUP
        ===================================================== */

        .input-group {

            margin-bottom: 16px;

            opacity: 0;

            animation:
                inputSlide
                0.7s
                ease-out
                forwards;
        }

        .input-group:nth-child(1) {
            animation-delay: 0.35s;
        }

        .input-group:nth-child(2) {
            animation-delay: 0.45s;
        }

        @keyframes inputSlide {

            from {

                opacity: 0;

                transform:
                    translateY(15px);
            }

            to {

                opacity: 1;

                transform:
                    translateY(0);
            }

        }

        .input-group label {

            display: block;

            font-size: 13px;

            font-weight: 600;

            color: #334155;

            margin-bottom: 7px;
        }


        /* =====================================================
           INPUT BOX
        ===================================================== */

        .input-box {

            position: relative;
        }

        .input-icon {

            position: absolute;

            left: 15px;

            top: 50%;

            transform:
                translateY(-50%);

            font-size: 16px;

            color: #94a3b8;

            pointer-events: none;

            z-index: 2;
        }

        .input-box input {

            width: 100%;

            height: 49px;

            border:
                1px solid #cbd5e1;

            border-radius: 10px;

            padding:
                0 45px;

            outline: none;

            font-size: 14px;

            color: #0f172a;

            background: #f8fafc;

            transition:
                border-color 0.25s ease,
                box-shadow 0.25s ease,
                background 0.25s ease,
                transform 0.25s ease;
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

            transform:
                translateY(-1px);

            box-shadow:
                0 0 0 4px
                rgba(37, 99, 235, 0.10);
        }


        /* =====================================================
           PASSWORD TOGGLE
        ===================================================== */

        .password-toggle {

            position: absolute;

            right: 13px;

            top: 50%;

            transform:
                translateY(-50%);

            border: none;

            background: transparent;

            cursor: pointer;

            color: #64748b;

            font-size: 16px;

            transition:
                0.2s ease;

            z-index: 3;
        }

        .password-toggle:hover {

            color: #2563eb;

            transform:
                translateY(-50%)
                scale(1.12);
        }


        /* =====================================================
           OPTIONS
        ===================================================== */

        .form-options {

            display: flex;

            align-items: center;

            justify-content: space-between;

            margin:
                5px 0 22px;

            font-size: 13px;
        }

        .remember {

            display: flex;

            align-items: center;

            gap: 7px;

            color: #64748b;

            cursor: pointer;
        }

        .remember input {

            accent-color: #2563eb;

            cursor: pointer;
        }

        .forgot {

            color: #2563eb;

            text-decoration: none;

            font-weight: 600;
        }

        .forgot:hover {

            text-decoration: underline;

            color: #1d4ed8;
        }


        /* =====================================================
           LOGIN BUTTON
        ===================================================== */

        .login-submit {

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

            box-shadow:
                0 8px 20px
                rgba(37, 99, 235, 0.25);

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease,
                background 0.25s ease;

            animation:
                buttonAppear
                0.8s
                ease-out
                0.6s
                both;
        }

        .login-submit:hover {

            transform:
                translateY(-2px);

            background:
                linear-gradient(
                    135deg,
                    #1d4ed8,
                    #1e40af
                );

            box-shadow:
                0 12px 27px
                rgba(37, 99, 235, 0.35);
        }

        .login-submit:active {

            transform:
                translateY(0)
                scale(0.98);
        }

        @keyframes buttonAppear {

            from {

                opacity: 0;

                transform:
                    translateY(15px);
            }

            to {

                opacity: 1;

                transform:
                    translateY(0);
            }

        }


        /* =====================================================
           DIVIDER
        ===================================================== */

        .divider {

            display: flex;

            align-items: center;

            gap: 12px;

            margin:
                23px 0;

            color: #94a3b8;

            font-size: 12px;
        }

        .divider::before,
        .divider::after {

            content: "";

            height: 1px;

            flex: 1;

            background: #e2e8f0;
        }


        /* =====================================================
           REGISTER
        ===================================================== */

        .register-text {

            text-align: center;

            color: #64748b;

            font-size: 14px;

            animation:
                fadeUp
                0.8s
                ease-out
                0.75s
                both;
        }

        .register-text a {

            color: #2563eb;

            font-weight: 700;

            text-decoration: none;
        }

        .register-text a:hover {

            color: #1d4ed8;

            text-decoration: underline;
        }


        /* =====================================================
           SECURITY
        ===================================================== */

        .secure-login {

            text-align: center;

            margin-top: 17px;

            padding: 9px;

            border-radius: 8px;

            background: #f0f7ff;

            border:
                1px solid #dbeafe;

            color: #64748b;

            font-size: 11px;

            animation:
                fadeUp
                0.8s
                ease-out
                0.9s
                both;
        }

        @keyframes fadeUp {

            from {

                opacity: 0;

                transform:
                    translateY(12px);
            }

            to {

                opacity: 1;

                transform:
                    translateY(0);
            }

        }


        /* =====================================================
           TABLET
        ===================================================== */

        @media (max-width: 850px) {

            .login-wrapper {

                align-items: flex-start;

                padding:
                    25px 20px 40px;
            }

            .login-container {

                grid-template-columns: 1fr;

                max-width: 560px;
            }

            .login-left {

                min-height: 300px;

                padding: 35px;
            }

            .login-left h1 {

                font-size: 30px;
            }

            .left-features {

                gap: 9px;
            }

            .login-right {

                padding:
                    35px;
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

                gap: 16px;

                flex-wrap: wrap;

                justify-content: center;
            }

            .nav-links a {

                font-size: 12px;
            }

            .login-wrapper {

                min-height: auto;

                padding:
                    18px 12px 30px;
            }

            .login-container {

                border-radius: 18px;
            }

            .login-left {

                min-height: 285px;

                padding:
                    30px 25px;
            }

            .left-icon {

                width: 55px;

                height: 55px;

                font-size: 25px;

                margin-bottom: 15px;
            }

            .login-left h1 {

                font-size: 27px;
            }

            .login-left p {

                font-size: 13px;

                margin-bottom: 20px;
            }

            .left-feature {

                font-size: 12px;
            }

            .check {

                width: 21px;

                height: 21px;

                font-size: 10px;
            }

            .login-right {

                padding:
                    30px 22px;
            }

            .form-icon {

                width: 52px;

                height: 52px;

                font-size: 23px;
            }

            .login-form h2 {

                font-size: 25px;
            }

            .subtitle {

                font-size: 13px;

                margin-bottom: 20px;
            }

            .form-options {

                font-size: 12px;
            }

        }


        /* =====================================================
           REDUCED MOTION
        ===================================================== */

        @media (prefers-reduced-motion: reduce) {

            *,
            *::before,
            *::after {

                animation-duration:
                    0.01ms !important;

                animation-iteration-count:
                    1 !important;

                transition-duration:
                    0.01ms !important;
            }

        }

    </style>

</head>


<body>


    <!-- =====================================================
         ONLY ONE NAVBAR
    ===================================================== -->

    <nav class="navbar">

        <a href="index.jsp" class="logo">

            <span class="logo-icon">
                📅
            </span>

            <span class="logo-text">
                Last Minute
                <span>Slot Booking</span>
            </span>

        </a>


        <div class="nav-links">

            <a href="index.jsp">
                Home
            </a>

            <a href="about.jsp">
                About
            </a>

            <!-- LOGIN IS ACTIVE -->
            <a href="login.jsp" class="active">
                Login
            </a>

            <a href="register.jsp">
                Register
            </a>

        </div>

    </nav>


    <!-- =====================================================
         LOGIN WRAPPER
    ===================================================== -->

    <main class="login-wrapper">


        <!-- =================================================
             LOGIN CONTAINER
        ================================================= -->

        <div class="login-container">


            <!-- =============================================
                 LEFT PANEL
            ============================================== -->

            <section class="login-left">

                <div class="left-content">


                    <div class="left-icon">
                        🔐
                    </div>


                    <h1>
                        Welcome to
                        <span>Last Minute</span>
                    </h1>


                    <p>
                        Login to your account and manage your
                        bookings quickly and easily. Find available
                        slots and book them before they are gone.
                    </p>


                    <div class="left-features">


                        <div class="left-feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                Quick and secure login
                            </span>

                        </div>


                        <div class="left-feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                View available slots
                            </span>

                        </div>


                        <div class="left-feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                Manage your bookings
                            </span>

                        </div>


                        <div class="left-feature">

                            <div class="check">
                                ✓
                            </div>

                            <span>
                                Simple and easy experience
                            </span>

                        </div>


                    </div>

                </div>

            </section>


            <!-- =============================================
                 RIGHT LOGIN PANEL
            ============================================== -->

            <section class="login-right">


                <div class="login-form">


                    <div class="form-icon">
                        👤
                    </div>


                    <h2>
                        Welcome Back
                    </h2>


                    <p class="subtitle">
                        Login to continue to your account
                    </p>


                    <!-- =====================================
                         LOGIN FORM
                    ====================================== -->

                    <form
                        action="login"
                        method="post"
                    >


                        <!-- EMAIL -->

                        <div class="input-group">

                            <label for="email">
                                Email Address
                            </label>


                            <div class="input-box">

                                <span class="input-icon">
                                    ✉
                                </span>


                                <input
                                    type="email"
                                    id="email"
                                    name="email"
                                    placeholder="Enter your email"
                                    autocomplete="email"
                                    required
                                >

                            </div>

                        </div>


                        <!-- PASSWORD -->

                        <div class="input-group">

                            <label for="password">
                                Password
                            </label>


                            <div class="input-box">

                                <span class="input-icon">
                                    🔒
                                </span>


                                <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    placeholder="Enter your password"
                                    autocomplete="current-password"
                                    required
                                >


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


                        <!-- OPTIONS -->

                        <div class="form-options">


                            <label class="remember">

                                <input
                                    type="checkbox"
                                    name="remember"
                                >

                                Remember me

                            </label>


                            <a
                                href="#"
                                class="forgot"
                            >
                                Forgot Password?
                            </a>


                        </div>


                        <!-- LOGIN BUTTON -->

                        <button
                            type="submit"
                            class="login-submit"
                        >
                            🔐 &nbsp; Login to Account →
                        </button>


                    </form>


                    <!-- DIVIDER -->

                    <div class="divider">
                        OR
                    </div>


                    <!-- REGISTER -->

                    <p class="register-text">

                        Don't have an account?

                        <a href="register.jsp">
                            Create Account
                        </a>

                    </p>


                    <!-- SECURITY -->

                    <p class="secure-login">
                        🔒 Your information is securely protected
                    </p>


                </div>

            </section>


        </div>

    </main>


    <!-- =====================================================
         PASSWORD SCRIPT
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
```